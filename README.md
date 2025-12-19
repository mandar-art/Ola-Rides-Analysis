# 🚖 OLA Rides Analysis – End‑to‑End Data Analytics Project

## 📌 Project Overview

This project presents an **end‑to‑end data analytics workflow** on **OLA ride booking data**, covering **data cleaning, database integration, SQL analysis, and interactive dashboarding**. The goal is to analyze ride performance, booking outcomes, cancellations, and revenue patterns to derive **actionable business insights**.

The project follows a complete analytics lifecycle:
**Raw Data → Data Cleaning (Python) → Database (MySQL) → Business Queries (SQL) → Visualization (Power BI)**.

---

## 📂 Project Structure

```
├── OLA_DATA_Dataset.csv        # Raw dataset
├── Ola Data Cleaning.ipynb     # Python data cleaning & transformation
├── Ola Queries.sql             # SQL queries for business questions
├── Ola Dashboard.pbix          # Power BI dashboard file
├── Questions.txt               # Problem statements / business questions
└── README.md                   # Project documentation
```

---

## 📊 Dataset Description (OLA_DATA_Dataset.csv)

The dataset contains **ride‑level booking information** for OLA rides.

### Key Columns:

* **Booking_ID** – Unique identifier for each ride
* **Date** – Ride booking date (with time component initially)
* **Time** – Ride booking time
* **Time_cat** – Time of day category (Morning / Afternoon / Evening / Night)
* **Booking_Status** – Ride outcome (Success, Cancelled by Customer, Cancelled by Driver)
* **Incomplete_Rides** – Indicator for incomplete rides
* **Incomplete_Rides_Reason** – Reason for ride incompletion
* **Vehicle_Type** – Type of vehicle used for the ride
* **Pickup_Location / Drop_Location** – Ride locations
* **Ride_Distance** – Distance covered during the ride
* **Booking_Value** – Revenue generated per ride
* **Payment_Method** – Mode of payment
* **Customer_Rating / Driver_Ratings** – Experience ratings
* **C_TAT / V_TAT** – Customer and Vehicle turnaround times

This dataset enables analysis of **demand patterns, cancellations, revenue drivers, and service quality**.

---

## 🧹 Data Cleaning & Preparation (Python)

Data cleaning and preprocessing were performed using **Python (Pandas)** in `Ola Data Cleaning.ipynb`.

### Key Cleaning Steps:

* Removed data inconsistencies and handled missing values
* Converted **date and time columns** to appropriate datetime formats
* Extracted date and time components for analysis
* Categorized time into four buckets:

  * **Morning**
  * **Afternoon**
  * **Evening**
  * **Night**
* Standardized categorical values for consistency

These steps ensured the dataset was **analysis‑ready and reliable**.

---

## 🛢 Database Integration (MySQL)

* The cleaned dataset was **connected and loaded into MySQL** from Python
* Proper data types were maintained during the load process
* The database layer was used to support **efficient querying and analysis**

This step simulates a **real‑world analytics pipeline**, where cleaned data is stored centrally for reporting.

---

## 🧠 SQL Analysis

All business questions from `Questions.txt` were solved using **SQL queries** in `Ola Queries.sql`.

### Example Analysis Areas:

* Total rides and successful bookings
* Cancellation analysis by vehicle type and time of day
* Complete vs incomplete ride comparison
* Revenue contribution by vehicle type and payment method
* Trend analysis across dates and time categories

SQL techniques used include:

* `GROUP BY` and aggregation
* Conditional logic using `CASE`
* Filtering and sorting
* Date and time functions

---

## 📈 Power BI Dashboard

An **interactive 3‑page Power BI dashboard** was built using the cleaned and analyzed data.

### 📄 Page 1: KPI Overview

* Total Rides
* Successful vs Cancelled Rides
* Cancellation Percentage
* Total Revenue
* Average Booking Value

### 📄 Page 2: Booking & Cancellation Analysis

* Booking Status by Vehicle Type (stacked visuals)
* Cancellation reasons analysis
* Complete vs Incomplete rides breakdown

### 📄 Page 3: Revenue Analysis

* Revenue by Vehicle Type
* Revenue by Time of Day
* Complete vs Incomplete ride revenue comparison

The dashboard provides **clear, decision‑oriented insights** for operational and business teams.

---

## 🎯 Key Insights Generated

* Identified **peak demand time slots** and high‑cancellation periods
* Analyzed which **vehicle types contribute most to revenue**
* Highlighted major **reasons for ride cancellations**
* Compared revenue impact of **completed vs incomplete rides**

---

## 🛠 Tools & Technologies Used

* **Python** (Pandas, NumPy)
* **MySQL**
* **SQL**
* **Power BI**
* **Excel / CSV**

## 📬 Contact

* **Author:** Mandar Manjare
* **Role:** Aspiring Data Analyst
* **LinkedIn:** www.linkedin.com/in/mandar-manjare


