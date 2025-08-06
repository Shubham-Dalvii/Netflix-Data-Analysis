![Netflix_Image](https://github.com/Shubham-Dalvii/Netflix-Data-Analysis/blob/main/netflix.jpg)

# Netflix-Data-Analysis using SQL

This project performs **Exploratory Data Analysis (EDA)** on a Netflix dataset using **SQL** to uncover patterns in content type, ratings, genres, country distribution, actor appearances, and time-based trends.

---

## 🎯 Objective

To explore and analyze Netflix's content catalog using SQL queries and derive meaningful insights about content trends and user viewing options without any data preprocessing.

---

## 🗂️ Dataset Summary

- **Source**: [Netflix Shows Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Records**: ~8,800+
- **Features**:
  - `title`, `type`, `director`, `cast`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`

---

## 🔍 Key SQL Questions Answered

| # | Question |
|--|----------|
| 1 | Total number of Movies and TV Shows |
| 2 | Most common rating for each content type |
| 3 | List all movies released in 2020 |
| 4 | Top 5 countries with most Netflix content |
| 5 | Longest movie on Netflix |
| 6 | TV shows with more than 3 seasons |
| 7 | Content added in the last 5 years |
| 8 | Salman Khan movies in the last 10 years |
| 9 | Top 10 actors in Indian Netflix content |
| 10 | Categorize content as Action_Film or Normal_Film |

---

## 🛠️ Tools Used

- SQL (PostgreSQL / SQLite)
- SQL Editor / DB Browser
- Microsoft Word (for report formatting)

---

## 📄 Sample SQL Query

```sql
SELECT Content_type, COUNT(*) AS Total_Count
FROM Netflix
GROUP BY Content_type;
