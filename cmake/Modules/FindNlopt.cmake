###############################################################################
# Find NLopt
#
# This sets the following variables:
#  NLOPT_FOUND - True if NLopt was found.
#  NLOPT_INCLUDE_DIRS - Directories containing the NLopt include files.
#  NLOPT_LIBRARIES - Libraries needed to use NLopt.

find_path(NLOPT_INCLUDE_DIR
          NAMES nlopt.h
          HINTS "${NLOPT_ROOT}" "$ENV{NLOPT_ROOT}" "${NLOPT_INCLUDE_DIR}"
          PATHS "$ENV{PROGRAMFILES}/NLopt" "$ENV{PROGRAMW6432}/NLopt" /usr/include
          PATH_SUFFIXES nlopt src/libnlopt libnlopt include)

set(NLOPT_INCLUDE_DIRS ${NLOPT_INCLUDE_DIR})

find_library(NLOPT_LIBRARY
             NAMES nlopt libnlopt libnlopt-0
             HINTS "${NLOPT_ROOT}" "$ENV{NLOPT_ROOT}" "${NLOPT_INCLUDE_DIRS}"
             PATHS "$ENV{PROGRAMFILES}/NLopt" "$ENV{PROGRAMW6432}/NLopt" 
             PATH_SUFFIXES project build bin lib)

set (NLOPT_LIBRARIES ${NLOPT_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Nlopt DEFAULT_MSG NLOPT_LIBRARY NLOPT_INCLUDE_DIR)


mark_as_advanced(NLOPT_LIBRARY NLOPT_INCLUDE_DIR NLOPT_ROOT_DIR NLOPT_INTERFACE_VERSION)

if(NLOPT_FOUND)
  message(STATUS "NLopt found (include: ${NLOPT_INCLUDE_DIRS}, lib: ${NLOPT_LIBRARIES})")
endif(NLOPT_FOUND)
