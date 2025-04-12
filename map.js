mapboxgl.accessToken = 'YOUR_MAPBOX_TOKEN'; // Replace this

const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/dark-v11',
  center: [21.5, 59.3],
  zoom: 5
});

map.on('load', () => {
  // Undersea cable line
  map.addSource('cable', {
    type: 'geojson',
    data: {
      type: "Feature",
      geometry: {
        type: "LineString",
        coordinates: [
          [24.7536, 59.4370], // Estonia
          [18.0686, 59.3293]  // Sweden
        ]
      }
    }
  });

  map.addLayer({
    id: 'cable-line',
    type: 'line',
    source: 'cable',
    paint: {
      'line-color': '#00ffff',
      'line-width': 4
    }
  });

  // Russian vessel
  map.addSource('vessel', {
    type: 'geojson',
    data: {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [21.5, 59.3]
      },
      properties: {
        name: "Akademik Pashin"
      }
    }
  });

  map.addLayer({
    id: 'vessel-circle',
    type: 'circle',
    source: 'vessel',
    paint: {
      'circle-radius': 8,
      'circle-color': '#ff0000',
      'circle-stroke-width': 2,
      'circle-stroke-color': '#ffffff'
    }
  });

  // Threat buffer zone (10km)
  const buffer = turf.circle([21.5, 59.3], 10, { steps: 64, units: 'kilometers' });

  map.addSource('buffer', {
    type: 'geojson',
    data: buffer
  });

  map.addLayer({
    id: 'threat-buffer',
    type: 'fill',
    source: 'buffer',
    paint: {
      'fill-color': '#ff0000',
      'fill-opacity': 0.25
    }
  });
});
