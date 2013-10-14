#= require jquery
#= require jquery_ujs
#= require components
#= require namespace
#= require_tree .

$ ->
  App.routers.appRouter = new App.Routers.AppRouter
  Backbone.history.start(pushState: true)
