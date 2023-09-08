#!/usr/bin/env bash

###############################################################################
# Dependencies:
#
# $ cargo install cargo-tarpaulin
#
###############################################################################

cargo tarpaulin --workspace --force-clean --out Html --engine llvm --output-dir ./target/tov