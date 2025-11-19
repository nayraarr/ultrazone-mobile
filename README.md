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

<details>
<summary>Tugas Individu 9</summary>

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
>Dengan model Dart, kita memiliki sebuah objek yang ter struktur. Saat parsing, JSON akan diubah menjadi sebuah objek yang jelas dimana tiap fieldnya memiliki tipe tertentu. Selain itu, tiap fieldnya terintegrasi 
dengan null-safety sehingga error akan terdeteksi saat compile. Dalam pemeliharaannya, IDE akan memberikan saran field yang tersedia, kita mudah mengubah struktur data di keseluruhan aplikasi, kita lebih mudah mengelola
perubahan API, serta bisa menambahkan validasi di constructor nya. Tanpa adanya model, tiap fieldnya tidak memiliki validasi sehingga bisa saja muncul data dengan tipe yang tidak diharapkan. Tidak adanya null-safety 
membuat munculnya runtime error. Selain itu, support IDE juga tidak bisa membantu kita membuat susah melakukan debugging ataupun bisa salah mengetikkan nama field (tidak ada autocomplete). Semakin besar aplikasinya, maka 
akan lebih susah di-maintain karena kodenya tidak rapih dan tidak terstruktur.

### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
>Package http merupakan sebuah library standat untuk melakukan http request di flutter. Libary ini dapat kita gunakan untuk melakukan request seferhana seperti method GET, POST, PUT, dan DELET tanpa adanya state management
(tidak menyimpan session dan cookie). Setiap request yang dilakukan bersifat independen dan tidak menyimpan cookies/session nya. Di tugas ini, kita menggunakan package http untuk mengambil keseluruhan produk dari endpoint 
django, contohnya [TODO]. Adapun CookieRequest dari package pbp_django_auth merupakan sebuah wrapper khusus untuk berkomunikasi dengan djnago. Wrapper ini berguna dalam mengelola session dan cookies secara otomatis. Nantinya,
tiap request akan otomatis mengirim cookie ke server. Wrapper ini juga menghandle CSRF token. Wrapper ini digunakan untuk proses login dan register pada aplikasi yang saya buat ini.
>Perbedaan keduanya adalah http tidak menyimpan cookie dan session django sedangkan CookieRequest menyimpan, http request digunakan API public sedangkan CookieRequest tidak, http tidak menghandle CSRF secara otomatis sedangkan
CookieRequest iya, http bersifat stateless sedangkan CookieRequest bersifat stataful.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
>Instance CookieRequest perlu dibagikan untuk menjaga konsistensi session di keseluruhan aplikasi. Dengan login cukup sekali, seharusnya aplikasi tahu bahwa user sudah login den mengupdate informasi dari user. Jika tiap komponen 
widget membuat CookieRequest baru, nanti session yang sudah dibuat akan hilang dan user akan dianggap sudah logout. Dengan satu insrtance, kita juga menghindari redudansi serta mempermudah pengaksesan nya.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan 
izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
>Konfigurasi yang diperlukan adalah menambah 10.0.2.2 pada ALLOWED_HOSTS, mengasktifkan CORS, mengatur cookie dan samsite pada djngao, dan menambah izin internet pada android. IP 10.0.2.2 adalah IP khusus Android Emulator untuk 
mengakses localhost dari komputer host. Karena android emulator berjalan di vm yang terpisah, ip tersebut akan memappingkan andorid emulator ke localhost sehingga request emulator berjalan. Kalau tidak, maka django akan memblokir 
request. CORS merupakan sebuah sistem keamanan browser yang mencegah request dari domain yang berbeda. Flutter app dan djngo API adalah dua origin berbeda. Tanpa adanya CORS, API django tidak bisa diakses oleh flutter. Pengaturan 
cookie akan mengontol kapan cookies dikirim. Samsite diatur menjadi none agar bisa mengikirim cross site. Selain itu, cookie diatur agar tidak bisa diakses js dan hanya bisa dikirim via https. Tanpa adanya pengaturan ini, cookies 
tidak akan dikirim (login gagal), session tidak tersimpan, dan pada akhirnya user harus login terus menerus. Adapaun izin internet diporbolehkan agar aplikasi andorid bisa melakukan request http. Tanpa adanya ini, semua request 
akan gagal dan aplikasi gabisa request data sama sekali. 

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
>Proses pengiriman data dimulai saat pengguna mengisi form di Flutter, seperti menambahkan produk dengan mengisi nama, harga, dan deskripsi melalui TextFormField. Input ini ditangkap oleh event handler dan disimpan dalam variabel 
state lokal. Sebelum dikirim, Flutter melakukan validasi client-side untuk memastikan data memenuhi kriteria seperti field tidak kosong atau format sudah benar.
>
>Setelah validasi berhasil, data dikemas dalam format JSON dan dikirim ke Django menggunakan CookieRequest melalui method postJson(). Request HTTP ini membawa header Content-Type dan cookies session yang otomatis ditambahkan oleh 
CookieRequest, memungkinkan Django mengidentifikasi user yang melakukan request.
>Di server Django, request diterima oleh view sesuai routing URL, kemudian body JSON di-parse menjadi dictionary Python. Django melakukan validasi server-side yang lebih ketat karena validasi client-side bisa di-bypass. Setelah 
valid, data diproses sesuai logika bisnis—dalam kasus produk, Django membuat instance model Product baru dan menyimpannya ke database menggunakan ORM.
>
>Django membuat response JSON berisi status operasi, message, dan data relevan seperti ID produk baru, lalu mengirimnya kembali ke Flutter dengan status code yang sesuai. Di Flutter, response otomatis di-decode menjadi Map. Jika 
operasi berhasil dan perlu menampilkan data, Flutter melakukan request GET untuk mengambil data terbaru dari server.
>
>Data JSON yang diterima di-parse menjadi list of model objects menggunakan factory constructor fromJson(), mengkonversi raw JSON menjadi strongly-typed objects. Flutter kemudian memperbarui state aplikasi dengan setState(), 
men-trigger rebuild widget tree untuk menampilkan data terbaru. UI merender data menggunakan widget seperti ListView.builder yang efisien membuat tampilan untuk setiap item, menampilkan informasi produk dalam format visual responsif
dengan loading indicator sebagai feedback selama proses berlangsung.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
>Registrasi dimulai saat pengguna baru mengisi form dengan username, password, dan confirm password di Flutter. Setelah validasi awal memastikan kedua password cocok, data dikirim via CookieRequest ke endpoint /auth/register/ Django. 
Django memvalidasi apakah password cocok, username belum digunakan, dan password cukup kuat. Jika valid, Django membuat user baru dengan User.objects.create_user(). Response success dikirim ke Flutter yang kemudian navigasi ke halaman login.
>
>Login dimulai saat user mengisi credentials yang dikirim menggunakan request.login() ke endpoint /auth/login/ Django. Django menggunakan authenticate() untuk memverifikasi credentials dengan membandingkan hash password. Jika valid 
dan user active, Django memanggil login() yang membuat session baru di database dan menggenerate session ID unik. Session ID ini dikirim ke Flutter melalui Set-Cookie header dalam response JSON yang juga berisi status success dan username.
CookieRequest secara otomatis menangkap dan menyimpan sessionid cookie, mengubah flag loggedIn menjadi true, dan menyimpan informasi user dalam state. Flutter kemudian navigasi ke homepage menggunakan Navigator.pushReplacement(). Setiap 
request berikutnya otomatis membawa cookies ini di header, memungkinkan Django mengidentifikasi user melalui session lookup tanpa perlu login ulang. Session tetap aktif selama periode tertentu dan diperpanjang otomatis dengan aktivitas.
>
>Logout terjadi saat user menekan tombol logout, memicu request.logout() yang mengirim POST ke endpoint /auth/logout/ Django. Django memanggil logout() yang menghapus session dari database. Response menginstruksikan penghapusan cookies, 
dan CookieRequest clear semua cookies serta mengubah flag loggedIn menjadi false. Flutter me-reset state aplikasi dan navigasi ke halaman login menggunakan Navigator.pushAndRemoveUntil() yang menghapus semua halaman sebelumnya dari navigation 
stack. 

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
>1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
>   Dilakukan dengan menjalankan menjalankan command `python manage.py runserver` pada root project django. Setelah itu, pada website bisa diakses pada halaman http://127.0.0.1:8000/login/ yang mana langsung 
>   ke-redirect ke halaman login.
>   DOKUMENTASI : https://drive.google.com/file/d/1dvIZ2KNswuv63MlskPNmR5ugLEe4HHOd/view?usp=sharing
>
>2,3,4. Mengimplementasikan fitur registrasi dan login akun pada proyek tugas Flutter. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
>   Awalnya saya membuat django-app baru bernama authentication pada project django saya. Setelah itu, saya menambahkan 'authentication' ke installed apps pada settings.py nya. Lalu, saya juga menginstall
>   library django-cors-headers pada project django, tidak lupa menambahkan ke requirements.txt nya juga. Selain itu saya menambahkan moddlewarenya juga dan beberapa variabel untuk corsheader ke settingsnya.
>   Untuk mengintrgasikan ke emulator android, saya juga menambahan "10.0.2.2" ke ALLOWED_HOST pada settings.py nya.
>   
>   Untuk mengintegrasikannya dengan flutter, saya mengunduh package provider dan pbp_django_auth pada direktori projek. Lalu, saya juga memodifikasi root widget agar menyediakan CookieRequest library ke 
>   seluruh child widget menggunakan provider. Hal ini membuat provider akan membagian instance cookie request dengan semua komponen aplikasi. 
> 
>   Untuk proses login, saya membuat method login pada authentication/views.py dan menambahkan endpointnya ke url nya. Setelah itu, urls.py pada authentication tidak lupa ditambahkan ke urls.py direktori projek.
>   Setelah itu, saya membuat berkas login.dart di direktori lib/screens untuk menampilkan halaman login. Pada main.dart, saya mengubah home: MyHomePage () menjadi home: const LoginPage(). 
>   
>   Untuk proses register, saya menambahkan method register pada authentication/views.py projek django saya. Saya juga menambahkan endpoint pada urls.py nya. Di projek flutter lib/screens, saya juga menambahkan
>   berkas register.dart untuk menampilkan halaman register. 
>
>   Setelah membuat register, saya mengubah login.dart dengan mengimpor register.dart dan fungsi onTap nya saya arahkan ke halaman RegisterPage. 
> 
>   Di file main.dart, saya membungkus seluruh aplikasi dengan Provider yang menyediakan instance CookieRequest(). Karena CookieRequest adalah objek yang menyimpan state autentikasi dan cookie session dari Django,
>   nantinya setiap widget di aplikasi Anda bisa mengakses CookieRequest yang sama menggunakan context.watch<CookieRequest>() atau context.read<CookieRequest>() yang mana session login akan konsisten di seluruh aplikasi
>   Saya juga mengatur home: const LoginPage() yang berarti aplikasi akan selalu dimulai dari halaman login.
>   Ketika user login, Django akan mengembalikan session cookie yang disimpan oleh CookieRequest. Cookie ini akan otomatis dikirim pada setiap request berikutnya (seperti request.get(), request.post(), dll). Django akan
>   mengenali cookie ini dan tahu bahwa request datang dari user yang sudah login, sehingga bisa memberikan data yang sesuai dengan user tersebut.
>
>5. Membuat model kustom sesuai dengan proyek aplikasi Django.
>   Awalnya saya mengambil data json product footbal dari endpoint http://localhost:8000/json/. Setelah itu, data tesebut saya paste di siturs web Quicktype dan mengubahnya menjadi ProductsEntry. source type 
>   menjadi JSON, dan language nya menjadi Dart. Setelah itu, kode dari modelsnya saya salin lalu saya taruh pada lib/models/products_entry.dart.
>   
>6, 7. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item 
> pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya).
>   Di file products_entry_list.dart, saya membuat function fetchProducts() yang menggunakan request.get('http://localhost:8000/json/') untuk mengambil data dari Django. Function ini akan mengembalikan Future<List<ProductsEntry>>,
    yang berarti operasi asynchronous yang akan menghasilkan list produk. Data JSON yang diterima dari Django kemudian di-loop dan setiap item dikonversi menjadi object ProductsEntry menggunakan method ProductsEntry.fromJson(d).
    Hasilnya adalah list berisi semua produk yang siap ditampilkan. Untuk menampilkan data, saya menggunakan FutureBuilder widget untuk operasi asynchronous. FutureBuilder akan otomatis menangani tiga state: loading
    (menampilkan CircularProgressIndicator), empty (menampilkan pesan "no products"), dan success (menampilkan list produk).Setiap produk ditampilkan menggunakan widget ProductsEntryCard yang saya buat di file terpisah.
    Card ini menampilkan semua field seperti: name, price, description, thumbnail, category, brand, rating, dan isDiscount (discount badge). 
