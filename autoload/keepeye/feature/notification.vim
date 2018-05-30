function! keepeye#feature#notification#Activate()
  let l:message = substitute(g:keepeye_message, '-', '\\-', '')
  if has('unix') 
    if has('mac')
      call system('terminal-notifier -title KeepEye -message ' . shellescape(l:message))
    else
      call system('notify-send KeepEye ' . shellescape(l:message))
    endif
  endif
endfunction

function! keepeye#feature#notification#Deactivate()
  " Nothin to do
endfunction

