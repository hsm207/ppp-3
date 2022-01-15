# go to the root of the plutus-apps repo
alias gtpa='cd /workspaces/ppp-3/plutus-apps'

# start a nix-shell
alias nxs='pushd /workspaces/ppp-3/plutus-apps && nix-shell && popd'

# start a playground server
alias spps='pushd /workspaces/ppp-3/plutus-apps && nix-shell --command "cd plutus-playground-client && plutus-playground-server"; popd'

# start a playground client
alias sppc='pushd /workspaces/ppp-3/plutus-apps && nix-shell --command "cd plutus-playground-client && npm start"; popd'

# read the docs
alias docs='pushd /workspaces/ppp-3/plutus-apps && nix-shell --command build-and-serve-docs; popd'

# go to a week in the plutus pioneer program repo
gtppp () {
    if [ $# -eq 0 ] 
    then 
        cd /workspaces/ppp-3/plutus-pioneer-program 
    else 
        cd /workspaces/ppp-3/plutus-pioneer-program/code/$1 
    fi 
}

# checkout tag in the plutus-apps repo
cpa() { 
    git --git-dir /workspaces/ppp-3/plutus-apps/.git checkout "$1" ; 
}