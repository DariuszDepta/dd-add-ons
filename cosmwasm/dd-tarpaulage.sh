#!/usr/bin/env bash

###############################################################################
# Dependencies:
#
# $ cargo install cargo-tarpaulin
#
###############################################################################

cargo tarpaulin --workspace --features cosmwasm_1_4 --force-clean --out Html --engine llvm --output-dir ./target/tov