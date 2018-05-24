# KeepEye

KeepEye is a vim plugin that invites you to take a break after a huge coding session. By default, it will notify you after 25min, with the message at the middle of your status line: `SAVE YOUR EYES, TAKE A BREAK`.

![image](https://user-images.githubusercontent.com/10437171/40429072-0ca8f20e-5ea2-11e8-8e19-0a1a0728caf1.png)

## What's new ?

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
let g:keepeye_system_notification = v:false            " enable the system notification (2)
let g:keepeye_timer = 1500                             " set the work time, 25min by default
```
1. [mpv](https://mpv.io/) is required for this feature
2. only Linux systems are supported for this feature
