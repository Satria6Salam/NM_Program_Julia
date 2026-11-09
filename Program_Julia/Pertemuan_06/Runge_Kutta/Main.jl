println("Pertemuan 6")

function rungeKutta(x0, y0, h)
    n = (2 - 0)/ h # Jumlah iterasi n = (2 - 0) / h
    for i=1:n
        k1 = 1.3*exp(-x0) - (2*y0)

        a = x0 + h
        b = y0 + (k1 * h)
        k2 = 1.3*exp(-a)-(2*b)

        y1 = y0 + (0.5 * k1 + 0.5 * k2) * h

        x1 = x0 + h

        # Solusi analitik
        y = 1.3*exp(-x1) + 3.7*exp(-2 * x1)

        # error
        eA = abs((y - y1) / y) * 100
        println((i, x1, y1, eA))

        y0 = y1
        x0 = x1
    end
end

rungeKutta(0, 5, 0.01)