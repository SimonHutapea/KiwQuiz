-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2025 pada 10.16
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kiwquiz`
--
CREATE DATABASE IF NOT EXISTS `kiwquiz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kiwquiz`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `score` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `calculus`
--

CREATE TABLE `calculus` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `e` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `calculus`
--

INSERT INTO `calculus` (`id`, `question`, `a`, `b`, `c`, `d`, `e`, `correct_answer`) VALUES
(1, 'Jika f(x) = ln(sin(x)), maka f\'(x) = ?', 'cot(x)', '1/sin(x)', 'cos(x)/sin(x)', 'csc(x)', 'tan(x)', 'C'),
(2, 'Turunan ke-n dari f(x) = e^{2x} adalah?', '2^n * e^{2x}', 'n * e^{2x}', '2n * e^{2x}', 'e^{2x}', 'n^2 * e^{2x}', 'A'),
(3, '∫ x * ln(x) dx = ?', '(x^2)/2 * ln(x)', '(x^2)/2 * ln(x) - (x^2)/4', '(x^2 * ln(x)) - x^2', 'ln(x)/2', '(x^2 * ln(x))/2 + C', 'B'),
(4, 'Jika f(x) = tan^{-1}(x), maka ∫ f(x) dx = ?', 'x * tan^{-1}(x) - ln(1 + x^2)/2 + C', 'tan^{-1}(x^2) + C', 'ln|x| + C', 'x^2 * tan^{-1}(x)', '1/(1 + x^2) + C', 'A'),
(5, 'Limit dari (e^x - 1 - x)/x^2 saat x→0 adalah?', '∞', '0', '1', '1/2', 'Tidak terdefinisi', 'D'),
(6, 'Turunan dari f(x) = x^x adalah?', 'x^x(1 + ln(x))', 'x^x ln(x)', 'x^(x-1)', 'x * x^x', 'x^(x+1)', 'A'),
(7, '∫ 1/(x^2 + 4) dx = ?', '(1/2) arctan(x/2) + C', 'arctan(x^2/4) + C', '(1/4) arctan(x) + C', 'ln|x^2 + 4| + C', 'arcsin(x/2) + C', 'A'),
(8, 'Jika f(x) = ln(x)/x, maka nilai maksimum dari f(x) pada x > 0 terjadi saat?', 'x = 1', 'x = e', 'x = √e', 'x = ln(2)', 'x = 2', 'C'),
(9, '∫ ln(x) dx = ?', 'x ln(x) + C', 'x ln(x) - x + C', '(ln(x))^2 + C', 'x^2 ln(x) + C', '1/x + C', 'B'),
(10, 'Limit dari (sin(x) - x)/(x^3) saat x→0 adalah?', '1/6', '0', '∞', '-1/6', '-∞', 'D'),
(11, 'Turunan ke-100 dari sin(x) adalah?', 'sin(x)', '-sin(x)', 'cos(x)', '-cos(x)', '0', 'A'),
(12, '∫ x^2 * e^{x} dx = ?', 'x^2 * e^x - 2x * e^x + 2 * e^x + C', 'x^2 * e^x + C', 'e^x + C', 'x * e^x + C', 'x^2 * e^x - x + C', 'A'),
(13, 'Turunan implisit dari x^2 + y^2 = 25 adalah?', 'dy/dx = -x/y', 'dy/dx = y/x', 'dy/dx = x/y', 'dy/dx = -y/x', 'dy/dx = 0', 'A'),
(14, 'Jika y = x^x^x, maka dy/dx = ?', 'x^x^x * ln(x^x)', 'x^x^x * ln(x) * x^x', 'x^x^x * ln(x^x^x)', 'ln(x) * x^x^x', 'x^x * ln(x^x)', 'B'),
(15, '∫ dx / (x * √(x^2 - 1)) = ?', 'arcsec(x) + C', 'arccos(x) + C', 'arcsin(x) + C', 'ln|x + √(x^2 - 1)| + C', '1/(x^2 - 1) + C', 'A'),
(16, 'Limit dari (1 + 1/n)^n saat n→∞ adalah?', 'e', '0', '1', '∞', 'ln(2)', 'A'),
(17, 'Integral dari √(x^2 + a^2) dx adalah?', '1/2 (x √(x^2 + a^2) + a^2 ln|x + √(x^2 + a^2)|) + C', '√(x^2 + a^2) + C', 'x ln(x^2 + a^2) + C', 'ln(x + a) + C', 'a tan^{-1}(x/a) + C', 'A'),
(18, 'Turunan dari y = ln|cos(x)| adalah?', '-tan(x)', 'sec^2(x)', 'tan(x)', '-sec^2(x)', '-cot(x)', 'A'),
(19, '∫ dx / √(a^2 - x^2) = ?', 'arcsin(x/a) + C', 'arccos(x/a) + C', 'ln|x + √(a^2 - x^2)| + C', 'tan^{-1}(x/a) + C', '1/√(a^2 - x^2) + C', 'A'),
(20, 'Turunan dari f(x) = ln(sec(x)) adalah?', 'tan(x)', 'sec(x)', '1/x', 'sec(x)tan(x)', 'cos(x)', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `computer_network`
--

CREATE TABLE `computer_network` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `e` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `computer_network`
--

INSERT INTO `computer_network` (`id`, `question`, `a`, `b`, `c`, `d`, `e`, `correct_answer`) VALUES
(1, 'Apa peran dari protokol BGP dalam jaringan internet global?', 'Mengatur transmisi data dalam LAN', 'Mengatur IP lokal', 'Routing antar domain otonom', 'Mengelola enkripsi data', 'Memfilter lalu lintas jaringan', 'C'),
(2, 'Apa yang menyebabkan terjadinya routing loop dalam jaringan dinamis?', 'Penggunaan NAT', 'Protokol statis', 'Penggunaan gateway default', 'Keterlambatan konvergensi routing', 'DNS yang salah', 'D'),
(3, 'Manakah dari berikut ini yang merupakan fitur dari IPv6 namun tidak ada pada IPv4?', 'Header lebih besar', 'Checksum pada header', 'Autoconfiguration', 'Alamat kelas A', 'Header UDP', 'C'),
(4, 'Dalam konteks OSI Layer, pada layer manakah protokol SSL/TLS beroperasi?', 'Application', 'Presentation', 'Session', 'Transport', 'Network', 'D'),
(5, 'Manakah dari berikut ini yang merupakan teknik untuk mencegah serangan ARP Spoofing?', 'Subnetting', 'DHCP Snooping', 'NAT Traversal', 'TTL Limiting', 'DNS Over HTTPS', 'B'),
(6, 'Apa kelebihan dari OSPF dibanding RIP dalam routing dinamis?', 'Lebih sederhana konfigurasinya', 'Menggunakan metric hop count', 'Lebih cepat konvergensi', 'Menggunakan UDP', 'Menggunakan tabel statis', 'C'),
(7, 'Apa yang dimaksud dengan jitter dalam transmisi jaringan?', 'Jumlah total paket yang hilang', 'Waktu tempuh rata-rata data', 'Variasi delay antar paket', 'Kecepatan transfer maksimal', 'Perbedaan bandwidth', 'C'),
(8, 'Manakah yang bukan merupakan protokol tunneling?', 'IPSec', 'GRE', 'L2TP', 'MPLS', 'SNMP', 'E'),
(9, 'Dalam VLAN trunking, protokol apa yang digunakan untuk tag VLAN pada frame Ethernet?', 'STP', '802.1Q', 'VTP', 'RSTP', 'IGMP', 'B'),
(10, 'Manakah yang menjelaskan konsep zero trust pada keamanan jaringan?', 'Selalu percaya pada jaringan internal', 'Enkripsi data end-to-end', 'Otentikasi hanya dilakukan satu kali', 'Asumsikan semua perangkat tidak tepercaya', 'Segmentasi jaringan berdasarkan zona', 'D'),
(11, 'Apa tujuan dari protokol 802.1X dalam jaringan?', 'Manajemen alamat IP', 'Routing antar jaringan', 'Autentikasi akses jaringan', 'Pengendalian bandwidth', 'Penetapan VLAN otomatis', 'C'),
(12, 'Manakah berikut ini yang paling menggambarkan man-in-the-middle attack?', 'Mengubah DNS resolver', 'Memata-matai komunikasi dua pihak', 'Menyerang server DNS', 'Flooding jaringan dengan paket palsu', 'Mengirim spam melalui SMTP relay', 'B'),
(13, 'Teknologi SDN memisahkan control plane dari data plane. Apa manfaat utamanya?', 'Biaya perangkat keras lebih mahal', 'Routing dilakukan oleh hardware', 'Kemudahan manajemen dan konfigurasi pusat', 'Koneksi lebih cepat antar router', 'Penggunaan NAT menjadi opsional', 'C'),
(14, 'Apa fungsi dari protokol IGMP?', 'Menentukan jalur tercepat', 'Routing multicast', 'Mengatur DNS query', 'Manajemen enkripsi jaringan', 'Load balancing', 'B'),
(15, 'Apa perbedaan utama antara TCP dan SCTP?', 'SCTP hanya digunakan untuk video', 'TCP lebih cepat', 'SCTP mendukung multistreaming', 'TCP mengenkripsi data', 'SCTP hanya untuk protokol layer 7', 'C'),
(16, 'Dalam MPLS, label dimasukkan di layer apa?', 'Layer 2', 'Layer 3', 'Antara layer 2 dan 3', 'Application layer', 'Session layer', 'C'),
(17, 'Manakah bukan fitur dari protokol SNMP versi 3?', 'Enkripsi', 'Autentikasi', 'Privasi', 'Multicast routing', 'Akses berbasis pengguna', 'D'),
(18, 'Fungsi dari RSTP dibandingkan STP adalah?', 'Menghindari loop routing', 'Mempercepat konvergensi topologi', 'Menambah jumlah VLAN', 'Memblokir paket broadcast', 'Mengurangi MTU', 'B'),
(19, 'Apa ciri khas dari alamat IPv6 multicast?', 'Dimulai dengan fe80::', 'Dimulai dengan ff00::', 'Dimulai dengan ::1', 'Dimulai dengan 2001::', 'Dimulai dengan fc00::', 'B'),
(20, 'Apa keuntungan dari penggunaan NAT66 pada IPv6?', 'Menghemat IP', 'Meningkatkan keamanan koneksi peer-to-peer', 'Menghindari konfigurasi DHCP', 'Mengganti kebutuhan routing dinamis', 'Menyembunyikan identitas host', 'E');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_structure_and_algorithm`
--

