#' Writing data options
#'
#' @name writing-options
#' @examples \dontrun{
#' # write to disk
#' (x <- HttpClient$new(url = "https://httpbin.org"))
#' f <- tempfile()
#' res <- x$get("get", disk = f)
#' res$content # when using write to disk, content is a path
#' readLines(res$content)
#' close(file(f))
#'
#' # streaming response
#' (x <- HttpClient$new(url = "https://httpbin.org"))
#' res <- x$get('stream/50', stream = function(x) cat(rawToChar(x)))
#' res$content # when streaming, content is NULL
#'
#'
#' ## Async
#' (cc <- Async$new(
#'   urls = c(
#'     'https://httpbin.org/get?a=5',
#'     'https://httpbin.org/get?foo=bar',
#'     'https://httpbin.org/get?b=4',
#'     'https://httpbin.org/get?stuff=things',
#'     'https://httpbin.org/get?b=4&g=7&u=9&z=1'
#'   )
#' ))
#' files <- replicate(5, tempfile())
#' (res <- cc$get(disk = files, verbose = TRUE))
#' lapply(files, readLines)
#'
#' ## Async varied
#' ### disk
#' f <- tempfile()
#' g <- tempfile()
#' req1 <- HttpRequest$new(url = "https://httpbin.org/get")$get(disk = f)
#' req2 <- HttpRequest$new(url = "https://httpbin.org/post")$post(disk = g)
#' req3 <- HttpRequest$new(url = "https://httpbin.org/get")$get()
#' (out <- AsyncVaried$new(req1, req2, req3))
#' out$request()
#' out$content()
#' readLines(f)
#' readLines(g)
#' close(file(f))
#' close(file(g))
#'
#' ### stream - to console
#' fun <- function(x) cat(rawToChar(x))
#' req1 <- HttpRequest$new(url = "https://httpbin.org/get"
#' )$get(query = list(foo = "bar"), stream = fun)
#' req2 <- HttpRequest$new(url = "https://httpbin.org/get"
#' )$get(query = list(hello = "world"), stream = fun)
#' (out <- AsyncVaried$new(req1, req2))
#' out$request()
#' out$content()
#'
#' ### stream - to an R object
#' lst <- c()
#' fun <- function(x) lst <<- c(lst, x)
#' req1 <- HttpRequest$new(url = "https://httpbin.org/get"
#' )$get(query = list(foo = "bar"), stream = fun)
#' req2 <- HttpRequest$new(url = "https://httpbin.org/get"
#' )$get(query = list(hello = "world"), stream = fun)
#' (out <- AsyncVaried$new(req1, req2))
#' out$request()
#' lst
#' cat(rawToChar(lst))
#' }
NULL
