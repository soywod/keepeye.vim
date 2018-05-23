function! keepeye#Callback() abort
  let s:statusline = &statusline

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
python3 << EOF
import vim
from threading import Timer

timer = int(vim.eval('g:keepeye_timer'))
callback = vim.Function(vim.eval('g:keepeye_callback'))

thread = Timer(timer, callback, [])
thread.start()
EOF
endfunction

function! keepeye#Clear() abort
  if exists('s:statusline')
    let &statusline = s:statusline
    unlet s:statusline
  endif
endfunction

