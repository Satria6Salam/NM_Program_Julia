using Printf
using Plots
plotly()

function rungeKutta4(xi, yi, h)
    eksak = 1.75
    x0 = xi
    y0 = yi

    listX = Float64[]
    listError = Float64[]


    # jumlah iterasi dari xi sampai 2
    n = Int((2 - xi) / h)

    f(x, y) = exp(x) - y

    for i in 1:n

        k1 = f(x0, y0)
        k2 = f(x0 + 0.5*h, y0 + 0.5*k1*h)
        k3 = f(x0 + 0.5*h, y0 + 0.5*k2*h)
        k4 = f(x0 + h,     y0 + k3*h)

        y_next = y0 + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h
        x_next = x0 + h

        @printf("x0 = %.4f | y0 = %.6f | y_next = %.6f\n", x0, y0, y_next)

        error = abs((eksak - y_next) / eksak) * 100
        push!(listError, error)
        push!(listX, x_next)

      
        x0 = x_next
        y0 = y_next

        if abs(x0 - 1) < 1e-9
            @printf("y_next = %.6f\n", y_next)
        end
    end

    return listX, listError
end


h = 0.1
xs, errs = rk4_errors(0.0, 0.0, h)

# ===== PLOT =====
p = plot(xs, errs,
        xlabel="x",
        ylabel="Error (%)",
        title="RK4 Error vs Exact Solution",
        linewidth=2,
        legend=false,
        grid=true,
    )

display(p)