library(stringr)
library(readr)
library(purrr)
library(tokenizers)

poe <- read_lines("E:/poe-filtered.txt")  ## read filtered poe text for more filtering
poe_token <- tokenize_words(poe,
                            lowercase = FALSE,
                            stopwords = NULL,
                            strip_punct = FALSE,
                            simplify = FALSE)
poe_txt <- character()
for(i in 1:length(poe_token)){
  if(length(poe_token[[i]]>1)){                    ## remove all single token sentences like "." etc
    tmp <- paste(poe_token[[i]] , collapse = ' ')  ## rebuild tokenized sentence
    poe_txt <- c(poe_txt , tmp)                    ## rebuild whole text
  }  
}
indices <- which(poe_txt == ".")                   ## some single token sentences may remain (because of " ." etc)
poe_txt <- poe_txt[-indices]
poe_txt <- paste(poe_txt , "." , sep = "")         ## append "." to every sentence for using markovify.Text()
write_lines(poe_txt , "E:/poe-filtered_2.txt")

##################################

mel <- read_lines("E:/mel-filtered.txt")   ## read filtered mel text for more filtering
mel_token <- tokenize_words(mel,
                            lowercase = FALSE,
                            stopwords = NULL,
                            strip_punct = FALSE,
                            simplify = FALSE)
mel_txt <- character()
for(i in 1:length(mel_token)){                     ## remove all single token sentences like "." etc
  if(length(mel_token[[i]]>1)){                    
    tmp <- paste(mel_token[[i]] , collapse = ' ')  ## rebuild tokenized sentence
    mel_txt <- c(mel_txt , tmp)                    ## rebuild whole text
  }  
}

indices <- which(mel_txt == ".")
mel_txt <- mel_txt[-indices]
mel_txt <- paste(mel_txt , "." , sep = "")         ## append "." to every sentence for markovify.Text()
write_lines(mel_txt , "E:/mel-filtered_2.txt")

####################

poe_mel <- c(poe_txt , mel_txt)                    ## combine filtered poe and mel text
poe_mel_rand <- sample(poe_mel)                    ## randomize the sentences
write_lines(poe_mel_rand , "E:/poe-mel-rand.txt")