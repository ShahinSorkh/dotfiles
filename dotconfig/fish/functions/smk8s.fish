function smk8s --wraps='kubectl --kubeconfig ~/.kube/salecrm-staging' --description 'alias smk8s=kubectl --kubeconfig ~/.kube/salecrm-staging'
  kubectl --kubeconfig ~/.kube/salecrm-staging $argv; 
end
