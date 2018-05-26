function! keepeye#feature#bell#Activate()
  let l:exe = substitute(g:keepeye_feature_bell_cmd, '\s', '', 'g')
  if ! executable(l:exe) | return | endif

  let l:flags = shellescape(g:keepeye_feature_bell_cmd_flags)
  let l:path = shellescape(g:keepeye_feature_bell_audio_path)
  let l:cmd = join([l:exe, l:flags, l:path, '&'], ' ')

  call system(l:cmd)
endfunction

function! keepeye#feature#bell#Desactivate()
  " Nothing to do
endfunction

