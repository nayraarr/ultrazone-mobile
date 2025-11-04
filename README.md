Nama : Zita Nayra Ardini
NPM : 2406404913
Kelas : PBP - F

# Ultrazone

<details>
<summary>Tugas Individu 7</summary>

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
> Widget tree adalah representasi logis dari seluruh tampilan yang ada. Tree ini menggambarkan susunan widget yang membentuk keseluruhan struktur halaman.
Tree ini digunakan flutter untuk mendeskripsikan layout dari sebuah widget dan dipakai saat me-render ke halaman, serta saat hit testing. Widget digambarkan
sebagai node di dalam tree tersebut. Setiap node bisa memiliki sebuah state. Setiap node juga nantinya dapat tersusun secara bersarang/nested yang membentuk 
hubungan parent-child dengan satu sama lain. Setiap node (widget) parent memiliki satu atau lebih child widget child penyusunnya. Widget parent akan menentukan
bagaimana tampilan layout ataupun batasan untuk widget childnya. Data atau properti juga umumnya diteruskan dari widget parent ke childnya untuk dipakai. Jika
child perlu mengirimkan data ke parentnya, nanti fungsi callback akan digunakan.

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
> Widget yang saya gunakan disini ada banyak. Widget yang berguna untuk membuat struktur halaman ada Scaffold (membentuk stuktur dasar halaman), AppBar (menampilkan 
bagian atas halaman berupa bar berisi judul aplikasi), Padding (mengatur jarak di sekitar widget), Column (menyusun widget secara vertikal), Row (Menyusun widget 
secara horizontal), Center (membuat widget berada di tengah area), dan GridView (meyusun widget dalam bentuk grid). Selain itu, ada juga wodget yang berguna untuk
menampilkan isi dari halaman, yaitu Card (membentuk kotak dengan bayangan), Container (wadah yang bisa meng-kostumisasi ukuran, padding, margin, dan warna nya), Text
(menampilkan teks), Icon (menampilkan ikon dari library flutter), SizedBox (mengatur jarak dengan widget lain), Material (membuat efek material), InkWell (menambah 
efek ripple saat ditekan), dan SnackBar (menampilkan pesan di bawah layar sementara). Selain itu, ada juga widget buatan sendiri yaitu InfoCard (menampilkan info NPM
kelas, dan npm) dan ItemCard (menampilkan tombol All Product, My Product, dan Create Product).

### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
>Widget MaterialApp berperan sebagai pembungkus susunan aplikasi flutter yang menyediakan fungsionalitas inti dan berbagai konfigurasi app. MaterialApp bisa mengatur
tema aplikasi, memnentukan routing aplikasi, menetapkan widget awal, dan membungkus widget lainnya. Widget ini sering digunakan sebagai root karena menyediakan fungsionalitas
inti aplikasi yang dibutuhkan olah widget-widget childnya. Dengan pewarisan konfigurasinya, otomatis pembuatan app menjadi lebih cepat dan efisien. Selain itu, dengan 
MaterialApp akan memudahkan kita mendapatkan tampilan sesuai pedoman material design (seperti Scaffold, AppBar, dll). Dengan menjadikan MaterialApp sebagai root, titik 
pusat konfigurasi dan pengaturan global akan tersimpan secara terstruktur.

### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
>Pada stateless widget, ketika app suah merender, maka tidak akan perubahan yang terjadi pada widget tersebut. Widget tidak menimpan state/keadaan sehingga entuk widget 
akan selalu seperti itu (Immutable), ia hanya menyimpan final elemen saja. Jika ada perubahan data, maka widget perlu dibuat ulang dengan nilai terbarunya.
Pada stateful widget, tiap widgetnya akan menyimpan state object (keaadaan) yang bisa berubah-ubah. Jika ada perubahan data, widget akan diperbarui tanpa membuat ulang
widget secara keseluruhan. Ketika ada perubahan, flutter akan otomatis mengubah state dari widget dan langsung merender ulang widget tsb.

### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
>BuildContext adalah objek mendeskripsikan lokasi dari widget dalam widget tree nya. Penggunaannya menjadi penting di flutter karena kita bisa mengakses data di widget parentnya,
setiap widget membutuhkan dari mana konteks dipanggil untuk mendapat widget yang diinginkan. Selain itu, flutter juga menggunakan context untuk menentukan urutan rendering, layout,
dan UI. Dengan context nya juga, flutter mengatur ukuran layar berdasarkan widget di dalam tree.
>Pada setiap widget, fungsi build memiliki parameter BuildContext context. Nantinya, flutter memanggil build() untuk memberikan context ke widget. Context menunjukkan posisi dalam 
tree sehingga flutter bisa tau dari konteks mana pencarian widget dimulai.

### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
> Hot reload dan hot restart sebenarnya merupakan fitur development dari flutter untuk me-refresh sebuah halaman aplikasi, hanya
saja pendekatan yang dilakukannya berbeda. Hot reload adalah proses flutter untuk mengunggah/me-load perubahan kode ke Dart VM dan membangun ulang widget tree. Proses ini 
tetap mempertahankan state aplikasi pada saat ini dan berlangsung sangat cepat, hanya membutuhkan beberapa detik. Sedangkan, hot restart akan menggugah/me-load perubahan
kode ke Dart VM lalu me-restart ulang flutter app nya sekaligus membangun ulang widget tree. Proses ini tidak mempertahankan state aplikasi sehingga akan kehilangan seluruh
data atau navigasi proses yang sebelumnya sudah berlangsung. Prosesnya berlangsung lebih lambat dibanding hot reload, tetapi lebih cepat dari full app restart.

</details>