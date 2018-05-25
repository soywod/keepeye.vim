function! keepeye#system#Notify(message)
  if has('unix') && !has('mac')
    let l:message = substitute(a:message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

function! keepeye#system#Bell()
  let l:player = substitute(g:keepeye_bell_cmd, '\s', '', 'g')
  if executable(l:player)
    call system(l:player . ' ' . shellescape(g:keepeye_bell_cmd_flags) . ' ' . shellescape(g:keepeye_bell_path) . '&')
  endif
endfunction

