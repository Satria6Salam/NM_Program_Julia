using ForwardDiff


"""
    Implikasi turunan adalah ke gradien
    Metode ini sangat populer karena konvergensinya cepat (order 2)
    Metode ini menggunakan pendekatan garis singgung (tangent line).

    -> Misalkan kamu punya titik xn
    -> Di titik tersebut, buat garis singgung fungsi f(x).
    -> Garis singgung akan memotong sumbu-x di suatu titik baru n+1.
    -> Titik potong inilah perkiraan akar selanjutnya.
    jika tebakan ditengah hasil gradien tidak memotong sumbu x, hasilnya akan error
"""

# function newtonRaphson(Xi, Es)
#     for i = 1:10
#         f(Xi) = Xi^2 - 5*Xi + 6

#         y = f(Xi)
#         dif = ForwardDiff.derivative(Xi -> f(Xi), Xi)

#         Xii = Xi - (y/dif)
#         ea = abs((Xii - Xi)/Xii) 

#         println(i, " | ", Xi, " | ", Xii, " | ", ea)

#         if ea < Es
#             break
#         end

#         Xi = Xii
#     end
# end

using Plots
plotly()

function newtonRaphson(Xi, Es)

    f(x) = x^2 - 5x + 6         # fungsi
    eaVals = Float64[]         # untuk menyimpan error

    for i = 1:10

        y = f(Xi)                              # f(x)
        dif = ForwardDiff.derivative(f, Xi)    # f'(x)

        Xii = Xi - (y/dif)                     # rumus Newton-Raphson
        ea = abs((Xii - Xi)/Xii) * 100         # error (%)

        push!(eaVals, ea)                      # simpan error

        println(i, " | ", Xi, " | ", Xii, " | error = ", ea, "%")

        if ea < Es
            break
        end

        Xi = Xii
    end

    # Plot error
    p = plot(1:length(eaVals), eaVals,
        xlabel="Iterasi",
        ylabel="Error (%)",
        title="Plot Error Newton-Raphson",
        marker=:circle,
        legend=false)

    display(p)

    return Xi
end

newtonRaphson(2, 0.001)
