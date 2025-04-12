-- Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Drop existing tables if rerunning
DROP TABLE IF EXISTS undersea_cables, naval_activity, landing_stations;

-- Undersea cable route
CREATE TABLE undersea_cables (
  id SERIAL PRIMARY KEY,
  name TEXT,
  geom GEOGRAPHY(LINESTRING, 4326),
  landing_country TEXT
);

-- Naval activity (Russian vessels)
CREATE TABLE naval_activity (
  id SERIAL PRIMARY KEY,
  vessel_name TEXT,
  type TEXT,
  nation TEXT,
  geom GEOGRAPHY(POINT, 4326),
  timestamp TIMESTAMP
);

-- Cable landing stations
CREATE TABLE landing_stations (
  id SERIAL PRIMARY KEY,
  country TEXT,
  geom GEOGRAPHY(POINT, 4326)
);

-- Insert sample cable
INSERT INTO undersea_cables (name, geom, landing_country)
VALUES (
  'BalticConnector',
  ST_GeogFromText('LINESTRING(24.7536 59.4370, 18.0686 59.3293)'),
  'Estonia'
);

-- Insert Russian vessel
INSERT INTO naval_activity (vessel_name, type, nation, geom, timestamp)
VALUES (
  'Akademik Pashin', 'Intelligence Ship', 'Russia',
  ST_GeogFromText('POINT(21.5 59.3)'),
  NOW() - INTERVAL '1 day'
);

-- Insert landing stations
INSERT INTO landing_stations (country, geom)
VALUES
  ('Estonia', ST_GeogFromText('POINT(24.7536 59.4370)')),
  ('Sweden', ST_GeogFromText('POINT(18.0686 59.3293)'));
