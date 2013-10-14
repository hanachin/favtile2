class App.Routers.AppRouter extends Backbone.Router
  routes:
    ':screen_name': 'favorites'

  favorites: (screen_name) ->
    App.collections.tweets = new App.Collections.Tweets
    App.collections.tweets.reset(App.Bootstraps.favorites)

    App.views.app = new App.Views.Application collection: App.collections.tweets
    App.views.app.render()
