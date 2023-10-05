#!/usr/bin/env bash

###############################################################################
# Dependencies:
#
# $ cargo install cargo-tarpaulin
#
###############################################################################

WORKING_DIRECTORY=$(pwd)

cargo tarpaulin --workspace --features backtrace,cosmwasm_1_1,cosmwasm_1_2,cosmwasm_1_3,iterator,staking,stargate --force-clean --out Html --engine llvm --output-dir "$WORKING_DIRECTORY/target/tov"

# display final message
echo ""
echo "Open coverage report:"
echo "  HTML file://$WORKING_DIRECTORY/target/tov/tarpaulin-report.html"
echo ""
