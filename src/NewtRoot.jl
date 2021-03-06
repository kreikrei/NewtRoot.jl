module NewtRoot

using ForwardDiff

function newtonRoot(g,x_0,tol,max_iter)
    #initialization
    x_old = x_0
    x_Diff = Inf
    iter = 0

    #iteration to tolerance
    while x_Diff > tol && iter <= max_iter
        #first half calculate new x_n+1
        x_new = x_old - g(x_old)/ForwardDiff.derivative(g,x_old)
        x_Diff = abs(x_new-x_old)

        #output progress
        println("iter $iter \t x_n = $x_old")
        println("\t g(x_n): $(g(x_old)) , g'(x_n): $(ForwardDiff.derivative(g,x_old))")
        println("\t x_n+1 = $x_old - ($(g(x_old)/ForwardDiff.derivative(g,x_old))) = $x_new")

        #second half prepare for next iter
        x_old = x_new
        iter += 1
    end

    if x_Diff > tol #non-converging or out of max iter limit
        return nothing
    else
        return x_old
    end
end

export newtonRoot

end
