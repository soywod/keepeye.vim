let g:keepeye_autostart = get(g:, 'keepeye_autostart', 0)
let g:keepeye_callback = get(g:, 'keepeye_callback', 'keepeye#Callback')
let g:keepeye_message = get(g:, 'keepeye_message', 'SAVE YOUR EYES, TAKE A BREAK')
let g:keepeye_system_notification = get(g:, 'keepeye_system_notification', 0)
let g:keepeye_timer = get(g:, 'keepeye_timer', 3600)

command! -range KeepEye call keepeye#Start()
command! -range KeepEyeClear call keepeye#Clear()

if g:keepeye_autostart
  autocmd VimEnter * KeepEye
endif

