% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_config.R
\name{.sits_config_band_names_convert}
\alias{.sits_config_band_names_convert}
\title{Convert bands names from cube to SITS}
\usage{
.sits_config_band_names_convert(satellite, sensor, type)
}
\arguments{
\item{satellite}{Name of the satellite}

\item{sensor}{Name of sensor}

\item{type}{Type of data cube}
}
\value{
Name of the bands used in SITS (named vector)
}
\description{
Convert the name of the band used by the origin data cube
             to the name used by SITS
}
\author{
Gilberto Camara, \email{gilberto.camara@inpe.br}
}
