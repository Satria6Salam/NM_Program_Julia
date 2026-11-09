print("Masukkan masa benda (Kg): ");
m = parse(Float64, readline());
print("Masukkan percepatan gravitasi: ");
g = parse(Float64, readline());
print("Masukkan koefisien hambatan udara (Kg/m): ");
Cd = parse(Float64, readline());
print("Masukkan waktu (s): ");
t = parse(Float64, readline());

println("m  -> ", m);
println("g  -> ", g);
println("Cd -> ", Cd);
println("t  -> ", t);

s1 = sqrt((m * g) / Cd);
y = sqrt((g * Cd) / m);
x = y * t;
s2 = tanh(x);

println("Hasil s1 = sqrt((m * g) / Cd)     --> ", s1);
println("Hasil s2 = sqrt((g * Cd) / m) * t --> ", s2);

v = s1 * s2;

println("Hasil perhitungan kecepatan benda pada waktu ", t, "s , (s1 * s2) = ", v);
