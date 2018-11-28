
source("./src/replaceText.R")
source("./src/tabPanel2Content.R")


nGramData <- setDT(readRDS('./dta/nGramData.RData'))
unigramData <- readRDS('./dta/unigram.RData')

ui <- shinyUI(
        fluidPage(theme = "bootstrap.css",
                tabsetPanel(
                        tabPanel(div(style = "font-weight:normal; font-size:12px; color:#2471A3", 'Home'),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:40px;"))),
                                fluidRow(column(12, align="center",
                                        img(src='logo_v2.png', align='center', width = 450, height = 143.77))),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:30px;"))),
                                fluidRow(column(12, align="center",
                                        textInput(inputId ='searchBar', 
                                                label = div(style = "font-weight: normal; font-size:16px; 
                                                        color:#8597AB; font-family:Arial",'Type a phrase here :'), value = '', width = '600px'))),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:20px;"))),
                                fluidRow(column(12, align="center",
                                        div(style = "; font-family:Arial; font-size:16px; color:#8597AB; padding:20px;","Top predicted next word :"))),
                                #fluidRow(column(12, align="center", textOutput('predict')))
                                fluidRow(column(12, align="center",
                                        div(style = "font-weight:bold; font-size:22px; color:#2471A3; font-family:Segoe UI", 
                                                textOutput("predict")))),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:80px;"))),
                                fluidRow(column(width = 12, align="center", style="padding:1px",
                                        div(style = "font-weight:normal; font-size:10px; font-family:Segoe UI", 
                                                'Created by :'))),
                                fluidRow(column(width = 12, align="center", style="padding:1px",
                                        div(
                                                tags$a(style = "font-weight:normal; font-size:10px; font-family:Segoe UI; color:#3681DA",
                                                        href = 'https://www.linkedin.com/in/grejell-segura-13009a15/','Grejell B. Segura')))),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:5px;"))),
                                fluidRow(column(width = 12, align="center", style="padding:1px",
                                        div(style = "font-weight:normal; font-size:10px; font-family:Segoe UI", 
                                                'Powered by :'))),
                                fluidRow(column(12, align="center",
                                        img(src='tools.png', align='center', width = 150, height = 47)))
                                ),  #this closes the tabPanel1
                        tabPanel(div(style = "font-family:Segoe UI; font-weight:normal; font-size:12px; color:#2471A3", 'About the App'),
                                fluidRow(column(12, align="center", style="padding:10px;",
                                        img(src='logo_v2.png', align='center', width = 400, height = 127.8))),
                                fluidRow(column(12, align="center",
                                        h4(" ", style="padding:10px;"))),
                                        tabContent # function located in tabPanel2Content.R
                                 ) #this closes the tabPanel2
                        ) #this closes the tabsetPanels
                ) #this closes the fluidPage
        ) #this closes the shiny UI


##################################################################################################################################
##################################################################################################################################


server <- shinyServer(function(input, output){
                output$predict <- renderText({
                        sentence <- input$searchBar
                        wordBreakDown <- unlist(replaceText(sentence))
                        wordBreakDown <- strsplit(wordBreakDown, split = " ")[[1]]
                        numberWords <- length(wordBreakDown)
                        scoreTable <- data.frame()
                        if(numberWords == 0){
                                return(as.character('Type a phrase first!'))
                        } else if(numberWords >= 1){
                                # match 4 words with nGramData
                                if (numberWords > 4){
                                        numberWords = 4
                                }
                                scoreTable <- data.frame()
                                for (i in 1:numberWords){
                                        lastWords <- wordBreakDown[(length(wordBreakDown)-i):length(wordBreakDown)]
                                        lastWords <- paste(lastWords, collapse = " ")
                                        setOfNextWord <- nGramData[nGramData$typedWord %in% lastWords, ]
                                        countWords <- setOfNextWord %>% group_by(nextWord) %>% 
                                                summarise(frequency = n()) %>% arrange(desc(frequency)) %>% top_n(n = 5, wt = frequency) %>%
                                                mutate(score = ((0.4^((numberWords+1)-i))*frequency)/nrow(setOfNextWord))
                                        scoreTable <- as.data.frame(rbind(scoreTable, countWords))
                                        scoreTable <- scoreTable %>% top_n(n = 5, wt = score)
                                        scoreTable <- scoreTable[!(is.na(scoreTable$nextWord)),]
                                        if (nrow(scoreTable) < 5){
                                                addUniGram <- as.data.frame(unigramData[1:(5-nrow(scoreTable)), c('nextWord')])
                                                scoreTable <- as.data.frame(full_join(scoreTable, addUniGram, by = 'nextWord'))
                                                return(as.character(unlist(scoreTable[1:3, c('nextWord')]))) #return the top 3 words
                                        }
                                        return(as.character(unlist(scoreTable[1:3, c('nextWord')]))) #return the top 3 words
                                }
                        }
                })
        })                        

shinyApp(ui = ui, server = server)