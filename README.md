# KiwQuiz

## Nama dan Deskripsi Singkat Aplikasi  
**KiwQuiz** adalah aplikasi kuis edukatif berbasis JavaFX yang memungkinkan pengguna mengasah kemampuan dalam berbagai kategori soal. Aplikasi ini memiliki sistem akun, leaderboard, dan evaluasi skor otomatis untuk meningkatkan pengalaman belajar yang menyenangkan dan kompetitif.

---

## Penjelasan Fitur Utama

### 1. Autentikasi & Akun Pengguna
- **Login & Register:** Pengguna dapat membuat akun baru dan masuk menggunakan email serta password.
- **Profil Pengguna:** Tampilkan informasi akun, ubah data pribadi dan Logout.
- **Keamanan Akun:** Fitur ganti password untuk menjaga keamanan data pengguna.

### 2. Sistem Kuis Interaktif
- **Kategori Soal:** Tersedia kategori seperti Sistem Operasi, Jaringan Komputer, Struktur Data & Algoritma, Pengantar Ilmu Komputer dan Kalkulus.
- **Navigasi Soal:** Jawab pertanyaan pilihan ganda satu per satu dengan opsi A–E.
- **Evaluasi Skor:** Skor langsung dihitung setelah menyelesaikan kuis.

### 3. Leaderboard
- **Leaderboard:** Menampilkan daftar skor tertinggi secara real-time.
  
---

## Cara Menjalankan Aplikasi (Langkah Instalasi dan Dependencies)

### Kebutuhan Sistem
- **Java Development Kit (JDK):** Versi 24
- **IDE:** IntelliJ IDEA
- **Database:** MySQL (melalui XAMPP)

### Langkah Instalasi dan Menjalankan
1. **Siapkan MySQL di XAMPP:**
   - Aktifkan service **MySQL** di XAMPP Control Panel.
   - Buat database dengan nama sesuai yang digunakan di aplikasi (contoh: `kiwquiz`).
   - Import struktur database jika disediakan dalam file `kiwquiz.sql`.

2. **Import Proyek ke IntelliJ IDEA:**
   - Buka IntelliJ IDEA → New Project → Buat nama projek (KiwQuiz) → JavaFX (JDK Version 24) → Next → Create
   - Pilih Main Menu(pojok kiri atas) → Setting → Version Control → GitHub
   - Login GitHub Anda → Apply → Ok 
   - Pilih Folder yang tadi di buat(pojok kiri atas) → Clone Repository → Masukan URL(https://github.com/SimonHutapea/KiwQuiz.git) → Clone
    

3. **Periksa Koneksi Database:**
   - Buka file `DatabaseConnection.java`.
   - Pastikan konfigurasi berikut:
     - `host`: `localhost`
     - `user`: `root`
     - `password`: *(kosong atau sesuai konfigurasi MySQL kamu)*
     - `database`: `kiwquiz`

4. **Jalankan Aplikasi:**
   - Buka file `MainApp.java`.
   - Klik tombol `Run` atau gunakan shortcut `Shift + F10`.

### Dependencies Utama
- **JavaFX Controls** dan **FXML** (versi 24.0.1 atau versi terbaru)
- **XAMPP** versi 8.2.12 atau versi terbaru
- **MySQL JDBC Driver** (`mysql-connector-java`) versi 9.3.0 atau versi terbaru

---

## Link Menuju Video Presentasi YouTube  
*(https://youtu.be/sWQN2blGO0s)*

---

