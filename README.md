
# UTS - PEMOGRAMAN MOBILE 7A2 (MyShop Mini)

*A new Flutter project.*

**Nama Project** : MyShop Mini - ShiftKomputer

**Nama** : Dimas Hammam Abdillah

**NIM** : 221080200048

---

## 📸 Screenshots  
| Light Mode | Dark Mode |
|--|--|
| ![Home Light](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/L1.png) | ![Home Dark](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/D1.png) |
| ![List](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/L2.png) | ![List](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/D2.png) |
| ![Detail](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/L3.png) | ![Detail](https://github.com/FourthMarch/UTS-MyShop-Mini/blob/main/ScreenShoots/D3.png) |


---
## **Deskripsi Widget(Jawaban Soal Nomor 4)**
**Berikut adalah daftar lengkap Widget yang digunakan dalam membangun proyek ShiftKomputer ini, dikelompokkan berdasarkan fungsinya:**
---

### 1. Struktur Utama (Core Structure)

-   **`MaterialApp`**: Widget induk yang mengatur tema global (Light/Dark Mode), judul aplikasi, dan navigasi dasar.
    
-   **`Scaffold`**: Struktur dasar halaman yang menyediakan kerangka untuk AppBar, Body, dan fitur standar layar.
    
-   **`SafeArea`**: Menjaga konten agar tidak tertutup oleh _notch_ (poni layar), status bar, atau area gestur di HP modern.
    
---
### 2. Layout & Tata Letak (Layouting)

-   **`Column`**: Menyusun elemen secara vertikal (atas ke bawah). Digunakan di hampir semua bagian halaman.
    
-   **`Row`**: Menyusun elemen secara horizontal (kiri ke kanan). Digunakan pada Top Bar, deretan tombol kategori, dan info produk.
    
-   **`Stack`**: Menumpuk widget di atas widget lain. Digunakan pada **Product Card** (Gambar di bawah, Teks di atasnya) dan **Header Kategori**.
    
-   **`Positioned`**: Mengatur posisi elemen secara spesifik di dalam `Stack` (misalnya: menaruh teks di pojok bawah kartu).
    
-   **`Positioned.fill`**: Memaksa widget anak (seperti gambar background) untuk memenuhi seluruh area `Stack`.
    
-   **`Container`**: Kotak serbaguna untuk membungkus widget lain, memberi warna background, border, radius sudut, dan bayangan (`BoxShadow`).
    
-   **`SizedBox`**: Memberi jarak kosong (spasi) antar elemen, atau membatasi ukuran tombol/gambar.
    
-   **`Padding`**: Memberi jarak di dalam elemen (jarak antara konten dengan tepi layar/kotak).
    
-   **`Expanded`**: Mengisi sisa ruang yang tersedia. Digunakan agar gambar pada kartu produk mengambil porsi ruang yang pas.
    
-   **`Center`**: Menengahkan widget anak.
    
---
### 3. Konten & Visual (Content)

-   **`Text`**: Menampilkan tulisan (Judul, Harga, Deskripsi).
    
-   **`Icon`**: Menampilkan simbol vektor (ikon Search, Laptop, Mouse, Monitor, dll).
    
-   **`Image.network`**: Memuat gambar dari internet (URL Unsplash).
    
-   **`ClipRRect`**: Memotong widget anak menjadi bentuk bulat (rounded corner). Sangat penting agar gambar produk sudutnya tidak lancip.
    
-   **`LinearGradient`**: Membuat efek gradasi warna (Transparan ke Hitam) pada kartu produk agar teks putih mudah dibaca.
    
---
### 4. Input & Interaksi (Interaction)

-   **`TextField`**: Kolom input teks untuk pencarian ("Cari produk...").
    
-   **`GestureDetector`**: Mendeteksi ketukan (tap) pada kartu produk untuk pindah halaman.
    
-   **`MouseRegion`**: Mendeteksi kursor mouse (Hover) untuk memberikan efek animasi saat mouse berada di atas kartu (khusus Web/Desktop).
    
-   **`AnimatedContainer`**: Wadah yang bisa berubah bentuk/warna secara halus (animasi) saat di-hover.
    
-   **`ElevatedButton`**: Tombol dengan background warna solid (Tombol "Beli").
    
-   **`OutlinedButton`**: Tombol transparan dengan garis tepi (Tombol "Detail" & "Chat").
    
-   **`IconButton`**: Tombol yang hanya berisi ikon (Tombol Ganti Tema Matahari/Bulan).
    
---
### 5. Scroll & Grid (List Display)

-   **`SingleChildScrollView`**: Membuat konten bisa digulir (scroll) jika isinya melebihi tinggi layar (digunakan di HomePage dan DetailPage). Juga digunakan dengan `scrollDirection: Axis.horizontal` untuk kategori Monitor.
    
-   **`GridView.builder`**: Menampilkan daftar produk dalam bentuk kisi-kisi (grid) 2 kolom secara otomatis dan efisien.
    
---
### 6. Navigasi & Tema

-   **`Navigator.push`**: Fungsi untuk berpindah dari satu halaman ke halaman lain (Home -> List -> Detail).
    
-   **`MaterialPageRoute`**: Mengatur animasi transisi standar Android saat pindah halaman.
    
-   **`AppBar`**: Bar di bagian atas layar yang berisi Judul Halaman dan tombol kembali (Back button) otomatis.
    
-   **`Theme` / `ThemeData`**: Mengatur warna dan gaya aplikasi secara global (Logika Dark Mode vs Light Mode).
