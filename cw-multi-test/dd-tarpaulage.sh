#!/usr/bin/env bash

###############################################################################
# Dependencies:
#
# $ cargo install cargo-tarpaulin
#
###############################################################################

cargo tarpaulin --workspace --features backtrace,cosmwasm_1_1,cosmwasm_1_2,cosmwasm_1_3,iterator,staking,stargate --force-clean --out Html --engine llvm --output-dir ./target/tov