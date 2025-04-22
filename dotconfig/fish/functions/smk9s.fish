function smk9s --wraps='k9s --kubeconfig ~/.kube/salecrm-staging' --description 'alias smk8s=k9s --kubeconfig ~/.kube/salecrm-staging'
  set has_namespace 0
  for arg in $argv
    if string match -r -q -- '^(-n|--namespace)$' $arg
      set has_namespace 1
      break
    end
  end

  if test $has_namespace -eq 1
    k9s --kubeconfig ~/.kube/salecrm-staging $argv
  else
    k9s --kubeconfig ~/.kube/salecrm-staging -n staging $argv
  end
end
