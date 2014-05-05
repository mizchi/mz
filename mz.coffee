require './bower_components/momic/momic'
require './bower_components/warden/src/warden'

window.mz = {}
mz.Model = Momic.Model
mz.Router = Warden
mz.Controller = Warden.Controller

class mz.Application
  setup: (options) -> new Promise (done) =>
    mz.Model.setup({
      name: options?.name ? 'app'
      collections: options?.collections ? []
    }).then =>
      init = ->
        window.removeEventListener 'warden:routed'
        done()
      window.addEventListener 'warden:routed', init
      mz.router = new mz.Router(opts.router)
