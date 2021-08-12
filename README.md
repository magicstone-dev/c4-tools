# c4-tools
Scripts and documentation for creating a C4-based fork

# Installation
1. Copy `sample.c4.yml` to `.c4.yml` and put it at the root of your checked-out code.
2. Edit `.c4.yml` to fill in user and project details
3. Copy `c4pr.sh` to your path (i.e. ~/bin)

You also need to add the upstream to your git. From your local checkout of your fork:

`git remote add upstream git://github.com/upstream_user/upstream_repo.git` 

# Operation

Run `c4pr.sh` from the root of your project folder to copy PRs from upstream to your fork.

Ex. `c4pr.sh 1234 desired-branch-name`

You may be asked to confirm a couple of merge commit messages which is normal.
