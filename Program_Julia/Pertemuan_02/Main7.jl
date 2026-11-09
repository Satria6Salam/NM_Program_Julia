using Plots
gr()

# --------------------------
# Mulut cangkir (ellipse atas)
θ = range(0, 2π, length=200)
x_top = 2 .* cos.(θ)
y_top = 0.3 .* sin.(θ) .+ 5

# Alas cangkir (ellipse bawah)
x_bottom = 1.5 .* cos.(θ)
y_bottom = 0.3 .* sin.(θ) .+ 0

# --------------------------
# Sisi kiri & kanan
x_left = [-2, -1.5]
y_left = [5, 0]

x_right = [2, 1.5]
y_right = [5, 0]

# --------------------------
# Area dalam cangkir (isi merah transparan)
cup_x = vcat([-2], x_top, [2], reverse(x_bottom))
cup_y = vcat([5], y_top, [5], reverse(y_bottom))
p = plot(cup_x, cup_y, seriestype=:shape, lw=0, c=:red, alpha=0.3, label="")

# Outline dinding
plot!(p, x_top, y_top, color=:blue, linewidth=2, label="")
plot!(p, x_bottom, y_bottom, color=:blue, linewidth=2, label="")
plot!(p, x_left, y_left, color=:blue, linewidth=2, label="")
plot!(p, x_right, y_right, color=:blue, linewidth=2, label="")

# --------------------------
# Pegangan (outer & inner)
θ_handle = range(-π/2, π/2, length=200)
x_handle_outer = 2 .+ 0.8 .* cos.(θ_handle)
y_handle_outer = 2.5 .+ 1.5 .* sin.(θ_handle)

x_handle_inner = 2 .+ 0.6 .* cos.(θ_handle)
y_handle_inner = 2.5 .+ 1.2 .* sin.(θ_handle)

# Isi warna pegangan
handle_x = vcat(x_handle_outer, reverse(x_handle_inner))
handle_y = vcat(y_handle_outer, reverse(y_handle_inner))
plot!(p, handle_x, handle_y, seriestype=:shape, lw=0, c=:cyan, alpha=0.4, label="")

# Outline pegangan
plot!(p, x_handle_outer, y_handle_outer, color=:blue, linewidth=2, label="")
plot!(p, x_handle_inner, y_handle_inner, color=:blue, linewidth=2, label="")

# --------------------------
title!(p, "Cangkir 2D Berwarna Penuh dengan Pegangan")
plot!(p, aspect_ratio=:equal, xlabel="x", ylabel="y")

# Tampilkan & simpan
display(p)
savefig(p, "cangkir2d_fullfilled.png")
