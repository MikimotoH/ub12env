#!/usr/bin/env zsh 
# pre-requirement:
#   oh-my-zsh, vim 7.4(+python)

sudo apt-get install -y git zsh mercurial wget \
    exuberant-ctags ack-grep silversearcher-ag

[[ -d $HOME/.oh-my-zsh ]] || \
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


cp ./rkj-repos.zsh-theme $HOME/oh-my-zsh/themes

(mkdir -p $HOME/.oh-my-zsh/custom/plugins; \
    cd $HOME/.oh-my-zsh/custom/plugins; \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    git clone https://github.com/zsh-users/zsh-history-substring-search )

(cd $HOME && \
    hg clone https://bitbucket.org/sjl/hg-prompt && \
    hg clone https://bitbucket.org/sjl/mercurial-cli-templates )

ln -sf `readlink -f .gitconfig` $HOME/
ln -sf `readlink -f .vimrc` $HOME/
ln -sf `readlink -f .vim` $HOME/
ln -sf `readlink -f .zshrc` $HOME/
ln -sf `readlink -f .hgrc`  $HOME/

# git config initialize 
git config --global user.name MikimotoH
git config --global user.email mikimotoh@gmail.com
git config --global credential.helper "cache --timeout=31536000"
git config --global color.ui true

# Install VIM pathogen -- bundle manager
( mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
    curl 'www.vim.org/scripts/download_script.php?src_id=19375' \
    > $HOME/.vim/autoload/pathogen.vim )


( mkdir -p $HOME/.vim/colors && curl \
    'www.vim.org/scripts/download_script.php?src_id=13397'\
    > $HOME/.vim/colors/wombat256.vim )

(cd $HOME/.vim/bundle && \
    git clone https://github.com/scrooloose/nerdtree && \
    git clone https://github.com/majutsushi/tagbar )



( curl -L "www.vim.org/scripts/download_script.php?src_id=10433" \
    | tar zxvf - -C $HOME/.vim )

( mkdir -p $HOME/.vim/plugin && \
    curl -L "www.vim.org/scripts/download_script.php?src_id=16171" \
    > $HOME/.vim/plugin/DirDiff.vim )

# install Ag
( git clone https://github.com/rking/ag.vim $HOME/.vim/bundle/ag &&\
    vim $HOME/.vim/bundle/ag/doc -c "helptags ." -c "q")
echo "tags" >> $HOME/.agignore

if [ -d $HOME/.vim/doc ] ; then
    if [ "$(ls -A $HOME/.vim/doc )" ]; then 
        print  "$HOME/.vim/doc not empty" 
        vim -c "helptags $HOME/.vim/doc/" -c "q"
    else 
        print "$HOME/.vim/doc is empty; don't helptags" 
    fi
else
    print "make empty $HOME/.vim/doc/"
    mkdir -p $HOME/.vim/doc
fi


vim -c "helptags $HOME/.vim/bundle/nerdtree/doc/" -c "helptags $HOME/.vim/bundle/tagbar/doc/" -c "q"

