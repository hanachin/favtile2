class App.Views.TwitterUser extends Backbone.View
  el: '.twitter-user'

  events:
    'change .twitter-user-screen-name': 'updateAction'

  updateAction: ->
    @$el.attr 'action', "/" + encodeURIComponent $('.twitter-user-screen-name').val()
