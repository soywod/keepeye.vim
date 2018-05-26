let s:finish = v:false
let s:providers = {
      \ 'airline': exists('g:loaded_airline') && g:loaded_airline,
      \ 'lightline': exists('g:loaded_lightline') && g:loaded_lightline,
      \}

function! keepeye#feature#statusline#Activate()
  let s:backup = &statusline
  call s:DisableProviderStatusLines()
  call s:ActivateStatusLine()
  let s:finish = v:true
endfunction

function! keepeye#feature#statusline#Desactivate()
  if ! s:finish | return | endif
  let &statusline = s:backup
  call s:EnableProviderStatusLines()
  let s:finish = v:false
endfunction

function! s:ActivateStatusLine() abort
  let l:colshlen = &columns / 2
  let l:msghlen = strdisplaywidth(g:keepeye_message) / 2
  let l:message = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  let &statusline = g:keepeye_message_hl_user
        \ ? '%' . g:keepeye_message_hl_user . '*' . l:message
        \ : l:message
endfunction

function! s:DisableProviderStatusLines() abort
  call s:ToggleProviderStatusLines('Disable')
endfunction

function! s:EnableProviderStatusLines() abort
  call s:ToggleProviderStatusLines('Enable')
endfunction

function! s:ToggleProviderStatusLines(state) abort
  for [l:provider, l:is_provider_loaded] in items(s:providers)
    if l:is_provider_loaded
      execute('call keepeye#feature#statusline#' . l:provider . '#' . a:state . '()')
      break
    endif
  endfor
endfunction

