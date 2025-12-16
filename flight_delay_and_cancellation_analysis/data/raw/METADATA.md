# Flight Delay & Cancellation Analysis - Metadata

## Dataset Source
- Source: Kaggle  
- Contributor: Aleesha Nadeem  
- File: `flight_data_2024.csv` (88.62 MB)  
- License: CC0 Public Domain  
- Last Updated: October 2024  
- URL: [Dataset](https://www.kaggle.com/datasets/nalisha/flight-delay-and-cancellation-data-1-million-2024?resource=download)  

**Note:** This dataset contains the full set of US flights in 2024.

## Time Coverage
- Year: 2024  
- Months: January – December 2024  
- Each row contains the exact date and time of departure.

## Unit of Analysis
- Each row represents **one flight**.

## Dataset Type
- Transactional

## Row and Column Count
- Rows: 1,048,575  
- Columns: 18 (all are included; key columns highlighted in descriptions below)

## Key Columns

| Column Name              | Description                                               | Type       | Unit       |
|---------------------------|-----------------------------------------------------------|------------|------------|
| year                      | Year of flight                                            | int        | N/A        |
| month                     | Month of flight                                           | int        | N/A        |
| day                       | Day of the month                                         | int        | N/A        |
| day_of_week               | Day of week (1=Monday, 7=Sunday)                         | int        | N/A        |
| flight_date               | Full flight date (YYYY-MM-DD)                             | date       | N/A        |
| origin_airport            | Departure airport code                                    | string     | N/A        |
| origin_city               | Origin city name                                          | string     | N/A        |
| origin_state              | Origin state                                             | string     | N/A        |
| departure_time            | Scheduled/actual departure time                           | int        | HHMM       |
| taxi_out_minutes          | Time spent taxiing before takeoff                         | int        | minutes    |
| takeoff_time              | Wheels off / aircraft takeoff time                        | int        | HHMM       |
| landing_time              | Wheels on / aircraft landing time                          | int        | HHMM       |
| taxi_in_minutes           | Time spent taxiing after landing                           | int        | minutes    |
| is_cancelled              | Flight cancellation flag (1=yes, 0=no)                   | boolean    | N/A        |
| flight_duration_minutes   | Air time / flight duration                                 | int        | minutes    |
| distance_miles            | Flight distance                                           | int        | miles      |
| weather_delay_minutes     | Delay caused by weather                                   | int        | minutes    |
| late_aircraft_delay_minutes | Delay caused by late arrival of previous aircraft       | int        | minutes    |

---

## Known Limitations
- Some `departure_time`, `takeoff_time`, `landing_time`, or `flight_duration_minutes` values are missing for cancelled flights.  
- Limited weather details included; cannot fully explain all delays.  
- The dataset only covers US flights in 2024, so trends may not generalise to other years.  
- Possible duplicates or errors in recorded delays.

---

## Potential Analytical Questions
These questions guide the understanding of the dataset before analysis:  

### Airline & Route Performance
- Which airports and routes have the best on-time performance?  
- Which airlines experience the most delays or cancellations?  

### Time-Based Patterns
- Do delays occur more frequently at certain times of day (morning, afternoon, evening)?  
- Are there monthly or seasonal patterns in flight delays?  

### Weather & Operational Impact
- How does the weather influence flight delays?  
- To what extent do late arrivals of previous aircraft (`late_aircraft_delay_minutes`) affect subsequent flights?

