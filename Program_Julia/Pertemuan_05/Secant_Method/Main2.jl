function countSecantMethod(xOne, xTwo, eS)
    x0 = xOne
    x1 = xTwo

    for i in 1:100
        f1 = x0^2 - 5*x0 + 6
        f2 = x1^2 - 5*x1 + 6

         # cek pembagi 0
        if f2 == f1
            println("Error: pembagi nol (f(x_i) = f(x_i-1))")
            return
        end
        
        xiadd1 = x1 - ((f2 * (x1 - x0)) / (f2 - f1)) 
        
        eA = abs((xiadd1 - x1) / xiadd1) * 100

        println("Iterasi ke-", i)
        println("  x(i-1)   : ", x0)
        println("  x(i)     : ", x1)
        println("  Secant   : ", xiadd1)
        println("  Error %  : ", eA)
        println("----------------------------------------")

        if eA < eS
            return
        end

        x0 = x1
        x1 = xiadd1
    end
end