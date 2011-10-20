lines = Array()
latlngBounds = new google.maps.LatLngBounds()

addMarker = (checkin, previous, finish = false) ->
  latlng = new google.maps.LatLng(checkin.venue.location.lat, checkin.venue.location.lng); 
  latlngBounds.extend(latlng)
  lines.push(latlng)

  marker = new google.maps.Marker
    position: latlng
    map: window.map

  unless finish
    window.map.panTo(latlng)
  else
    window.map.fitBounds(latlngBounds)

    #travel = new google.maps.Polyline ->
    #  path: lines 
    #  strokeColor: "#FF0000"
    #  strokeOpacity: 1.0
    #  strokeWeight: 2

    #travel.setMap(window.map)
    


getCheckins = () ->
  if $('.loggedin').length > 0 and google
    # 'checkins/recent' is my recent checkins, '/tips/228176' is Bjørn's tips
    #$.getJSON('/tips/228176', (data) ->
    $.getJSON('/checkins/recent', (data) ->

      if data.items 

        window.map.setZoom(16)

        $.each data.items, (i, checkin) ->
          
          if i == data.items.length - 1
            finish = true
          else
            finish = false

          setTimeout (-> addMarker checkin, null, finish), 1000 * i

    )

$.fn.googleMap = () ->
  
  element = $(this).get(0);
  $element = $(this);

  $element.hide() # To avoid confusing Flash Of Non-interactive Map Content

  geocoder = new google.maps.Geocoder
  geocoderParams =
    address: $(this).data('address') || "Holland"
    region: "US"
  results = geocoder.geocode geocoderParams, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      window.latlngNL = latlng = results[0].geometry.location

      mapOptions =
        mapTypeControl: false
        overviewMapControl: false
        zoom: 7
        center: latlng
        mapTypeId: google.maps.MapTypeId.ROADMAP

      window.map = new google.maps.Map(element, mapOptions)
      window.map.setZoom(8)
      window.map.setCenter(latlng)

      ###
      marker = new google.maps.Marker
        position: latlng
        map: map
      ###

      $element.show() # Time to re-show the element

      getCheckins()

$('#map').googleMap()

