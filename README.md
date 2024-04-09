
# Snuyster

A command-line tool built on top of [Code Maat](https://github.com/adamtornhill/code-maat) to mine and analyze data from version-control systems.

# Why

## ... do we need to analyze data from VCS?
Taken from Code Maat:
> To understand large-scale software systems we need to look at their evolution. The history of our system provides us with data we cannot derive from a single snapshot of the source code. Instead VCS data blends technical, social and organizational information along a temporal axis that let us map out our interaction patterns in the code. Analyzing these patterns gives us early warnings on potential design issues and development bottlenecks, as well as suggesting new modularities based on actual interactions with the code. Addressing these issues saves costs, simplifies maintenance and let us evolve our systems in the direction of how we actually work with the code.

## ... did you create Snuyster?

Code Maat does a great job at providing the scripts necessary to perform analyses. However, it does not provide the nuts and bolts to generate these analyses for many different repositories at once and does not aggregate these results.

# Features

Snuyster offers the following features:

- A Docker container containing python
- Direct access to Code Maat

Some scripts to perform code analyses

> Uses code-maat (see: "Your code as a crime scene" book) and some additional tools such as cloc (for counting lines) and Python (matplotlib) for visualizing the results.

# Use

```
docker run \
-v /Users/niedel/private-repos/snuyster/reports:/reports \
-v /Users/niedel/private-repos/snuyster/repositories:/repositories \
-v /Users/niedel/private-repos/snuyster/logs:/logs \
-v /Users/niedel/private-repos/snuyster/git-logs:/git-logs \
--name snuyster -it niedel/snuyster
```

# Contribute

## Installation

Run `asdf install` to install the correct tools (e.g. python)

- In Intellij's Module settings, select and set the Python SDK (from ASDF) 

Using pip, install the following Python libraries:

- `pip install numpy`
- `pip install pandas`
- `pip install matplotlib`

Install `cloc` using brew
- `brew install cloc`

## Dockerfile and build image

Unreleased:

- `docker build -t niedel/snuyster:latest -t niedel/snuyster:0.0.1 .`

Released:

- `docker build -t niedel/snuyster:latest -t niedel/snuyster:1.0.0 .`

## Usage

> REVISIT THIS

All subsequent steps require the previous step to be executed (at least once)

### 1. Generate data-rich logs using Git
Run `./generate_logs.sh`

- This will create a dedicate log file for each service in `datafiles/<service>.log`
- _Only has to be rerun when a new repository is to be included._

### 2. Perform an analysis on the logs
Run `./perform_analysis.sh <analysis>`

- `<analysis>` must be one of code-maat's or cloc analysis options (e.g. `summary`).
- _Run the script without an analysis option to view all possible options._

### 3. (a) Aggregate the same analysis of different services into a single file
Run `./aggregate_summary_analyses.sh <analysis>` 

- This will create one file containing the aggregated analysis service in `datafiles/aggregated/<analysis>.csv`
- Currently only `summary` is supported

### 3. (b) Aggregate different analyses of all services into a single file
Run `./aggregate_analyses_all_services.sh <service>`

- This will create one file containing the aggregated analyses per service in `datafiles/aggregated/<service>.csv`
- And, one file the aggregated analyses of all services in `datafiles/aggregated/aggregated-services-analyses.csv`

### 3. (c) Aggregate the abs-churn analysis of all services into a single file
Run `./aggregate_abs-churn_analysis_all_services.sh <service>`

- This will create one file containing the aggregated analyses in `datafiles/aggregated/aggregated-abs-churn.csv`
- And, one file the aggregated analyses of all services in `datafiles/aggregated/aggregated-services-analyses.csv`


### 4. Generate a plot from the aggregated result 3 (a)

Run `./plot.sh`

- It will prompt to provide the aggregated `<analysis>` to visualize.
- Currently only `summary` is supported

# Todo

Gebruik de unofficial code-maat docker image, komt met python en cloc en voorziet in een bash.

- [x] Dockerize
  - Start docker
  - Mount / provide a list of repositories to clone
  - OR, mount the folder in which the already clones repositories exist
  - in docker container, run ./inspect.sh
- [ ] Set correct license (see `generate_revision_per_loc`)
- [ ] Properly document
- [ ] Release as 1.0.0 (ARM... also AMD?)
- [x] improve
- [ ] Add a nice logo
- [ ] Push image to dockerhub
- [x] Create an unofficial fork from code-maat and use it in Dockerfile
- [ ] Use functions!
- [ ] check TODOs in code
- [ ] Write explanation in tool (for user)
- [ ] Rerunning summary will give a reindexing error (might also be an issue with the other options)
- [x] Allow to develop without the need for docker (code-maat, python tooling is mainly an issue. Also we have to explicitly run snuyster via bash, not zsh due to readarray; `bash snuyster.sh`)
  - [ ] Document direnv / asdf
- [ ] Provide a help option
- [ ] Add Plot functionality to summary

# Resources

- https://en.wikipedia.org/wiki/List_of_Unicode_characters
- https://github.com/stevenalexander/code-maat-python
- https://github.com/adamtornhill/code-maat