class App.Views.Tweet extends Backbone.View
  template: App.Templates.tweet

  className: ->
    "tweet #{@favoritedState()} #{@retweetedState()}"

  favoritedState: ->
    if @model.get('favorited') then 'is-favorited' else ''

  retweetedState: ->
    if @model.get('retweeted') then 'is-retweeted' else ''

  render: ->
    @$el.html @template @model.toJSON()
    @decorateContent()
    @

  decorateContent: ->
    tweetDecorateService = new App.Services.TweetDecorateService(@model.toJSON())
    @$('.tweet-content').html tweetDecorateService.decorate()
