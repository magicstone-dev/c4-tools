# C4-tools

Welcome and thank you for visiting C4-tools.

This project arises out of the quest for optimal developer experience in free/libre and open source software (FLOSS). An experience where developers work together with minimal conflict to solve problems specific to the market in which their code operates. This quest began in earnest when I (weex) wondered how successful FLOSS projects manage themselves. The most relevant material I found was by a man named Pieter Hintjens, who grew ZeroMQ to an organization with half-a-million LoC, 400 contributors, and little to no conflict over seven years. To quote his style, his videos are great. You should watch them.

C4 or Collective Code Construction Contract is a protocol, a contract that developers on a project agree to, that allows contributors to participate in a decentralized, asynchronous, concurrent, message-driven, lock-free, process with no one really in charge. To me it sounded perfect for FLOSS so I wonder why it's not more widely adopted.

My best guess is that people just haven't tried it. Some practices in C4 are counterintuitive, for example the de-emphasis on review or perference for opportunistically solving problems over top-down design. Others feel amazing though, respecting contributions by merging them, accepting their imperfections and working out the bugs that are inevitable in all software.

The next step therefore was to try out C4 on a new project and for this exercise, I chose the most popular software in the #Fediverse, Mastodon. Creating a C4-based fork means adhering to the contract, which says to merge any patch that addresses a valid problem. This I began on August 1st, 2021 by merging every valid, open pull-request in the Mastodon repository. Since there were ~30 pull requests to do, and the git commands were several, c4pr.sh and this repo were created.

Currently, this project contains scripts and documentation for creating a C4-based fork.

# Installation
1. Copy `sample.c4.yml` to `.c4.yml` and put it at the root of your checked-out code.
2. Edit `.c4.yml` to fill in user and project details
3. Copy `c4pr.sh` to your path (i.e. ~/bin)

You also need to add the upstream to your git. From your local checkout of your fork:

`git remote add upstream git://github.com/upstream_user/upstream_repo.git` 

For more, see [Setup.md](/doc/Setup.md).

# Operation

Run `c4pr.sh` from the root of your project folder to copy PRs from upstream to your fork.

Ex. `c4pr.sh 1234 desired-branch-name`

You may be asked to confirm a couple of merge commit messages which is normal.

## Contributing

This project uses [C4(Collective Code Construction Contract)](https://rfc.zeromq.org/spec:42/C4/) process for contributions.