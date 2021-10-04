## Milestone #2: Geth

References:
- Geth instructions: https://notes.ethereum.org/@9AeMAlpyQYaAAyuj47BzRw/rkwW3ceVY
- Geth PR: https://github.com/ethereum/go-ethereum/pull/23607

## Quick instructions:
- Run 
```
souce vars.env
docker run -v $(pwd)/geth_data:/data -v $(pwd)/../../../genesis-states/$TESTNET_NAME/public/:/genesis parithoshj/geth:merge-00f36885a --catalyst --datadir "/data" init /genesis/eth1_config.json
```
- Run `docker-compose up -d`
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
c./go-ethereum/build/bin/geth --catalyst --http --ws -http.api "engine,eth" --datadir "./datadir"
```
