module IR_Paper

using LinearAlgebra: LAPACK, lu, I, norm, lu!
using MultiPrecisionArrays: mplu
using MultiPrecisionArrays.Examples
using BenchmarkTools
using Printf

export time_example
export maketabir1

include("IR_Example.jl")

end
