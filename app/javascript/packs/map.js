import GMaps from 'gmaps/gmaps.js';

import { autocomplete } from '../components/autocomplete';

autocomplete();

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });

  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);

  const styles = [
  {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "color": "#33a952"
            }
        ]
    },
    {
        "featureType": "road.highway.controlled_access",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#33a952"
            },
            {
                "weight": "2.09"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#fbbd06"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#b4c8eb"
            }
        ]
    }];

map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
