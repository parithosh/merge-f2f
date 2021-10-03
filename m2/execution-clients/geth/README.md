## Milestone #2: Geth

References:
- Geth instructions: https://notes.ethereum.org/@9AeMAlpyQYaAAyuj47BzRw/rkwW3ceVY
- Geth PR: https://github.com/ethereum/go-ethereum/pull/23607

## Dependency install instructions:
- Install [go](https://golang.org/doc/install)
- Ensure build essentials are installed, `sudo apt install build-essential`

### Terminal 1: Geth

```bash
git clone https://github.com/MariusVanDerWijden/go-ethereum.git
cd go-ethereum
git checkout merge-interop-spec
make geth
cd ..
./go-ethereum/build/bin/geth --catalyst --datadir "./datadir" init genesis.json
./go-ethereum/build/bin/geth --catalyst --http --ws -http.api "engine,eth" --datadir "./datadir"
```
