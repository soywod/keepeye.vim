function! keepeye#system#bell#Trigger(message)
  if executable('mpv')
    call system('mpv ' . shellescape(g:keepeye_bell_path) . '&')
  endif
endfunction

