let s:providers = {
  \ 'airline': exists('g:loaded_airline') && g:loaded_airline,
  \ 'lightline': exists('g:loaded_lightline') && g:loaded_lightline,
  \ }

let s:system_events = ['bell', 'notification']

function! keepeye#helper#DisableStatusLines() abort
  for [l:provider, l:is_provider_loaded] in items(s:providers)
    if l:is_provider_loaded
      execute('call keepeye#statusline#' . l:provider . '#Disable()')
      break
    endif
  endfor
endfunction

function! keepeye#helper#EnableStatusLines() abort
  for [l:provider, l:is_provider_loaded] in items(s:providers)
    if l:is_provider_loaded
      execute('call keepeye#statusline#' . l:provider . '#Enable()')
      break
    endif
  endfor
endfunction

function! keepeye#helper#TriggerSystemEvents(message) abort
  for l:event in s:system_events
    if eval('g:keepeye_system_' . l:event)
      execute('call keepeye#system#' . l:event . '#Trigger(a:message)')
    endif
  endfor
endfunction

function! keepeye#helper#WithHighlightGroup(message) abort
  if ! g:keepeye_statusline_hl_group
    return a:message
  endif

  return '%' . g:keepeye_statusline_hl_group . '*' . a:message
endfunction

