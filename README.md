# KeepEye

KeepEye is a vim plugin that invites you to take a break after a huge coding session. By default, it will notify you after 25min, with the message at the middle of your status line: `SAVE YOUR EYES, TAKE A BREAK`.

![image](https://user-images.githubusercontent.com/10437171/40429072-0ca8f20e-5ea2-11e8-8e19-0a1a0728caf1.png)

## What's new ?

 - *05/25* - add [lightline.vim](https://github.com/itchyny/lightline.vim) integration
 - *05/25* - add User hl-group support (thanks to [@kristijanhusak](https://github.com/kristijanhusak))
 - *05/25* - add [vim-airline](https://github.com/vim-airline/vim-airline) integration
 - *05/24* - add bell sound feature :bell:
 - *05/23* - add system notification feature (thanks to [@stsewd](https://github.com/stsewd))

## Installation

```viml
Plug 'soywod/vim-keepeye' " with vim-plug
```

## Usage

```viml
:KeepEye      " to (re)start the timer
:KeepEyeClear " to clear the message and reset the status bar
```

## Configuration

Here the default configuration:

```viml
let g:keepeye_autostart = v:true                       " launch at vim startup
let g:keepeye_callback = 'keepeye#Callback'            " customize the callback
let g:keepeye_message = 'SAVE YOUR EYES, TAKE A BREAK' " set the message to show
let g:keepeye_system_bell = v:false                    " enable the bell sound (1)
let g:keepeye_bell_cmd = 'vclc'                        " set a custom player to ring the bell
let g:keepeye_bell_cmd_flags = 'flags'                 " set the player flags to suit your needs
let g:keepeye_system_notification = v:false            " enable the system notification (2)
let g:keepeye_timer = 1500                             " set the work time, 25min by default
let g:keepeye_statusline_hl_group = v:null             " use hl group to color the statusline (3)
```
1. [mpv](https://mpv.io/) is the default player used
2. only Linux systems are supported for now
3. see `:help hl-User`

## Examples

To get the message `-- BREAK TIME --` with a notification and a bell sound:

```viml
let g:keepeye_message = '-- BREAK TIME --'
let g:keepeye_system_bell = v:true
let g:keepeye_system_notification = v:true
```
1. [mpv](https://mpv.io/) is the default player for this feature
2. only Linux systems are supported for this feature
=======

To color your statusline in red via the hl group `User1`:

```viml
higlight User1 guifg=#ffffff guifb=#ff0000
let g:keepeye_statusline_hl_group = 1
```

To use moc player to ring the bell
```viml
let g:keepeye_system_bell = v:true
let g:keepeye_bell_cmd = "mocp"
let g:keepeye_bell_cmd_flags = '-l'
```
