function! keepeye#Callback() abort
  let l:colshlen = &columns/2
  let l:msghlen = strdisplaywidth(g:keepeye_message)/2
  let l:finalmsg = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  let &statusline = l:finalmsg

  if g:keepeye_system_notification
    call keepeye#system#Notify()
  endif

  if g:keepeye_system_bell
    call keepeye#system#Bell()
  endif
endfunction

function! keepeye#CallbackWrapper(timer) abort
  let s:statusline = &statusline
  execute('call ' . g:keepeye_callback . '()')
endfunction

function! keepeye#Check() abort
  if localtime() > s:time_limit
    set statusline-=%{keepeye#Check()}
    execute('call ' . g:keepeye_callback . '()')
  endif

  return ''
endfunction

function! keepeye#Clear() abort
  if exists('s:statusline')
    let &statusline = s:statusline
    unlet s:statusline
  endif
endfunction

function! keepeye#Start() abort
  call keepeye#Clear()
  call timer_start(g:keepeye_timer*1000, 'keepeye#CallbackWrapper')
endfunction

