println("\nPerulangan for")
for i in 1:5
    println(i)
end

buah = ["Apel", "Jeruk"]

for item in buah 
    print(item, " ")
end

println("\n\nPerulangan while")
p = 1

while p <= 5
    println("Nilai ", p)
    global p += 1
end

println("\nPenggunaan break")
b = 0
for i in 1:6
    if b == 4
        break
    end
    print(b, " ")
    global b += 1 # Hanya assignment yang butuh global
end

println("\n\nPenggunaan continue")
c = 1
for i in 1:7
    if c == 3
        global c += 1
        continue   # skip angka 3
    end
    print(c)
    global c += 1
end

println("\n\nPenggunaan Nested Loop")
for i in 1:3
    for j in 1:2
        println("i = $i, j = $j")
    end
end

println("\n\nPenggunaan Function untuk Loop")

function loop()
    i = 1
    while i <= 5
        println("Nilai i: $i")
        i += 1
    end
end

# Panggil function
loop()