import 'package:flutter/material.dart';
import '../utils/colors.dart';

class RegisterContactScreen extends StatefulWidget {
  const RegisterContactScreen({
    super.key,
    this.personalData,
  });

  final Map<String, dynamic>? personalData;

  @override
  State<RegisterContactScreen> createState() => _RegisterContactScreenState();
}

class _RegisterContactScreenState extends State<RegisterContactScreen> {
  // ============================================================
  // TEXT CONTROLLERS
  // ============================================================
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();

  // ============================================================
  // DISPOSE
  // ============================================================
  @override
  void dispose() {
    _emailController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  // ============================================================
  // CONTINUE
  // ============================================================
  void _handleContinue() {
    final email = _emailController.text.trim();
    final contactNumber = _contactNumberController.text.trim();

    if (email.isEmpty || contactNumber.isEmpty) {
      _showAlert(
        'Please provide your email address and contact number.',
      );
      return;
    }

    final contactData = {
      'email': email,
      'contactNumber': contactNumber,
    };

    Navigator.pushNamed(
      context,
      '/register_address',
      arguments: {
        'personalData': widget.personalData ?? {},
        'contactData': contactData,
      },
    );
  }

  // ============================================================
  // ALERT
  // ============================================================
  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Error',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // HEADER - magkadikit ang arrow at title
              // ============================================================
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),

              // ============================================================
              // STEPPER - UPDATED WITH CONNECTING LINE
              // ============================================================
              _buildStepper(currentStep: 2),
              const SizedBox(height: 14),

              // ============================================================
              // INTRO TEXT
              // ============================================================
              const Text(
                'Provide your contact details so we can reach you.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                  fontFamily: 'Poppins',
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 22),

              // ============================================================
              // EMAIL LABEL
              // ============================================================
              _buildLabel('E-MAIL ADDRESS *'),
              const SizedBox(height: 6),

              // ============================================================
              // EMAIL FIELD
              // ============================================================
              _buildInputField(
                controller: _emailController,
                hintText: 'juan@email.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),

              // ============================================================
              // EMAIL VERIFICATION CONTAINER
              // ============================================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFFAF5),
                  border: Border.all(
                    color: const Color(0xFFD6EEE3),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.email_outlined,
                        size: 18,
                        color: Color(0xFF9CCFC0),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'A verification link will be sent to this email after registration.',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF687477),
                          fontFamily: 'Poppins',
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // ============================================================
              // CONTACT NUMBER LABEL
              // ============================================================
              _buildLabel('CONTACT NUMBER *'),
              const SizedBox(height: 6),

              // ============================================================
              // CONTACT NUMBER FIELD
              // ============================================================
              _buildInputField(
                controller: _contactNumberController,
                hintText: '+63 9XX XXX XXXX',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 30),

              // ============================================================
              // CONTINUE BUTTON
              // ============================================================
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STEPPER - UPDATED WITH CONNECTING LINE
  // ============================================================
  Widget _buildStepper({required int currentStep}) {
    final List<String> steps = [
      'Personal',
      'Contact',
      'Address',
      'Verify',
      'Account',
    ];

    return SizedBox(
      height: 64,
      child: Stack(
        children: [
          // CONNECTING LINE
          Positioned(
            left: 26,
            right: 26,
            top: 18,
            child: Row(
              children: List.generate(steps.length - 1, (index) {
                final isCompleted = index + 1 < currentStep;

                return Expanded(
                  child: Container(
                    height: 2,
                    color:
                        isCompleted ? AppColors.primary : AppColors.lightGray,
                  ),
                );
              }),
            ),
          ),

          // CIRCLES + LABELS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps.asMap().entries.map((entry) {
              final index = entry.key;
              final label = entry.value;
              final stepNumber = index + 1;

              final isCurrent = stepNumber == currentStep;
              final isCompleted = stepNumber < currentStep;

              return SizedBox(
                width: 50,
                child: Column(
                  children: [
                    // STEP CIRCLE
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCurrent || isCompleted
                            ? AppColors.primary
                            : AppColors.lightGray,
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 18,
                              )
                            : Text(
                                stepNumber.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isCurrent
                                      ? AppColors.white
                                      : AppColors.gray,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // STEP LABEL
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: isCurrent || isCompleted
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isCurrent || isCompleted
                            ? AppColors.primary
                            : AppColors.gray,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LABEL
  // ============================================================
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  // ============================================================
  // INPUT FIELD
  // ============================================================
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required TextInputType keyboardType,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.lightGray,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.darkGray,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: const Color(0xFFB0B6B7),
            size: 22,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xFFB0B6B7),
            fontFamily: 'Poppins',
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
