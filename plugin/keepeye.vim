" Basic options ==============================================================

let g:keepeye_autostart = get(g:, 'keepeye_autostart', v:true)
let g:keepeye_features = get(g:, 'keepeye_features', ['statusline'])
let g:keepeye_message = get(g:, 'keepeye_message', 'SAVE YOUR EYES, TAKE A BREAK')
let g:keepeye_timer = get(g:, 'keepeye_timer', 1500)

" Advanced options ===========================================================

let g:keepeye_feature_bell_audio_path = get(
      \ g:, 'keepeye_feature_bell_audio_path',
      \ resolve(expand('<sfile>:h') . '/../media/bell.mp3')
      \)

let g:keepeye_feature_bell_cmd = get(
      \ g:, 'keepeye_feature_bell_cmd',
      \ 'mpv'
      \)

let g:keepeye_feature_bell_cmd_flags = get(
      \ g:, 'keepeye_feature_bell_cmd_flags',
      \ ''
      \)

let g:keepeye_message_hl_user = get(
      \ g:, 'keepeye_message_hl_user',
      \ v:null
      \)

" Error messages from obsolete options =======================================

if exists('g:keepeye_callback')
  echo '[ERROR] KeepEye: `g:keepeye_callback` is no longer available (considered useless)'
endif

if exists('g:keepeye_system_bell')
  echo '[ERROR] KeepEye: `g:keepeye_system_bell` is no longer available (:help keepeye-features)'
endif

if exists('g:keepeye_system_bell_cmd')
  echo '[ERROR] KeepEye: `g:keepeye_system_bell_cmd` is now `g:keepeye_feature_bell_cmd` (:help keepeye-feature-bell-cmd)'
endif

if exists('g:keepeye_system_bell_cmd_flags')
  echo '[ERROR] KeepEye: `g:keepeye_system_bell_cmd_flags` is now `g:keepeye_feature_bell_cmd_flags` (:help keepeye-feature-bell-cmd-flags)'
endif

if exists('g:keepeye_system_notification')
  echo '[ERROR] KeepEye: `g:keepeye_system_notification` is no longer available (:help keepeye-features)'
endif

if exists('g:keepeye_statusline_hl_group')
  echo '[ERROR] KeepEye: `g:keepeye_statusline_hl_group` is now `g:keepeye_message_hl_user` (:help keepeye-message-hl-user)'
endif

" Commands ===================================================================

command! -range KeepEye call keepeye#core#Start()
command! -range KeepEyeClear call keepeye#core#DeactivateFeatures()

if g:keepeye_autostart
  autocmd VimEnter * KeepEye
endif

