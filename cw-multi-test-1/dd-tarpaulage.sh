#!/usr/bin/env bash

###############################################################################
#
# Dependencies:
#
# $ cargo install cargo-tarpaulin
#
###############################################################################

WORKING_DIRECTORY=$(pwd)

cargo +1.74.0-x86_64-unknown-linux-gnu tarpaulin --workspace --features backtrace,cosmwasm_1_1,cosmwasm_1_2,cosmwasm_1_3,cosmwasm_1_4 --force-clean --engine llvm --out Html --output-dir "$WORKING_DIRECTORY/target/tov"

# display final message
echo ""
echo "Open coverage report:"
echo "  HTML file://$WORKING_DIRECTORY/target/tov/tarpaulin-report.html"
echo ""
