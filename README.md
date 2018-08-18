# MVIMRC

## 1. Install Plug
1. Unix
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Window PowerShell
```
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
```
## 2. Insatll Vimrc
1. Unix
```
git clone https://github.com/Claude121/MVIMRC.git .tmp
mv .tmp/vimrc ~/.vimrc
rm .tmp -rf
```
2. Window PowerShell
```
git clone https://github.com/Claude121/MVIMRC.git .tmp
move .tmp/vimrc ~\vimfiles\autoload\plug.vim
del .tmp
```
