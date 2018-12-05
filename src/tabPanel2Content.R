library(shiny)
 
tabContent <- fluidRow(column(width = 6, offset = 3, align="justified",
                       div(style = "background-color:#F2F5F7 ;align:justified; font-weight:normal; font-size:14px; font-family:Segoe UI; 
                                border-style:solid; border-color: #E4E7E9; border-width:1px",
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'This app was built as a Capstone Project for Data Science Specialization Course offered by www.coursera.org.
                                I named this particular app as Word Suggest. 
                                It uses the stupid backoff algorithm in the backend to calculate the predictions.
                                It accepts an English phrase as input and takes the last 4 words to predict the next word.
                                The top 5 most likely next word is then displayed in the bottom.
                                The user may choose one of the words as the next word for the phrase or may type any other word.
                                The process continues as long as the user wants.'),
                           p(style = 'margin: 25px 25px 25px 25px',
                                'An overview of this particular course is stated below.'),
                           p(style = 'margin: 25px 25px 25px 25px', 'Source: www.coursera.org'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'Around the world, people are spending an increasing amount of time on 
                                their mobile devices for email, social networking, banking and a whole range of other activities.
                                But typing on mobile devices can be a serious pain. SwiftKey, our corporate partner in this capstone, 
                                builds a smart keyboard that makes it easier for people to type on their mobile devices. 
                                One cornerstone of their smart keyboard is predictive text models. When someone types:'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'I went to the'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'the keyboard presents three options for what the next word might be. 
                                For example, the three words might be gym, store, restaurant. 
                                In this capstone you will work on understanding and building predictive text models like those used by SwiftKey.'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'This course will start with the basics, analyzing a large corpus of text 
                                documents to discover the structure in the data and how words are put together. 
                                It will cover cleaning and analyzing text data, then building and sampling from a predictive text model. 
                                Finally, you will use the knowledge you gained in data products to build a 
                                predictive text product you can show off to your family, friends, and potential employers.'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'You will use all of the skills you have learned during the Data Science Specialization in this course, 
                                but you will notice that we are tackling a brand new application: 
                                analysis of text data and natural language processing. 
                                This choice is on purpose. As a practicing data scientist you will be frequently 
                                confronted with new data types and problems. 
                                A big part of the fun and challenge of being a data scientist is figuring out how to 
                                work with these new data types to build data products people love. 
                                The capstone will be evaluated based on the following assessments:',
                           p(style = 'margin: 25px 25px 25px 25px',
                                        tags$ul(style="list-style-type:disc",
                                                tags$li('An introductory quiz to test whether you have downloaded and can manipulate the data.'),
                                                tags$li('An intermediate R markdown report that describes in plain language, plots, 
                                                        and code your exploratory analysis of the course data set.'),
                                                tags$li('Two natural language processing quizzes, where you apply your 
                                                        predictive model to real data to check how it is working.'),
                                                tags$li('A Shiny app that takes as input a phrase (multiple words), 
                                                        one clicks submit, and it predicts the next word.'),
                                                tags$li('A 5 slide deck created with R presentations pitching your algorithm and app to your boss or investor.'))),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'During the capstone you can get support from your fellow students, 
                                from us, and from the engineers at SwiftKey. But we really want you to show your independence, 
                                creativity, and initiative. We have been incredibly impressed by your performance in the classes 
                                up until now and know you can do great things.'),
                           p(style = 'margin: 25px 25px 25px 25px',
                                'We have compiled some basic natural language processing resources below. 
                                You are welcome to use these resources or any others you can find while performing this analysis.
                                One thing to keep in mind is that we do not expect you to become a world\'s 
                                expert in natural language processing. The point of this capstone is for you to show you can explore a new data type, 
                                quickly get up to speed on a new application, and implement a useful model in a reasonable period of time. 
                                We think NLP is very cool and depending on your future goals may be worth studying more in-depth, 
                                but you can complete this project by using your general knowledge of data science and basic knowledge of NLP.'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                'Here are a few resources that might be good places to start as you tackle this ambitious project.'),
                           p(style = 'margin: 25px 25px 25px 25px', 
                                        tags$ul(style="list-style-type:disc",
                                                tags$li('Text mining infrastucture in R'),
                                                tags$li('CRAN Task View: Natural Language Processing'),
                                                tags$li('Videos and Slides from Stanford Natural Language Processing course')))
                           )
                        )
                      ))
