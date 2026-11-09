using Plots
plotly()

# Menyimpan Plot
x = 0:1:10
y = cos.(x)
p = plot(x, y, label="cos(x)")
display(p)
savefig(p, "Contoh Save Plot.png")

# Plot skala logaritmik
f(x) = exp(x)

plt1 = plot(f, 1, 10, lw=2, label="exp(x)")                     # normal
plt2 = plot(f, 1, 10, lw=2, label="exp(x)", yscale=:log10)      # semilog-y
plt3 = plot(f, 1, 1000, lw=2, label="exp(x)", xscale=:log10, yscale=:log10)  # log-log
display(plt1)
display(plt2N)
display(plt3)
