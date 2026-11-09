using Plots
plotly()

function bisaction(Xl, Xu, Es)

    Xm_list = Float64[]     # menyimpan Xm tiap iterasi
    iter_list = Int[]       # menyimpan nomor iterasi

    for i in 1:100
        fXl = Xl^2 - 5*Xl + 6
        fXu = Xu^2 - 5*Xu + 6

        if fXl * fXu > 0
            println("Interval tidak valid: f(Xl) dan f(Xu) tidak beda tanda.")
            return
        end

        Xm = (Xl + Xu) / 2
        push!(Xm_list, Xm)
        push!(iter_list, i)

        fXm = Xm^2 - 5*Xm + 6

        # Tentukan interval baru
        if fXl * fXm < 0
            Xu = Xm
        elseif fXu * fXm < 0
            Xl = Xm
        end

        Xm_new = (Xl + Xu) / 2
        Eg = abs((Xm_new - Xm) / Xm_new) * 100

        println(i, " | ", Xl, " | ", Xu, " | ", Xm_new, " | ", Eg)

        if Eg < Es
            push!(Xm_list, Xm_new)
            push!(iter_list, i+1)
            break
        end
    end

    # ==== PLOT ====
    p = plot(iter_list, Xm_list,
        marker = :circle,
        xlabel = "Iterasi",
        ylabel = "Nilai Xm (titik tengah)",
        title = "Plot Nilai Akar (Xm) vs Iterasi",
        grid = true,
        legend = false)
    display(p)

end

bisaction(0.5, 2.2, 0.01)
