# KeepEye

KeepEye is a vim plugin that invites you to take a break after a huge coding session. By default, it will notify you after 25min, with the message at the middle of your status line: `SAVE YOUR EYES, TAKE A BREAK`.

![image](https://user-images.githubusercontent.com/10437171/40429072-0ca8f20e-5ea2-11e8-8e19-0a1a0728caf1.png)

## What's new ?

 - *05/30* - add system notification feature for Mac based on [terminal-notifier](https://github.com/julienXX/terminal-notifier) (thanks to [@crisidev](https://github.com/crisidev))
 - *05/26* - **[BREAKING CHANGES] due to a lot of new features these days, a good refactor was mandatory to maintain more easily this plugin in the future. You will be notified at plugin startup if you use an obsolete option (see [plugin/keepeye.vim](https://github.com/soywod/vim-keepeye/blob/177b77d688119bc84cb0c41e91f30e0f99ebbe9a/plugin/keepeye.vim#L30-L54))**
 - *05/25* - add support for custom audio player (thanks to [@trmendes](https://github.com/trmendes))
 - *05/25* - add [lightline.vim](https://github.com/itchyny/lightline.vim) integration
 - *05/25* - add User hl-group support (thanks to [@kristijanhusak](https://github.com/kristijanhusak))
 - *05/25* - add [vim-airline](https://github.com/vim-airline/vim-airline) integration
 - *05/24* - add bell sound feature :bell:
 - *05/23* - add system notification feature for Linux (thanks to [@stsewd](https://github.com/stsewd))

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
### Basic configuration

Launch the plugin at vim startup

```viml
let g:keepeye_autostart = boolean
" Default v:true
```

Setup features to activate when reach the timer

```viml
let g:keepeye_features = ['bell', 'notification', 'statusline']
" Default ['statusline']

" The bell feature plays a bell song (1)
" The notification feature shows a system notification (2)
" The statusline feature put a message in your statusline
```

Set the message to show (used by notification and statusline features)

```viml
let g:keepeye_message = string
" Default 'SAVE YOUR EYES, TAKE A BREAK'
```

Set the work time

```viml
let g:keepeye_timer = integer
" Default 1500 (25min)
```

(1) The default player used is [mpv](https://mpv.io/)

(2) Only Linux systems are supported for now

### Advanced configuration

Use hl user to color the statusline message (1)

```viml
let g:keepeye_message_hl_user = integer | v:null
" Default v:null
```

Set a custom player for the bell feature

```viml
let g:keepeye_feature_bell_cmd = string
" Default 'mpv'
```

Set custom player flags for the bell

```viml
let g:keepeye_feature_bell_cmd_flags = string
" Default ''
```

Set a custom audio file for the bell

```viml
let g:keepeye_feature_bell_audio_path = string
" Default '<PLUGIN_FOLDER>/media/bell.mp3'
```

(1) See [examples](#examples), or `:help hl-User`

## Examples

To get the message `-- BREAK TIME --` with a notification and a bell sound

```viml
let g:keepeye_features = ['bell', 'notification']
let g:keepeye_message = '-- BREAK TIME --'
```

To color your statusline in red via the hl group `User1`

```viml
highlight User1 guifg=#ffffff guifb=#ff0000
let g:keepeye_features = ['statusline']
let g:keepeye_message_hl_user = 1
```

To use [moc player](http://moc.daper.net/) to ring the bell (instead of [mpv](https://mpv.io/))

```viml
let g:keepeye_features = ['bell']
let g:keepeye_feature_bell_cmd = 'mocp'
let g:keepeye_feature_bell_cmd_flags = '-l'
```

