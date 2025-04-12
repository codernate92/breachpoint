# 💥 BreachPoint  
*Baltic Cable Threat Simulation using PostGIS + Mapbox*  
**Category:** 🛰️ GEOINT · 🛡️ Infrastructure Security · 🌐 OSINT Threat Modeling

---

## 🚨 Overview

**BreachPoint** is a threat simulation platform that models Russian sabotage of undersea fiber-optic cables in the Baltic Sea — inspired by real-world hybrid warfare scenarios like the 2022 Nord Stream attack.

Built with **PostGIS**, **Mapbox GL JS**, and **open geospatial tooling**, the project simulates Russian naval proximity to the BalticConnector cable, visualizes threat zones, and ranks infrastructure risk in real time.

---

## 🧠 Key Features

- 📍 Proximity detection using `ST_DWithin()` and `ST_Distance()`
- 🛰️ Dynamic sabotage threat zones with `ST_Buffer()`
- 🧭 Landing station risk rankings based on naval proximity
- 🌐 Live visualization with Mapbox GL JS + Turf.js
- ⚙️ GeoJSON overlays for map rendering and dashboard use

---

## 🧰 Stack + Tools

| Layer       | Tools Used                                       |
|-------------|--------------------------------------------------|
| 💽 Database | PostgreSQL 14 + PostGIS                          |
| 🧠 Analysis | SQL: `ST_DWithin`, `ST_Buffer`, `ST_AsGeoJSON`  |
| 🖥️ Frontend | Mapbox GL JS + Turf.js                          |
| 📡 Scenario | BalticConnector cable, Akademik Pashin vessel, Estonia + Sweden landing stations |

---

## 🧪 Sample Query

```sql
-- Detect Russian vessels within 10km of any undersea cable
SELECT n.vessel_name, c.name AS cable_name
FROM naval_activity n
JOIN undersea_cables c
  ON ST_DWithin(n.geom, c.geom, 10000)
WHERE n.nation = 'Russia';
