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

<details>
<summary>Tugas Individu 8</summary>

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
>Kedua hal ini terletak pada penyusunan stack navigasi oleh flutter. Dengan Navigator.push(), flutter menambahkan layar baru ke atas navigasi sehingga layar sebelumnya masih ada di
dalam stack. Hal ini memungkinkan pengguna untuk kembali ke halaman sebelumnya. Fitur seperti ini cocok dalam kasus ketika pengguna sedang melihat detail sebuah produk. Ketika 
pengguna kembali ke halaman sebelumnya, pengguna akan melihat daftar produk yang dijual. Sedangkan, Navigator.pushReplacement() berarti mengganti halaman yang aktif saat ini dengan 
halaman baru sehingga halaman sebelumnya tidak akan ada lagi di stack. Hal ini mebuat pengguna tidak dapat kembali ke halaman sebelumnya. Fitur ini cocok untuk kasus ketika pengguna 
selesai login. Setelah pengguna masuk, pengguna tidak perlu kembali lagi ke halaman form login.

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
>Saya memanfaatkan hierarcy widget sebagai struktur utama setiap halaman aplikasi. Scaffold digunakan dalam kedua screen/halaman saya, yaitu di MyHomePage dan ProductFormPage. Setiap 
scaffold, saya konfigurasikan appBar sebagai judul halaman yang seragam dimana warna background dan teks nya itu konsisten yaitu merah dan putih. Judulnya berada di tengah halaman dan
tersambung dengan Drawer. Selain itum saya juga mengonfigurasikan drawernya dengan menyisipkan LeftDrawer() di setiap halaman. LeftDrawer() ini dibuat sebagai widget terpisah dan memiliki
navigasi yang sama (Home dan Tambah Produk). Tidak lupa saya juga mengonfigurasikan body pada scaffold untuk menampung isi dari halamannya masing-masing. Dengan ini, setiap halaman memiliki
layout yang mirip dan pengguna akan familiar.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh 
### penggunaannya dari aplikasi kamu.
>Ketiga hal ini membuat tata letak, responsif, dan user experience pengguna menjadi lebih baik. Pada padding, flutter akan memberikan ruang dan jarak yang konsisten satu sama lain nya. Kelebihannya
membuat tampilan lebih rapih, konsistensi designnya baik antar elemen, mencegah elemen menempel pada tepi layar. Contoh penerapannya ada pada 'ProductFormPage', dimana setiap form field nya akan 
dibungkus oleh padding di semua sisinya sehingga form terlihat rapih dan seragam. Pada SingleChildScrollView, flutter akan mengatasi overflow pada layar yang kecil. Kelebihannya cocok untuk form 
yang panjang dengan banyak field, mencegah error Bottom overflowed, serta memungkinkan user menggulir halaman secara vertikal ketika isi nya melebihi tinggi layar. Contoh penerapannya ada pada
'ProductFormPage' dimana ketika form memiliki banyak elemen input nantinya seluruh field tetap bisa diakses walaupun layar kecil (dengan scrolling). Adapun, ListView berupa widget untuk menampilkan
daftar elemen baik secara vertikal maupun horizontal. Kelebihannya adalah cocok daftar yang panjang, lazy loading, dan otomatis menggulir. Contohnya adalah LeftDrawer yang menggunakan Listview untuk 
navigasi.

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
>Saya menyesuaikan dengan menerapkan warna utama/primary nya adalah 'Colors.red'. Hal ini diterapkan pada setiap tombol, ikon aktif, dan header dari halaman. Selain itu, teks nya juga juga diseragamakan
berwarna putih pada setiap appBar, card menym dan drawer headernya juga. Selain itu, 'Theme.of(context).colorScheme.primary' juga digunakan pada halaman utama untuk memastikan gaya nya mengikuti tema 
utama aplikasi walaupun 'Colors.red' dibuat lebih dominan. Lalu, card menu nya juga menggunakan warna berbeda per item nya. Tetapi, style nya masih konsisten dengan background putih dan text berwarna putih
juga. Setiap halaman dan elemen dibuat dengan tema warna merah yang menggambarkan brand 'Ultrazone' itu sendiri yang membuat pengguna merasakan pengalaman visual energik dan mudah dikenali.

</details>