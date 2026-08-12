# Cyclistic Bike-Share Analysis

## Business Context
Cyclistic is a fictional bike-share company used in the Google Data Analytics Capstone project. The company serves two main customer groups: casual riders, who purchase individual rides or passes, and annual members. The marketing team wants to increase the number of annual memberships because members are considered a more valuable and stable customer segment. To support this goal, this analysis examines how casual riders and annual members use the service differently.

## Business Problem
To analyze historical bike trip data to identify differences between casual riders and annual members, and to use these insights to develop strategies for converting casual riders into annual members.

## Data

The dataset consists of 12 monthly CSV files of Divvy bike-share trip data for the year 2022. Each file contains information about individual bike rides, including ride ID, bike type, start/end times, station names, geographical coordinates, and rider type (member/casual).

The original 12 monthly CSV files are not included in this repository due to their large file size. The complete dataset is publicly available from the [Divvy Trip Data repository](https://divvy-tripdata.s3.amazonaws.com/index.html).

## Data Preparation
The 12 monthly datasets were combined into one dataset using Python and Pandas.

### Cleaning Steps

1.  **Checked data structure:**
    *   Verified that all monthly files had the same columns and format using `df.columns.equals()`.
    *   Combined the 12 files into one dataset using `pd.concat()`.
2.  **Checked data types:**
    *   Converted `started_at` and `ended_at` to datetime objects using `pd.to_datetime()`.
    *   Verified data types using `all_rides_df.info()`.
3.  **Checked missing values:**
    *   Identified missing values in station-related columns (`start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `end_lat`, `end_lng`) using `all_rides_df.isnull().sum()`.
    *   No rows were dropped based on these specific missing values as they did not affect the required analysis for this notebook.
4.  **Checked duplicates:**
    *   Checked `ride_id` for duplicate records using `all_rides_df.duplicated().sum()`.
    *   The check revealed no duplicate records, so no removal was necessary.
5.  **Created analysis columns:**
    *   Calculated ride duration (`ride_length`) from `started_at` and `ended_at`.
    *   Extracted the day of the week (`day_of_week`) and month-based season (`season`) for time-based analysis.
6.  **Checked invalid data:**
    *   Checked for invalid ride start/end times where `started_at` was after `ended_at`.
    *   Corrected these records by swapping the `started_at` and `ended_at` values to ensure chronological order.
    *   Created `ride_length_min` and `duration_group` to categorize ride lengths for further analysis, implicitly handling unreasonable durations by categorizing them into bins.

### Result

The cleaned dataset was saved to `clean_divvy_tripdata.csv` and subsequently used for the analysis phase. The cleaning process ensured that the data had a consistent structure, appropriate data types, and usable values for comparing casual riders and annual members.

## Analysis
The analysis focused on comparing casual riders and annual members across various metrics:
*   Overall ride volume.
*   Average ride duration.
*   Ride duration variation by weekday and time of day.
*   Bike type preferences.
*   Most popular start and end stations.
*   Ride duration distribution.
*   Peak ride activity times (hour, weekday, month).

## Key Findings

### Ride Volume

<table>
  <tr>
    <td><img src="visualizations/Ride%20volume.png" width="700"></td>
  </tr>
</table>

- Annual members generated a higher ride volume than casual riders throughout the analysis period.

### Ride Duration

<table>
  <tr>
    <td><img src="visualizations/Rider%27s%20average%20ride%20time.png" width="700"></td>
  </tr>
</table>

- Casual riders had an average ride duration that was more than twice as long as annual members. This suggests that casual riders primarily use the bikes for leisure and recreational purposes rather than transportation.

### Usage Patterns

- **Casual rider behavior**

  - Average ride duration increased noticeably between 11:00 PM–4:00 AM and 10:00 AM–3:00 PM. Although ride volume during these periods was relatively low, riders tended to take much longer trips.
  - Ride volume gradually increased from Thursday onward, peaked on Saturday, and remained high on Sunday. Average ride duration was also longer on weekends, especially Sunday, indicating recreational usage.

<table>
  <tr>
    <td><img src="visualizations/Casual%20Rider%27s%20Ride%20Count%20by%20Hour.png" width="450"></td>
    <td><img src="visualizations/Casual%20Rider%27s%20Ride%20Count%20by%20Weekdays.png" width="450"></td>
  </tr>
</table>

- **Annual member behavior**

  - Average ride duration remained relatively consistent throughout the day.
  - Ride volume increased sharply between 3:00 PM and 7:00 PM, corresponding to typical commuting hours after work.
  - Ride volume decreased on weekends, unlike casual riders, while ride duration remained fairly stable across the week.

<table>
  <tr>
    <td><img src="visualizations/Annual%20Rider%27s%20Ride%20Count%20by%20Hour.png" width="450"></td>
    <td><img src="visualizations/Annual%20Rider%27s%20Ride%20Count%20by%20Weekday.png" width="450"></td>
  </tr>
</table>

### Bike Type Preference

<table>
  <tr>
    <td><img src="visualizations/Casual%20Rider%27s%20bike%20preference.png" width="450"></td>
    <td><img src="visualizations/Annual%20Rider%27s%20bike%20preference.png" width="450"></td>
  </tr>
</table>

- **Bike type preference**
  - Casual riders showed a stronger preference for electric bikes, likely because they provide a more comfortable and enjoyable riding experience.
  - Annual members used both bike types more evenly, with no strong preference observed.

### Ride Duration Distribution

<table>
  <tr>
    <td><img src="visualizations/Ride%20Duration%20Distribution.png" width="700"></td>
  </tr>
</table>

- **Ride duration distribution**
  - Casual riders were more likely to take medium- to long-duration rides.
  - Annual members predominantly took short-duration rides.
- **Overall Conclusion**
  - The analysis indicates two distinct usage patterns:
    - Casual riders primarily use the bike-sharing service for leisure and recreation. They prefer longer rides, ride more frequently on weekends and during summer, and tend to choose electric bikes for a more comfortable experience.
    - Annual members mainly use the service for daily commuting. Their rides are shorter, more consistent in duration, and concentrated on weekday morning and late afternoon commuting hours.

## Recommendations
*   **Promote Leisure Rides**: Promote leisure rides during weekends and daytime, when casual riders are most active.
*   **Highlight Weekend Activities**: Emphasize weekend recreation and leisure activities in marketing campaigns.
*   **Showcase Electric Bikes**: Highlight the convenience and comfort of electric bikes, which are preferred by casual riders.

## Tools
*   Python
*   Pandas (for data manipulation and analysis)
*   NumPy (for numerical operations)
*   Google Colab (as the development environment)

## Project Files
*   [Jupyter Notebook](notebooks/Cyclistic_Case_Study.ipynb)
*   [Cleaned Data](data/clean_divvy_tripdata.csv)
*   [Raw Data](data/)
*   [Visualizations](visualizations/)
*   [Requirements](requirements.txt)

## Tableau Dashboard
[Link to Interactive Tableau Dashboard →]
