let s:features = ['bell', 'notification', 'statusline']

function! keepeye#core#ActivateFeatures(timer) abort
  call s:ToggleFeatures('Activate')
endfunction

function! keepeye#core#DesactivateFeatures() abort
  call s:ToggleFeatures('Desactivate')
endfunction

function! keepeye#core#Start() abort
  call keepeye#core#DesactivateFeatures()
  call timer_start(g:keepeye_timer * 1000, 'keepeye#core#ActivateFeatures')
endfunction

function! s:ToggleFeatures(state) abort
  for l:feature in g:keepeye_features
    if index(s:features, l:feature) == -1 | continue | endif
    execute('call keepeye#feature#' . l:feature . '#' . a:state . '()')
  endfor
endfunction

