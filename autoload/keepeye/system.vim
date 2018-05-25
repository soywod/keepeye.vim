function! keepeye#system#Notify(message)
  if has('unix') && !has('mac')
    let l:message = substitute(a:message, '-', '\\-', '')
    call system('notify-send KeepEye ' . shellescape(l:message))
  endif
endfunction

function! keepeye#system#Bell()
  let l:player =  split(g:keepeye_bell_player, " ")[0]
  if executable(l:player)
    let output = system(g:keepeye_bell_player . ' ' . shellescape(g:keepeye_bell_path) . '&')
  endif
endfunction

