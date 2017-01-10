syntax enable
set number
set showmatch
set incsearch
set hlsearch

augroup configgroup
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal tabstop=2
  autocmd FileType php setlocal softtabstop=2
  autocmd FileType php autocmd BufWritePre <buffer> %s/\s\+$//e

  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e

  autocmd FileType ruby setlocal expandtab
  autocmd FileType ruby setlocal tabstop=4
  autocmd FileType ruby setlocal softtabstop=4
  autocmd FileType ruby autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END
