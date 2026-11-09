# | Ketik           | Hasil |
# | --------------- | ----- |
# | `\theta` + Tab  | θ     |
# | `\alpha` + Tab  | α     |
# | `\beta` + Tab   | β     |
# | `\gamma` + Tab  | γ     |
# | `\delta` + Tab  | δ     |
# | `\lambda` + Tab | λ     |
# | `\mu` + Tab     | μ     |
# | `\phi` + Tab    | φ     |
# | `\omega` + Tab  | ω     |

# | Ketik           | Hasil |
# | --------------- | ----- |
# | `\Theta` + Tab  | Θ     |
# | `\Lambda` + Tab | Λ     |
# | `\Delta` + Tab  | Δ     |
# | `\Gamma` + Tab  | Γ     |

# | Ketik           | Operator |
# | --------------- | -------- |
# | `\times` + Tab  | ×        |
# | `\div` + Tab    | ÷        |
# | `\in` + Tab     | ∈        |
# | `\subset` + Tab | ⊂        |
# | `\sum` + Tab    | ∑        |
# | `\int` + Tab    | ∫        |

using ForwardDiff
using Plots
using Printf
plotly()

# function count(x)
#     xi = x
#     f(y) = 2y^2 - 4y + 1
#     df(y) = ForwardDiff.derivative(f, y)
#     df2(y) = ForwardDiff.derivative(y -> df(y), y)

#     d1 = 0
#     d2 = 0
#     cek = true;
#     iter = 0;

#     while (cek)
#         iter += 1
#         d1 = df(xi)
#         d2 = df2(xi)
#         print("Iterasi: ", iter, "\nf'(x): ", d1, " f''(x): ", d2, "\n")
#         xiadd1 = xi - (d1/d2)
#         println("Xi(", xi, ") X1+i(", xiadd1, ")\n")
        
#         xi = xiadd1

#         if abs(d1) < 1e-10
#             cek = false
#         end
#     end
# end

# function plt()
#     x = -20:0.5:20
#     y = 2 .* x.^2 .- 4 .* x .+ 1 
#     a2 = plot(x, y, label="Kurva: f(x) = 2x^2 - 4x + 1", lw=2, color=:red, xlabel="x", ylabel="f(x) = 2x^2 - 4x + 1", title="Grafik")
#     display(a2) 
# end

# count(0.5)
# plt()

function line() 
    ln = "==================="

    for i in 1:3
        ln = ln * ln
    end
    println(ln)
end

function count(x)
    xi = x
    f(θ) = 4 * sin(θ) * (1 + cos(θ))                # -> persamaan luas
    df(θ) = ForwardDiff.derivative(f, θ)            # -> turunan 1
    df2(θ) = ForwardDiff.derivative(θ -> df(θ), θ)  # -> turunan 2

    line()
    @printf("%-10s %-25s %-25s %-25s %-25s %-25s\n",
            "Iterasi", "θ", "f'(θ)", "f''(θ)", "θ_estimate", "f(θ)")
    line()

    listθ = Float64[]   # list sudut θ
    listA0 = Float64[]  # list luas pada setiap sudut θ -> f(θ)
    
    push!(listθ, xi)
    push!(listA0, f(xi))

    for iter in 1:5
        d1 = df(xi)
        d2 = df2(xi)
        xi_new = xi - (d1/d2)   # -> hitung sudut berikutnya θ next
        d3 = f(xi_new)          # -> hitung luas di setiap perubahan sudut
        
        push!(listθ, xi_new)
        push!(listA0, d3)

        @printf("%-10d %-25.16f %-25.16f %-25.16f %-25.16f %-25.16f\n",
                iter, xi, d1, d2, xi_new, d3)

        xi = xi_new

        # xi_new - xi < e
    end

    line()

    plt2(listθ, listA0)  
    
end

# function plt()
#     # -> persamaan
#     A(θ) = 4 * sin(θ) * (1 + cos(θ))

#     # -> sumbu x
#     x = 0:0.01:pi/2  

#     # -> sumbu y
#     y = A.(x)


#     a2 = plot(
#             x, y, 
#             label="A(θ) = 4 * sin(θ) * (1 + cos(θ))", 
#             lw=2, 
#             color=:red, 
#             xlabel="x", 
#             ylabel="A(θ)", 
#             title="Grafik"
#         )

#     display(a2) 
# end

# function plt2(listθ, listA0)

#     x = listθ         # sumbu x: sudut θ hasil iterasi
#     y = listA0        # sumbu y: luas

#     a2 = plot(
#             x, y,
#             seriestype = :scatter,
#             markersize = 6,
#             markercolor = :blue,
#             xlabel = "θ (radian)",
#             ylabel = "A(θ)",
#             title  = "Grafik Perubahan Luas terhadap Sudut (Iterasi Newton)"
#         )

#     plot!(x, y, lw=2, color=:red)
#     display(a2)
# end

# -> plot untuk melihat hasil luas disetiap sudut -> melihat nilai maksimum 
function plt2(listθ, listAθ)
    A(θ) = 4 * sin(θ) * (1 + cos(θ))

    # -> Kurva asli
    θ = range(0, stop=pi/2, length=400)
    Aθ = A.(θ)

    plt = plot(
        θ, Aθ,
        lw = 2,
        color = :red,
        label = "Kurva A(θ)",
        xlabel = "θ (radian)",
        ylabel = "A(θ)",
        title = "Kurva A(θ) dan Titik-titik Hasil Iterasi Newton"
    )

    # -> Titik iterasi Newton (perubahan sudut)
    scatter!(
        listθ, listAθ,
        markersize = 6,
        markercolor = :blue,
        label = "Titik Iterasi"
    )

    display(plt)
    savefig(plot(plt), "Grafik Optimization.png")
end

π = 3.14
θ = π / 4
count(θ) 