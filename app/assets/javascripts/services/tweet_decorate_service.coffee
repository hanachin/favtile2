class App.Services.TweetDecorateService
  constructor: (@tweetJson) ->

  # utils
  entityText: (e) ->
    @tweetJson.text[e.indices[0]..e.indices[1]]

  displayUrl: (e) ->
    e.display_url ? e.url

  expandedUrl: (e) ->
    e.expanded_url ? e.url

  # entity partials
  urlEntity: (e) ->
    $('<a>').attr(class: 'urls',  target: '_blank', href: @expandedUrl e).text @displayUrl e

  mediaEntity: (e) ->
    $('<a>').attr(class: 'media', target: '_blank', href: @expandedUrl e).text @displayUrl e

  userMentionEntity: (e) ->
    $('<a>').attr(class: 'user_mentions', target: '_self', href: "/#{encodeURIComponent e.screen_name}").text @entityText e

  hashtagEntity: (e) ->
    $('<a>').attr(class: 'hashtags',      target: '_self', href: "/##{encodeURIComponent e.text}").text @entityText e

  unknownEntity: (e) ->
    console?.log "unknown entity type", e
    @entityText e

  decorateEntity: (type, e) ->
    switch type
      when 'urls'          then @urlEntity e
      when 'user_mentions' then @mediaEntity e
      when 'hashtags'      then @hashtagEntity e
      when 'media'         then @mediaEntity e
      else                      @unknownEntity e

  # tewak tweet text :)
  decorate: ->
    { text, entities } = @tweetJson

    v.type = t for v in values for own t, values of entities
    entities = _.chain(v for own t, v of entities).flatten().sortBy((e) -> e.indices[0]).value()

    $el = $('<div>')
    pos = 0
    for e in entities
      # add text between entities
      $el.append text[pos...e.indices[0]]
      pos = e.indices[1]

      $ent = $ @decorateEntity e.type, e
      $el.append $ent.embedly
        key: '3e44f228543a11e184354040d3dc5c07'
        query:
          maxwidth: 200
        done: ->
          $ent.imagesLoaded().done -> App.routers.appRouter.trigger('relayout')

    # rest text
    $el.append text[pos..]
    $el
