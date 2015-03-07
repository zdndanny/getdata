# download a file
dl  <- function(url, filename) {
    if (url.exists(url)) {
        if (!file.exists(filename)) {
            download.file(url, filename, method = 'wget')
            downloaded  <- Sys.time()
        }    
        else stop("file with same name exists")
    }
    else stop("bad url")
}