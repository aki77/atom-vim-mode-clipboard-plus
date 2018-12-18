# vim-mode-clipboard-plus package

Add clipboard-plus feature to vim-mode.

See [clipboard-plus](https://atom.io/packages/clipboard-plus) for details.

## Requirement

* [vim-mode](https://atom.io/packages/vim-mode) or [vim-mode-plus](https://atom.io/packages/vim-mode-plus)
* [clipboard-plus](https://atom.io/packages/clipboard-plus)

## Keymap

No keymap by default.

edit `~/.atom/keymap.cson`

```coffeescript
'.platform-darwin atom-text-editor.vim-mode-plus:not(.insert-mode)':
  'ctrl-p': 'clipboard-plus:toggle'

'.platform-win32 atom-text-editor.vim-mode-plus:not(.insert-mode), .platform-linux atom-text-editor.vim-mode-plus:not(.insert-mode)':
  'alt-p': 'clipboard-plus:toggle'
```

## Settings

* `useVimModePlus` (default: false)
