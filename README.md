# git greenbase
`git greenbase` is an alternative to `git pull` that pulls the latest **green** build from your continuous integration (CI) provider.

## Description
🙁 **Scenario (without `greenbase`)**: You pull the latest from `origin/master` and begin adding a new feature. It doesn't build. *Huh? What did I do?* And the tests don't pass. *What..?* You spend an hour trying to figure out where you went wrong, only to discover that your code is fine -- you pulled a broken build.

😍 **Scenario (with `greenbase`)**: You pull the latest from `origin/master` using `git greenbase`. `git greenbase` queries your CI provider for the latest **passing** build, then resets your local `master` to match. You add the new feature, build, run the tests, and submit a pull request. *That was quick! :) Think I'll grab some coffee...*

If you can relate to the first scenario, `git greenbase` is for you. The idea is that you always begin development on top of a known "green" build. That way you and your team spend far less time scratching your head wondering what you broke.

**What if I'm working locally on a branch other than master?** 
If you are using a rebase-based workflow, and your local branch is tracking `master`, running `git greenbase` will perform exactly as described above, but it will also rebase your local branch on top of your local copy of `master`. 

### Alternatives
Some teams never push directly to master. They instead push to a feature branch which is built, tested, and only merged with `master` if the build succeeds. `git greenbase` would be unnecessary in such a workflow.

## Installation
### Linux
    git clone https://github.com/tygerbytes/git-greenbase.git
    cd git-greenbase
    ./install

The `./install` script will create a symlink to `git-greenbase` and add it to your PATH. `Git` will find it in your path and allow you to run `git greenbase`, just like any `Git` command.

### Mac
I haven't tried it yet, but following the Linux instructions should work.

### Windows
I haven't tried `git greenbase` with Windows yet.

## Usage
    usage: git greenbase [<options>]
      -p <provider> Use specific CI <provider>
      -b <branch>   Specify <branch> other than master
      -d      (Dry Run) Don't do anything destructive

View list of supported CI providers with `git greenbase -p list`

### Configuring a CI provider
A provider is set and configured via `git config greenbase.`

#### `Latest`
    git config greenbase.provider latest
    
`Latest` is a psuedo CI provider. It just returns the latest commit from `origin/master`, passing build or not. Typically used with the `-p` switch: `git greenbase -p latest`.

#### `GitLab`
    git config greenbase.provider gitlab
    git config greenbase.gitlab.token <TOKEN>
    git config greenbase.gitlab.serverUri <SERVER URI>
    git config greenbase.gitlab.projectId <PROJECT ID>

#### `Travis CI`
    git config greenbase.provider travisci
    git config greenbase.travisci.token <TOKEN>
    git config greenbase.travisci.serverUri <SERVER_URI>
    git config greenbase.travisci.repoId <GITHUB_REPO_ID>
    
#### `TFS`
TFS support is currently experimental.

    git config greenbase.provider tfs
    git config greenbase.tfs.tokenBase64 <BASE64_ENCODED_TOKEN>
    git config greenbase.tfs.projectId <PROJECT_ID>
    git config greenbase.tfs.serverUri <SERVER_URI>

**Tip:** To get your base64 encoded token, run the following command:

    base64 <(echo my_token)

## Development
See [DEVELOPMENT.md](DEVELOPMENT.md).

## License
MIT. See [LICENSE.md](LICENSE.md).
