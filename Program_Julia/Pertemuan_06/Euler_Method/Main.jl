function countEulerMethod(a, b)
    x0 = a
    y0 = b
    h = 0.1 # jarak interval
    n = Int((2 - x0) / h) # 2: x ke2 yang akan di cari

    for i in 1:n
        fxy = 1.3*exp(-x0) - 2y0

        y1 = y0 + fxy * h

        x0 = x0 + h
        y0 = y1
        
        # Solusi analitik
        y = 1.3*exp(-x0) + 3.7*exp(-2*x0)
        eA = abs((y - y1)/y)

        println("Iter: ", i, "|x0: ", x0, "|y1: ", y1, "|y: ", y, "|error: ", eA)
        println("")
    end
end

countEulerMethod(0, 1)
