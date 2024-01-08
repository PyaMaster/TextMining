#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shinydashboard)
library(shinyjs)
library(shinythemes)
library(tidyverse)
library(shinydashboardPlus)
library(shinyEffects)
library(bs4Dash)
library(DT)
library(stringr)
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

cleanning <- function(path,removenum,language,stopword,stem){
  #Load the text
  text <- readLines(path)
  # Load the data as a corpus
  docs <- Corpus(VectorSource(text))
  #Text transformation
  toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
  docs <- tm_map(docs, toSpace, "/")
  docs <- tm_map(docs, toSpace, "@")
  docs <- tm_map(docs, toSpace, "\\|")
  #Cleaning the text
  # Convert the text to lower case
  docs <- tm_map(docs, content_transformer(tolower))
  # Remove numbers
  if(removenum=="Yes")docs <- tm_map(docs, removeNumbers)
  # Remove common stopwords
  docs <- tm_map(docs, removeWords, stopwords(language))
  # Remove your own stop word
  # specify your stopwords as a character vector
  if(stopword!=""){
    if(TRUE %in% str_detect(stopword,",")){
      docs <- tm_map(docs, removeWords, as_vector(str_split(stopword,",")))
    }else{
      docs <- tm_map(docs, removeWords, stopword)
    }
  }
  # Remove punctuations
  docs <- tm_map(docs, removePunctuation)
  # Eliminate extra white spaces
  docs <- tm_map(docs, stripWhitespace)
  # Text stemming
  if(stem=="Yes")docs <- tm_map(docs, stemDocument)
  return(docs)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  observeEvent(input$docimport,{
    language <- input$lang
    path <- input$doc
    removenum <- input$removeNum
    stopword <- input$removeword
    stem <- input$stemming
    docs<-cleanning(path$datapath,removenum,language,stopword,stem)

    #Step 4: Build a term-document matrix
    dtm <- TermDocumentMatrix(docs)
    m <- as.matrix(dtm)
    v <- sort(rowSums(m),decreasing=TRUE)
    d <- data.frame(word = names(v),freq=v)
    output$wordcloud<-renderPlot({
      minfreq<-input$minfreq
      maxword<-input$maxword
      #Step 5: Generate the Word cloud
      set.seed(1234)
      wordcloud(words = d$word, freq = d$freq, min.freq = minfreq,
                max.words=maxword, random.order=FALSE, rot.per=0.35,
                colors=brewer.pal(8, "Dark2"))
    })
    output$barplot<-renderPlot({
      n<-input$barwords
      barplot(d[1:n,]$freq, las = 2, names.arg = d[1:n,]$word,
              col ="lightblue", main ="Most frequent words",
              ylab = "Word frequencies")
    })
    word_ass_base<-reactive({
      wordass<-input$wordass
      cor<-input$cor
      a<-findAssocs(dtm, terms = wordass, corlimit = cor)
      b <- data.frame(word = names(a[[1]]),corr=a[[1]])
      b
    })
    output$base<-renderDataTable({
      datatable(
        word_ass_base(),
        extensions = "Buttons",
        options = list(
          dom = "Bfrtip",
          buttons = c("copy", "csv", "excel", "pdf", "print")
        )
      )
    })
  })

})
