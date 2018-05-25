let s:finish = v:false

function! keepeye#Callback(timer) abort
  let s:backup = &statusline

  call keepeye#core#DisableProviderStatusLines()
  call keepeye#core#ActivateFeatures()
  call keepeye#core#BuildStatusLine()

  let s:finish = v:true
endfunction

function! keepeye#Clear() abort
  if ! s:finish | return | endif

  let &statusline = s:backup

  call keepeye#core#EnableProviderStatusLines()

  let s:finish = v:false
endfunction

function! keepeye#Start() abort
  call keepeye#Clear()
  call timer_start(g:keepeye_timer * 1000, 'keepeye#Callback')
endfunction

