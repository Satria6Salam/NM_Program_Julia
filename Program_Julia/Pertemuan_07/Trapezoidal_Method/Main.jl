using SymPy

function h(a, b, n)
    return (b - a) / n
end

function titik(a, b, n)
    dh = h(a, b, n)
    listT = Float64[]
    current = a

    push!(listT, current)
    for i in 1:n
        current += dh
        push!(listT, current)
    end

    println("ListT: ", listT)
    return listT
end

function fungsi(a, b, n)
    listT = titik(a, b, n);

    f(xi) = xi^3 + 1
    listF = Float64[]

    for xi in listT 
        push!(listF, f(xi))
    end
    println("ListF: ", listF)
    return listF
end

function compositeTrapezoid(a, b, n)
    listF = fungsi(a, b, n)
    f0 = listF[1]
    fn = listF[end]
    
    dh = h(a, b, n)

    sumF = 0.0
    for i in 2:length(listF)-1 
        sumF += listF[i]
    end

    apr = (dh / 2) * (f0 + (2 * sumF) + fn)
    ek = eksak(a, b)

    error = trapezoid_error(6, a, b, n)

    println("Hasil Eksa     : ", ek)
    println("Hasil Aprokmasi: ", apr)
    println("Error          : ", error)
end 

function eksak(a, b)
    x = symbols("x") 
    f = x^3 + 1                 # ekspresi simbolik
    F = integrate(f, (x, a, b)) # integral eksak dari a sampai b
    return float(F)
end

function trapezoid_error(f2max, a, b, n) # f2max turunan kedua dari fungsi integral
    return ((b - a)^3 / (12 * n^2)) * abs(f2max)
end

compositeTrapezoid(0, 1, 4)
