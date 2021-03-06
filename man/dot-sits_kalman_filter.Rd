% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_filters.R
\name{.sits_kalman_filter}
\alias{.sits_kalman_filter}
\title{Compute the Kalman filter}
\usage{
.sits_kalman_filter(
  measurement,
  error_in_measurement = NULL,
  initial_estimate = NULL,
  initial_error_in_estimate = NULL
)
}
\arguments{
\item{measurement}{A vector of measurements.}

\item{error_in_measurement}{A vector of errors in the measuments.}

\item{initial_estimate}{A first estimation of the measurement.}

\item{initial_error_in_estimate}{A first error in the estimation.}
}
\value{
A matrix of 3 columns: estimate,
                                      error_in_estimate, and kalman_gain.
}
\description{
Compute the Kalman filter
}
