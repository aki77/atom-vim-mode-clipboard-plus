# vim-mode-clipboard-plus package

Add clipboard-plus feature to vim-mode.

See [clipboard-plus](https://atom.io/packages/clipboard-plus) for details.

## Requirement

* [vim-mode](https://atom.io/packages/vim-mode)
* [clipboard-plus](https://atom.io/packages/clipboard-plus)

## Keymap

No keymap by default.

edit `~/.atom/keymap.cson`

```coffeescript
'.platform-darwin atom-text-editor.vim-mode:not(.insert-mode)':
  'ctrl-p': 'clipboard-plus:toggle'

'.platform-linux atom-text-editor.vim-mode:not(.insert-mode)':
  'alt-p': 'clipboard-plus:toggle'
```
