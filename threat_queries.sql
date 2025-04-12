-- Detect Russian vessels within 10km of cables
SELECT n.vessel_name, c.name AS cable_name
FROM naval_activity n
JOIN undersea_cables c
  ON ST_DWithin(n.geom, c.geom, 10000)
WHERE n.nation = 'Russia';

-- Rank landing stations by Russian vessel proximity
SELECT l.country, COUNT(n.id) AS threat_count
FROM landing_stations l
JOIN naval_activity n
  ON ST_DWithin(l.geom, n.geom, 15000)
WHERE n.nation = 'Russia'
GROUP BY l.country
ORDER BY threat_count DESC;

-- Export threat vessels as GeoJSON
SELECT id, vessel_name, ST_AsGeoJSON(geom) AS geojson
FROM naval_activity
WHERE nation = 'Russia';

-- Generate threat buffer zones
SELECT vessel_name, ST_Buffer(geom::geometry, 10000)::geography AS threat_zone
FROM naval_activity
WHERE nation = 'Russia';
