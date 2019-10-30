base_dir <- "/Users/salmaelshahawy/Desktop/MSDS_2019/Fall2019/aquisition_management_607/week_10/spam_ham_documents"

email_content <- NA

get_content <- function(type) {
  files_path <- paste(base_dir,type, sep = "/")
  files_name <- list.files(files_path)
  for (file in 1:length(files_name)) {
    file_path <- paste(files_path, files_name[file], sep = "/")
  }
  return(email_content)
}