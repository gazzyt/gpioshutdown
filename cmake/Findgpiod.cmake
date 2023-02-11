################################################################################
### Find the gpiod shared libraries.
################################################################################

# Find the path to the gpiod includes.
find_path(gpiod_INCLUDE_DIR 
	NAMES gpiod.h
	HINTS /usr/local/include)
	
# Find the gpiod libraries.
find_library(gpiod_LIBRARY 
	NAMES libgpiod.so
	HINTS /usr/local/lib)
find_library(gpiod_cxx_LIBRARY 
	NAMES libgpiodcxx.so
	HINTS /usr/local/lib)
    
# Set the gpiod variables to plural form to make them accessible for 
# the paramount cmake modules.
set(gpiod_INCLUDE_DIRS ${gpiod_INCLUDE_DIR})
set(gpiod_INCLUDES     ${gpiod_INCLUDE_DIR})
set(gpiod_LIBRARIES	   ${gpiod_cxx_LIBRARY} ${gpiod_LIBRARY})

# Handle REQUIRED, QUIET, and version arguments 
# and set the <packagename>_FOUND variable.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(gpiod 
    DEFAULT_MSG 
    gpiod_INCLUDE_DIR gpiod_LIBRARY gpiod_cxx_LIBRARY)
    