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

Data Process
========================================================
Since the raw data is too big to process, an extensive data process has to be executed. The following are the key points of the data process:

1. I decided to randomly use 20% of the appended news, blogs, and twitter data to minimize the memory and computing requirement.
2. The data was tokenized up to 5-grams.
3. A data corpus was made based on the n-grams while another data was extracted on the most popular words found.
4. The corpus was used for the stupid backoff algorithm while the most popular words are used as predictions for those instances when the stupid backoff algorithm does not provide a prediction.
5. The corpus is made up of 4,132,251 rows of n-grams and occupies just around 30mb of memory.

Algorithm : Stupid Backoff
========================================================
The stupid backoff algorithm is the algorithm of choice for most of projects similar to this one. The main reason is that it provides predictions faster the most the available algorithms out there. The process is simple as stated below:

1. The algorithm requires a corpus of n-grams.
2. While the user inputs a text, the algorithm takes the last n-1 words and finds its match in the highest order of n-gram, in this case the 5-gram.
3. If it doesn't find enough candidate, it then finds matches in the n-1 gram and so on. The stupid backoff scores are then calculated after enough candidates are found.
4. It calculates the scores by considering the order. See the formula below.

<img src="formula.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="30%" style="display: block; margin: auto;" />


5. If there is still no much, the algorithm provides the most frequent word in the corpus as the prediction.



Interface
========================================================

<img src="interface.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="50%" style="display: block; margin: auto;" />
 
 
 
    
- The app's interface is very user friendly. 
- A text input is placed in the middle. 
- As the user types the phrase in the input, the algorithm provides the top predicted word right after. 
- The user may choose to select one of the words or type another word. 
- The process continues for as long as the user wants.
