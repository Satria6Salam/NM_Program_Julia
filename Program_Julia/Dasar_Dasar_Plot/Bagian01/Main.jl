using Plots
plotly()

# Contoh 1: plot vektor saja
ys = rand(10) # fungsi bawaan Julia untuk menghasilkan bilangan acak (random numbers)antara 0 dan 10 (distribusi uniform).
a1 = plot(ys, label="Random Data", lw=2, marke=:circle, color=:blue, xlabel="Index", ylabel="Value", titel="Plot vekto saja", legend=:topright)
display(a1)

# Contoh 2: plot x dan y
xs = 0:0.5:5 # membuat range dari 0 - 5 di sumbu x dengan step 0.5 --> collect untuk mengubah ke format array
ys2 = sin.(xs) # sin dari setiap nilai xs
a2 = plot(xs, ys2, label="sin(x)", lw=2, color=:red, xlabel="x", ylabel="sin(x)", title="Grafik")
display(a2)

# Contoh 3: banyak seri
ys3 = hcat(sin.(xs), cos.(xs))      # N×2 matrix: kolom1 = sin, kolom2 = cos
@show size(ys3)                     # cek ukurannya -> (N, 2)
a3 = plot(xs, ys3,
     labels = ["sin(x)", "cos(x)"],
     lw = 2,
     linestyle = [:solid :dash],
     xlabel = "x", ylabel = "Value",
     title = "Sin dan Cos Bersama",
     legend = :bottomleft)
display(a3)

# Contoh 4: overlay / modifikasi plot
a4 = plot(xs, sin.(xs), label="sin(x)", color=:purple)
plot!(a4, xs, cos.(xs), label="cos(x)", color=:orange, linestyle=:dot)
plot!(title="overlay Sin dan Cos", xlabel="x", ylabel="Value")
display(a4)

# Contoh 5: x axis dan y axis customizing 
a5 = plot(xs, exp.(xs), label="e^x", color=:black, lw=2)
plot!(title="Eksponensial", xlabel="x", ylabel="e^x",
    xlims=(0,5), ylims=(0,150), xticks=0:0.5:5, yticks=[0, 50, 100, 150])
display(a5)




