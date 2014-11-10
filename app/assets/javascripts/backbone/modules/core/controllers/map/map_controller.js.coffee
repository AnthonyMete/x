@Core.module "Map", (Map, App, Backbone, Marionette, $, _) ->
  
  class Map.Controller extends Marionette.Controller
    
    @startWithParent = false

    initialize: (options) ->
      "INITIALIZE MAP CONTROLLER"

    # initialize: (options) ->

    #   if options.initialCoords.type == "bounds"
    #     @initialCoords = options.initialCoords
    #     sw = new google.maps.LatLng(options.initialCoords.sw.lat, options.initialCoords.sw.lng)
    #     ne = new google.maps.LatLng(options.initialCoords.ne.lat, options.initialCoords.ne.lng)
    #     bounds = new google.maps.LatLngBounds(sw, ne)
    #     centerCoords = bounds.getCenter()
    #   else if options.initialCoords.type == "point"
    #     centerCoords = new google.maps.LatLng(options.initialCoords.lat, options.initialCoords.lng)
    #   else if options.initialCoords.type == "union_bounds"
    #     bounds = options.initialCoords
    #     centerCoords = bounds.getCenter()
    #   # console.log "starting map controller with ", options.coords
    #   @polygons = [] #all the polygons on the map
    #   @map = @initializeMap(centerCoords, options.el)
    #   @map.fitBounds(bounds) if bounds
      
    #   @drawingManager = @getDrawingManager()
    #   @drawingManager.setMap(@map)
    #   searchbar = @initializeSearchBar() if options.searchbar
      
    #   App.reqres.setHandler "map:polygon:new", (options) => @newPolygon(options)
    #   App.reqres.setHandler "map:polygon:edit", (options) => @editPolygon(options)
    #   App.reqres.setHandler "map:polygon:edit:color", (options) => @editPolygonColor(options)
    #   App.reqres.setHandler "map:polygon:edit:opacity", (options) => @editPolygonOpacity(options)
    #   App.reqres.setHandler "map:polygon:edit:cancel", (options) => @cancelEditPolygon(options)
    #   App.reqres.setHandler "map:polygon:swap", (options) => @swapPolygon(options)
    #   App.reqres.setHandler "map:polygon:show", (options) => @showPolygon(options)
    #   App.reqres.setHandler "map:polygon:delete", (options) => @deletePolygon(options)
    #   App.reqres.setHandler "map:polygon:zoomTo", (options) => @zoomToPolygon(options)

    #   App.reqres.setHandler "map:allpolygons:zoomTo", (options) => @seeAllPolygons(options)
    #   App.reqres.setHandler "map:allpolygons:opacity:default", (options) => @setDefaultOpacity(options)

    #   App.reqres.setHandler "map:clear", (options) => @clearMap(options)

    #   App.reqres.setHandler "map:mode:view", => @cancelDrawMode()
      
    # getMap: ->
    #   @map
    
    # initializeMap: (coords, el) ->
    #   remove_poi = [
    #     {
    #       "featureType": "poi",
    #       "elementType": "labels",
    #       "stylers": [
    #         { "visibility": "off" }
    #       ]
    #     }
    #   ]       
    #   mapOptions =
    #     center: coords
    #     zoom: 12 
    #     panControl: true
    #     panControlOptions:
    #       position: google.maps.ControlPosition.TOP_RIGHT    
    #     zoomControl: true
    #     zoomControlOptions:
    #       style: google.maps.ZoomControlStyle.LARGE,
    #       position: google.maps.ControlPosition.TOP_RIGHT   
    #     mapTypeControl: false
    #     scaleControl: true
    #     streetViewControl: false
    #     overviewMapControl: false
    #     styles: remove_poi

    #   new google.maps.Map(document.getElementById(el), mapOptions)
    
    # getDrawingManager: ->
    #   drawingManagerOptions = 
    #     drawingControl: false
    #     drawingControlOptions:
    #       position: google.maps.ControlPosition.BOTTOM_CENTER
    #       drawingModes: [google.maps.drawing.OverlayType.POLYGON]
    #     polygonOptions:
    #       strokeColor: "#000000"
    #       strokeOpacity: 1
    #       strokeWeight: 2
    #       fillColor: "#000000"
    #       fillOpacity: 0.06
    #       zIndex: 1

    #   new google.maps.drawing.DrawingManager drawingManagerOptions
    
    # cancelDrawMode: ->
    #   @drawingManager.setOptions 
    #     drawingMode: null
    #     drawingControl: false

    # editPolygon: (options) ->
    #   if options?.polygon        
    #     @drawingManager.setOptions
    #       drawingControl: true
    #       drawingControlOptions:
    #         position: google.maps.ControlPosition.BOTTOM_CENTER
    #         drawingModes: []

    #     polygon = options.polygon
    #     polygonOptions = 
    #       editable: true
    #       draggable: true
    #       zIndex: 10
    #     polygon.setOptions(polygonOptions)
        
    #     google.maps.event.addListener polygon.getPath(), "set_at", ->
    #       options.deferred?.notify(polygon)

    #     google.maps.event.addListener polygon.getPath(), "insert_at", ->
    #       options.deferred?.notify(polygon)

    #     google.maps.event.addListener polygon.getPath(), "remove_at", ->
    #       options.deferred?.notify(polygon)
    #   else
    #     console.log "gimme a polygon!"
    
    # cancelEditPolygon: (options) ->
    #   if options?.polygon
    #     polygon = options.polygon
    #     polygonOptions = 
    #       editable: false
    #       draggable: false
    #     polygon.setOptions(polygonOptions)
    
    # editPolygonColor: (options) ->
    #   if options?.polygon
    #     polygon = options.polygon
    #     new_color = if options.color then options.color else "#000000"
    #     polygonOptions = 
    #       strokeColor: new_color
    #       strokeOpacity: 1
    #       strokeWeight: 2
    #       fillColor: new_color
    #       fillOpacity: 0.06
    #       zIndex: 1
        
    #     polygon.setOptions polygonOptions
    #   else
    #     console.log "gimme a polygon!"
    
    # editPolygonOpacity: (options) ->
    #   polygon = options.polygon
    #   new_opacity = options.opacity

    #   polygon.setOptions
    #     fillOpacity: new_opacity
    
    # deletePolygon: (options) ->
    #   if options?.polygon
    #     options.polygon.setMap(null)
    #     p_idx = @polygons.indexOf(options.polygon)
    #     @polygons.splice(p_idx, -1)
    #   else
    #     console.log "gimme a polygon!"

    # newPolygon: (options = {color: "#000000"}) ->
    #   polygonOptions = Provender.defaultPolygonOptions
    #   polygonOptions.strokeColor = options.color
    #   polygonOptions.fillColor = options.color

    #   @drawingManager.setOptions 
    #     drawingMode: google.maps.drawing.OverlayType.POLYGON
    #     drawingControl: true
    #     drawingControlOptions:
    #       position: google.maps.ControlPosition.BOTTOM_CENTER
    #       drawingModes: [google.maps.drawing.OverlayType.POLYGON]
    #     polygonOptions: polygonOptions

    #   google.maps.event.addListenerOnce @drawingManager, "polygoncomplete", (polygon) =>    
    #     options.deferred.resolve polygon
    #     @polygons.push polygon
      
    # swapPolygon: (options) ->
    #   options.new_polygon.setMap(@map)
    #   options.old_polygon.setMap(null)
    #   old_p = @polygons.indexOf(options.old_polygon)
    #   @polygons[old_p] = options.new_polygon

    # showPolygon: (options) ->
    #   polygon = options.polygon
    #   polygon.setMap(@map)
    #   @polygons.push polygon
    
    # zoomToPolygon: (options) ->      
    #   polygon_bounds = options.polygon.getBounds()
    #   @map.fitBounds(polygon_bounds)
    
    # seeAllPolygons: (options) ->
    #   if @initialCoords and @polygons.length == 0
    #     sw = new google.maps.LatLng(@initialCoords.sw.lat, @initialCoords.sw.lng)
    #     ne = new google.maps.LatLng(@initialCoords.ne.lat, @initialCoords.ne.lng)
    #     unionBounds = new google.maps.LatLngBounds(sw, ne)
    #   else 
    #     unionBounds = new google.maps.LatLngBounds()
    #     for polygon in @polygons
    #       unionBounds.union(polygon.getBounds())
      
    #   @map.fitBounds(unionBounds)
    
    # setDefaultOpacity: ->
    #   for polygon in @polygons
    #     @editPolygonOpacity({polygon: polygon, opacity: Provender.defaultPolygonOptions.fillOpacity})
    
    # clearMap: (options) ->
    #   for polygon in @polygons
    #     polygon.setMap(null)

    #   @polygons = []
    
    # initializeSearchBar: ->
    #   #TODO: stop autocomplete from disappearing on submit
    #   input = document.getElementById("map-searchbar")
    #   autocomplete_options = { types: ['(cities)'] }

    #   onPlaceChanged = =>
    #     place = @autocomplete.getPlace()
        
    #     if place.geometry
    #       @map.panTo( place.geometry.location )
    #       @map.setZoom(12)      
      
    #   @autocomplete = new google.maps.places.Autocomplete(input, autocomplete_options)

    #   places = new google.maps.places.PlacesService(@map)

    #   google.maps.event.addListener( @autocomplete, 'place_changed', -> onPlaceChanged() )