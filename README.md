# 🧠 TextMining App

**TextMining** is an interactive web application built with **R** and **Shiny** for performing basic text mining operations on uploaded documents. Users can preprocess text data, visualize word frequencies using word clouds and bar plots, and analyze word associations—all from a user-friendly interface.

🔗 **Try it online**: [https://pyamaster.shinyapps.io/TextMining/](https://pyamaster.shinyapps.io/TextMining/)

---

## 🚀 Features

- 📂 Upload and clean text documents (with customizable options)
- 🧹 Remove stopwords, numbers, punctuation, and apply stemming
- ☁️ Generate word clouds based on frequency
- 📊 Display bar plots of the most frequent words
- 🔗 Explore word associations based on correlation thresholds

---

## 🖥️ Application Overview

The application consists of three main tabs:

### 📂 Choose Doc
- Upload your `.txt` file  
- Choose the language of stopwords  
- Optionally remove numbers or apply stemming  
- Add custom words to exclude from analysis  

### 📊 Analysis
- Generate a word cloud of the most frequent terms  
- View a barplot showing top N word frequencies  

### 🔗 Words Association
- Enter a word to explore its associations with other terms based on correlation  
- Adjust the minimum correlation threshold  
- View associations in a downloadable table  

---

## 🛠️ Technologies & Libraries

- **R Shiny**, `shinydashboard`, `bs4Dash` – Interface  
- `tm`, `SnowballC`, `stringr` – Text preprocessing  
- `wordcloud`, `RColorBrewer` – Visualization  
- `DT` – Interactive tables  
- `tidyverse` – Data manipulation  

---

## 📦 Installation

Install the required R packages:

```r
install.packages(c(
  "shiny", "shinydashboard", "shinyjs", "shinythemes", "shinydashboardPlus",
  "shinyEffects", "bs4Dash", "DT", "tidyverse", "stringr",
  "tm", "SnowballC", "wordcloud", "RColorBrewer"
))

