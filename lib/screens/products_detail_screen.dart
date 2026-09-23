import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.productId,
  });

  final String? productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // ============================================================
  // PRODUCT DATA
  // ============================================================

  final Map<String, dynamic> _product = {
    'id': '1',
    'name': 'Anker Soundcore Q35 Wireless Headphones',
    'price': 2499,
    'originalPrice': 3299,
    'rating': 4.7,
    'reviews': 842,
    'sold': 1200,
    'category': 'ELECTRONICS',

    // ==========================================================
    // LOCAL IMAGES
    // ==========================================================

    'images': [
      'assets/image/headphones.jpg',
      'assets/image/headphones.jpg',
      'assets/image/headphones.jpg',
      'assets/image/headphones.jpg',
    ],

    'colors': ['Black', 'Blue', 'White'],
    'stock': 25,
    'discount': 24,
  };

  String _selectedImage = '';
  String _selectedColor = 'Black';
  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    _selectedImage = _product['images'][0];
  }

  // ============================================================
  // QUANTITY
  // ============================================================

  void _increaseQuantity() {
    if (_quantity < _product['stock']) {
      setState(() {
        _quantity++;
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  // ============================================================
  // ADD TO CART
  // ============================================================

  void _addToCart() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$_quantity item(s) added to cart',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          16,
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'View Cart',
          textColor: AppColors.white,
          onPressed: () {
            // Cart navigation can be added here later.
          },
        ),
      ),
    );
  }

  // ============================================================
  // BUY NOW
  // ============================================================

  void _buyNow() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        final int total = (_product['price'] as int) * _quantity;

        return Container(
          padding: const EdgeInsets.fromLTRB(
            20,
            18,
            20,
            24,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==================================================
                // HEADER
                // ==================================================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.close,
                        size: 23,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        Navigator.pop(sheetContext);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ==================================================
                // PRODUCT
                // ==================================================

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        _selectedImage,
                        fit: BoxFit.cover,
                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.gray,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _product['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGray,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Color: $_selectedColor',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Quantity: $_quantity',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                const Divider(
                  height: 1,
                  color: Color(0xFFE5E5E5),
                ),

                const SizedBox(height: 15),

                // ==================================================
                // TOTAL
                // ==================================================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '₱$total',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // ==================================================
                // CHECKOUT BUTTON
                // ==================================================

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(sheetContext);

                      ScaffoldMessenger.of(context).hideCurrentSnackBar();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ready for checkout',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue to Checkout',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // ========================================================
      // FIXED BOTTOM BUTTONS
      // ========================================================

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.fromLTRB(
            16,
            10,
            16,
            14,
          ),
          child: Row(
            children: [
              // ==================================================
              // ADD TO CART
              // ==================================================

              Expanded(
                child: SizedBox(
                  height: 54,
                  child: OutlinedButton(
                    onPressed: _addToCart,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // ==================================================
              // BUY NOW
              // ==================================================

              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _buyNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================

            Container(
              height: 64,
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BACK

                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  // RIGHT ICONS

                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: AppColors.primary,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 29,
                          color: AppColors.primary,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ==================================================
            // SCROLLABLE CONTENT
            // ==================================================

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMainImage(),
                    _buildThumbnails(),
                    _buildProductInfo(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MAIN IMAGE
  // ============================================================

  Widget _buildMainImage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        0,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.72,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(26),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image(
              image: AssetImage(_selectedImage),
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  color: const Color(0xFFE9E9E9),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 45,
                      color: AppColors.gray,
                    ),
                  ),
                );
              },
            ),
          ),

          // ==================================================
          // DISCOUNT BADGE
          // ==================================================

          Positioned(
            top: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: AppColors.danger,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                '-${_product['discount']}%',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // THUMBNAILS
  // ============================================================

  Widget _buildThumbnails() {
    return SizedBox(
      height: 88,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          16,
          10,
          16,
          10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: _product['images'].length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          final String imagePath = _product['images'][index] as String;

          final bool isActive = _selectedImage == imagePath && index == 0;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedImage = imagePath;
              });
            },
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isActive ? AppColors.primary : const Color(0xFFE5E5E5),
                  width: isActive ? 2 : 1,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 22,
                      color: AppColors.gray,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // PRODUCT INFORMATION
  // ============================================================

  Widget _buildProductInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        18,
        16,
        18,
        18,
      ),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ======================================================
          // CATEGORY
          // ======================================================

          Text(
            _product['category'],
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: AppColors.primary,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 5),

          // ======================================================
          // PRODUCT NAME
          // ======================================================

          Text(
            _product['name'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              height: 1.25,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 8),

          // ======================================================
          // RATING
          // ======================================================

          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) {
                    return const Padding(
                      padding: EdgeInsets.only(
                        right: 2,
                      ),
                      child: Icon(
                        Icons.star,
                        size: 17,
                        color: AppColors.gold,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  '${_product['rating']} · '
                  '${_product['reviews']} reviews · '
                  '1.2k sold',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ======================================================
          // PRICE
          // ======================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₱${_product['price']}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '₱${_product['originalPrice']}',
                style: const TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.gray,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEEEE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '-${_product['discount']}%',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.danger,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ======================================================
          // COLOR
          // ======================================================

          const Text(
            'Color',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 7),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: (_product['colors'] as List<String>).map<Widget>(
                (color) {
                  final bool isSelected = _selectedColor == color;

                  final Map<String, Color> colorMap = {
                    'Black': Colors.black,
                    'Blue': Colors.blue,
                    'White': Colors.grey,
                  };

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 9,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(
                                0xFFF1F7F7,
                              )
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : const Color(
                                  0xFFE5E5E5,
                                ),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: colorMap[color] ?? Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            color,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.darkGray,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // ======================================================
          // QUANTITY
          // ======================================================

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                  fontFamily: 'Poppins',
                ),
              ),
              Row(
                children: [
                  // MINUS

                  GestureDetector(
                    onTap: _decreaseQuantity,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: const Color(
                            0xFFE5E5E5,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '−',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 17,
                  ),

                  Text(
                    '$_quantity',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(
                    width: 17,
                  ),

                  // PLUS

                  GestureDetector(
                    onTap: _increaseQuantity,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: const Color(
                            0xFFE5E5E5,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 7),

          // ======================================================
          // STOCK
          // ======================================================

          Text(
            'Available Stock: '
            '${_product['stock']} units',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.gray,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
