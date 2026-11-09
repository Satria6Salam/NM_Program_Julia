# Kelipatan 2
a = 0
b = 1
n = 6
h = (b - a) / n
f0 = a^3 + 1
fn = b^3 + 1

fc1 = 0
fc2 = 0
fc3 = 0

for i in 1:3:n-1
    c = a + (i * h)
    fc = c^3 + 1
    global fc1 += fc
    println("1)", fc1)
end

for i in 2:3:n-1
    c = a + (i * h)
    fc = c^3 + 1
    global fc2 += fc
    println("2)",fc2)
end

for i in 3:3:n-1
    c = a + (i * h)
    fc = c^3 + 1
    global fc3 += fc
    println("3)", fc3)
end

I = (3*h)/8 * (f0 + 3(fc1) + 3(fc2) + 2(fc3) + fn)

# Integral eksak dari x^3 + 1 adalah:
# ∫ (x^3 + 1) dx = (x^4)/4 + x
# Jadi nilai integral dari 0 sampai 1:
exact_integral = (b^4)/4 + b - ((a^4)/4 + a)

println("Integral eksak = ", exact_integral)
println("Simpson = ", I)