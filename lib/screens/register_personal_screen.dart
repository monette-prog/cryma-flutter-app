import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';

class RegisterPersonalScreen extends StatefulWidget {
  const RegisterPersonalScreen({super.key});

  @override
  State<RegisterPersonalScreen> createState() => _RegisterPersonalScreenState();
}

class _RegisterPersonalScreenState extends State<RegisterPersonalScreen> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleInitialController =
      TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _selectedSex = '';
  bool _showSexDropdown = false;

  final List<String> _sexOptions = ['Male', 'Female', 'Other'];

  // ============================================================
  // AGE COMPUTATION
  // ============================================================
  void _computeAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    final monthDiff = today.month - birthDate.month;
    if (monthDiff < 0 || (monthDiff == 0 && today.day < birthDate.day)) {
      age--;
    }
    _ageController.text = age.toString();
  }

  void _onDateSelected(DateTime? date) {
    if (date != null) {
      _birthdayController.text = DateFormat('MM/dd/yyyy').format(date);
      _computeAge(date);
    }
  }

  // ============================================================
  // VALIDATION
  // ============================================================
  bool _validateForm() {
    if (_lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _selectedSex.isEmpty ||
        _birthdayController.text.isEmpty) {
      _showErrorDialog('Please fill in all required fields.');
      return false;
    }
    return true;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
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

  void _handleContinue() {
    if (_validateForm()) {
      final formData = {
        'lastName': _lastNameController.text,
        'firstName': _firstNameController.text,
        'middleInitial': _middleInitialController.text,
        'sex': _selectedSex,
        'birthday': _birthdayController.text,
        'age': _ageController.text,
      };
      Navigator.pushNamed(
        context,
        '/register_contact',
        arguments: formData,
      );
    }
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
                    icon:
                        const Icon(Icons.arrow_back, color: AppColors.primary),
                    onPressed: () => Navigator.pop(context),
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

              // STEPPER
              _buildStepper(currentStep: 1),
              const SizedBox(height: 10),

              // INTRO TEXT
              const Text(
                'Enter your personal information to get started.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 18),

              // ============================================================
              // FORM
              // ============================================================
              // LAST NAME
              _buildLabel('LAST NAME *'),
              _buildTextField(
                controller: _lastNameController,
                hintText: 'Dela Cruz',
              ),
              const SizedBox(height: 10),

              // FIRST NAME
              _buildLabel('FIRST NAME *'),
              _buildTextField(
                controller: _firstNameController,
                hintText: 'Juan',
              ),
              const SizedBox(height: 10),

              // MIDDLE INITIAL
              _buildLabel('MIDDLE INITIAL'),
              _buildTextField(
                controller: _middleInitialController,
                hintText: 'R.',
              ),
              const SizedBox(height: 10),

              // SEX
              _buildLabel('SEX *'),
              _buildSexDropdown(),
              const SizedBox(height: 10),

              // BIRTHDAY
              _buildLabel('BIRTHDAY *'),
              _buildDatePicker(),
              const SizedBox(height: 10),

              // AGE
              _buildLabel('AGE (AUTO-GENERATED)'),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  border: Border.all(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _ageController,
                  enabled: false,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.gray,
                    fontFamily: 'Poppins',
                  ),
                  decoration: const InputDecoration(
                    hintText: '—',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
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
  // STEPPER
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
      padding: const EdgeInsets.only(bottom: 4),
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
  // TEXT FIELD
  // ============================================================
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.darkGray,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }

  // ============================================================
  // SEX DROPDOWN
  // ============================================================
  Widget _buildSexDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showSexDropdown = !_showSexDropdown;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedSex.isEmpty ? 'Select sex' : _selectedSex,
                  style: TextStyle(
                    fontSize: 13,
                    color: _selectedSex.isEmpty
                        ? AppColors.gray
                        : AppColors.darkGray,
                    fontFamily: 'Poppins',
                  ),
                ),
                Icon(
                  _showSexDropdown
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
        if (_showSexDropdown)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: _sexOptions.map((option) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSex = option;
                      _showSexDropdown = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: option == _sexOptions.last
                              ? Colors.transparent
                              : AppColors.lightGray,
                        ),
                      ),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.darkGray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  // ============================================================
  // DATE PICKER
  // ============================================================
  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            _onDateSelected(picked);
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _birthdayController.text.isEmpty
                  ? 'MM / DD / YYYY'
                  : _birthdayController.text,
              style: TextStyle(
                fontSize: 13,
                color: _birthdayController.text.isEmpty
                    ? AppColors.gray
                    : AppColors.darkGray,
                fontFamily: 'Poppins',
              ),
            ),
            const Icon(Icons.calendar_today, color: AppColors.gray, size: 18),
          ],
        ),
      ),
    );
  }
}
