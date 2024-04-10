FROM clojure:temurin-21-lein-jammy

# Copy all files from Snuister
COPY snuyster.sh LICENSE /
COPY src/ /src/

# Install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssh-client
RUN apt-get install -y git
RUN apt-get install -y cloc
RUN apt-get install -y python3
RUN apt-get install -y pip

ARG code_maat_local_repo=/code-maat

RUN git clone https://github.com/nielsdelestinne/code-maat.git $code_maat_local_repo
WORKDIR $code_maat_local_repo

# Build code-maat's code from source (Clojure)
RUN lein deps
COPY . $code_maat_local_repo
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" code-maat-standalone.jar

WORKDIR /

RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib

# Open bash
ENTRYPOINT ["bash"]
CMD ["./snuyster.sh"]
