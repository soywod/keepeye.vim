function! keepeye#system#Notify(message)
  if has('unix') && !has('mac')
    let l:message = substitute(a:message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

function! keepeye#system#Bell()
  if executable('mpv')
    call system('mpv ' . shellescape(g:keepeye_bell_path) . '&')
  elseif executable('mocp')
    call system('mocp -l ' . shellescape(g:keepeye_bell_path) . '&')
  elseif executable('cvlc')
    call system('cvlc ' . shellescape(g:keepeye_bell_path) . ' 2> /dev/null &')
  endif
endfunction

