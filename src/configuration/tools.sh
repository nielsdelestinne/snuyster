#!/bin/bash

function code_maat() {
    java -XX:+UseContainerSupport -XX:MaxRAMPercentage=85.0 -jar /code-maat/code-maat-standalone.jar "$@"
}

function python() {
    python3 "$@"
}