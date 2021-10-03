# merge-f2f
This repo is for scripts to run various clients at the merge f2f.

## Tested with Lighthouse!
## Tested with Geth!

## General dependecies
```bash
sudo apt-get install python3-dev python3-pip python3-venv golang

# Check that you have Go 1.16+ installed
go version

# Create, start and install python venv
python -m venv venv 
. venv/bin/activate
pip install -r requirements.txt

# Install eth2-testnet-genesis tool (Go 1.16+ required)
go install github.com/protolambda/eth2-testnet-genesis@latest
# Install eth2-val-tools
go install github.com/protolambda/eth2-val-tools@latest
# You are now in the right directory to run the setupenv commands below.
```

## Now what?
- Create the genesis states required by going to the `genesis-states/README.md` and following the instructions
- Run an execution client by going to `m2/execution-clients/<client>/README.md`
- Run a consensus beacon client + validator by going to `m2/consensus-clients/<client>/README.md`

Lots of info taken from [Lighthouse](https://github.com/sigp/lighthouse-merge-f2f), thanks!

