# git greenbase
`git greenbase` is an alternative to `git pull` that pulls the latest **green** build from your continuous integration (CI) provider.

## Description
**Scenario (without `greenbase`)**: You pull the latest from `origin/master` and begin adding a new feature. It doesn't build. *Huh? What did I do?* And the tests don't pass. *What..?* You spend an hour trying to figure out where you went wrong, only to discover that your code is fine -- you pulled a broken build.

**Scenario (with `greenbase`)**: You pull the latest from `origin/master` using `git greenbase`. `git greenbase` queries your CI provider for the latest **passing** build, then resets your local `master` to match. You add the new feature, build, run the tests, and submit a pull request. *That was quick! :) Think I'll grab some coffee...*

If you can relate to the first scenario, `git greenbase` is for you. The idea is that you always begin development on top of a known "green" build. That way you and your team spend far less time tracking down other peoples' bugs, assuming they're of your own making.

### Alternatives
Some teams never push directly to master. They instead push to a feature branch which is built, tested, and only merged with `master` if the build succeeds. `git greenbase` would be unnecessary in such a workflow.

## Installation
    git clone https://github.com/tygerbytes/git-greenbase.git
    cd git-greenbase
    ./install

The `./install` script will create a symlink to `git-greenbase` and add it to your PATH. `Git` will find it in your path and allow you to run `git greenbase`, just like any `Git` command.

## Usage


## License
MIT. See [LICENSE.md](LICENSE.md).
