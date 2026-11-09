using Plots
plotly()

# =========================
# Bentuk Cangkir
# =========================
teta = range(0, 2π, length=200) 
x_Atas = 2 .* cos.(teta)
y_Atas = 0.3 .* sin.(teta) .+ 5

x_Bawah = 1.5 .* cos.(teta)
y_Bawah = 0.3 .* sin.(teta)

x_Kiri = [-2, -1.5]
y_Kiri = [5, 0]

x_Kanan = [2, 1.5]
y_Kanan = [5, 0]

teta_P = range(-π/2, π/2, length=200)
x_Luar = 2 .+ 0.8 .* cos.(teta_P)
y_Luar = 2.5 .+ 1.5 .* sin.(teta_P)
x_Dalam = 2 .+ 0.6 .* cos.(teta_P)
y_Dalam = 2.5 .+ 1.2 .* sin.(teta_P)

warna_x = vcat(x_Bawah, reverse(x_Atas)) 
warna_y = vcat(y_Bawah, reverse(y_Atas))
p = plot(warna_x, warna_y, seriestype=:shape, lw=0, c=:red, alpha=0.7, label="")

plot!(p, x_Atas, y_Atas, color=:blue, linewidth=2, label="")
plot!(p, x_Bawah, y_Bawah, color=:blue, linewidth=2, label="")
plot!(p, x_Kiri, y_Kiri, color=:blue, linewidth=2, label="")
plot!(p, x_Kanan, y_Kanan, color=:blue, linewidth=2, label="")

warna_a = vcat(x_Luar, reverse(x_Dalam))
warna_b = vcat(y_Luar, reverse(y_Dalam))
plot!(p, warna_a, warna_b, seriestype=:shape, lw=0, c=:red, alpha=0.7, label="")

plot!(p, x_Luar, y_Luar, color=:blue, linewidth=2, label="")
plot!(p, x_Dalam, y_Dalam, color=:blue, linewidth=2, label="")

title!(p, "Cangkir 2D + Emoji Senyum")
plot!(p, aspect_ratio=:equal, xlabel="x", ylabel="y")

# =========================
# Emoji Senyum (manual)
# =========================
# Wajah (lingkaran)
θ = range(0, 2π, length=300)
x_face = 1.0 .* cos.(θ) .+ 0   # pusat (0, 2.5)
y_face = 1.0 .* sin.(θ) .+ 2.5
plot!(p, x_face, y_face, seriestype=:shape, lw=0, c=:yellow, alpha=0.9, label="")

# Outline wajah
plot!(p, x_face, y_face, color=:black, linewidth=2, label="")

# Mata kiri
θ_eye = range(0, π, length=100)
x_eyeL = 0.2 .* cos.(θ_eye) .- 0.4
y_eyeL = 0.2 .* sin.(θ_eye) .+ 3.0
plot!(p, x_eyeL, y_eyeL, color=:black, linewidth=3, label="")

# Mata kanan
x_eyeR = 0.2 .* cos.(θ_eye) .+ 0.4
y_eyeR = 0.2 .* sin.(θ_eye) .+ 3.0
plot!(p, x_eyeR, y_eyeR, color=:black, linewidth=3, label="")

# Senyum
θ_mouth = range(0, π, length=200)
x_mouth = 0.5 .* cos.(θ_mouth)
y_mouth = -0.3 .* sin.(θ_mouth) .+ 2.2
plot!(p, x_mouth, y_mouth, color=:black, linewidth=3, label="")

# =========================
# Tampilkan & simpan
# =========================
display(p)
savefig(p, "cangkir2d_emoji_senyum.png")
