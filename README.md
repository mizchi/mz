# mz

`mz` is mizchi's central packages for single page application.

## Included pakcages

- mizchi/momic for storages and models
- mizchi/warden for routing and controller

## Dependencies

- es6-promise
- localforage

## Architect

- mz.Router => Warden
- mz.Controller => Warden.Controller
- mz.Model => Momic.Model
- mz.Application 

### Examples

```coffeescript
Item = mz.Model.extend
  key: 'items'

controllers =
  home: class HomeController extends mz.Controller
    index: (params) ->
      console.log params.id
      @reuse {dispose: -> console.log 'it will be disposed'}

mz.Router.prototype.findController = (name) ->
  # require("./controllers/#{name}-controller") # default
  controllers[name]

routes = (match) =>
  match 'home/:id', 'home#index'

mz.Application.setup({
  name: 'app'
  collections:
    items: {}
  routes: routes
}).then => # ...
```

`mz` has some rules to run. It will fit to stucted directories like this.

```
app/
  - initialize.coffee
  - routes.coffee
  models/
    - users.coffee
  controllers
    - home-controller.coffee
```

`mz` doesn't have view library now. Author uses vue.js and jQuery.
