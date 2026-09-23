import 'package:flutter/material.dart';
import '../utils/colors.dart';

// ============================================================
// MODEL
// ============================================================

class SearchResult {
  final String id;
  final String name;
  final int price;
  final int? originalPrice;
  final double rating;
  final String category;
  final String imagePath;
  final bool isSale;

  const SearchResult({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.category,
    required this.imagePath,
    this.isSale = false,
  });
}

// ============================================================
// SEARCH RESULTS SCREEN
// ============================================================

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    this.searchQuery,
  });

  final String? searchQuery;

  // ============================================================
  // LOCAL PRODUCT DATA
  // ============================================================

  List<SearchResult> get _allResults => const [
        SearchResult(
          id: '1',
          name: 'COSRX Snail 96 Mucin',
          price: 549,
          originalPrice: 799,
          rating: 4.9,
          category: 'BEAUTY',
          imagePath: 'assets/image/cosrx_snail_mucin.jpg',
          isSale: true,
        ),
        SearchResult(
          id: '2',
          name: 'Klairs Midnight Blue Lotion',
          price: 899,
          rating: 4.6,
          category: 'BEAUTY',
          imagePath: 'assets/image/midnight_lotion.jpg',
        ),
        SearchResult(
          id: '3',
          name: 'Some By Mi AHA Toner',
          price: 649,
          originalPrice: 850,
          rating: 4.7,
          category: 'BEAUTY',
          imagePath: 'assets/image/some_toner.jpg',
          isSale: true,
        ),
        SearchResult(
          id: '4',
          name: 'Laneige Water Sleeping Mask',
          price: 1250,
          rating: 4.8,
          category: 'BEAUTY',
          imagePath: 'assets/image/laneige_sleeping_mask.jpg',
        ),
      ];

  // ============================================================
  // FILTER RESULTS
  // ============================================================

  List<SearchResult> _getFilteredResults() {
    return _allResults;
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final results = _getFilteredResults();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            // ====================================================
            // SEARCH AREA
            // ====================================================

            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 12,
                bottom: 6,
              ),
              child: Row(
                children: [
                  // BACK BUTTON
                  SizedBox(
                    width: 38,
                    height: 54,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: AppColors.primary,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(width: 6),

                  // SEARCH CONTAINER
                  Expanded(
                    child: Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFE3E3E3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            size: 22,
                            color: AppColors.gray,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              searchQuery?.isNotEmpty == true
                                  ? searchQuery!
                                  : 'Search products, brands...',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: searchQuery?.isNotEmpty == true
                                    ? AppColors.darkGray
                                    : AppColors.gray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ====================================================
            // RESULTS COUNT + FILTER + SORT
            // ====================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                7,
                14,
                9,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // RESULTS COUNT
                  Expanded(
                    child: Text(
                      '128 results found',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  // FILTER
                  _buildActionButton(
                    icon: Icons.filter_alt_outlined,
                    label: 'Filter',
                  ),

                  const SizedBox(width: 8),

                  // SORT
                  _buildActionButton(
                    icon: Icons.sort,
                    label: 'Sort',
                  ),
                ],
              ),
            ),

            // ====================================================
            // PRODUCT GRID
            // ====================================================

            Expanded(
              child: results.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        20,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,

                        // SMALLER CARD
                        mainAxisExtent: 350,
                      ),
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        return _buildResultCard(
                          context,
                          results[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // FILTER / SORT BUTTON
  // ============================================================

  Widget _buildActionButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE3E3E3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 50,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'No results found',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Try adjusting your search terms',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.gray,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PRODUCT CARD
  // ============================================================

  Widget _buildResultCard(
    BuildContext context,
    SearchResult result,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product_detail',
          arguments: result.id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,

        // IMPORTANT:
        // Image + information will fit inside the card.
        child: Column(
          children: [
            // ==================================================
            // IMAGE
            // ==================================================

            SizedBox(
              height: 165,
              width: double.infinity,
              child: Stack(
                children: [
                  // PRODUCT IMAGE
                  Positioned.fill(
                    child: Image.asset(
                      result.imagePath,
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
                              size: 42,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ==================================================
                  // SALE BADGE
                  // ==================================================

                  if (result.isSale)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.danger,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'SALE',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),

                  // ==================================================
                  // HEART
                  // ==================================================

                  Positioned(
                    top: 9,
                    right: 9,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 26,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // PRODUCT INFORMATION
            // ==================================================

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  9,
                  12,
                  9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CATEGORY
                    Text(
                      result.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        color: AppColors.primary,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 3),

                    // PRODUCT NAME
                    SizedBox(
                      height: 38,
                      child: Text(
                        result.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGray,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(height: 2),

                    // RATING
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.gold,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          result.rating.toString(),
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.gray,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // ==================================================
                    // PRICE
                    // ==================================================

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '₱${result.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        if (result.originalPrice != null) ...[
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              '₱${result.originalPrice}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.gray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
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
  }
}
