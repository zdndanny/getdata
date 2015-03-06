# download a file
dl  <- function(url, filename) {
  if (!file.exists(filename)) {
    download.file(url, filename)
  }
  downloaded  <- Sys.time()
  downloaded
}