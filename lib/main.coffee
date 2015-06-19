module.exports =
  activate: ->
    atom.config.set('vim-mode.useClipboardAsDefaultRegister', true)
    @installPackageDependencies()

  deactivate: ->

  consumeClipboardPlus: ({registerPasteAction}) ->
    registerPasteAction((editor, item) ->
      editorElement = atom.views.getView(editor)
      atom.commands.dispatch(editorElement, 'vim-mode:put-after')
    )

  installPackageDependencies: ->
    return if atom.packages.getLoadedPackage('clipboard-plus')
    message = 'vim-mode-clipboard-plus: Some dependencies not found. Running "apm install" on these for you. Please wait for a success confirmation!'
    notification = atom.notifications.addInfo(message, { dismissable: true })
    require('atom-package-dependencies').install ->
      atom.notifications.addSuccess('vim-mode-clipboard-plus: Dependencies installed correctly.', dismissable: true)
      notification.dismiss()
      atom.packages.activatePackage('clipboard-plus')
