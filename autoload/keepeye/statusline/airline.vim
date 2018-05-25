function! keepeye#statusline#airline#Enable() abort
  if match(&statusline, 'airline') == -1
    AirlineToggle
  endif
endfunction

function! keepeye#statusline#airline#Disable() abort
  if match(&statusline, 'airline') != -1
    AirlineToggle
  endif
endfunction

