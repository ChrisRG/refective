import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

let map;
let mapMarkers = [];

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const clearMapMarkers = () => {
  mapMarkers.forEach((marker) => {
    marker.remove();
  });
  mapMarkers = [];
};

const buildMarkers = (map, markersJSON) => {
  clearMapMarkers();
  markersJSON.forEach((marker) => {
    const mapMarker = new mapboxgl.Marker();
    mapMarker.setLngLat([marker.lng, marker.lat]);
    mapMarker.addTo(map);
    mapMarkers.push(mapMarker);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/kibex/cklksgilw0i5r17lnxcpc0g9s",
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    buildMarkers(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox, fitMapToMarkers, buildMarkers, map };
