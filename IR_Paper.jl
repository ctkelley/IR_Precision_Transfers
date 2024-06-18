module IR_Paper

using LinearAlgebra: LAPACK, lu, I, norm, lu!
using MultiPrecisionArrays: mplu
using MultiPrecisionArrays.Examples
using BenchmarkTools
using Printf

export Green_Example
export time_example
export maketabir1

include("Green_Example.jl")
include("IR_Example.jl")

end
