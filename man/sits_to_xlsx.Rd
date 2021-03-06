% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_accuracy.R
\name{sits_to_xlsx}
\alias{sits_to_xlsx}
\title{Saves the results of accuracy assessments as Excel files}
\usage{
sits_to_xlsx(acc.lst, file)
}
\arguments{
\item{acc.lst}{A list of confusion matrices.}

\item{file}{The file where the XLSX data is to be saved.}
}
\description{
Saves confusion matrices as Excel spreadsheets. This function
takes the a list of confusion matrices generated
by the \code{\link[sits]{sits_conf_matrix}}
function and save them in an Excel spreadsheet.
}
\examples{
\donttest{
# read a tibble with 400 samples of Cerrado and 346 samples of Pasture
data(cerrado_2classes)
# perform a 2 fold validation of this sample file
pred_ref.tb <-  sits_kfold_validate(cerrado_2classes, folds = 2)
# calculate and print the confusion matrix
conf.mx <- sits_conf_matrix(pred_ref.tb)
# create a list to store the results
results <- list()
# give a name to the confusion matrix
conf.mx$name <- "confusion_matrix"
# add the confusion matrix to the results
results[[length(results) + 1]] <- conf.mx
# save the results to an XLSX file
sits_to_xlsx(results, file = "confusion_matrix.xlsx")

# cleanup (optional)
file.remove("confusion_matrix.xlsx")
}
}
\author{
Gilberto Camara, \email{gilberto.camara@inpe.br}
}
