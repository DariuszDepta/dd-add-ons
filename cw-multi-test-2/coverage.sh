#!/usr/bin/env bash

set -e

###############################################################################
# Dependencies:
#
# $ sudo dnf install lcov
# $ rustup component add llvm-tools-preview
# $ cargo install grcov
#
###############################################################################

WORKING_DIRECTORY=$(pwd)
CARGO_NAME=$(grep -oE '^name = "[^"]+"' Cargo.toml | grep -oE '"[^"]+"' | grep -oE '[^"]+')
CARGO_VERSION=$(grep -oE '^version = "[^"]+"' Cargo.toml | grep -oE '"[^"]+"' | grep -oE '[0-9\.a-z\-]+')

# clean before proceeding
cargo clean

# set instrumenting variables
export CARGO_INCREMENTAL=0
export RUSTDOCFLAGS="-Cpanic=unwind"
export RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=unwind"

# run all tests
cargo +nightly test --all-features

# prepare output directories for coverage results
mkdir ./target/lcov
mkdir ./target/coverage

# generate coverage info
grcov . --llvm -s . -t lcov --ignore-not-existing \
     --excl-line='\s+\)$|\s+\}$|\s+\);$|\s+\}\)$|\s+\)\?\;$|\s+\};$|\s+\},$|\s+\)\?\)$' \
     --ignore "*cargo*" --ignore "*tests*" \
     -o ./target/lcov/lcov.info

# generate coverage report in HTML format
genhtml -t "$CARGO_NAME v$CARGO_VERSION" -q --ignore-errors unmapped,unmapped -o ./target/coverage ./target/lcov/lcov.info

# display final message
echo ""
echo "Open coverage report:"
echo "  HTML file://$WORKING_DIRECTORY/target/coverage/index.html"
echo ""
