let s:finish = v:false

function! keepeye#Callback() abort
  let l:colshlen = &columns/2
  let l:msghlen = strdisplaywidth(g:keepeye_message)/2
  let s:message = repeat(' ', l:colshlen - l:msghlen) . g:keepeye_message

  if keepeye#hasAirline() && keepeye#isAirlineVisible()
    AirlineToggle
  endif

  let &statusline = s:getHighlightGroup().s:message

  if g:keepeye_system_bell
    call keepeye#system#Bell()
  endif

  if g:keepeye_system_notification
    call keepeye#system#Notify(s:message)
  endif
endfunction

function! keepeye#CallbackWrapper(timer) abort
  let s:finish = v:true
  let s:backup = &statusline
  execute('call ' . g:keepeye_callback . '()')
endfunction

function! keepeye#Clear() abort
  if s:finish
    let s:finish = v:false

    if keepeye#hasAirline() && ! keepeye#isAirlineVisible()
      AirlineToggle
    else
      let &statusline = s:backup
    endif
  endif
endfunction

function! keepeye#hasAirline() abort
  return exists('g:loaded_airline') && g:loaded_airline
endfunction

function! keepeye#isAirlineVisible() abort
  return match(&statusline, 'airline') != -1
endfunction

function! keepeye#Start() abort
  call keepeye#Clear()
  call timer_start(g:keepeye_timer*1000, 'keepeye#CallbackWrapper')
endfunction

function! s:getHighlightGroup() abort
  if g:keepeye_statusline_hl_group == 0
    return ''
  endif

  return '%'.g:keepeye_statusline_hl_group.'*'
endfunction

