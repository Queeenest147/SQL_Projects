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
- Columns: 18 (10 key columns are most relevant for analysis)

## Key Columns

| Column Name          | Description                                   | Type       | Unit       |
|----------------------|-----------------------------------------------|------------|------------|
| year                 | Year of flight                                | int        | N/A        |
| month                | Month of flight                               | int        | N/A        |
| day                  | Day of flight                                 | int        | N/A        |
| departure_time       | Actual departure timestamp                     | timestamp  | N/A        |
| arrival_time         | Actual arrival timestamp                       | timestamp  | N/A        |
| wheels_off           | Time aircraft leaves the runway                | timestamp  | N/A        |
| wheels_on            | Time aircraft touches down                     | timestamp  | N/A        |
| origin_airport       | Departure airport code                          | string     | N/A        |
| destination_airport  | Arrival airport code                            | string     | N/A        |
| airtime              | Duration of flight                             | int        | minutes    |
| taxi_out             | Time spent taxiing before takeoff               | int        | minutes    |
| taxi_in              | Time spent taxiing after landing                | int        | minutes    |
| departure_delay      | Delay in departure                             | int        | minutes    |
| arrival_delay        | Delay in arrival                               | int        | minutes    |
| weather_delay        | Delay caused by weather                        | int        | minutes    |
| late_aircraft_delay  | Delay caused by late arrival of previous aircraft | int     | minutes    |
| cancelled            | Flight cancellation flag                        | boolean    | N/A        |
| cancellation_code    | Reason for cancellation (A/B/C/D)              | string     | N/A        |

---

## Known Limitations
- Some `arrival_time` or `departure_time` values are missing for cancelled flights.  
- Limited weather details included; cannot fully explain all delays.  
- Dataset only covers US flights in 2024, so trends may not generalize to other years.  
- Possible duplicates or errors in recorded delays.

---

## Usability
- Score: 10.00 / 10  
- Expected update frequency: Annually

---

## Potential Analytical Questions
These questions guide understanding of the dataset before analysis:  

### Airline & Route Performance
- Which airports and routes have the best on-time performance?  
- Which airlines experience the most delays or cancellations?  

### Time-Based Patterns
- Do delays occur more frequently at certain times of day (morning, afternoon, evening)?  
- Are there monthly or seasonal patterns in flight delays?  

### Weather & Operational Impact
- How does weather influence flight delays?  
- To what extent do late arrivals of previous aircraft (`late_aircraft_delay`) affect subsequent flights?
