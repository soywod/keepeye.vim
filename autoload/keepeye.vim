function! keepeye#Callback() abort
  let s:statusline = &statusline

  let l:colshlen = &columns/2
  let l:msghlen = strdisplaywidth(g:keepeye_message)/2
  let l:finalmsg = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  let &statusline = l:finalmsg

  if g:keepeye_system_notification
    if has('unix') && !has('mac')
      let l:message = substitute(g:keepeye_message, '-', '\\-', '')
      call system('notify-send KeepEye ' . shellescape(l:message))
    endif
  endif
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

