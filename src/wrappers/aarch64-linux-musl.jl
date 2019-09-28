# Autogenerated wrapper script for Musl_jll for aarch64-linux-musl
export libc

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libc`
const libc_splitpath = ["lib", "ld-musl-aarch64.so.1"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libc_path = ""

# libc-specific global declaration
# This will be filled out by __init__()
libc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libc = "libc.musl-aarch64.so.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libc_path = abspath(joinpath(artifact"Musl", libc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libc_handle = dlopen(libc_path)
    push!(LIBPATH_list, dirname(libc_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

