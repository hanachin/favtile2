class App.Views.Application extends Backbone.View
  el: '#app'

  initialize: ->
    @listenTo App.routers.appRouter, 'relayout', @relayout

    @twitterUserView = new App.Views.TwitterUser
    @tweetViews      = @collection.map (m) -> new App.Views.Tweet(model: m)

  render: ->
    @$el.html ''
    _.each @tweetViews, (v) -> v.render()
    _.each @tweetViews, (v) => v.$el.appendTo @$el
    @$el.masonry itemSelector: '.tweet', isAnimated: true
    @

  relayout: ->
    @$el.masonry 'reload'
