using Plots
plotly()  

# Cari nilai shimson 
a = 0
b = 1
n = 8
h = (b - a) / n
fa = exp(2*a) + exp(a)
fb = exp(2*b) + exp(b)
fc1 = 0
fc2 = 0

for i = 1:n-1
    c = a + (i * h)
    fc = exp(2*c) + exp(c)
    
    if i % 2 == 0
        global fc1 += fc
    else 
        global fc2 += fc
    end
end

I = (b - a) / (3 * n) * (fa + 4 * fc2 + 2 * fc1 + fb)      # Nilai aproksimasi
I1 = (0.5 * exp(2*b) + exp(b)) - (0.5 * exp(2*a) + exp(a)) # Nilai eksak
EA = abs((I1 - I) / I1)
println("Aproksimasi: ", I, " Error: ", EA)


# Plot
# Fungsi yang diintegralkan
f(x) = exp(2x) + exp(x)

# Titik-titik x dan nilai fungsi
x_points = [a + i*h for i in 0:n]
y_points = f.(x_points)

# Titik halus untuk kurva asli
x_plot = range(a, b, length=300)
y_plot = f.(x_plot)

# Plot kurva fungsi asli
p = plot(
    x_plot, y_plot,
    label = "f(x) = e^(2x) + e^x",
    linewidth = 2,
    color = :blue,
    xlabel = "x",
    ylabel = "f(x)",
    title = "Visualisasi Simpson’s 1/3 Rule (n=8)"
)

# Tambahkan titik-titik Simpson
scatter!(
    x_points, y_points,
    label = "Titik Simpson",
    color = :red,
    markersize = 6
)

# Arsiran area di bawah kurva (approx. integral)
plot!(
    x_plot, y_plot,
    fill = (0, :cyan, 0.2),
    label = "Area Integral"
)

display(p)
savefig(plot(p), "Grafik Simpson.png")
