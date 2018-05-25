function! keepeye#system#bell#Trigger(message)
  let l:player = substitute(g:keepeye_system_bell_cmd, '\s', '', 'g')
  if executable(l:player)
    call system(join([l:player, shellescape(g:keepeye_system_bell_cmd_flags), shellescape(g:keepeye_bell_path), '&'], ' '))
  endif
endfunction

