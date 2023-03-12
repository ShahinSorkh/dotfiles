function xpl --description 'alias xpl=mkdir -p /tmp/explains; cd /tmp/explains'
  cd $HOME
  rm -rf /tmp/explains
  mkdir -p /tmp/explains
  cd /tmp/explains
  git init
  curl -LSsf -o .gitignore 'https://www.toptal.com/developers/gitignore/api/vim,emacs,linux,python,composer,git,php-cs-fixer,cmake,c,c++,scala,fish,node'
  git add -A
  git commit -m 'init'
  pipenv --rm || true
end
