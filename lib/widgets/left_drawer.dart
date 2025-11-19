import 'package:flutter/material.dart';
import 'package:ultrazone/screens/menu.dart';
import 'package:ultrazone/screens/productlist_form.dart';
import 'package:ultrazone/screens/products_entry_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ultrazone/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                Text(
                  'Ultrazone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Authentic kits, fanwearn and football essentials dor every supporter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Products List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductsEntryListPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final request = context.read<CookieRequest>();
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");

                  String message = response["message"];
              if (context.mounted) {
              if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("$message See you again, $uname."),
              ));
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              );
              } else {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              content: Text(message),
              ),
              );
              }
              }
            },
          ),
        ],
      ),
    );
  }
}