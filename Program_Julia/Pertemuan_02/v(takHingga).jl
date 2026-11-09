using Plots
plotly()

print("Masukkan masa benda (Kg): ");
m = parse(Float64, readline());
print("Masukkan percepatan gravitasi: ");
g = parse(Float64, readline());
print("Masukkan koefisien hambatan udara (Kg/m): ");
Cd = parse(Float64, readline());
print("Masukkan waktu awal: ");
t = parse(Float64, readline());

println("m  -> ", m);
println("g  -> ", g);
println("Cd -> ", Cd);
println("t  -> ", t);

next = true;
t0 = t
t_vals = Float64[]
v_vals = Float64[]

# rumus kecepatan terhadap waktu
s1 = sqrt((m * g) / Cd); # Kecepatan terminal

# Mencari kecepatan konstan
while (next == true)
    
    # rumus kecepatan terhadap waktu
    y = sqrt((g * Cd) / m);
    x = y * t0;
    s2 = tanh(x);

    v = s1 * s2;

    push!(t_vals, t0)
    push!(v_vals, v)

    println("Hasil perhitungan v($t0) dengan nilai tanh($s2) --> ", v);

    global t0 = t0 + 0.001; # jarak interval dari suatu titik waktu ke titik waktu berikutnya (s) 
    if (s2 > 0.999999999999999) # ketika nilai tanh melebihi nilai yang mendekati 1 -> 0.999...
        global next = false;    # loop berhenti 
    end
end

p = plot(t_vals, v_vals, lw=2, color=:blue, label="v(t)")
hline!(p, [s1], linestyle=:dash, color=:red, label="Kecepatan Terminal")
xlabel!(p, "Waktu (s)")
ylabel!(p, "Kecepatan (m/s)")
hline!(p, [s1], linestyle=:dash, color=:red, label="Kecepatan Terminal")
xlabel!(p, "Waktu (s)")
ylabel!(p, "Kecepatan (m/s)")
display(p)
savefig(p, "Grafik Kecepatan Konstan.png")