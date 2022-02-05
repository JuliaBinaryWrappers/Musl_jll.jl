# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Musl_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Musl")
JLLWrappers.@generate_main_file("Musl", UUID("3490aa6f-05e0-5d3a-9648-5b0c647c155f"))
end  # module Musl_jll
