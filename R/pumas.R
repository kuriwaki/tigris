#' Download a Public Use Microdata Area (PUMA) shapefile into R
#'
#' Public use microdata areas (PUMAs) are decennial census areas that have been
#' defined for the tabulation and dissemination of Public Use Microdata Sample
#' (PUMS) data, American Community Survey (ACS) data, and ACS period estimates.
#' For the 2010 Census, the State Data Centers (SDCs) in each state, the
#' District of Columbia, and the Commonwealth of Puerto Rico were given the
#' opportunity to delineate PUMAs within their state or
#' statistically equivalent entity. All PUMAs must nest within states and have
#' a minimum population threshold of 100,000 persons. 2010 PUMAs were built on
#' census tracts and cover the entirety of the United States, Puerto Rico,
#' Guam, and the U.S. Virgin Islands. Because they do not meet the minimum
#' population requirement, the Commonwealth of the Northern Mariana Islands
#' and American Samoa do not contain any 2010 PUMAs.
#'
#' @param state The two-digit FIPS code (string) of the state you want. Can also
#'        be state name or state abbreviation.
#' @param detailed detailed If detailed is set to FALSE, download a generalized (1:500k)
#'        states file.  Defaults to TRUE (the most detailed TIGER/Line file)
#' @export
#' @family general area functions
#' @seealso \url{http://www.census.gov/geo/reference/puma.html}
#' @examples \dontrun{
#' library(tigris)
#' library(sp)
#'
#' us_states <- unique(fips_codes$state)[1:51]
#'
#' continental_states <- us_states[!us_states %in% c("AK", "HI")]
#' pumas_list <- lapply(continental_states, function(x) {
#'   pumas(state = x, detailed = FALSE)
#'   })
#'
#' us_pumas <- rbind_tigris(pumas_list)
#'
#' plot(us_pumas)
#' }
pumas <- function(state, detailed = TRUE) {

  state <- validate_state(state)

  if (is.null(state)) stop("Invalid state", call.=FALSE)

  if (detailed == FALSE) {
    url <- paste0("http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_",
                  state,
                  "_puma10_500k.zip")
  } else {
    url <- paste0("http://www2.census.gov/geo/tiger/TIGER2014/PUMA/tl_2014_",
                  state,
                  "_puma10.zip")
  }

  pm <- load_tiger(url, tigris_type = "puma")

  attr(pm, "tigris") <- "puma"

  return(pm)

}


