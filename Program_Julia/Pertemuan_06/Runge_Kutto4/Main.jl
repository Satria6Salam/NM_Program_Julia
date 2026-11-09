using Printf           # digunakan untuk format cetak tabel hasil numerik
using Plots            # digunakan untuk membuat grafik
plotly()               # memilih backend Plotly agar grafik bisa interaktif (zoom/pan)


"""
    Runge Kutta 4

    Metode numerik yang handal dalam delam menyelesaikan persamaan Diferensial biasa.
    Metode ini, merupakan metode iteratif untuk mendapatkan solusi perkiraan. Metode ini, 
    dikenal karena keseimbangan yang baik antara akurasi, efisiensi dan kemudahan implementasi.
    Runge kutta 4 memberikan hasil yang lebih akurat untuk ukuran langkah (h) yang sama.

    Konsep Dasar
        Terdapat persamaan diferensial biasa orde pertama:

            dy/dx = f(x, y)

        dengan kondisi awal y(x0) = y0. tujuannya untuk mencari nilai y pada titik x berikutnya.
        yaitu x(i+1) = xi + h, dimana h adalah ukuran langkah step size. 

    Metode runge kutta 4 mengambil sampel kemiringan di empat titik berbeda dalam satu interval 
    langkah. Kemudian, nilai-nilai kemiringan ini dirata ratakan secara berbobot untuk mendapatkan
    perkiraan kemiringan terbaik yang mewakili seluruh interval yang mirip dengan aturan simpson
    dalam integrasi numerik.

    Rumus 
    Untuk bergerak dari titik (xi, yi) ke titik berikutnya (xi + 1, yi + 1):

    y(i+1) = yi + 1/6 (k_1 + 2(k_2) + 2(k_3) + k_4) h

        >> h : ukuran langkah
        >> k_1 : kemiringan pada awal interval.
                --> k_1 = f(xi, yi)

        >> k_2 : kemiringan di titik tengah interval, dihitung menggunakan k_1.
                --> k_2 = f(xi + 0.5 * h, yi + 0.5 * k_1 * h)
        
        >> k_3 : kemiringan di titik tengah, tetapi dihitung menggunakan k_2 untuk akurasi yang lebih baik.
                --> k_3 = f(xi + o.5 * h, yi + 0.5 * k_2 * h)

        >> k_4 : kemiringan diakhir interval, dihitung menggunakan k_3.
                --> k_4 = f(xi + h, yi + k_3 * h)

        Soal:
        f(x, y) = 1,3 e^-x - 2y
        h = 1
        y(0) = 5
        y(2) = ... ?
"""


function rungeKutta4(xi, yi, h)
    xi = BigFloat(xi) # nilai x awal
    yi = BigFloat(yi) # nilai y awal
    h  = BigFloat(h)  # ukuran langkah
    setprecision(128)
    
    array_xi = [xi]             # menyimpan nilai x diseriap iterasi
    array_yi = [yi]             # menyimpan nilai y disetiap iterasi
    array_error = BigFloat[]    # menyimpan nilai error tiap langkah

    stp = repeat("============", 11)
    stp2 = repeat("------------", 11)

    println(stp)
    @printf("%-5s %-20s %-25s %-25s %-25s %-25s\n", "Iter",  "xi", "y(i-1)", "y(i+1)",  "Eksak", "Error(%)")
    println(stp)
    
    n = round(Int, (BigFloat(2) - BigFloat(0)) / h) # Menghitung jumlah iterasi (dari 0 hingga 2, sesuai interval x)

    f(xi, yi) = 1.3 * exp(-xi) - 2 * yi
    
    # interasi
    for i in 1:n
        
        k_1 = f(xi, yi)
        k_2 = f(xi + 0.5 * h, yi + 0.5 * k_1 * h)
        k_3 = f(xi + 0.5 * h, yi + 0.5 * k_2 * h)
        k_4 = f(xi + h, yi + k_3 * h)

        # println("k1", k_1)
        # println("k2", k_2)
        # println("k3", k_3)
        # println("k4", k_4)
        
        # perhitungan nilai y berikutnya
        yiadd1 = yi + 1/6 * (k_1 + 2*k_2 + 2*k_3 + k_4) * h
        
        
        x = xi + h
        
        # Solusi analitik
        y = 1.3*exp(-x) + 3.7*exp(-2 * x)
        
        # error
        eA = abs((y - yiadd1) / y) * 100
        
        @printf("%-5d %-20.10f %-25.15f %-25.15f %-25.15f %-25.15f\n", i, x, yi, yiadd1, y, eA)
        println(stp2)
        
        xi = x
        yi = yiadd1

        # simpan hasil xi, yi, eA ke array
        push!(array_xi, xi)
        push!(array_yi, yi)
        push!(array_error, eA)
    end
    return array_xi, array_yi, array_error
end

function grafik()
    # menjalan metode RK4
    x_rk, y_rk, err = rungeKutta4(0, 5, 1) 

    # solusi eksak
    y(x) = 1.3*exp(-x) + 3.7*exp(-2 * x)

    # membuat kurva eksak
    x_val = 0:0.1:2
    y_val = [y(x) for x in x_val]

    plt = plot(x_val, y_val, xlims=(0,2), ylims=(0,5), xticks=0:0.5:2, yticks=0:0.5:6,
            label = "Solusi Analitik y(x) = 1.3e^{-x} + 3.7e^{-2x}", 
            lw=4, color=:blue, xlabel="x", ylabel="y(x)",
            title = "",
            legend = :topright, grid = true)
        
    # Tambahkan garis penghubung antar hasil RK4 (garis merah putus-putus)
    plot!(Float64.(x_rk), Float64.(y_rk),
        label = "Hasil RK4 (garis hampiran)",
        color = :red, lw = 2, linestyle = :dash)

    # Tambahkan titik hasil RK4 (titik merah)
    scatter!(Float64.(x_rk), Float64.(y_rk),
        label = "Titik RK4",
        color = :red, markersize = 2)

    # tampilkan grafik 
    display(plt) 

    # Buat grafik error
    plt_error = plot(Float64.(x_rk[2:end]), Float64.(err),  # mulai dari iterasi ke-1
        label = "Error (%) terhadap Solusi Analitik",
        lw = 2.5, color = :orange, marker = :circle,
        xlabel = "x", ylabel = "Error (%)",
        title = "Grafik Error",
        legend = :topright, grid = true,
        xlims = (0, 2), xticks = 0:0.2:2)

    # tampilkan grafik error
    display(plt_error) 

    # simpan grafik dalam bentuk png
    savefig(plot(plt), "RK4 EksakvsHampiran.png")
    savefig(plot(plt_error), "RK4 Error.png")
end

grafik()