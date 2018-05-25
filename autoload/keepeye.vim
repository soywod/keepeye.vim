let s:finish = v:false

function! keepeye#Callback() abort
  let l:colshlen = &columns/2
  let l:msghlen = strdisplaywidth(g:keepeye_message)/2
  let s:message = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  call keepeye#helper#DisableStatusLines()
  call keepeye#helper#TriggerSystemEvents(s:message)

  let &statusline = keepeye#helper#WithHighlightGroup(s:message)
endfunction

function! keepeye#CallbackWrapper(timer) abort
  let s:backup = &statusline
  let s:finish = v:true

  execute('call ' . g:keepeye_callback . '()')
endfunction

function! keepeye#Clear() abort
  if s:finish
    let s:finish = v:false
    let &statusline = s:backup

    call keepeye#helper#EnableStatusLines()
  endif
endfunction

function! keepeye#Start() abort
  call keepeye#Clear()
  call timer_start(g:keepeye_timer*1000, 'keepeye#CallbackWrapper')
endfunction

