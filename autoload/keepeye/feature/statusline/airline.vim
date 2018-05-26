function! keepeye#feature#statusline#airline#Enable() abort
  if match(&statusline, 'airline') == -1
    AirlineToggle
  endif
endfunction

function! keepeye#feature#statusline#airline#Disable() abort
  if match(&statusline, 'airline') != -1
    AirlineToggle
  endif
endfunction

