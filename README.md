# 🧠 TextMining App

**TextMining** is an interactive web application built with **R** and **Shiny** for performing basic text mining operations on uploaded documents. Users can preprocess text data, visualize word frequencies using word clouds and bar plots, and analyze word associations—all from a user-friendly interface.

🔗 **Try it online**: [https://pyamaster.shinyapps.io/TextMining/](https://pyamaster.shinyapps.io/TextMining/)

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)


## 🚀 Features

- 📂 Upload and clean text documents (with customizable options)
- 🧹 Remove stopwords, numbers, punctuation, and apply stemming
- ☁️ Generate word clouds based on frequency
- 📊 Display bar plots of the most frequent words
- 🔗 Explore word associations based on correlation thresholds


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


## 🛠️ Technologies & Libraries

- **R Shiny**, `shinydashboard`, `bs4Dash` – Interface  
- `tm`, `SnowballC`, `stringr` – Text preprocessing  
- `wordcloud`, `RColorBrewer` – Visualization  
- `DT` – Interactive tables  
- `tidyverse` – Data manipulation  


## 📦 Installation

Install the required R packages:

```r
install.packages(c(
  "shiny", "shinydashboard", "shinyjs", "shinythemes", "shinydashboardPlus",
  "shinyEffects", "bs4Dash", "DT", "tidyverse", "stringr",
  "tm", "SnowballC", "wordcloud", "RColorBrewer"
))
```

## ▶️ Running the App Locally
1. Clone this repository or download the source code.
2. Open the project in RStudio.
3. Launch the app using:

```r
shiny::runApp()
```

## 📄 Example Input
- Upload a plain text file (`.txt`)
- Choose preprocessing options (e.g., stemming, stopwords, etc.)

## ✅ Sample Use Case
This app is ideal for:
- Teaching basic text mining concepts
- Quick exploration of textual data
- Identifying key terms and their relationships in small corpora

## 📌 Known Limitations
- Only supports single plain-text documents
- No multi-language analysis per document
- No advanced NLP features (e.g., topic modeling, sentiment analysis)

## 📬 Feedback & Contributions
Feel free to open issues or pull requests to suggest improvements, report bugs, or contribute enhancements.

## 📜 License
This project is licensed under the MIT License. See the LICENSE file for details.
