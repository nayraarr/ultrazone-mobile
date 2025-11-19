import 'package:flutter/material.dart';
import 'package:ultrazone/models/products_entry.dart';
import 'package:ultrazone/widgets/left_drawer.dart';
import 'package:ultrazone/screens/products_detail.dart';
import 'package:ultrazone/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsListWithFilterPage extends StatefulWidget {
  final String? initialFilter; // Parameter opsional untuk filter awal

  const ProductsListWithFilterPage({
    super.key,
    this.initialFilter
  });

  @override
  State<ProductsListWithFilterPage> createState() => _ProductsListWithFilterPageState();
}

class _ProductsListWithFilterPageState extends State<ProductsListWithFilterPage> {
  List<ProductsEntry> _allProducts = [];
  String _activeFilter = 'all'; // 'all' atau 'my'
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();

    // Set initial filter jika ada
    if (widget.initialFilter != null) {
      _activeFilter = widget.initialFilter!;
    }

    _fetchProducts();
  }

  // Fetch semua produk sekali saja
  Future<void> _fetchProducts() async {
    final request = context.read<CookieRequest>();

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await request.get('http://localhost:8000/json/');

      List<ProductsEntry> products = [];
      for (var d in response) {
        if (d != null) {
          products.add(ProductsEntry.fromJson(d));
        }
      }

      if (mounted) {
        setState(() {
          _allProducts = products;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to load products: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  // Filter produk berdasarkan activeFilter
  List<ProductsEntry> _getFilteredProducts() {
    if (_activeFilter == 'all') {
      return _allProducts;
    } else {
      // Filter hanya produk milik user yang sedang login
      // Asumsi: ProductsEntry punya field userId
      final request = context.read<CookieRequest>();
      // Dapatkan user ID dari cookie/session jika ada
      // Atau bisa pass dari login page
      return _allProducts.where((product) {
        // Sesuaikan dengan cara Anda menyimpan user info
        return product.userId != null; // Ganti dengan logic yang sesuai
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Filter Buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                // All Products Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _activeFilter = 'all';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _activeFilter == 'all'
                          ? Colors.red
                          : Colors.white,
                      foregroundColor: _activeFilter == 'all'
                          ? Colors.white
                          : Colors.grey.shade700,
                      side: BorderSide(
                        color: _activeFilter == 'all'
                            ? Colors.red
                            : Colors.grey.shade300,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'All Products',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // My Products Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _activeFilter = 'my';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _activeFilter == 'my'
                          ? Colors.red
                          : Colors.white,
                      foregroundColor: _activeFilter == 'my'
                          ? Colors.white
                          : Colors.grey.shade700,
                      side: BorderSide(
                        color: _activeFilter == 'my'
                            ? Colors.red
                            : Colors.grey.shade300,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'My Products',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Refresh Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _fetchProducts,
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: _buildContent(filteredProducts),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(List<ProductsEntry> products) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.red),
            SizedBox(height: 16),
            Text('Loading products...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              _activeFilter == 'all'
                  ? 'No products available yet.'
                  : 'You haven\'t created any products yet.',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            if (_activeFilter == 'my')
              const Text(
                'Tap "Create Product" to add your first product!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchProducts,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ProductsEntryCard(
          product: products[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  product: products[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}