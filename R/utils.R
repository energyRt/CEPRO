
#' Convert names of provinces between different formats.
#'
#' @param name character, name of the province
#' @param to type of name to return (column names of `CEPRE:::.proNames`)
#' @param from character or NULL, the type of name to convert from (if known)
#' @param asCharacter logical,
#' @param caseSensitive logical
#' @param NAifNotFound logical,
#' @param fuzzy ignored
#' @param asTibble logical, FALSE by default
#'
#' @return
#' @export
#'
#' @examples
proName <- function(name, # name of the province
                    to = "eng", # type of name to return (colum names of .proNames)
                    from = NULL, # type of name to convert from (if known)
                    asCharacter = TRUE, # return char., if FALSE - as stored in .proNames
                    caseSensitive = FALSE, # for comparison only
                    NAifNotFound = FALSE,
                    fuzzy = FALSE, # not implemented yet
                    asTibble = FALSE # not finished, need to test
) {
  if (!exists(".modelVersion")) .modelVersion <- 13.0
  if (!exists(".proNames")) {
    # if (.modelVersion >= 13.0) {
    #   load("data/pro_names_v13up.RData", envir = globalenv())
    # } else {
    #   load("data/pro_names.RData", envir = globalenv())
    # }
    .proNames <- CEPRO:::.proNames
  }
  if (is.null(from)) from <- names(.proNames)[-1]
  sapply(name, function(x) {
    for (j in from) {
      if (caseSensitive) {
        ii <- .proNames[[j]] == x
        ii[is.na(ii)] <- FALSE
      } else {
        ii <- tolower(as.character(.proNames[[j]])) == tolower(as.character(x))
        ii[is.na(ii)] <- FALSE
      }
      if (sum(ii, na.rm = TRUE) == 1) {
        if (asTibble) {
          return(.proNames[ii,to])
        } else if (!asCharacter) {
          return(.proNames[[to]][ii])
        } else {
          return(as.character(.proNames[ii,to][[1]]))
        }
      } else if (sum(ii, na.rm = TRUE) > 1) {
        warning(paste0("The province name ", x, " has several matches - chek the .proName"))
      }
    }
    message(paste0("The province name ", x, " is not found"))
    if (NAifNotFound) {
      return(NA)
    } else {
      return(x)
    }
  })
}
