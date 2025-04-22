function smk8s --wraps='kubectl --kubeconfig ~/.kube/salecrm-staging' --description 'alias smk8s=kubectl --kubeconfig ~/.kube/salecrm-staging'
  set has_namespace 0
  for arg in $argv
    if string match -r -q -- '^(-n|--namespace)$' $arg
      set has_namespace 1
      break
    end
  end

  if test $has_namespace -eq 1
    kubectl --kubeconfig ~/.kube/salecrm-staging $argv
  else
    kubectl --kubeconfig ~/.kube/salecrm-staging -n staging $argv
  end
end
