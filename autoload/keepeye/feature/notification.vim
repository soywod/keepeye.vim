function! keepeye#feature#notification#Activate()
  let l:title = 'KeepEye'
  let l:message = shellescape(substitute(g:keepeye_message, '-', '\\-', ''))
  
  if has('unix') 
    if has('mac')
      call system('terminal-notifier -title ' . l:title . ' -message ' . l:message)
    else
      call system('notify-send ' . l:title . ' ' . l:message)
    endif
  endif
endfunction

function! keepeye#feature#notification#Deactivate()
  " Nothin to do
endfunction
