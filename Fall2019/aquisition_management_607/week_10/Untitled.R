
library(R.utils)
library(tidyverse)
library(tidytext)
library(readtext)
library(stringr)
library(tm)
library(rpart)
library(rpart.plot)
library(e1071)
library(dplyr)
library(caret)
# Library for parallel processing
library(doMC)
registerDoMC(cores=detectCores())
library(R.cache)
library(knitr)

base_url_spam <- "https://spamassassin.apache.org/old/publiccorpus/20030228_spam_2.tar.bz2"
spam_zip <- "20030228_spam_2.tar.bz2"
spam_tar <- "20030228_spam_2.tar"

base_url_ham <- "https://spamassassin.apache.org/old/publiccorpus/20030228_easy_ham_2.tar.bz2"
ham_zip <- "20030228_easy_ham_2.tar.bz2"
ham_tar <- "20030228_easy_ham_2.tar"
if(!file.exists(spam_tar)){
  res_spam <- tryCatch(download.file(base_url_spam,
                                     destfile= spam_folder,
                                     method="curl"),
                       error=function(e) 1)
  bunzip2(spam_zip)
  untar(spam_tar, exdir="spam_ham_documents")
} 

if(!file.exists(ham_tar)){
  res_ham <- tryCatch(download.file(base_url_ham,
                                    destfile= ham_folder,
                                    method="curl"),
                      error=function(e) 1)
  bunzip2(ham_zip)
  untar(ham_tar, exdir = "spam_ham_documents")
  
} else {
  paste("The file is already exists!")
}
clean_cache(clean = TRUE)

base_dir <- "/Users/salmaelshahawy/Desktop/MSDS_2019/Fall2019/aquisition_management_607/week_10/spam_ham_documents"

email_content <- NA

get_content <- function(type) {
  files_path <- paste(base_dir,type, sep = "/")
  files_name <- list.files(files_path)
  for (file in 1:length(files_name)) {
    file_path <- paste(files_path, files_name[file], sep = "/")
    content_per_file <- file_path %>%
      lapply(readLines)
    
    email_content <- c(email_content, content_per_file)
  }
  return(email_content)
}

spam_test <- get_content("spam_2") #list
ham_test <- get_content("easy_ham_2") #list


