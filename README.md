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

---

## 🌍 Visualization Demo

Open the interactive threat map in your browser:

```bash
visualization/index.html

Make sure to insert your Mapbox Access Token into map.js.

Map Layers Rendered:
	•	LineString: BalticConnector undersea cable
	•	Point: Simulated Russian vessel (Akademik Pashin)
	•	Polygon: 10km threat buffer via Turf.js

📂 File Structure
breachpoint/
├── breachpoint_model.sql       # Full PostGIS schema + inserts
├── threat_queries.sql          # Spatial threat detection queries
├── visualization/
│   ├── index.html              # Mapbox GL JS map container
│   └── map.js                  # Buffer logic + vessel plotting
├── README.md                   # Full project overview
├── .gitignore                  # Common project ignores
└── LICENSE                     # MIT License

🔓 OSINT + GEOINT Fusion

This project fuses:
	•	Public vessel activity patterns
	•	Undersea cable routing data
	•	Spatial SQL intelligence logic
	•	Mapbox-based threat visualization

BreachPoint demonstrates how open tooling can model hybrid conflict threats and help visualize infrastructure exposure at strategic choke points.

⸻

💡 Future Expansions
	•	Integrate AIS feeds for real-time vessel tracking
	•	Overlay EEZ boundaries to flag territorial incursions
	•	Export dynamic threat maps via GeoJSON for mission dashboards
	•	Extend with Streamlit or FastAPI frontend

⸻

✅ Outcomes

This project is:
	•	🎯 Operationally relevant
	•	💼 Interview + portfolio ready
	•	🛠️ Reproducible and expandable
	•	🔗 Ideal for GEOINT, CTI, OSINT, and defense tech use cases

⸻

🧠 TL;DR

BreachPoint simulates Russian sabotage threats to undersea cables in the Baltic Sea using PostGIS, Mapbox, and spatial intelligence techniques. It models gray-zone warfare through open geospatial tooling — turning infrastructure risk into something you can see, query, and respond to.
