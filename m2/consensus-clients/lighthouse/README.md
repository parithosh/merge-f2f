## M2 Lighthouse

This contains the scripts required to run Lighthouse in the M2 milestone.

## Dependency install instructions:

```bash
git clone https://github.com/sigp/lighthouse.git
git fetch origin pull/2620/head:merge-f2f
git checkout merge-f2f
cd lighthouse
make
make install-lcli
```

This will install `lighthouse` and `lcli` in `~/.cargo/bin`. You will need to
ensure this is on your `PATH`.

## Instructions for running lighthouse beacon and validator
**Warning: We probably want to change `8550` to whatever port Besu uses for the
JSON API.**

```bash
cd m2_lighthouse
./start_beacon_node.sh 8550 or ./start_beacon_node.sh 8545 
./start_validator_node.sh
```


