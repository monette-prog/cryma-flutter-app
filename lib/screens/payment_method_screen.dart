import 'package:flutter/material.dart';
import '../utils/colors.dart';

// ============================================================
// PAYMENT METHOD MODEL
// ============================================================
class PaymentMethod {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  const PaymentMethod({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}

// ============================================================
// PAYMENT METHOD SCREEN
// ============================================================
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedMethodId = '1';

  final List<PaymentMethod> _paymentMethods = const [
    PaymentMethod(
      id: '1',
      title: 'Cash on Delivery',
      description: 'Pay when your order arrives',
      icon: Icons.attach_money_outlined,
    ),
    PaymentMethod(
      id: '2',
      title: 'GCash',
      description: 'Pay using your GCash wallet',
      icon: Icons.phone_android_outlined,
    ),
    PaymentMethod(
      id: '3',
      title: 'Maya (PayMaya)',
      description: 'Pay using your Maya account',
      icon: Icons.phone_android_outlined,
    ),
    PaymentMethod(
      id: '4',
      title: 'Online Banking',
      description: 'BPI, BDO, UnionBank & more',
      icon: Icons.business_outlined,
    ),
    PaymentMethod(
      id: '5',
      title: 'Credit / Debit Card',
      description: 'Visa, Mastercard, JCB',
      icon: Icons.credit_card_outlined,
    ),
  ];

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Method'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleConfirm() {
    final method = _paymentMethods.firstWhere((m) => m.id == _selectedMethodId);
    _showAlert('Payment method selected: ${method.title}');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                        size: 20, color: AppColors.primary),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // ============================================================
            // BODY
            // ============================================================
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose how you\'d like to pay for your order.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.gray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 14),
                    ..._paymentMethods
                        .map((method) => _buildPaymentCard(method))
                        .toList(),
                  ],
                ),
              ),
            ),

            // ============================================================
            // BOTTOM CONTAINER - Confirm Payment Method
            // ============================================================
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Confirm Payment Method',
                    style: TextStyle(
                      fontSize: 15,
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
  // PAYMENT CARD - DARK BLUE GREEN HIGHLIGHT
  // ============================================================
  Widget _buildPaymentCard(PaymentMethod method) {
    final isSelected = _selectedMethodId == method.id;

    return GestureDetector(
      onTap: () => setState(() => _selectedMethodId = method.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightGray : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGray,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Icon(method.icon, size: 20, color: AppColors.primary),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color:
                          isSelected ? AppColors.primary : AppColors.darkGray,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    method.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected ? AppColors.primary : AppColors.gray,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            // Check icon if selected - DARK BLUE GREEN
            if (isSelected)
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 14,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
