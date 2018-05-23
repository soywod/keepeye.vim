function! keepeye#Callback() abort
  let l:msg = g:keepeye_message
  let l:colshlen = &columns/2
  let l:msghlen = len(l:msg)/2
  let l:finalmsg = repeat(' ', l:colshlen - l:msghlen) . l:msg

  let &statusline = l:finalmsg
endfunction

function! keepeye#Check()
  if localtime() > s:time_limit
    set statusline-=%{keepeye#Check()}
    execute('call ' . g:keepeye_callback . '()')
  endif

  return ''
endfunction

function! keepeye#Start() abort
  let s:statusline = &statusline
  let s:time_limit = localtime() + g:keepeye_timer

  if &statusline == ''
    set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P%{keepeye#Check()}
  else
    set statusline+=%{keepeye#Check()}
  endif
endfunction

function! keepeye#Stop() abort
  let &statusline = s:statusline
endfunction

