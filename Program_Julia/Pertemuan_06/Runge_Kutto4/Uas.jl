using Printf
using Plots
plotly()

function y_eksak(x)
    return 0.5 * (exp(x) - exp(-x))
end

function rungeKutta4(xi, yi, h)

    x0 = xi
    y0 = yi

    listX = Float64[]
    listError = Float64[]

    n = Int((1 - xi) / h)

    f(x, y) = exp(x) - y

    for i in 1:n + 1

        k1 = f(x0, y0)
        k2 = f(x0 + 0.5*h, y0 + 0.5*k1*h)
        k3 = f(x0 + 0.5*h, y0 + 0.5*k2*h)
        k4 = f(x0 + h,     y0 + k3*h)

        y_next = y0 + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h
        x_next = x0 + h

        @printf("x = %.4f | y = %.6f | approx = %.6f\n", x0, y0, y_next)

        y_eks = y_eksak(x_next)
        error = abs((y_eks - y_next) / y_eks) * 100

        push!(listError, error)
        push!(listX, x_next)

        x0 = x_next
        y0 = y_next
        
    end

    return listX, listError
end

h = 0.1
xs, errs = rungeKutta4(0.0, 0.0, h)

p = plot(xs, errs,
    xlabel="x",
    ylabel="Error (%)",
    title="RK4 Error vs Eksak Solusi",
    linewidth=2,
    legend=false,
    grid=true,
)

display(p)
