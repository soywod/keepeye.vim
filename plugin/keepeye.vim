let g:keepeye_autostart = get(g:, 'keepeye_autostart', v:true)
let g:keepeye_callback = get(g:, 'keepeye_callback', 'keepeye#Callback')
let g:keepeye_message = get(g:, 'keepeye_message', 'SAVE YOUR EYES, TAKE A BREAK')
let g:keepeye_system_bell = get(g:, 'keepeye_system_bell', v:false)
let g:keepeye_system_notification = get(g:, 'keepeye_system_notification', v:false)
let g:keepeye_timer = get(g:, 'keepeye_timer', 1500)
let g:keepeye_bell_path = resolve(expand('<sfile>:h') . '/../media/bell.mp3')

command! -range KeepEye call keepeye#Start()
command! -range KeepEyeClear call keepeye#Clear()

if g:keepeye_autostart
  autocmd VimEnter * KeepEye
endif

