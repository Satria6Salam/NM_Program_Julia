"""
    1.  Pendahuluan
        Latar belakang.
        Integrasi numerik dibutuhkan ketika integral analitik sulit atau tidak mungkin 
        dihitung secara eksplisit (mis. data diskrit, fungsi tak tertutup bentuk primitifnya).
        Metode numerik umum meliputi aturan Riemann, metode trapesium, dan aturan Simpson. 
        Simpson’s 1/3 Rule muncul sebagai metode yang memanfaatkan interpolasi polinomial 
        orde dua (parabola) pada pasangan subinterval sehingga memberikan aproksimasi yang 
        lebih akurat daripada metode yang hanya memakai garis lurus (trapezoidal).

        Perbandingan singkat dengan Trapezoidal Rule.
        --> Trapesium mengaproksimasi f(x) antara dua titik dengan garis lurus → galat orde O(h^2).
        --> Simpson (1/3) mengaproksimasi sepasang subinterval (tiga titik) dengan parabola → galat ordre O(h^4).
        --> Akibatnya, untuk fungsi halus dan h kecil, Simpson umumnya jauh lebih akurat daripada trapesium pada jumlah segmen yang sama (dengan syarat n genap).
"""