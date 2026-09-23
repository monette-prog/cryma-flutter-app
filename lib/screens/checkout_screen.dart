import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  final int subtotal = 2499;
  final int discount = 0;
  final int shippingFee = 89;

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)},',
        );
  }

  @override
  Widget build(BuildContext context) {
    final total = subtotal - discount + shippingFee;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER
            // ============================================================
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 22, color: AppColors.primary),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // ============================================================
            // BODY (scrollable)
            // ============================================================
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    // ============================================================
                    // DELIVERY ADDRESS - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Delivery Address',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGray,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const Text(
                                  'Change',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Juan Dela Cruz · 0917 123 4567',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.darkGray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const Text(
                              '123 Sampaguita St., Barangay Maliwanag,\nSan Juan, Metro Manila 1500',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.gray,
                                fontFamily: 'Poppins',
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Default',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ============================================================
                    // ORDER ITEMS - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Items',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                // LOCAL IMAGE
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.lightGray,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/image/headphones.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Anker Soundcore Q35',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkGray,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      const Text(
                                        'Black · x1',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.gray,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '₱${_formatPrice(subtotal)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ============================================================
                    // APPLY VOUCHER - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/voucher_selection');
                        },
                        leading: const Icon(Icons.local_offer_outlined,
                            size: 20, color: AppColors.primary),
                        title: const Text(
                          'Apply Voucher',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGray,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right,
                            size: 20, color: AppColors.gray),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ============================================================
                    // STANDARD DELIVERY - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_outlined,
                                        size: 20, color: AppColors.primary),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Standard Delivery',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.darkGray,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '₱${_formatPrice(shippingFee)}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGray,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Estimated: Aug 26–28, 2026',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.gray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ============================================================
                    // CASH ON DELIVERY - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/payment_method');
                        },
                        leading: const Icon(Icons.attach_money_outlined,
                            size: 20, color: AppColors.primary),
                        title: const Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGray,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        trailing: const Text(
                          'Change',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ============================================================
                    // ORDER SUMMARY - ROUNDED CARD
                    // ============================================================
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColors.lightGray, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Summary',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildSummaryRow(
                                'Subtotal', '₱${_formatPrice(subtotal)}'),
                            _buildSummaryRow(
                                'Discount', '-₱${_formatPrice(discount)}'),
                            _buildSummaryRow('Shipping Fee',
                                '₱${_formatPrice(shippingFee)}'),
                            const SizedBox(height: 6),
                            const Divider(color: AppColors.lightGray),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGray,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  '₱${_formatPrice(total)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // ============================================================
            // BOTTOM FIXED - Place Order
            // ============================================================
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/order_success');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Place Order',
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
    );
  }

  // ============================================================
  // SUMMARY ROW HELPER
  // ============================================================
  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
