# merge-f2f
This repo is for scripts to run various clients at the merge f2f.

## Tested with lighthouse!

## General dependecies
```bash
apt-get install python3-dev python3-pip python3-venv golang

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
## How To Run
This testnet requires 3 terminal processes, one for a execution client one for a consensus node and one for a consensus validator. 
 Go to each folder that you want to run and run the required commands in the `README.md` file.

Lots of info taken from [Lighthouse](https://github.com/sigp/lighthouse-merge-f2f), thanks!

