using Plots
plotly()

function countSecantMethod(xOne, xTwo, eS)
    x0 = xOne
    x1 = xTwo
    results = []

    for i in 1:100
        f1 = x0^2 - 5x0 + 6
        f2 = x1^2 - 5x1 + 6
        xiadd1 = x1 - ((f2 * (x1 - x0)) / (f2 - f1)) 
        
        eA = abs((xiadd1 - x1) / xiadd1) * 100

        push!(results, (i, x0, x1, f1, f2, xiadd1, eA))  # simpan hasil iterasi

        println("Iterasi ke-", i)
        println("  x(i-1)   : ", x0)
        println("  x(i)     : ", x1)
        println("  Secant   : ", xiadd1)
        println("  Error %  : ", eA)
        println("----------------------------------------")

        if eA < eS
            return results
        end

        x0 = x1
        x1 = xiadd1
    end
end 

function grafikEksak(a1, b1, c1, xOne, xTwo, eS) 
    # Koefisien
    a, b, c = a1, b1, c1

    # Rumus kuadrat
    x1 = (-b + sqrt(b^2 - 4a*c)) / (2a)
    x2 = (-b - sqrt(b^2 - 4a*c)) / (2a)

    # Interval x
    x = min(x1,x2)-1:0.01:max(x1,x2)+1
    f = a .* x.^2 .+ b .* x .+ c 

    # Hitung secant
    result = countSecantMethod(xOne, xTwo, eS)

    # Plot eksak
    plt1 = plot(x, f, label="f(x) = x^2 - 5x + 6", lw=1, color=:red,
        xlabel="x", ylabel="f(x)", title="Grafik Eksak + Metode Secant")
    
    hline!(plt1, [0], color=:black, lw=1, label="") # menggambar garis horizontal di y=0 (sumbu-x).

    for (i, x0, x1, f1, f2, xiadd1, eA) in result   
       scatter!([x0, x1], [f1, f2], label=false, color=:blue) # plot titik (scatter plot) ke plt1
       plot!([x0, x1], [f1, f2], linestyle=:dash, color=:orange, label=false) # Menggambar garis secant
       scatter!([xiadd1], [0], color=:green, label="Aproksimasi akar"*(i==1 ? "" : "")) # Menandai aproksimasi akar
    end

    iterasi = [i for (i, _, _, _, _, _, _) in result]
    error   = [eA for (_, _, _, _, _, _, eA) in result]

    # Plot error
    plt2 = plot(iterasi, error, marker=:circle, lw=2, color=:blue, # marker=:circle → tiap titik data ditandai lingkaran.
        xlabel="Iterasi ke-i", ylabel="Error (%)", 
        title="Konvergensi Error (Metode Secant)", yscale=:log10,
        label="Error")

    display(plot(plt1, plt2, layout=(2,1), size=(800,800)))
    savefig(plot(plt1), "Grafik Eksak.png")
    savefig(plot(plt2), "Grafik Error.png")
end


grafikEksak(1, -5, 6, 2.1, 2.2, 0.001)


"""
x^2 - 5x + 6
xi = 2,2
xi-1 = 2,1

Hitung sampai 3 iterasi dengan es = 0.001
Kode diprint 
Figure untuk nilai kesalahan (eA)
"""
