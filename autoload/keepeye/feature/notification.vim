function! keepeye#feature#notification#Activate()
  if has('unix') && !has('mac')
    let l:message = substitute(g:keepeye_message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

