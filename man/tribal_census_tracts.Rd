% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/native.R
\name{tribal_census_tracts}
\alias{tribal_census_tracts}
\title{Download a Tribal Census tract shapefile into R.}
\usage{
tribal_census_tracts(year = NULL, ...)
}
\arguments{
\item{year}{the data year (defaults to 2018).}

\item{...}{arguments to be passed to the underlying `load_tiger` function, which is not exported.
Options include \code{class}, which can be set to \code{"sp"} (the default) or \code{"sf"} to
request sp or sf class objects, and \code{refresh}, which specifies whether or
not to re-download shapefiles (defaults to \code{FALSE}).}
}
\description{
From the US Census Bureau: "Tribal census tracts are relatively small statistical
subdivisions of an American Indian reservation and/or
off-reservation trust land (ORTL) and were defined by
federally recognized tribal government officials in
the Census Bureau's Tribal Statistical Areas Program (TSAP) for the 2010 Census. If a tribal government
declined to participate in TSAP, the Census Bureau delineated tribal census tracts on the American
Indian reservation and/or ORTL. Tribal census tracts are conceptually similar and equivalent to standard
census tracts. Unlike standard census tracts, however, tribal census tracts may cross state, county, and
standard census tract boundaries." For more information, please view the link provided.
}
\examples{
\dontrun{
library(tigris)
library(leaflet)

trib <- tribal_census_tracts()
leaflet(trib) \%>\%
  addProviderTiles("CartoDB.Positron") \%>\%
  addPolygons(fillColor = "white",
              color = "black",
              weight = 0.5)
}
}
\seealso{
\url{https://www2.census.gov/geo/pdfs/reference/GARM/Ch5GARM.pdf}

Other native/tribal geometries functions: 
\code{\link{alaska_native_regional_corporations}()},
\code{\link{native_areas}()},
\code{\link{tribal_block_groups}()},
\code{\link{tribal_subdivisions_national}()}
}
\concept{native/tribal geometries functions}
