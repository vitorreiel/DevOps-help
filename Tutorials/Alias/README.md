# Alias do Kubernetes

[ Primeiro crie o arquivo onde ficarão os Alias do K8s ]
touch .bash_aliases

[ Com o editor de texto, entre no arquivo e depois cole todos os Alias a baixo ]
nano .bash_aliases

[ Alias K8s ]
alias k='kubectl'
alias kc='k config view --minify | grep name'
alias kdp='kubectl describe pod'
alias c='clear'
alias kd='kubectl describe pod'
alias ke='kubectl explain'
alias kf='kubectl create -f'
alias kg='kubectl get pods --show-labels'
alias kr='kubectl replace -f'
alias ks='kubectl get namespaces'
alias l='ls -lrt'
alias kga='k get pod --all-namespaces'
alias kgaa='kubectl get all --show-labels'

[ Para aplicar os novos Alias, use o comando abaixo ]
source .bash_aliases

