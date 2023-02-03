!#/bin/bash

# Show env vars
grep -v '^#' .env

# Export env vars
export $(grep -v '^#' .env | xargs)

cast rpc anvil_impersonateAccount "${CURVE_WHALE}" -r http://localhost:8545

cast send "${USD3CRV_TOKEN}" transfer(address, uint256) "${PUBLIC_KEY}" 10000000000000000000000 --from "${CURVE_WHALE}"

cast send rpc anvil_stopImpersonatingAccount "${CURVE_WHALE}" -r http://localhost:8545

forge script scripts/deploy/dollar/solidityscripting/08_DevelopmentDeploy.s.sol:DevelopmentDeploy --fork-url http://localhost:8545 --broadcast