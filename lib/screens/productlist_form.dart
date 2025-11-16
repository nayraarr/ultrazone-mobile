import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultrazone/widgets/left_drawer.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ultrazone/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {

  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _desc = "";
  String _thumbnail = "";
  String _category = "jersey"; // default
  bool _isDiscount = false; // default
  String _brand = "";
  double _rating = 0.0;

  final List<String> _categories = [
    'jersey',
    'footwear',
    'scarf',
    'jacket',
    'hat',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Product Form',
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                // === Name ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name= value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama produk tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                  // === Price ===
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: "Harga Produk",
                      labelText: "Harga",
                      prefixText: "Rp ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.tryParse(value ?? "0") ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null || int.tryParse(value)! <= 0) {
                        return "Masukkan harga yang valid!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Deskripsi Produk",
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _desc = value ?? "";
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail (opsional)",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value ?? "";
                      });
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: _category,
                    decoration: InputDecoration(
                      labelText: "Kategori",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat[0].toUpperCase() + cat.substring(1)),
                    ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Pilih kategori produk!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Brand ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Brand Produk",
                      labelText: "Brand",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _brand = value ?? "";
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Merek tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Rating ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rating Produk",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Slider(
                              value: _rating,
                              min: 0.0,
                              max: 5.0,
                              divisions: 10,
                              label: _rating.toStringAsFixed(1),
                              activeColor: Theme.of(context).colorScheme.primary,
                              onChanged: (double value) {
                                setState(() {
                                  _rating = value;
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${_rating.toStringAsFixed(1)} / 5.0",
                                style: const TextStyle(fontSize: 14, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // === Is Discount ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Tandai sebagai Produk Diskon"),
                    value: _isDiscount,
                    onChanged: (bool value) {
                      setState(() {
                        _isDiscount = value;
                      });
                    },
                  ),
                ),

                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () async {
                        // Bagian 1: Validasi form sebelum submit
                        // Mengecek apakah semua field yang required sudah terisi dengan benar
                        if (_formKey.currentState!.validate()) {

                          // Bagian 2: Kirim HTTP POST request ke Django backend
                          // menggunakan postJson dari pbp_django_auth
                          // request adalah instance dari CookieRequest yang sudah di-provide
                          final response = await request.postJson(
                            // URL endpoint Django untuk create product
                            // Ganti [YOUR_APP_URL] dengan URL backend Anda
                            // Contoh: "http://localhost:8000/create-product-flutter/"
                            "http://localhost:8000/create-product-flutter/",

                            // Line 6-14: Convert data form ke JSON format
                            // jsonEncode() mengubah Map menjadi string JSON
                            jsonEncode({
                              "name": _name,                    // Nama produk dari TextField
                              "price": _price,       // Harga dikonversi dari String ke int
                              "description": _desc,       // Deskripsi produk
                              "thumbnail": _thumbnail,           // URL gambar produk
                              "rating": _rating,   // Rating dikonversi dari String ke double
                              "category": _category,             // Kategori produk
                              "is_discount": _isDiscount,        // Boolean untuk status diskon
                              "brand": _brand,                   // Brand/merk produk
                            }),
                          );

                          // Bagian 3: Check apakah widget masih mounted (masih dalam widget tree)
                          // Penting untuk menghindari error "setState on disposed widget"
                          if (context.mounted) {

                            // Bagian 4: Handle response sukses dari server
                            if (response['status'] == 'success') {
                              // Tampilkan snackbar sukses di bagian bawah layar
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Product successfully saved!"),
                                backgroundColor: Colors.green,  // Tambahkan warna hijau untuk sukses
                              ));

                              // Navigate kembali ke halaman home setelah berhasil save
                              // pushReplacement mengganti halaman saat ini, bukan push biasa
                              // sehingga user tidak bisa back ke form lagi
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            }
                            // Handle response error dari server
                            else {
                              // Tampilkan snackbar error jika ada masalah
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Something went wrong, please try again."),
                                backgroundColor: Colors.red,  // Tambahkan warna merah untuk error
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ],
            )
        ),
      ),
    );
  }
}