using Plots
gr()

# Fungsi layar besar (pakai ellipse terpotong)
θ1 = range(0, π/1.2, length=200)
x1 = 0 .+ 3 .* cos.(θ1).^1.5     # biar lebih melengkung
y1 = 0 .+ 7 .* sin.(θ1)
x1_full = vcat(x1, [0.0])
y1_full = vcat(y1, [0.0])

# Fungsi layar kecil
θ2 = range(0, π/1.3, length=200)
x2 = -2 .+ 2 .* cos.(θ2).^1.5
y2 = 0 .+ 5 .* sin.(θ2)
x2_full = vcat(x2, [-2.0])
y2_full = vcat(y2, [0.0])

# Badan kapal (melengkung dikit)
x_boat = [-4, 4, 3.5, -3.5]
y_boat = [0, 0, -1, -1]

# --------------------------
# Plot layar besar
p = plot(x1_full, y1_full, seriestype=:shape, c=:black, alpha=1, label="")
# Plot layar kecil
plot!(p, x2_full, y2_full, seriestype=:shape, c=:black, alpha=1, label="")
# Plot badan kapal
plot!(p, x_boat, y_boat, seriestype=:shape, c=:black, alpha=1, label="")

# Hilangkan sumbu
plot!(p, aspect_ratio=:equal, axis=false, grid=false, legend=false)

display(p)
savefig(p, "kapal_layar_bagus.png")
