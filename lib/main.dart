import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShiftKomputer',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: HomePage(onThemeChanged: _toggleTheme),
    );
  }
}

class AppColors {
  static const Color primaryBlue = Color(0xFF0D47A1);
  static const Color lightBlueAccent = Color(0xFFE3F2FD);
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  void _navToProductList(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListPage(categoryName: categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color headerFooterColor = isDarkMode
        ? const Color(0xFF1E1E1E)
        : AppColors.primaryBlue;
    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF1F2937);
    final Color cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final Color borderColor = isDarkMode
        ? Colors.grey[700]!
        : const Color(0xFF1976D2);
    final Color subHeaderBg = isDarkMode
        ? const Color(0xFF2C2C2C)
        : AppColors.lightBlueAccent;
    final Color categoryText = isDarkMode
        ? Colors.white
        : AppColors.primaryBlue;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: headerFooterColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ShiftKomputer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: onThemeChanged,
                    icon: Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      color: Colors.white,
                    ),
                    tooltip: 'Ganti Tema',
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: borderColor, width: 1.5),
                        ),
                        child: TextField(
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            hintText: 'Cari produk...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              color: isDarkMode
                                  ? Colors.white
                                  : AppColors.primaryBlue,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Banner Promo
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: subHeaderBg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: borderColor, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=800&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: borderColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Kategori Populer (Atas)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 60),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xFF252525)
                                  : null,
                              gradient: isDarkMode
                                  ? null
                                  : const LinearGradient(
                                      colors: [
                                        Color(0xFFBBDEFB),
                                        Color(0xFFE3F2FD),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: borderColor),
                            ),
                            padding: const EdgeInsets.only(top: 15),
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Kategori Populer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: categoryText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _HoverableProductCard(
                                  label: 'Laptop',
                                  icon: Icons.laptop,
                                  width: 120,
                                  height: 120,
                                  isDarkMode: isDarkMode,
                                  onTap: () =>
                                      _navToProductList(context, 'Laptop'),
                                ),
                                _HoverableProductCard(
                                  label: 'PC Build',
                                  icon: Icons.desktop_windows,
                                  width: 120,
                                  height: 120,
                                  isDarkMode: isDarkMode,
                                  onTap: () =>
                                      _navToProductList(context, 'PC Build'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Kategori Aksesori (Bawah)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: borderColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  _HoverableProductCard(
                                    label: 'Mouse',
                                    icon: Icons.mouse,
                                    width: 60,
                                    height: 60,
                                    fontSize: 10,
                                    isDarkMode: isDarkMode,
                                    onTap: () =>
                                        _navToProductList(context, 'Mouse'),
                                  ),
                                  const SizedBox(width: 15),
                                  _HoverableProductCard(
                                    label: 'Keyboard',
                                    icon: Icons.keyboard,
                                    width: 60,
                                    height: 60,
                                    fontSize: 10,
                                    isDarkMode: isDarkMode,
                                    onTap: () =>
                                        _navToProductList(context, 'Keyboard'),
                                  ),
                                  const SizedBox(width: 15),
                                  _HoverableProductCard(
                                    label: 'Audio',
                                    icon: Icons.headset,
                                    width: 60,
                                    height: 60,
                                    fontSize: 10,
                                    isDarkMode: isDarkMode,
                                    onTap: () =>
                                        _navToProductList(context, 'Audio'),
                                  ),
                                  const SizedBox(width: 15),
                                  _HoverableProductCard(
                                    label: 'Part',
                                    icon: Icons.memory,
                                    width: 60,
                                    height: 60,
                                    fontSize: 10,
                                    isDarkMode: isDarkMode,
                                    onTap: () =>
                                        _navToProductList(context, 'Parts'),
                                  ),
                                  const SizedBox(width: 15),
                                  _HoverableProductCard(
                                    label: 'Monitor',
                                    icon: Icons.monitor,
                                    width: 60,
                                    height: 60,
                                    fontSize: 10,
                                    isDarkMode: isDarkMode,
                                    onTap: () =>
                                        _navToProductList(context, 'Monitor'),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: headerFooterColor,
              child: const Text(
                '© 2024 ShiftKomputer',
                style: TextStyle(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverableProductCard extends StatefulWidget {
  final String label;
  final IconData icon;
  final double width;
  final double height;
  final double fontSize;
  final bool isDarkMode;
  final VoidCallback onTap;

  const _HoverableProductCard({
    required this.label,
    required this.icon,
    required this.width,
    required this.height,
    this.fontSize = 14,
    required this.isDarkMode,
    required this.onTap,
  });

  @override
  State<_HoverableProductCard> createState() => _HoverableProductCardState();
}

class _HoverableProductCardState extends State<_HoverableProductCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final cardBaseColor = widget.isDarkMode
        ? const Color(0xFF1E1E1E)
        : Colors.white;
    final borderColor = widget.isDarkMode
        ? Colors.grey[700]!
        : const Color(0xFF1976D2);
    final textColor = widget.isDarkMode
        ? Colors.white
        : const Color(0xFF1F2937);
    final hoverColor = widget.isDarkMode
        ? const Color(0xFF333333)
        : const Color(0xFFF0F9FF);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          // ignore: deprecated_member_use
          transform: _isHovering
              // ignore: deprecated_member_use
              ? (Matrix4.identity()..scale(1.05, 1.05))
              : Matrix4.identity(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: _isHovering ? hoverColor : cardBaseColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    // FIX: Menggunakan withValues(alpha: ...)
                    color: _isHovering
                        ? Colors.blueAccent
                        : borderColor.withValues(alpha: 0.5),
                    width: _isHovering ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      // FIX: Menggunakan withValues(alpha: ...)
                      color: Colors.black.withValues(
                        alpha: _isHovering ? 0.2 : 0.1,
                      ),
                      blurRadius: _isHovering ? 10 : 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  widget.icon,
                  size: widget.width * 0.4,
                  color: _isHovering ? Colors.blueAccent : borderColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                  color: _isHovering ? Colors.blueAccent : textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final String categoryName;

  const ProductListPage({super.key, required this.categoryName});

  String _getProductImage(String category) {
    final cat = category.toLowerCase();
    if (cat.contains('laptop')) {
      return 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&q=80';
    } else if (cat.contains('pc') || cat.contains('desktop')) {
      return 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=500&q=80';
    } else if (cat.contains('mouse')) {
      return 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=500&q=80';
    } else if (cat.contains('keyboard')) {
      return 'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    } else if (cat.contains('audio') || cat.contains('headset')) {
      return 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80';
    } else if (cat.contains('part') || cat.contains('memory')) {
      return 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=500&q=80';
    } else if (cat.contains('monitor') || cat.contains('screen')) {
      return 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500&q=80';
    } else {
      return 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=500&q=80';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode
        ? const Color(0xFF121212)
        : const Color(0xFFF5F7FA);

    final List<Map<String, String>> products = List.generate(
      8,
      (index) => {
        'name': '$categoryName Seri ${index + 100}',
        'price': 'Rp ${((index + 1) * 2500000).toString()}',
        'image': _getProductImage(categoryName),
        'description':
            'Nikmati performa maksimal dengan $categoryName Seri ${index + 100}. Produk ini dirancang untuk produktivitas tinggi dan gaming lancar. Dilengkapi garansi resmi 2 tahun.',
      },
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: isDarkMode
            ? const Color(0xFF1E1E1E)
            : AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // FIX: Menggunakan withValues(alpha: ...)
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        product['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, _) => Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              // FIX: Menggunakan withValues(alpha: ...)
                              Colors.black.withValues(alpha: 0.6),
                              Colors.black.withValues(alpha: 0.9),
                            ],
                            stops: const [0.0, 0.4, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 2, color: Colors.black),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              product['price']!,
                              style: const TextStyle(
                                color: Color(0xFF64B5F6),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 28,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                product: product,
                                              ),
                                        ),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      side: const BorderSide(
                                        color: Colors.white70,
                                      ),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      // FIX: Menggunakan withValues(alpha: ...)
                                      backgroundColor: Colors.white.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                    child: const Text(
                                      'Detail',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  height: 28,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: AppColors.primaryBlue,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Beli',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode
        ? const Color(0xFF121212)
        : const Color(0xFFF5F7FA);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(product['name']!),
        backgroundColor: isDarkMode
            ? const Color(0xFF1E1E1E)
            : AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[300],
                    child: Image.network(
                      product['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, _) => const Center(
                        child: Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                // FIX: Menggunakan withValues(alpha: ...)
                                color: Colors.green.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "Tersedia",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(Icons.share, color: Colors.grey[600]),
                          ],
                        ),
                        const SizedBox(height: 15),

                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          product['price']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Divider(color: Colors.grey[400]),
                        const SizedBox(height: 10),

                        Text(
                          "Deskripsi Produk",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product['description']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Spesifikasi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _specRow("Kondisi", "Baru", textColor),
                        _specRow("Berat", "3.5 Kg", textColor),
                        _specRow("Garansi", "2 Tahun Resmi", textColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              boxShadow: [
                // FIX: Menggunakan withValues(alpha: ...)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Beli Sekarang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _specRow(String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
          ),
        ],
      ),
    );
  }
}
