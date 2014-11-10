@Core = do (Backbone,Marionette) ->
  
  App = new Backbone.Marionette.Application

  App.on "start", (options) ->
    console.log "Core APP STARTED"

    # map = new Map.Controller

  # App.on "initialize:before", (options) ->        
    # console.log "BEFORE INITIALIZER"

  # App.addRegions
  #   root : "#root"

  # App.on "initialize:after", (options) ->
  #   console.log "HELLO WORLD!"
    # set locale for date and time
    # moment.lang(I18n.locale)
        
  App