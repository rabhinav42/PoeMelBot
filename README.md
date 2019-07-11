# PoeMelBot

A twitter bot that imitates the styles of Edgar Allan Poe and Herman Melville using a Markov model.

The program was built on Colaboratory (for speed while fitting the Markov models, etc) and the two notebooks are the primary code for the bot. The corpora of poems by Edgar Allan Poe and Herman Melville were built off scraped text from Project Gutenberg. 

Markov models were fit using the [markovify](https://github.com/jsvine/markovify) library.
The script from [Chapterize](https://github.com/JonathanReeve/chapterize) was also used in the cleaning.

Major cleaning of the corpora is done in PoeMelBot.ipynb, and in poe-mel-filter.R (R eases cleaning because of its vectorization). The R code also builds another text file which combines the Poe and Melville corpora and randomizes the order of the sentences. 

Four models are fit in the PoeMelBot.ipynb script out of Poe text (1), Mel text (2), the randomized text and a model that combines the markov chains (1) and (2) using markovify.combine() (with equal weights) and are saved as .json files. 

The TweetPoem.ipynb script chooses two of the four models at random, generates text (within Twitter's character limits) and tweets them with a gap of 2 mins between the tweets. 
