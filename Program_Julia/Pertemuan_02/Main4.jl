using Plots
gr()   # backend plotting

# --------------------------
# Mulut cangkir (ellipse atas)
θ = range(0, 2π, length=200)
x_top = 2 .* cos.(θ)
y_top = 0.3 .* sin.(θ) .+ 5   # geser ke atas (mulut cangkir)

# Alas cangkir (ellipse bawah)
x_bottom = 1.5 .* cos.(θ)
y_bottom = 0.3 .* sin.(θ) .+ 0   # ellipse lebih kecil di bawah

# Badan cangkir (dua garis miring)
x_left = [-2, -1.5]
y_left = [5, 0]

x_right = [2, 1.5]
y_right = [5, 0]

# Pegangan cangkir (setengah lingkaran di kanan)
θ_handle = range(-π/2, π/2, length=100)
x_handle = 2 .+ 0.8 .* cos.(θ_handle)
y_handle = 2.5 .+ 1.5 .* sin.(θ_handle)

# --------------------------
# Plot semua bagian
p = plot(x_top, y_top, color=:blue, linewidth=2, label="")        # mulut
plot!(p, x_bottom, y_bottom, color=:blue, linewidth=2, label="")  # alas
plot!(p, x_left, y_left, color=:blue, linewidth=2, label="")      # sisi kiri
plot!(p, x_right, y_right, color=:blue, linewidth=2, label="")    # sisi kanan
plot!(p, x_handle, y_handle, color=:blue, linewidth=2, label="")  # pegangan

# --------------------------
# Atur tampilan
title!(p, "Outline Cangkir 2D")
plot!(p, aspect_ratio=:equal, xlabel="x", ylabel="y")

# Tampilkan dan simpan
display(p)
savefig(p, "outline_cangkir2d.png")
