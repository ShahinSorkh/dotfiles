function smk9s-prod --wraps='k9s --kubeconfig ~/.kube/salecrm-production' --description 'alias smk8s=k9s --kubeconfig ~/.kube/salecrm-production'
  set has_namespace 0
  for arg in $argv
    if string match -r -q -- '^(-n|--namespace)$' $arg
      set has_namespace 1
      break
    end
  end

  if test $has_namespace -eq 1
    k9s --logoless --kubeconfig ~/.kube/salecrm-production $argv
  else
    k9s --logoless --kubeconfig ~/.kube/salecrm-production -n production $argv
  end
end
