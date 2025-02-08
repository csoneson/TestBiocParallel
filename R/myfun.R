#' Test function
#'
#' @param BPPARAM A BiocParallelParam object
#' @param verbose TRUE or FALSE
#'
#' @export
#'
#' @importFrom BiocParallel bplapply MulticoreParam bpnworkers bpworkers<-
#'     bpoptions bpprogressbar
#' @importFrom methods is
#'
myfun <- function(BPPARAM = MulticoreParam(4L, RNGseed = 42L),
                  verbose = TRUE) {
    ncpuTotal <- bpnworkers(BPPARAM)
    if (is(BPPARAM, "MulticoreParam") || is(BPPARAM, "SnowParam")) {
        bpworkers(BPPARAM) <- ncpuTotal
        on.exit(bpworkers(BPPARAM) <- ncpuTotal)
    }

    bplapply(
        structure(LETTERS[1:4], names = LETTERS[1:4]),
        function(l) {
            l
        }, BPPARAM = BPPARAM,
        BPOPTIONS = bpoptions(progressbar = (verbose && ncpuTotal > 1))
    )
}
