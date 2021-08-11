# c4-tools
Scripts and documentation for creating a C4-based fork

# Installation
1. Copy `c4.conf.sample` to `c4.conf`
2. Edit `c4.conf` to fill in your project details
3. Copy `c4.conf` and `c4pr.sh` to your path (i.e. ~/bin)

You also need to add the upstream to your git. From your local checkout of your fork:

`git remote add upstream git://github.com/upstream_user/repo.git`

For more, see [Setup.md](/doc/Setup.md).

# Operation

Run `c4pr.sh` from your project folder to copy PRs from upstream to your fork.

You may be asked to confirm a merge commit message which is normal.

## Contributing

This project uses [C4(Collective Code Construction Contract)](https://rfc.zeromq.org/spec:42/C4/) process for contributions.
