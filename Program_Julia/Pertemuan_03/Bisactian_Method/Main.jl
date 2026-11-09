""" Merupakan metode tertutup karena harus memilih 2 tebakan

"""
function bisaction(Xl, Xu, Es)
    
    for i in 1:100 
        fXl = Xl.^2 .- 5*Xl .+ 6 # f(a)
        fXu = Xu.^2 .- 5*Xu .+ 6 # f(b)

        # base case
        if fXl * fXu > 0
            pritnln("interval tidak valid")
            return;
        end

        Xm = (Xl + Xu) / 2       #  hitung titik tengah 
        fXm = Xm.^2 .- 5*Xm .+ 6 # Evaluasi f dititik tengah

        if fXl * fXm < 0            # akar berada di interval a - c
            Xl = Xl
            Xu = Xm
        elseif fXu * fXm < 0        # akar berada di interval c - b
            Xl = Xm
            Xu = Xu
        end

        Xm_new = (Xl + Xu) / 2
        Eg = abs((Xm_new - Xm)/Xm_new) * 100

        println(i, " | ", Xl, " | ", Xu, " | ", Xm_new, " | ", Eg)

        if Eg < Es
            break;
        end
    end
end

bisaction(0.5, 2.2, 0.01)







"""
    Kelebihan
    > Konvergen

    Kekurangan
    > Butuh waktu yang lama
    > Jika titik Xl dan Xu tidak seimbang butuh waktu lama
"""