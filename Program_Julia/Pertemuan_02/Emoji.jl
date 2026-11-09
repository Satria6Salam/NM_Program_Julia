"""
    > Plots: memberikan semua fungsi plotting (grafik) seperti plot, plot! dll
    > range(): membuat deret angka dengan jarak tertentu
        > range(0, 10, length=5) -> 5 titik dari 0 sampai 
    > vcat(): vertical concatenation (penggabungan array secara vertical)
        > a = [1,2]
        > b = [3,4]
        > vcat(a, b) # hasil [1, 2, 3, 4]
    > plot: fungsi utama untuk membuat grafik baru.
    > plot!: Versi in-place daro plot yaitu menambahkan garfik keplot yang sudah ada
"""

using Plots
plotly()

# Wajah (lingkaran kuning)
t = range(0, 2π, length=400) # membuat 1 putaran lingkaran penuh
x_waja = 3 .* cos.(t)  
y_waja = 3 .* sin.(t)  

p = plot(x_waja, y_waja, seriestype=:shape, lw=2, c=:yellow, linecolor=:orange, alpha=0.9, label="")

# Kacamata hitam
θ_lens = range(0, 2π, length=200)

# Lensa sebelah kiri
x_lensaL = 1.2 .* cos.(θ_lens) .- 1.2
y_lensaL = 0.8 .* sin.(θ_lens) .+ 1.0
plot!(p, x_lensaL, y_lensaL, seriestype=:shape, lw=0, c=:black, alpha=0.95, label="")

# Lensa sebelah kanan
x_lensaR = 1.2 .* cos.(θ_lens) .+ 1.2
y_lensaR = 0.8 .* sin.(θ_lens) .+ 1.0
plot!(p, x_lensaR, y_lensaR, seriestype=:shape, lw=0, c=:black, alpha=0.95, label="")

# Garis kacamata
plot!(p, [-0.4, 0.4], [1.2, 1.2], color=:black, linewidth=8, label="")


# Bentuk senyum
θ_senyum = range(-π/6, π/1.2, length=200)
x_senyum = 1.8 .* cos.(θ_senyum)
y_senyum = 1.0 .* sin.(θ_senyum) .- 1.2
plot!(p, x_senyum, y_senyum, color=:black, linewidth=5, label="")

# Membuat ujung kanan senyum (sedikit naik)
t = range(0, π/2, length=50)
x = 0.4 .* cos.(t) .+ 1.7
y = 0.4 .* sin.(t) .- 1.0
plot!(p, x, y, color=:black, linewidth=5, label="")

plot!(p, aspect_ratio=:equal, axis=true, grid=true, legend=true)
title!(p, "Emoji Cool")

display(p)
savefig(p, "emoji_cool_plot.png")
