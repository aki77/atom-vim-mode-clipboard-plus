{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null
  namespace: null

  config:
    useVimModePlus:
      description: 'Use vim-mode-plus'
      type: 'boolean'
      default: false

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add(atom.config.observe('vim-mode-clipboard-plus.useVimModePlus', (value) =>
      @namespace = if value then 'vim-mode-plus' else 'vim-mode'
      atom.config.set("#{@namespace}.useClipboardAsDefaultRegister", true)
    ))

    @installPackageDependencies()

  deactivate: ->
    @subscriptions?.dispose()
    @subscriptions = null
    @namespace = null

  consumeClipboardPlus: ({registerPasteAction}) ->
    registerPasteAction((editor, item) =>
      editorElement = atom.views.getView(editor)
      atom.commands.dispatch(editorElement, "#{@namespace}:put-after")
    )

  installPackageDependencies: ->
    return if atom.packages.getLoadedPackage('clipboard-plus')
    message = 'vim-mode-clipboard-plus: Some dependencies not found. Running "apm install" on these for you. Please wait for a success confirmation!'
    notification = atom.notifications.addInfo(message, { dismissable: true })
    require('atom-package-dependencies').install ->
      atom.notifications.addSuccess('vim-mode-clipboard-plus: Dependencies installed correctly.', dismissable: true)
      notification.dismiss()
      atom.packages.activatePackage('clipboard-plus')
