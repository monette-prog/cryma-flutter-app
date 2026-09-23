import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/colors.dart';

// ============================================================
// TIMELINE ITEM MODEL
// ============================================================
class TimelineItem {
  final String label;
  final String date;
  final bool isActive;

  const TimelineItem({
    required this.label,
    required this.date,
    this.isActive = false,
  });
}

// ============================================================
// ORDER DETAILS SCREEN
// ============================================================
class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, this.orderId});

  final String? orderId;

  final String _orderNumber = '#CRM-20260823-0042';
  final String _status = 'In Transit';
  final String _productName = 'Anker Soundcore Q35';
  final String _color = 'Black';
  final String _quantity = 'x1';
  final int _price = 2499;
  final String _imagePath = 'assets/image/headphones.jpg';

  final List<TimelineItem> _timeline = const [
    TimelineItem(
      label: 'Order Placed',
      date: 'Aug 20, 2026 · 9:30 AM',
      isActive: true,
    ),
    TimelineItem(
      label: 'To Ship',
      date: 'Aug 21, 2026 · 10:30 AM',
      isActive: true,
    ),
    TimelineItem(
      label: 'In Transit',
      date: 'Aug 22, 2026 · 11:30 AM',
      isActive: true,
    ),
    TimelineItem(
      label: 'Out for Delivery',
      date: '',
      isActive: false,
    ),
    TimelineItem(
      label: 'Delivered',
      date: '',
      isActive: false,
    ),
  ];

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)},',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER - back arrow + "Order Details"
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
                  const Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
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
                    // ORDER STATUS CARD - dark teal
                    // ============================================================
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: const FaIcon(
                              FontAwesomeIcons.truck,
                              size: 22,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _orderNumber,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB8D4D3),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _status,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ============================================================
                    // TIMELINE CARD
                    // ============================================================
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                        border:
                            Border.all(color: AppColors.lightGray, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: _timeline
                            .map((item) => _buildTimelineItem(item))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ============================================================
                    // PRODUCTS CARD
                    // ============================================================
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                        border:
                            Border.all(color: AppColors.lightGray, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Products',
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
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.lightGray,
                                  image: DecorationImage(
                                    image: AssetImage(_imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _productName,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkGray,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '$_color · $_quantity',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.gray,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '₱${_formatPrice(_price)}',
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
                    const SizedBox(height: 16),

                    // ============================================================
                    // BOTTOM BUTTONS - Contact Seller + Track Order
                    // ============================================================
                    Row(
                      children: [
                        // Contact Seller - outlined
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/chat_conversation');
                            },
                            icon: const Icon(Icons.chat_bubble_outline,
                                size: 16, color: Color(0xFF666666)),
                            label: const Text(
                              'Contact Seller',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0xFFDDE5E4), width: 1),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Track Order - filled
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/order_tracking');
                            },
                            icon: const FaIcon(FontAwesomeIcons.truck,
                                size: 16, color: AppColors.white),
                            label: const Text(
                              'Track Order',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
  // TIMELINE ITEM
  // ============================================================
  Widget _buildTimelineItem(TimelineItem item) {
    final isLast = item == _timeline.last;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Circle + Line
        SizedBox(
          width: 28,
          child: Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: item.isActive
                      ? AppColors.primary
                      : const Color(0xFFEDF0F0),
                  shape: BoxShape.circle,
                ),
                child: item.isActive
                    ? const Icon(Icons.check, size: 16, color: AppColors.white)
                    : null,
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 36,
                  color: item.isActive
                      ? AppColors.primary
                      : const Color(0xFFE8ECEC),
                ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        // Right: Label + Date
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight:
                        item.isActive ? FontWeight.w600 : FontWeight.normal,
                    color: item.isActive ? AppColors.darkGray : AppColors.gray,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.date.isNotEmpty ? item.date : '—',
                  style: TextStyle(
                    fontSize: 11,
                    color: item.date.isNotEmpty
                        ? AppColors.gray
                        : const Color(0xFFD5D5D5),
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
