# Snuyster

###### A command-line tool to retrieve, generate and analyze data from Git repositories.

```
╔══════════════════════════════════════════════════════════════════════════════════════════╗
║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░              ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    ░░░░░░    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                       ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                       ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   S N U Y S T E R !   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                       ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║
║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║
╚══════════════════════════════════════════════════════════════════════════════════════════╝
```

> "To understand large-scale software systems we need to look at their evolution. Version controlled data blends technical, social and organizational information along a temporal axis that let us map out our interaction patterns in the code and application landscape. Analyzing these patterns gives us early warnings on potential design issues and development bottlenecks, as well as suggesting new modularities based on actual interactions with the code. Addressing these issues saves costs, simplifies maintenance and let us evolve our systems in the direction of how we actually work with the code."
> - _Adam Thornhill, author of Your Code as a Crime Scene_

## So, what are you looking for?
1. [I want know about Snuyster's features.](#features)
1. [I want to use Snuyster.](#use)
1. [I want to contribute.](#contribute)

# Features

Snuyster offers the following features

## Dockerized runtime

Snuyster comes with batteries included: Snuyster's Docker image contains all required tools, scripts and a convenient cli to perform analyses and extract the resulting data.

## Git support

Snuyster can access your public and private repositories with ease:

- Provide Snuyster with a set of repository URLs and it will clone the repositories for you.
- Or, mount a directory which already contains your cloned repository. 

Snuyster will use these repositories to extract their entire Git history, in a processable format for further analysis.

## Perform analyses

Snuyster allows you to perform many different analyses on the extracted data.

For performing the actual analyses, the following tools are used:

- [Code Maat](https://github.com/adamtornhill/code-maat): analyze data from version-control systems (VCS).
- [Cloc](https://github.com/AlDanial/cloc): counts blank lines, comment lines, and physical lines of source code in many programming languages.

## Aggregation

Snuysters aggregates the results of the performed analyses of individual Git repositories into combined reports that span all repositories.

This allows to easily compare the analysis results between repositories.

## CSV Reports

All reports (individual and aggregated) are exported as CSV files and can be imported into other tools - like spreadsheets - for further analysis.

# Use

To use Snuyster, start its `Docker` container:

```
docker run \
-v <path>/repositories:/repositories \
-v <path>/results:/results \
-v ~/.ssh:/root/.ssh:ro \
--name snuyster -it niedel/snuyster:latest
```

Some information about this command:

- `docker run` will start a container from the image `niedel/snuyster:latest`
- `-v <path>/repositories:/repositories` will mount your folder of choice (e.g. `<path>/repositories`) to the container folder `/repositories`.
  - Your mounted folder should contain the cloned repositories you wish to analyse.
  - Or, a file named `to-clone.txt` that contains the URLs of the repositories to clone and analyse.
  - Or, a combination of both.
- `-v <path>/results:/results` will mount your folder of choice (e.g. `<path>/results`) to the container folder `/results`. 
  - All the `.csv` reports that Snuyster will generate, will appear in your mounted folder.
- `~/.ssh:/root/.ssh:ro` will mount your `.ssh` folder to the container's `.ssh` folder.
  - By mounting your `.ssh` folder, it's possible for Snuyster to clone your private repositories.
- `--name snuyster` will set the name of the container: you can create different containers, for different sets of repositories you want to analyze.

After the container is started, Snuyster is automatically started. 

- Follow the onscreen instructions and happy analyzing!

### Container

The next time you wish to use Snuyster, you can simply start the container you previously created and exec into it:

1. Start the container: `docker start snuyster` (where `snuyster` is the name of the container)
2. Exec into the container: `docker exec -it snuyster bash`
3. Run `./snusyter.sh` from within the container to start Snuyster

### to-clone.txt

Upon initialization, Snuyster will look for a file name `to-clone.txt` in the mounted repositories folder. 

- If the file is found, Snuyster expects that each line contains a URL to an online Git repository, which it will try to clone.

```
https://github.com/<user>/<repo>
https://github.com/<user>/<repo>.git
git@github.com:<user>/<repo>.git
git@github.com:<org>/<repo>.git
https://bitbucket.com/<user>/<repo>.git
(...etc)
```

The `to-clone.txt` file can be combined with already cloned repositories.

- For example, `-v /Users/me/my-repositories-to-analyze:/repositories`

```
my-repositories-to-analyze
└── my-cloned-repository-1
└── my-cloned-repository-2
└── my-cloned-repository-3
└── to-clone.txt
```

# Contribute

Everyone's welcome to contribute via pull-requests.

Snuyster consists of some bash and python scripts. But, it requires additional tools such as (for example) Java for running code-maat.

## Installation

Use `direnv` (which is configured to use `asdf`), or `asdf`, or any other to install the following required tools:

- Java 21 (used for running code-maat)
- Python 3.12

Using pip, install the following Python libraries:

- `pip install numpy`
- `pip install pandas`
- `pip install matplotlib`

Install `cloc` (e.g. on macOS, using `brew`)

- `brew install cloc`

## Dockerfile and build image

Building & push a multi-platform Dockerfile:

1. `docker buildx create --name snuyster-multi-platform --bootstrap --use`
2. `docker buildx build --push --platform linux/amd64,linux/arm64 -t niedel/snuyster:latest -t niedel/snuyster:<version> .`


Publishing a Dockerfile is performed by the maintainer.

## Structure

All source-code can be found in `src/`, within this folder, the code is organised in functional packages.

# License

Copyright © 2024 Niels Delestinne

Distributed under the GNU General Public License v3.0.