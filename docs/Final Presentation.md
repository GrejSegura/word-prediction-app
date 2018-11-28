Capstone Project: Word Prediction Application
========================================================
author: Grejell B. Segura
date: November 29, 2018
autosize: true





<img src="coursera.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="40%" style="display: block; margin: auto;" />


Word Suggest: About the App
========================================================
<img src="logo_v2.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="30%" style="display: block; margin: auto;" />


1. This application is a capstone project for the Coursera Data Science Specialization Course. 
2. It is designed to predict the next word when a phrase is entered. 
3. The data was taken from "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip" which includes news, blogs, and tweets collections. 
4. It uses the stupid backoff algorithm in the backend.
5. I named the app Word Suggest to make it more "stupid".

Here is the link for the app:

https://grejsegura.shinyapps.io/wordPredictionApp/

Process and Algorithm
========================================================
Since the raw data is too big to process, an extensive data process has to be executed. The following are the key points of the data process:

1. I decided to randomly use 20% of the appended news, blogs, and twitter data to minimize the memory and computing requirement.
2. The data was tokenized up to 5-grams.
3. A data corpus was made based on the n-grams while another data was extracted on the most popular words found.
4. The corpus was used for the stupid backoff algorithm while the most popular words are used as predictions for those instances when the stupid backoff algorithm does not provide a prediction.
5. The corpus is made up of 4,132,251 rows of n-grams and occupies just around 30mb of memory.

Interface
========================================================

<img src="interface.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="50%" style="display: block; margin: auto;" />
 
 
 
    
- The app's interface is very user friendly. 
- A text input is placed in the middle. 
- As the user types the phrase in the input, the algorithm provides the top predicted word right after. 
- The user may choose to select one of the words or type another word. 
- The process continues for as long as the user wants.


Challenges and Solution
========================================================

There are a number of challenges encountered during this project. Below are the accounts of the 2 most challenging circumstance and the solutions taken.

- The data is too big to process in a normal home computer.

Solution:

Randomly chose 10% of the data. These expedites computation process and reduce the bias.

- The algorithm needs to be fast.

Solution:

Stupid backoff algorithm was chosen as the main algorithm as it provides the prediction the fastest.