CREATE TABLE `data_structure_and_algorithm` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `e` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_structure_and_algorithm`
--

INSERT INTO `data_structure_and_algorithm` (`id`, `question`, `a`, `b`, `c`, `d`, `e`, `correct_answer`) VALUES
(1, 'Struktur data mana yang paling efisien untuk menerapkan antrian?', 'Array', 'Stack', 'Linked List', 'Tree', 'Graph', 'c'),
(2, 'Algoritma mana yang menggunakan pendekatan divide and conquer?', 'Bubble Sort', 'Selection Sort', 'Quick Sort', 'Insertion Sort', 'Linear Search', 'c'),
(3, 'Apa output dari traversal inorder pada binary search tree?', 'Root, Left, Right', 'Left, Root, Right', 'Right, Root, Left', 'Left, Right, Root', 'Right, Left, Root', 'b'),
(4, 'Struktur data mana yang cocok untuk menerapkan prinsip LIFO?', 'Queue', 'Linked List', 'Array', 'Stack', 'Heap', 'd'),
(5, 'Apa waktu rata-rata pencarian dalam struktur data Hash Table?', 'O(1)', 'O(n)', 'O(log n)', 'O(n log n)', 'O(n²)', 'a'),
(6, 'Manakah algoritma pencarian yang membutuhkan data dalam keadaan terurut?', 'Linear Search', 'Jump Search', 'Depth First Search', 'Breadth First Search', 'Hashing', 'b'),
(7, 'Apa fungsi dari pointer tail dalam struktur data queue?', 'Menunjukkan elemen pertama', 'Menunjukkan elemen terakhir', 'Menunjukkan elemen tengah', 'Menunjukkan node berikutnya', 'Menunjukkan node sebelumnya', 'b'),
(8, 'Bagian mana dari algoritma Dijkstra yang digunakan untuk melacak jarak terpendek?', 'Stack', 'Queue', 'Priority Queue', 'Heap', 'Array', 'c'),
(9, 'Apa karakteristik utama dari binary search tree?', 'Setiap node memiliki maksimal 3 anak', 'Node kiri selalu lebih besar', 'Node kanan selalu lebih kecil', 'Node kiri lebih kecil, kanan lebih besar', 'Node tidak memiliki urutan', 'd'),
(10, 'Manakah algoritma pengurutan berikut ini yang stabil?', 'Heap Sort', 'Quick Sort', 'Merge Sort', 'Selection Sort', 'Shell Sort', 'c'),
(11, 'Apa yang dimaksud dengan kompleksitas waktu algoritma?', 'Jumlah memori yang digunakan', 'Jumlah data yang diolah', 'Lama waktu komputasi', 'Jumlah proses yang digunakan', 'Jumlah file input', 'c'),
(12, 'Manakah metode traversal pada pohon biner yang mengikuti urutan Preorder?', 'Left, Right, Root', 'Root, Left, Right', 'Left, Root, Right', 'Right, Left, Root', 'Root, Right, Left', 'b'),
(13, 'Apa yang dimaksud dengan linked list circular?', 'Node terakhir menunjuk ke NULL', 'Semua node terhubung dua arah', 'Node pertama menunjuk ke node terakhir', 'Node terakhir menunjuk ke node pertama', 'Node saling menunjuk acak', 'd'),
(14, 'Struktur data mana yang paling cocok untuk menyimpan ekspresi matematika?', 'Stack', 'Queue', 'Array', 'Tree', 'Hash Table', 'a'),
(15, 'Pada algoritma bubble sort, berapa kali maksimum swap terjadi dalam array berisi n elemen?', 'n', 'n-1', 'n²', 'n log n', 'log n', 'c'),
(16, 'Apa keuntungan utama dari menggunakan AVL Tree dibandingkan Binary Search Tree biasa?', 'Penggunaan memori lebih kecil', 'Traversal lebih cepat', 'Lebih mudah diimplementasikan', 'Selalu seimbang', 'Mendukung multiple children', 'd'),
(17, 'Manakah dari berikut ini merupakan contoh penggunaan DFS?', 'Menemukan jalur terpendek', 'Mencari elemen minimum', 'Traversal graf secara mendalam', 'Mengurutkan data', 'Menghitung elemen array', 'c'),
(18, 'Struktur data mana yang digunakan dalam implementasi rekursi secara internal?', 'Queue', 'Array', 'Linked List', 'Stack', 'Heap', 'd'),
(19, 'Apa fungsi utama dari Heap dalam algoritma Heapsort?', 'Menyimpan hasil sorting', 'Mencari elemen minimum', 'Mempertahankan struktur urutan', 'Mengakses data secara acak', 'Membantu menyusun data terurut', 'e'),
(20, 'Apa perbedaan utama antara stack dan queue?', 'Stack FIFO, Queue LIFO', 'Stack dan Queue sama', 'Stack LIFO, Queue FIFO', 'Stack untuk data besar, Queue untuk kecil', 'Stack menggunakan pointer, Queue tidak', 'c');

-- --------------------------------------------------------

--
-- Struktur dari tabel `introduction_to_computer_science`
--

CREATE TABLE `introduction_to_computer_science` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `e` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `introduction_to_computer_science`
--

INSERT INTO `introduction_to_computer_science` (`id`, `question`, `a`, `b`, `c`, `d`, `e`, `correct_answer`) VALUES
(1, 'Apa fungsi utama CPU dalam sistem komputer?', 'Menyimpan data sementara', 'Menampilkan hasil output', 'Melakukan pemrosesan data', 'Menyediakan koneksi internet', 'Mengelola daya listrik', 'C'),
(2, 'Komponen apa yang bertugas menyimpan data secara permanen?', 'RAM', 'ROM', 'Cache', 'Hard disk', 'Register', 'D'),
(3, 'Bahasa pemrograman tingkat tinggi biasanya memiliki ciri:', 'Dekat dengan bahasa mesin', 'Sulit dipahami manusia', 'Bersifat platform dependent', 'Mirip bahasa manusia', 'Langsung dieksekusi CPU', 'D'),
(4, 'Apa yang dimaksud dengan algoritma dalam konteks komputer?', 'Kode rahasia', 'Susunan perangkat keras', 'Prosedur penyelesaian masalah', 'Bahasa pemrograman', 'Driver sistem operasi', 'C'),
(5, 'Sistem bilangan yang digunakan komputer untuk merepresentasikan data secara dasar adalah:', 'Desimal', 'Heksadesimal', 'Oktal', 'Biner', 'Roman', 'D'),
(6, 'Perangkat lunak sistem berfungsi untuk:', 'Menjalankan game', 'Mengedit video', 'Mengatur kerja perangkat keras', 'Membuat presentasi', 'Mengakses situs web', 'C'),
(7, 'Manakah dari berikut ini yang termasuk perangkat input?', 'Monitor', 'Printer', 'Speaker', 'Keyboard', 'Projector', 'D'),
(8, 'Yang dimaksud dengan cloud computing adalah:', 'Komputasi berbasis awan', 'Pemrograman dengan bahasa cloud', 'Pemrosesan offline', 'Pengolahan data manual', 'Sistem operasi khusus awan', 'A'),
(9, 'Perangkat lunak aplikasi digunakan untuk:', 'Meningkatkan kecepatan RAM', 'Menjalankan sistem operasi', 'Memfasilitasi tugas pengguna', 'Menghubungkan CPU dan GPU', 'Mengatur BIOS', 'C'),
(10, 'Jenis memori komputer yang cepat tapi bersifat sementara adalah:', 'Hard Disk', 'SSD', 'RAM', 'DVD', 'Flashdisk', 'C'),
(11, 'Apa itu compiler dalam pemrograman?', 'Program untuk menulis kode', 'Program untuk mendeteksi virus', 'Program yang menerjemahkan kode ke bahasa mesin', 'Program untuk backup data', 'Program komunikasi jaringan', 'C'),
(12, 'GUI dalam komputer mengacu pada:', 'Text-based interface', 'Coding-only display', 'Graphical User Interface', 'Game Utility Integration', 'General Use Interface', 'C'),
(13, 'Apa yang terjadi dalam proses booting?', 'Komputer dimatikan', 'Data dihapus', 'Sistem operasi dimuat', 'Aplikasi dijalankan', 'Jaringan dihubungkan', 'C'),
(14, 'Manakah yang merupakan sistem operasi?', 'Chrome', 'Windows', 'Oracle', 'Python', 'Excel', 'B'),
(15, 'Manakah yang bukan termasuk bahasa pemrograman?', 'Python', 'Java', 'HTML', 'C++', 'Linux', 'E'),
(16, 'Istilah debugging merujuk pada:', 'Menambahkan fitur baru', 'Menjalankan program', 'Mencari dan memperbaiki kesalahan', 'Menghapus data', 'Mempercepat CPU', 'C'),
(17, 'LAN adalah jenis jaringan dengan jangkauan:', 'Seluruh dunia', 'Satu kota', 'Antar negara', 'Area lokal', 'Antar benua', 'D'),
(18, 'Fungsi dari router dalam jaringan komputer adalah:', 'Mengedit dokumen', 'Menghubungkan perangkat ke internet', 'Menyimpan file', 'Menampilkan grafik', 'Mempercepat booting', 'B'),
(19, 'Apa itu firewall dalam konteks keamanan komputer?', 'Alat pemadam kebakaran', 'Perangkat keras printer', 'Proteksi jaringan dari akses tidak sah', 'Program desain grafis', 'Driver sistem', 'C'),
(20, 'Enkripsi digunakan untuk:', 'Memperbesar file', 'Mempercepat akses memori', 'Mengamankan data', 'Mendeteksi virus', 'Membuka aplikasi', 'C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `operating_system`
--

CREATE TABLE `operating_system` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `e` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `operating_system`
--

INSERT INTO `operating_system` (`id`, `question`, `a`, `b`, `c`, `d`, `e`, `correct_answer`) VALUES
(1, 'Apa fungsi utama dari kernel dalam sistem operasi?', 'Mengelola perangkat keras', 'Mengatur memori sekunder', 'Menyediakan antarmuka GUI', 'Mengeksekusi aplikasi', 'Mengatur printer', 'A'),
(2, 'Manakah dari berikut ini yang bukan bagian dari manajemen memori?', 'Swapping', 'Paging', 'Segmentation', 'Spooling', 'Virtual memory', 'D'),
(3, 'Dalam konsep deadlock, kondisi apa yang tidak diperlukan?', 'Mutual exclusion', 'Circular wait', 'Preemption', 'Hold and wait', 'No preemption', 'C'),
(4, 'Apa yang dimaksud dengan preemptive scheduling?', 'Proses tidak dapat diambil alih hingga selesai', 'Proses dapat dihentikan sementara untuk menjalankan proses lain', 'CPU hanya dijalankan satu proses saja', 'CPU berpindah antar proses setiap jam', 'Tidak ada proses yang saling preempt', 'B'),
(5, 'Algoritma penjadwalan apa yang paling adil di antara proses dengan prioritas berbeda?', 'Round Robin', 'First-Come First-Served', 'Priority Scheduling', 'Shortest Job First', 'Multi-level Queue', 'A'),
(6, 'Salah satu keuntungan utama dari virtual memory adalah?', 'Mengurangi ukuran program', 'Memungkinkan ukuran program lebih besar dari memori fisik', 'Mempercepat eksekusi program', 'Menghilangkan kebutuhan perangkat keras', 'Memperkuat proteksi jaringan', 'B'),
(7, 'Manakah dari berikut ini yang bukan metode alokasi memori?', 'Continuous Allocation', 'Linked Allocation', 'Indexed Allocation', 'Dynamic Allocation', 'Paging', 'D'),
(8, 'Sistem file dengan struktur direktori pohon digunakan untuk?', 'Menyimpan data dalam blok tetap', 'Mengorganisasi file secara hierarki', 'Menghapus file duplikat otomatis', 'Enkripsi file secara default', 'Menulis file dalam format biner', 'B'),
(9, 'Pada sistem multiprogramming, tujuan utama adalah?', 'Mempercepat CPU', 'Meningkatkan pemanfaatan CPU', 'Memperkecil ukuran program', 'Meningkatkan ukuran memori', 'Mengurangi I/O', 'B'),
(10, 'Bagaimana sistem operasi menangani interrupt?', 'Dengan polling secara terus-menerus', 'Dengan menjalankan rutin interrupt handler', 'Dengan menghentikan CPU', 'Dengan mengabaikan interrupt', 'Dengan menghapus proses', 'B'),
(11, 'Apa tujuan utama dari sistem operasi real-time?', 'Memastikan efisiensi memori', 'Memberikan respon tepat waktu', 'Mengurangi pemakaian disk', 'Memaksimalkan throughput', 'Meningkatkan kapasitas jaringan', 'B'),
(12, 'Manakah algoritma yang digunakan untuk mengganti halaman pada virtual memory?', 'FIFO', 'LRU', 'Optimal', 'All of the above', 'None of the above', 'D'),
(13, 'Bagaimana sistem operasi mendeteksi deadlock?', 'Dengan resource allocation graph', 'Dengan paging table', 'Dengan scheduling queue', 'Dengan file table', 'Dengan I/O buffer', 'A'),
(14, 'Apa yang dimaksud dengan starvation dalam penjadwalan proses?', 'Proses terus menunggu tanpa pernah dijalankan', 'Proses berjalan tanpa batas', 'CPU bekerja terlalu cepat', 'Memori terlalu kecil', 'Proses sering mengalami preemption', 'A'),
(15, 'Apa kelebihan utama dari microkernel dibanding monolithic kernel?', 'Lebih besar dan lebih cepat', 'Lebih kecil dan modular', 'Mendukung lebih sedikit perangkat keras', 'Tidak mendukung multitasking', 'Membutuhkan lebih banyak driver', 'B'),
(16, 'Dalam sistem distribusi file, mekanisme locking digunakan untuk?', 'Menyembunyikan file', 'Menghindari konflik akses bersamaan', 'Mempercepat transfer file', 'Mengurangi ukuran file', 'Menghapus file ganda', 'B'),
(17, 'Pada sistem operasi UNIX, fork() berfungsi untuk?', 'Menghapus proses', 'Membuat salinan proses', 'Mengakhiri proses', 'Mengunci proses', 'Mengubah prioritas proses', 'B'),
(18, 'Kapan terjadi thrashing pada sistem virtual memory?', 'Saat banyak halaman di-cache', 'Saat halaman sering berpindah masuk keluar memori', 'Saat tidak ada page fault', 'Saat semua proses berjalan lancar', 'Saat CPU idle', 'B'),
(19, 'Konsep protection domain digunakan untuk?', 'Mengatur akses sumber daya oleh proses', 'Mempercepat eksekusi program', 'Memperbesar virtual memory', 'Mengurangi ukuran file', 'Meningkatkan bandwidth', 'A'),
(20, 'Apa tujuan utama mekanisme context switching?', 'Mengganti memori fisik', 'Berpindah dari satu proses ke proses lain', 'Menghapus proses yang lambat', 'Mengunci CPU pada satu proses', 'Menghapus deadlock', 'B');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `calculus`
--
ALTER TABLE `calculus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `computer_network`
--
ALTER TABLE `computer_network`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_structure_and_algorithm`
--
ALTER TABLE `data_structure_and_algorithm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `introduction_to_computer_science`
--
ALTER TABLE `introduction_to_computer_science`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `operating_system`
--
ALTER TABLE `operating_system`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `calculus`
--
ALTER TABLE `calculus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `computer_network`
--
ALTER TABLE `computer_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `data_structure_and_algorithm`
--
ALTER TABLE `data_structure_and_algorithm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `introduction_to_computer_science`
--
ALTER TABLE `introduction_to_computer_science`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `operating_system`
--
ALTER TABLE `operating_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
