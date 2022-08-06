#!/bin/bash

set -eo pipefail

cd Jakob\ Skov\ Sondergard\ CV-package; swift test --parallel; cd ..