> 
>8. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
>Tampilkan seluruh atribut pada model item kamu pada halaman ini. Tambahkan tombol untuk kembali ke halaman daftar item.
>   Halaman products_detail.dart menerima parameter ProductsEntry product dari halaman list, jadi semua data produk sudah tersedia tanpa perlu fetch lagi. Tampilan detail akan menampilkan thumbnail besar (300px tinggi) di bagian
    atas dengan full width, discount badge (jika produk diskon) di pojok kiri atas, product name dengan font size 24 dan bold, Brand dan Category dalam bentuk badge berwarna, Rating dengan icon bintang dan angka, Price dalam format
    rupiah yang besar dan hijau untuk menarik perhatian, Description dengan text align justify. Selain itu, saya tambahkan tombol "Add to Cart" yang menampilkan SnackBar sebagai feedback ke user.
>
>9. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
>   Saya membuat halaman dengan dua tombol filter: "All Products" dan "My Products". Ketika user menekan salah satu tombol, variable _activeFilter berubah nilainya menjadi 'all' atau 'my', kemudian UI akan di-rebuild untuk menampilkan 
>   produk yang sesuai. Saat halaman pertama kali dibuka (initState()), akan dicek apakah ada initialFilter yang dikirim dari halaman sebelumnya. Jika ada, _activeFilter diset sesuai parameter tersebut. Method _fetchProducts() dipanggil 
>   untuk mengambil data dari Django. Method _fetchProducts() akan mengambil SEMUA produk dari endpoint /json/ dan menyimpannya di variable _allProducts. Setelah itu, method _getFilteredProducts() akan mengembalikan produk sesuai dengan
>   user yang login saat ini.

</details>
