#!/bin/sh
if [ "$#" -ne 2 ] || [ "$1" == "help" ]
then
  echo "Checkout upstream pull request onto new local fork and push to remote"
  echo 
  echo "usage: $0 PR# new-branch-name";
  echo 
  echo "e.g."
  echo 
  echo "$ $0 123 fix-foo"
  exit 1
fi

if [ ! -f ".c4.yml" ]; then
  echo "fatal: not at the root of a c4 repository (.c4.yml not found)"
  exit 1
fi

function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

eval $(parse_yaml .c4.yml)

git pull upstream pull/$1/head:$2
git checkout $2
git fetch upstream
git merge upstream/$upstream_branch

if [ $? -ne 0 ]; then
    git merge --abort
    echo "Merge failed and aborted."
    echo "*********************************************************************************"
    echo "*  Here's a link to the source PR:"
    echo "*    $forge/$upstream_owner/$upstream_repository/pull/$1"
    echo "*********************************************************************************"
    exit 1  
fi

git push origin $2

echo "*********************************************************************************"
echo "*  Here's a better link to create a PR:"
echo "*    $forge/$c4_owner/$c4_repository/compare/$c4_branch...$forge_user:$2"
echo "*********************************************************************************"
echo "*  And a link to the source PR:"
echo "*    $forge/$upstream_owner/$upstream_repository/pull/$1"
echo "*********************************************************************************"
