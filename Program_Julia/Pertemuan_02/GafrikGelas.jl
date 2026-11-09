"""
    > Plots: memberikan semua fungsi plotting (grafik) seperti plot, plot! dll
    > gr(): memakai GR backend, cepat dan ringa
    > range(): membuat deret angka dengan jarak tertentu
        > range(0, 10, length=5) -> 5 titik dari 0 sampai 
    > vcat(): vertical concatenation (penggabungan array secara vertical)
        > a = [1,2]
        > b = [3,4]
        > vcat(a, b) # hasil [1, 2, 3, 4]
    > plot: fungsi utama untuk membuat grafik baru.
    > plot!: Versi in-place daro plot yaitu menambahkan garfik keplot yang sudah ada
    > reverse(): berfungsi untuk menyambungkan titik awal dan akhir
"""

using Plots
plotly()

# Bentuk lingkaran gelas atas (ellipse atas)
teta = range(0, 2π, length=200) 
x_Atas = 2 .* cos.(teta) # Mengalikan hasil cos.(teta) dengan 2 -> x = 2cos(teta)
y_Atas = 0.3 .* sin.(teta) .+ 5 # jari-jari vertikal kecil (0.3) seluruh bentuk ellips digeser setinggi 5 -> y = 0.3sin(teta)+5

# Bentuk lingkaran gelas bawah (ellipse bawah)
x_Bawah = 1.5 .* cos.(teta) # x = 1.5cos(teta)
y_Bawah = 0.3 .* sin.(teta) .+ 0 # y = 0.3sin(teta) + 0

# Bentuk garis tepi gelas (miring)
x_Kiri = [-2, -1.5] # Dua titik koordinat sumbu (-x) 
y_Kiri = [5, 0] # Dua titik koordinat sumbu (y)

x_Kanan = [2, 1.5]
y_Kanan = [5, 0]

# Pegangan gelas -> bentuk umum x = x1 + acos(teta) | y = y1 + bsin(teta)
teta_P = range(-π/2, π/2, length=200) # Membuat setengah lingkaran -90* sampai +90*
x_Luar = 2 .+ 0.8 .* cos.(teta_P)
y_Luar = 2.5 .+ 1.5 .* sin.(teta_P)

# Pegangan dalam
x_Dalam = 2 .+ 0.6 .* cos.(teta_P)
y_Dalam = 2.5 .+ 1.2 .* sin.(teta_P)

# Warna isi cangkir 
warna_x = vcat(x_Bawah, reverse(x_Atas)) 
warna_y = vcat(y_Bawah, reverse(y_Atas))
p = plot(warna_x, warna_y, seriestype=:shape, lw=0, c=:red, alpha=0.7, label="") # alpha(transparansi)

# Membuat dinding gelas (outline)
plot!(p, x_Atas, y_Atas, color=:blue, linewidth=2, label="")
plot!(p, x_Bawah, y_Bawah, color=:blue, linewidth=2, label="")
plot!(p, x_Kiri, y_Kiri, color=:blue, linewidth=2, label="")
plot!(p, x_Kanan, y_Kanan, color=:blue, linewidth=2, label="")

# Warna pegangan gelas (area antara luar garu & dalam garis)
warna_a = vcat(x_Luar, reverse(x_Dalam))
warna_b = vcat(y_Luar, reverse(y_Dalam))
plot!(p, warna_a, warna_b, seriestype=:shape, lw=0, c=:cyan, alpha=0.7, label="")

# Garis pegangan
plot!(p, x_Luar, y_Luar, color=:blue, linewidth=2, label="")
plot!(p, x_Dalam, y_Dalam, color=:blue, linewidth=2, label="")

title!(p, "Cangkir 2D")
plot!(p, aspect_ratio=:equal, xlabel="x", ylabel="y") # aspect_ratio mengatur perbandingan sumbu x dan sumbu y


# Tampilkan & simpan
display(p)
savefig(p, "cangkir2d.png")
