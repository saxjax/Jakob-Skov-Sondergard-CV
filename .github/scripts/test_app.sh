#!/bin/bash

set -eo pipefail

xcodebuild -workspace Jakob\ Skov\ Sondergard\ CV.xcodeproj \
            -scheme Jakob\ Skov\ Sondergard\ CV\ (iOS) \
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 13 \
            clean test | xcpretty
