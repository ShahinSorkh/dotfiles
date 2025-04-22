function smk8s-prod --wraps='kubectl --kubeconfig ~/.kube/salecrm-production' --description 'alias smk8s=kubectl --kubeconfig ~/.kube/salecrm-production'
  set has_namespace 0
  for arg in $argv
    if string match -r -q -- '^(-n|--namespace)$' $arg
      set has_namespace 1
      break
    end
  end

  if test $has_namespace -eq 1
    kubectl --kubeconfig ~/.kube/salecrm-production $argv
  else
    kubectl --kubeconfig ~/.kube/salecrm-production -n production $argv
  end
end
