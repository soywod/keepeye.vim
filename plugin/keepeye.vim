let g:keepeye_autostart = get(g:, 'keepeye_autostart', 0)
let g:keepeye_callback = get(g:, 'keepeye_callback', 'keepeye#Callback')
let g:keepeye_message = get(g:, 'keepeye_message', 'SAVE YOUR EYES, DO A BREAK')
let g:keepeye_timer = get(g:, 'keepeye_timer', 3600)

command! -range KeepEyeStart call keepeye#Start()
command! -range KeepEyeStop call keepeye#Stop()

if g:keepeye_autostart
  autocmd VimEnter * KeepEyeStart
endif

