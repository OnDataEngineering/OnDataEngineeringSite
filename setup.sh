# Softlinks content site into this main site
# See http://stackoverflow.com/questions/18641864/git-bash-shell-fails-to-create-symbolic-links

# We still need this.
windows() { [[ -n "$WINDIR" ]]; }

# Cross-platform symlink function. Creates a symlink to a file or directory
link() {
  if windows; then
    # Windows needs to be told if it's a directory or not. Infer that.
    # Also: note that we convert `/` to `\`. In this case it's necessary.
    if [[ -d "$1" ]]; then
      cmd <<< "mklink /D \"$2\" \"${1//\//\\}\"" > /dev/null
    else
      cmd <<< "mklink \"$2\" \"${1//\//\\}\"" > /dev/null
    fi
  else
    ln -s "$1" "$2"
  fi
}

# Cross-platform symlink function. Deletes a symlink to a file or directory
rmlink() {
  if windows; then
    # Windows needs to be told if it's a directory or not. Infer that.
    # Also: note that we convert `/` to `\`. In this case it's necessary.
    if [[ -d "$1" ]]; then
      cmd <<< "rmdir \"${1//\//\\}\"" > /dev/null
    else
      cmd <<< "del \"${1//\//\\}\"" > /dev/null
    fi
  else
    rm $1
  fi
}


if [[ $# -ne 1 ]]
then
  echo "Usage: `basename $0` <content_dir>"
  exit -1
fi

contentdir=$1

if [[ ! -d $contentdir ]]
then
  echo "$contentdir is not a directory"
  exit -1
fi

for i in _drafts _posts _technologies _tech-categories _tech-vendors _templates _data _includes images redirects authors.yml
do
  echo
  echo "Processing $i"


  if [[ $i == "_templates" ]]
  then
    workdir="_includes"
    src="../${contentdir}/$i"
    trg="templates"
  elif [[ $i == "_data" || $i == '_includes' ]]
  then
    workdir=$i
    src="../${contentdir}/$i/shared"
    trg="shared"
  elif [[ $i == "authors.yml" ]]
  then
    workdir="_data"
    src="shared/$i"
    trg=$i
  else
    workdir="."
    src="${contentdir}/$i"
    trg=$i
  fi

  cd $workdir

  if [[ -f $trg ]]
  then
    echo "Removing existing file $workdir/$trg"
    rm $trg
  if [[ $? -ne 0 ]]
    then
      exit -1
    fi
  fi  

  if [[ -h $trg ]]
  then 
    echo "Removing existing symlink $workdir/$trg"
    rmlink $trg
    if [[ $? -ne 0 ]]
    then
      exit -1
    fi
  fi

  echo "Creating link $src $workdir/$trg"
  link $src $trg
  if [[ $? -ne 0 ]]
  then
    exit -1
  fi

  cd - > /dev/null

done
