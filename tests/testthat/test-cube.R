context("Cube")
test_that("Reading a raster cube", {
    #skip_on_cran()
    file <- c(system.file("extdata/raster/mod13q1/sinop-crop-ndvi.tif",
                          package = "sits"))
    raster_cube <- sits_cube(type = "BRICK",
                             name = "Sinop-crop",
                             timeline = sits::timeline_modis_392,
                             bands = c("ndvi"),
                             satellite = "TERRA",
                             sensor = "MODIS",
                             files = file)


    # get cube object
    cub.obj <- suppressWarnings(raster::brick(raster_cube$file_info[[1]]$path))
    expect_true("RasterBrick" %in% class(cub.obj))
    # get bands names
    bands <- sits:::.sits_cube_bands(raster_cube)
    expect_true(bands %in% c("NDVI"))

    params <- sits:::.sits_raster_params(cub.obj)
    expect_true(params$nrows == 11)
    expect_true(params$ncols == 14)
    expect_true(params$xres >= 231.5)
    expect_true(grepl("sinu", params$crs))


})

test_that("Reading a raster stack cube", {
    # Create a raster cube based on CBERS data provided by the inSitu package
    data_dir <- system.file("extdata/CBERS/CB4_64_16D_STK/022024", package = "inSitu")

    # create a raster cube file based on the information about the files
    cbers_stack <- sits_cube(type       = "STACK",
                             name       = "022024",
                             satellite  = "CBERS-4",
                             sensor     = "AWFI",
                             resolution = "64m",
                             data_dir   = data_dir,
                             delim      = "_",
                             parse_info = c("X1", "X2", "X3", "X4", "X5", "date", "X7", "band"))

    expect_true(all(sits_bands(cbers_stack) %in% c("NDVI", "EVI")))
    rast <- suppressWarnings(raster::raster(cbers_stack$file_info[[1]]$path[1]))
    expect_true(raster::nrow(rast) == cbers_stack[1,]$nrows)
    expect_true(all(unique(cbers_stack$file_info[[1]]$date) == cbers_stack$timeline[[1]][[1]]))
})

test_that("Reading a BDC data cube", {
    # Create a raster cube based on CBERS data provided by the inSitu package
    data_dir <- system.file("extdata/CBERS/", package = "inSitu")

    # create a raster cube file based on the information about the files
    cbers_bdc_tile <- sits_cube(type       = "BDC_TILE",
                                name       = "022024",
                                satellite  = "CBERS-4",
                                sensor     = "AWFI",
                                cube       = "CB4_64_16D_STK",
                                tile       = "022024",
                                data_access = "local",
                                start_date  = as.Date("2018-08-29"),
                                end_date    = as.Date("2019-08-13"),
                                .local      = data_dir)

    expect_true(all(sits_bands(cbers_bdc_tile) %in% c("NDVI", "EVI")))
    rast <- suppressWarnings(raster::raster(cbers_bdc_tile$file_info[[1]]$path[1]))
    expect_true(raster::nrow(rast) == cbers_bdc_tile[1,]$nrows)
    expect_true(all(unique(cbers_bdc_tile$file_info[[1]]$date) == cbers_bdc_tile$timeline[[1]][[1]]))
})
