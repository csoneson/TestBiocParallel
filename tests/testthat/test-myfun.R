test_that("myfun works", {
    L <- list(A = "A", B = "B", C = "C", D = "D")
    expect_equal(myfun(BPPARAM = BiocParallel::SerialParam(), verbose = TRUE), L)
    expect_equal(myfun(BPPARAM = BiocParallel::SerialParam(), verbose = FALSE), L)
    expect_equal(myfun(BPPARAM = BiocParallel::MulticoreParam(workers = 2L), verbose = TRUE), L)
    expect_equal(myfun(BPPARAM = BiocParallel::MulticoreParam(workers = 2L), verbose = FALSE), L)
})
