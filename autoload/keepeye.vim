function! keepeye#Callback() abort
  let s:statusline = &statusline

  let l:msg = g:keepeye_message
  let l:colshlen = &columns/2
  let l:msghlen = len(l:msg)/2
  let l:finalmsg = repeat(' ', l:colshlen - l:msghlen) . l:msg

  let &statusline = l:finalmsg
endfunction

function! keepeye#CallbackWrapper(timer)
  execute('call ' . g:keepeye_callback . '()')
endfunction

function! keepeye#Check()
  if localtime() > s:time_limit
    set statusline-=%{keepeye#Check()}
    execute('call ' . g:keepeye_callback . '()')
  endif

  return ''
endfunction

function! keepeye#Start() abort
  call timer_start(g:keepeye_timer*1000, 'keepeye#CallbackWrapper')
endfunction

function! keepeye#Clear() abort
  if exists('s:statusline')
    let &statusline = s:statusline
    unlet s:statusline
  endif
endfunction

function! keepeye#Restart() abort
  call keepeye#Clear()
  call keepeye#Start()
endfunction
