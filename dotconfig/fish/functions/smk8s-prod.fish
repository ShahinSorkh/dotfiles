function smk8s-prod --wraps='kubectl --kubeconfig ~/.kube/salecrm-production' --description 'alias smk8s-prod=kubectl --kubeconfig ~/.kube/salecrm-production'
  kubectl --kubeconfig ~/.kube/salecrm-production $argv; 
end
