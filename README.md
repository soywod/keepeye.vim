# KeepEye

KeepEye is a vim plugin that invites you to take a break after a huge coding session. By default, it will notify you after 25min, with the message at the middle of your status line: `SAVE YOUR EYES, TAKE A BREAK`.

![image](https://user-images.githubusercontent.com/10437171/40429072-0ca8f20e-5ea2-11e8-8e19-0a1a0728caf1.png)

## What's new ?

 - *05/25* - [BREAKING CHANGES] refactor options to improve repo organization
 - *05/25* - add support for custom audio player (thanks to [@trmendes](https://github.com/trmendes))
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
### Basic configuration

1. Launch the plugin at vim startup

```viml
let g:keepeye_autostart = boolean
```

Default: `v:true`


2. Setup features to activate when you reach the timer

```viml
let g:keepeye_features = ['bell', 'notification']
```

Default: `[]`

The `'bell'` feature plays a bell song (1)
The `'notification'` feature shows a system notification (2)


3. Set the message to show

```viml
let g:keepeye_message = string
```

Default: `'SAVE YOUR EYES, TAKE A BREAK'`


4. Set the work time

```viml
let g:keepeye_timer = integer
```

Default: `1500` (25min)


(1) The default player used is [mpv](https://mpv.io/)
(2) Only Linux systems are supported for now

### Advanced configuration

1. Use hl user to color the statusline message (1)   *keepeye-message-hl-user*

```viml
let g:keepeye_message_hl_user = integer | v:null
```

Default: `v:null`


2. Set a custom player for the bell feature         *keepeye-feature-bell-cmd*

```viml
let g:keepeye_feature_bell_cmd = string
```

Default: `'mpv'`


3. Set custom player flags for the bell       *keepeye-feature-bell-cmd-flags*

```viml
let g:keepeye_feature_bell_cmd_flags = string
```

Default: `''`


4. Set a custom audio file for the bell      *keepeye-feature-bell-audio-path*

```viml
let g:keepeye_feature_bell_audio_path = string
```

Default: `'<PLUGIN_FOLDER>/media/bell.mp3'`


(1) See [examples](#examples), or `:help hl-User`

## Examples

To get the message `-- BREAK TIME --` with a notification and a bell sound:

```viml
let g:keepeye_features = ['bell', 'notification']
let g:keepeye_message = '-- BREAK TIME --'
```

To color your statusline in red via the hl group `User1`:

```viml
higlight User1 guifg=#ffffff guifb=#ff0000
let g:keepeye_message_hl_user = 1
```

To use [moc player](http://moc.daper.net/) to ring the bell (instead of `mpv`):

```viml
let g:keepeye_features = ['bell']
let g:keepeye_feature_bell_cmd = 'mocp'
let g:keepeye_feature_bell_cmd_flags = '-l'
```

