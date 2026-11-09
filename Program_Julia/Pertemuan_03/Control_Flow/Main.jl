using Plots
plotly()

println("8 September 2025");

"""
    > Control Flow (Loop)
"""

function test(x, y)
    if x < y
        println("x is less than y")
    elseif x > y
        println("x is greater than y")
    else
        println("x is equal to y")
    end
end

x = 5
y = 6
test(x, y)

println("Seleksi Tornery")
println(x < y ? "x is less than y"    :
        x > y ? "x is greater than y" : "x is equal to y")



println("Perulangan while")
i = 1
while i < 5
    print(i)
    global i += 1
end


println()
v(x) = (println(x); x) 
v(test(x, y))


println("")

x = range(0, 2, length=1000)
y = (x.^2) .- (9*x) .+ 6
println(x)
println(y)
p = plot(x, y, title = "Trigonometri", lw=2, color=:blue, label="Sin(x)")
display(p)