using NewtRoot
using Test

f(x) = x^2 + 2 #function that doesn't converge
g(x) = log2(x - 1) #smooth function non-poly
h(x) = x^2 - x

# test for non-convergence
@test newtonRoot(f,3,1.0E-7,1000) == nothing

#test for known values
@test newtonRoot(g,3,1.0E-7,1000) == 2.00

#tes for little max iter
@test newtonRoot(h,3,1.0E-7,5) == nothing
