let s:features = ['bell', 'notification']
let s:providers = {
      \ 'airline': exists('g:loaded_airline') && g:loaded_airline,
      \ 'lightline': exists('g:loaded_lightline') && g:loaded_lightline,
      \}

function! keepeye#core#ActivateFeatures() abort
  for l:feature in g:keepeye_features
    if index(s:features, l:feature) != -1
      execute('call keepeye#feature#' . l:feature . '#Activate()')
    endif
  endfor
endfunction

function! keepeye#core#BuildStatusLine() abort
  let l:colshlen = &columns / 2
  let l:msghlen = strdisplaywidth(g:keepeye_message) / 2
  let l:message = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  let &statusline = g:keepeye_message_hl_user
        \ ? '%' . g:keepeye_message_hl_user . '*' . l:message
        \ : l:message
endfunction

function! keepeye#core#DisableProviderStatusLines() abort
  call s:ToggleProviderStatusLines('Disable')
endfunction

function! keepeye#core#EnableProviderStatusLines() abort
  call s:ToggleProviderStatusLines('Enable')
endfunction

function! s:ToggleProviderStatusLines(state) abort
  for [l:provider, l:is_provider_loaded] in items(s:providers)
    if l:is_provider_loaded
      execute('call keepeye#statusline#' . l:provider . '#' . a:state . '()')
      break
    endif
  endfor
endfunction

