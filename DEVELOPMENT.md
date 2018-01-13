# Developing `git greenbase`

## Architecture
"Architecture" is an awfully lofty sounding name for a collection of Bash scripts, but here is the basic design of `git greenbase`:

The user invokes `git-greenbase`. It in turn sources each of the `greenbase.*` "helper" scripts. The configured CI provider is invoked (see the `ci-providers` directory) and the provider returns a hash of the latest green build. `git-greenbase` updates the refs for both local and origin/master to point to this hash, and the current feature branch is rebased onto master (if the branch is configured to track and rebase onto master).

### `greenbase.*` helper scripts
Each of these scripts has been extracted into its own file in order to encapsulates an area of functionality as well as enable unit testing of the feature in isolation.

script | purpose
--- | ---
`greenbase.resolve_deps` | 3rd-party dependency resolution
`greenbase.provider` | CI provider management 
`greenbase.opts` | command line options
`greenbase.config` | git config management
`greenbase.prep_environment` | preps important environment variables

#### script "injection"
Note that each of the helper scripts is sourced into `git-greenbase` via an `inject` function, which first attempts to load a script from an environment variable of the same name. If the environment variable doesn't exist, it will load the default script. This was done to enable mocking of helper scripts. 

**Risky business:** This script "injection" via environment variable is a mild security risk, in the event that a nefarious foe is able to set an environment variable that points somewhere malevolent. I may add a `make` task that generates a release version of the script with everything inlined into one big script.

## Cleanup
Run `make clean` to clear out the cruft.

## Testing
Testing is accomplished using the [BATS testing framework](https://github.com/sstephenson/bats). All of the test files end in a `.tests` extension. the `run_tests` script just finds all those files and runs them with `bats`.

### `make`
Run `make test` to run the tests.

### `run_tests`
Alternatively, run `./run_tests` to run the tests.

**Tip:** To run only certain test files, such as those with "travis" in the name, pass the string as an optional argument to `run_tests`, like this: `./run_tests travis`.

## Debugging
### To see everything the script is doing printed to the terminal: 

     export GREENBASE_DEBUG=true

Then run `git greenbase` normally.

### Dry run
The `-d` option is great for testing changes without worrying that `greenbase` will start doing hard resets in your repo. :)

    git greenbase -d
