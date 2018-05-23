# KeepEye

A Vim plugin to keep your eyes safe.

![image](https://user-images.githubusercontent.com/10437171/40420681-5d851752-5e89-11e8-9c1a-67bb6f8d237e.png)

## Introduction

KeepEye is a vim plugin that invites you to do a break after a huge coding session.

By default, it will notify you after 1h, with the message at the middle of your status line: `SAVE YOUR EYES, DO A BREAK`.

## Installation

```viml
Plug 'soywod/vim-keepeye'
```

## Usage

`:KeepEye` to start the timer

`:KeepEyeClear` to clear the message and reset the status bar

## Configuration

To automatically launch KeepEye at vim startup:

```viml
let g:keepeye_autostart = 0 | 1
```

Default value: `0`

To customize the KeepEye callback:

```viml
let g:keepeye_callback = 'MyCallback'
```

Default value: `'keepeye#Callback'`

To customize the KeepEye message (only if `g:keepeye_callback` is not set ):

```viml
let g:keepeye_message = '-- CUSTOM MESSAGE --'
```

Default value: `'SAVE YOUR EYES, DO A BREAK'`

To change the timer (in seconds):

```viml
let g:keepeye_timer = 10
```

Default value: `3600`
