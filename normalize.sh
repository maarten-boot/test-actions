#! /usr/bin/env bash

black src/
pylama src/
mypy src/
