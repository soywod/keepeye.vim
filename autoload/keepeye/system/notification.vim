function! keepeye#system#notification#Trigger(message)
  if has('unix') && !has('mac')
    let l:message = substitute(a:message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

