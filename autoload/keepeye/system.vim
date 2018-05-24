function! keepeye#system#Notify()
  if has('unix') && !has('mac')
    let l:message = substitute(g:keepeye_message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

function! keepeye#system#Bell()
  if executable('mpv')
    call system('mpv ' . shellescape(g:keepeye_bell_path) . '&')
  endif
endfunction

