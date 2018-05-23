# KeepEye

A Vim plugin to keep your eyes safe.

## Introduction

KeepEye is a vim plugin that invites you to do a break after a huge coding session.

By default, it will notify you after 1h, with the message at the middle of your status line: `SAVE YOUR EYES, DO A BREAK`.

## Installation

```vim
Plug 'soywod/vim-keepeye'
```

## Usage

 - `:KeepEyeStart` to start the timer
 - `:KeepEyeStop` to stop the timer

## Configuration

To automatically launch KeepEye at vim startup:

```vim
let g:keepeye_autostart = 0 | 1
```

Default value: `0`

To customize the KeepEye callback:

```vim
let g:keepeye_callback = 'MyCallback'
```

Default value: `'keepeye#Callback'`

To customize the KeepEye message (only if `g:keepeye_callback` is not set ):

```vim
let g:keepeye_message = '-- CUSTOM MESSAGE --'
```

Default value: `'SAVE YOUR EYES, DO A BREAK'`

To change the timer (in seconds):

```vim
let g:keepeye_timer = 10
```

Default value: `3600`

