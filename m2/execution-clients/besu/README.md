## Milestone #2: Besu

References:
- Besu merge branch: https://github.com/hyperledger/besu/tree/merge

### Terminal 1: Besu

**Warning: I still don't have instructions on how to configure Besu, so this guide
is incomplete!**

```bash
git clone --recursive https://github.com/hyperledger/besu
git checkout merge
cd besu
./gradlew build
./gradlew integrationTest LTS
```

### Terminal 2: Lighthouse Beacon Node

**Warning: We probably want to change `8550` to whatever port Besu uses for the
JSON API.**

```bash
cd m2_lighthouse
./start_beacon_node.sh 8550
```

*Note: it's important to start the beacon node before the validator client
since that script also generates the testnet configuration.*

### Terminal 3: Lighthouse Validator Client

```bash
cd m2_lighthouse
./start_validator_client.sh
```
