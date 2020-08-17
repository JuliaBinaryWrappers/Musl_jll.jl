# Autogenerated wrapper script for Musl_jll for armv7l-linux-musleabihf
export libc

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libc`
const libc_splitpath = ["lib", "ld-musl-armhf.so.1"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libc_path = ""

# libc-specific global declaration
# This will be filled out by __init__()
libc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libc = "libc.musl-.so.1"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Musl")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libc_path = normpath(joinpath(artifact_dir, libc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libc_handle = dlopen(libc_path)
    push!(LIBPATH_list, dirname(libc_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()
