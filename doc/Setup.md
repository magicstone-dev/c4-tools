# C4 Fork Setup

The idea here is to create a fork which is maintained according to the [C4 process](https://rfc.zeromq.org/spec/42/).

At the beginning, there will be an upstream project with outstanding pull requests, some of which meet the criteria of [2.3 Patch Requirements](https://rfc.zeromq.org/spec/42/#23-patch-requirements). What follows is the process to go through open pull requests and merge those that are valid. Once all valid PRs are merged, the fork will be considered up-to-date.

Pre-requisites:
* c4pr.sh installed per [README.md](/README.md).

Bringing a C4-maintained fork up-to-date:

1. Fork the upstream project.
1. Setup continuous integration (CI) that meets or exceeds upstream.
1. Open the list of pull requests for upstream. (Using GitHub CLI run `gh pr list -L 10000 | grep -v DRAFT`)
1. Create a PR on your fork using c4-tools/c4pr.sh.
1. c4pr will generate a link to the pull-request so you can determine whether the issue it solves meets the criteria as an accurate, valuable problem ([2.4.1-5 Development Process](https://rfc.zeromq.org/spec/42/#24-development-process)).
1. If the CI passes, merge it.
1. Continue with other PRs until there are none left.
