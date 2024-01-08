#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Define UI for application
shinyUI(dashboardPage(

  # Application title
  dashboardHeader(title ="Text Mining App"),
  #Menu
  dashboardSidebar(
    sidebarMenu(
      menuItem(tabName = "file", text = "Choose Doc", icon = icon("folder-open")),
      menuItem(tabName = "data", text = "Analysis", icon = icon("chart-bar")),
      menuItem(tabName = "data1", text = "Words Association", icon = icon("th"))
    )
  ),
  #Body contents
  dashboardBody(
    tabItems(
      tabItem(tabName = "file",
              fluidRow(
                box(
                  title = "Import your document",
                  status = "primary",
                  selectInput("lang", label = "Document Language", choices = list("danish","dutch","english","finnish","french","german","hungarian","italian","norwegian","portuguese","russian","spanish","swedish"),
                              selected = "english"),
                  selectInput("removeNum", label = "Do you want do remove numbers for the analysis ?", choices = list("Yes","No")),
                  textInput("removeword", label = "Enter additional words you want to remove for the analysis"),
                  selectInput("stemming", label = "Do you want to do the text stemming ?", choices = list("No","Yes")),
                  fileInput("doc", label = "Document"),
                  fluidRow(column(4,p("")),column(3,actionButton("docimport","Import",type="primary",class="btn-lg")))
                )
              )
      ),
      tabItem(tabName = "data",
              fluidRow(
                box(
                  title = "words cloud",
                  status = "primary",
                  sliderInput("minfreq", label = "Minimu frequencie", min = 1, max = 26, value = 1),
                  numericInput("maxword", label = "Maximun of words", value = 200),
                  plotOutput("wordcloud")
                ),
                box(
                  title = "Word frequencies barplot",
                  status = "primary",
                  numericInput("barwords", label = "You want to do the barplot of the ... most frequent words", value = 10),
                  plotOutput("barplot")
                )
              )
      ),
      tabItem(tabName = "data1",
              fluidRow(
                box(
                  title = "Analyse of words association",
                  status = "primary",
                  textInput("wordass", label = "Enter a word to analyse his assosiation with other words"),
                  sliderInput("cor", label = "set the minimum correlation for the association", min = 0, max = 1, value = 0.3),
                  dataTableOutput("base")
                )
              )
      )
    )
  ),
  title = "Dashboard example"
))
