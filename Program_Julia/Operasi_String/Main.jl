""" 
Secara historis, string dalam bahasa pemrograman Julia direpresentasikan
sebagai array karakter UTF-8. Berarti bahwa setiap karakter dalam string 
tergantung pada karakter itu sendiri, bisa berukuran satu sampai 4 byte.
pendekatan ini adalah kompromi yang bagus antara efisiensi ruang dan kinerja 
terutama dalam menangani teks meltibahasa.

String dalam julia immutable yang artinya setelah string dibuat, anda tidak
bisa mengubahnya. Setiap operasi yang seolah olah memodifikasi string (misalnya, 
menambahkan atau manghapus kerakter) sebenarnya akan menciptakan string baru.

Ada beberapa cara untuk membuat string. bisa menggunakan tanda kutip ganda " atau
tanda kutip tiga kali \""" untuk string multiline
"""

s1 = "Halo dunia"

s2 = """
Ini adalah 
String
multiline
"""

println(s1)
println()
println(s2)

s2 = s1 * " " * s2
println(s2)

s4 = string("Julia", " ", "keren!")
println(s4)

"""
Interpolasi string memungkinkan anda menyisipkan nilai variabel atau ekspresi 
ke dalam string dengan menggunakan tanda dollar. 
"""

nama = "Satria"
umur = 25
pesan = "Nama saya $nama dan saya umur $(umur) tahun"

println("\n",pesan)