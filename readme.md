# 📌 Overview
This project was developed for a fictional e-scooter sharing company to assist them in the **optimal placement of their vehicles**.  
It gathers, processes, and stores data from multiple sources to provide a scalable and reliable data pipeline.

## ⚙️ Features
- Scrapes **demographic and geographic data** for cities from Wikipedia.  
- Collects **live flights data** from the RapidAPI Aerodatabox.  
- Retrieves **live weather data** from the OpenWeatherMap API.  
- **Global coverage** — works with any city that has a Wikipedia page.  


## 🗄️ Database
A relational database was designed in **MySQL 8.0** to:  
- Store and update retrieved data.  
- Ensure data integrity with ** relationships**  and **constraints**.  
- Support efficient updates and queries.  

## 🛠️ Technologies Used
- **Python**: Pandas, BeautifulSoup, Requests, SQLAlchemy  
- **MySQL 8.0**  
