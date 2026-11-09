using Plots
plotly()


# x = 0:4*pi:10
# x = 0:12:10
x = range(0,10, length=10)
y1 = sin.(x)
y2 = cos.(x)
println(y1)
println(y2)
# plot(x, y)
p = plot(x, [y1, y2], label=["sin(x)" "cos(x)"], title="Plot Sin & Cos")
display(p)
# savefig(p, "plot.html")

# Plot julia 
# Instal plot
# Model plot di julia plot
# Tugas terakhir jumat