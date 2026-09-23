import 'package:flutter/material.dart';
import '../utils/colors.dart';

// ============================================================
// 📍 MOCK DATA - PHILIPPINES
// ============================================================
class AddressData {
  static final List<String> provinces = [
    'Laguna',
    'Metro Manila',
    'Cebu',
    'Davao',
    'Pampanga',
    'Batangas',
    'Cavite',
    'Rizal',
    'Bulacan',
  ];

  static final Map<String, List<String>> municipalities = {
    'Laguna': [
      'Santa Cruz',
      'Calamba',
      'San Pablo',
      'Santa Rosa',
      'Biñan',
      'Cabuyao',
      'San Pedro',
      'Luisiana',
      'Lumban',
      'Mabitac',
      'Magdalena',
      'Majayjay',
      'Nagcarlan',
      'Paete',
      'Pagsanjan',
      'Pakil',
      'Pangil',
      'Pila',
      'Rizal',
      'San Juan',
      'Siniloan',
      'Victoria',
    ],
    'Metro Manila': [
      'Manila',
      'Quezon City',
      'Makati',
      'Pasig',
      'Taguig',
      'Mandaluyong',
      'Marikina',
      'Pasay',
      'Parañaque',
      'Las Piñas',
      'Muntinlupa',
      'Valenzuela',
      'Caloocan',
      'Malabon',
      'Navotas',
      'San Juan',
      'Pateros',
    ],
    'Cebu': [
      'Cebu City',
      'Mandaue',
      'Lapu-Lapu',
      'Talisay',
      'Consolacion',
      'Liloan',
      'Compostela',
      'Danao',
      'Toledo',
      'Naga',
    ],
    'Davao': [
      'Davao City',
      'Digos',
      'Tagum',
      'Panabo',
      'Samal',
      'Mati',
      'Santa Cruz',
    ],
    'Pampanga': [
      'Angeles City',
      'San Fernando',
      'Mabalacat',
      'Mexico',
      'Arayat',
      'Candaba',
      'Floridablanca',
      'Guagua',
      'Lubao',
      'Porac',
      'San Luis',
      'Santa Rita',
      'Sasmuan',
    ],
    'Batangas': [
      'Batangas City',
      'Lipa',
      'Tanauan',
      'Santo Tomas',
      'San Jose',
      'Rosario',
      'Balayan',
      'Calaca',
      'Nasugbu',
      'Taal',
      'Lemery',
      'Cuenca',
    ],
    'Cavite': [
      'Dasmariñas',
      'Bacoor',
      'Imus',
      'General Trias',
      'Silang',
      'Trece Martires',
      'Tagaytay',
      'Naic',
      'Tanza',
      'Maragondon',
    ],
    'Rizal': [
      'Antipolo',
      'Cainta',
      'Taytay',
      'Binangonan',
      'San Mateo',
      'Rodriguez',
      'Tanay',
      'Angono',
      'Cardona',
      'Morong',
      'Baras',
      'Jala-Jala',
      'Pililla',
      'Teresa',
    ],
    'Bulacan': [
      'Malolos',
      'Meycauayan',
      'San Jose del Monte',
      'Santa Maria',
      'Bocaue',
      'Marilao',
      'Balagtas',
      'Guiguinto',
      'Pulilan',
      'Plaridel',
      'Baliuag',
      'San Rafael',
      'Norzagaray',
      'Angat',
    ],
  };

  static final Map<String, List<String>> barangays = {
    'Santa Cruz': [
      'Poblacion I',
      'Poblacion II',
      'Poblacion III',
      'Poblacion IV',
      'Poblacion V',
      'Santisima',
      'Bagumbayan',
      'Bubukal',
      'Calios',
      'Duhat',
      'Gatid',
      'Halang',
      'Kabulusan',
      'Labuin',
      'Lalab',
      'Lumban',
      'Malinao',
      'Manila',
      'Masiit',
      'Palina',
      'San Juan',
      'San Lorenzo',
      'San Pablo',
      'San Pedro',
      'Santa Ana',
      'Santa Isabel',
      'Santa Rosa',
      'Santo Domingo',
      'Santo Tomas',
      'Silangan',
      'Taytay',
      'Zaballero',
    ],
    'Calamba': [
      'Barandal',
      'Canlubang',
      'Makiling',
      'Pansol',
      'Real',
      'Sucol',
      'Bagong Kalsada',
      'Bambang',
      'Bubuyan',
      'Halang',
      'Lawa',
      'Lingga',
      'Looc',
      'Paciano Rizal',
      'Palingon',
      'Parian',
      'San Cristobal',
      'San Jose',
      'San Juan',
      'San Pedro',
      'Santa Cruz',
      'Santa Elena',
      'Santa Isabel',
      'Santo Domingo',
      'Santo Tomas',
      'Turbina',
    ],
    'San Pablo': [
      'Bayan',
      'San Jose',
      'San Miguel',
      'Santa Ana',
      'Santa Catalina',
      'Santa Clara',
      'Santa Elena',
      'Santa Isabel',
      'Santa Maria',
      'Santa Rita',
      'Santo Cristo',
      'Santo Domingo',
      'Santo Niño',
      'Santiago',
      'San Antonio',
      'San Buenaventura',
      'San Francisco',
      'San Gabriel',
      'San Gregorio',
      'San Ildefonso',
      'San Isidro',
      'San Juan',
      'San Lorenzo',
      'San Luis',
      'San Mateo',
      'San Nicolas',
      'San Pascual',
      'San Pedro',
      'San Rafael',
      'San Roque',
      'San Vicente',
    ],
    'Santa Rosa': [
      'Tagapo',
      'Dita',
      'Malusak',
      'Balibago',
      'Don Jose',
      'Macabling',
      'Pulong Santa Cruz',
      'Santa Elena',
      'Aplaya',
      'Caingin',
      'Poblacion',
      'Labas',
      'Lagusnilad',
      'Malitlit',
      'Manila',
      'Santa Rosa',
      'Santo Domingo',
      'Santo Tomas',
      'Sinalhan',
      'Talong',
    ],
    'Biñan': [
      'Poblacion',
      'San Antonio',
      'San Francisco',
      'San Jose',
      'San Juan',
      'San Lorenzo',
      'San Mateo',
      'San Miguel',
      'San Nicolas',
      'San Pedro',
      'San Ramon',
      'San Vicente',
      'Santiago',
      'Santo Domingo',
      'Santo Niño',
      'Santo Tomas',
      'Timbao',
      'Zaballero',
    ],
    'Cabuyao': [
      'Poblacion',
      'Baclaran',
      'Bigaa',
      'Butong',
      'Casile',
      'Diezmo',
      'Gulod',
      'Mamatid',
      'Marinig',
      'Niugan',
      'Pulo',
      'Putol',
      'Sala',
      'San Isidro',
      'San Jose',
      'San Miguel',
      'San Nicolas',
      'Santa Ana',
      'Santa Cruz',
      'Santa Elena',
      'Santa Isabel',
      'Santa Maria',
      'Santo Domingo',
      'Santo Tomas',
      'Tulo',
    ],
  };
}

// ============================================================
// REGISTER ADDRESS SCREEN
// ============================================================
class RegisterAddressScreen extends StatefulWidget {
  const RegisterAddressScreen({
    super.key,
    this.personalData,
    this.contactData,
  });

  final Map<String, dynamic>? personalData;
  final Map<String, dynamic>? contactData;

  @override
  State<RegisterAddressScreen> createState() => _RegisterAddressScreenState();
}

class _RegisterAddressScreenState extends State<RegisterAddressScreen> {
  String _selectedProvince = '';
  String _selectedMunicipality = '';
  String _selectedBarangay = '';

  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _otherDetailsController = TextEditingController();

  bool _showProvince = false;
  bool _showMunicipality = false;
  bool _showBarangay = false;

  @override
  void dispose() {
    _houseNumberController.dispose();
    _streetController.dispose();
    _otherDetailsController.dispose();
    super.dispose();
  }

  List<String> _getMunicipalities() {
    return AddressData.municipalities[_selectedProvince] ?? [];
  }

  List<String> _getBarangays() {
    return AddressData.barangays[_selectedMunicipality] ?? [];
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleContinue() {
    if (_selectedProvince.isEmpty ||
        _selectedMunicipality.isEmpty ||
        _selectedBarangay.isEmpty) {
      _showAlert(
        'Please select Province, Municipality, and Barangay.',
      );
      return;
    }

    final addressData = {
      'province': _selectedProvince,
      'municipality': _selectedMunicipality,
      'barangay': _selectedBarangay,
      'houseNumber': _houseNumberController.text.trim(),
      'street': _streetController.text.trim(),
      'otherDetails': _otherDetailsController.text.trim(),
    };

    Navigator.pushNamed(
      context,
      '/register_id',
      arguments: {
        'personalData': widget.personalData ?? {},
        'contactData': widget.contactData ?? {},
        'addressData': addressData,
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

              // ============================================================
              // STEPPER - UPDATED WITH CONNECTING LINE
              // ============================================================
              _buildStepper(currentStep: 3),
              const SizedBox(height: 14),

              // ============================================================
              // INTRO
              // ============================================================
              const Text(
                'Where are you located?',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 18),

              // ============================================================
              // LOCATION SECTION
              // ============================================================
              _buildSectionTitle('LOCATION (API-BASED)'),
              const SizedBox(height: 6),

              // PROVINCE
              _buildLabel('PROVINCE *'),
              const SizedBox(height: 4),
              _buildDropdown(
                value: _selectedProvince,
                hint: 'Select province',
                isOpen: _showProvince,
                items: AddressData.provinces,
                onToggle: () {
                  setState(() {
                    _showProvince = !_showProvince;
                    _showMunicipality = false;
                    _showBarangay = false;
                  });
                },
                onSelect: (value) {
                  setState(() {
                    _selectedProvince = value;
                    _selectedMunicipality = '';
                    _selectedBarangay = '';
                    _showProvince = false;
                    _showMunicipality = false;
                    _showBarangay = false;
                  });
                },
              ),
              const SizedBox(height: 10),

              // MUNICIPALITY
              _buildLabel('MUNICIPALITY / CITY *'),
              const SizedBox(height: 4),
              _buildDropdown(
                value: _selectedMunicipality,
                hint: 'Select municipality',
                isOpen: _showMunicipality,
                items: _getMunicipalities(),
                isDisabled: _selectedProvince.isEmpty,
                onToggle: () {
                  if (_selectedProvince.isEmpty) {
                    _showAlert('Please select a province first.');
                  } else {
                    setState(() {
                      _showMunicipality = !_showMunicipality;
                      _showProvince = false;
                      _showBarangay = false;
                    });
                  }
                },
                onSelect: (value) {
                  setState(() {
                    _selectedMunicipality = value;
                    _selectedBarangay = '';
                    _showMunicipality = false;
                    _showBarangay = false;
                  });
                },
              ),
              const SizedBox(height: 10),

              // BARANGAY
              _buildLabel('BARANGAY *'),
              const SizedBox(height: 4),
              _buildDropdown(
                value: _selectedBarangay,
                hint: 'Select barangay',
                isOpen: _showBarangay,
                items: _getBarangays(),
                isDisabled: _selectedMunicipality.isEmpty,
                onToggle: () {
                  if (_selectedMunicipality.isEmpty) {
                    _showAlert('Please select a municipality first.');
                  } else {
                    setState(() {
                      _showBarangay = !_showBarangay;
                      _showProvince = false;
                      _showMunicipality = false;
                    });
                  }
                },
                onSelect: (value) {
                  setState(() {
                    _selectedBarangay = value;
                    _showBarangay = false;
                  });
                },
              ),
              const SizedBox(height: 16),

              // ============================================================
              // MANUAL ADDRESS
              // ============================================================
              _buildSectionTitle('MANUAL ADDRESS'),
              const SizedBox(height: 6),

              // HOUSE / UNIT NUMBER
              _buildLabel('HOUSE / UNIT NUMBER'),
              const SizedBox(height: 4),
              _buildTextField(
                controller: _houseNumberController,
                hintText: '123',
              ),
              const SizedBox(height: 10),

              // STREET
              _buildLabel('STREET'),
              const SizedBox(height: 4),
              _buildTextField(
                controller: _streetController,
                hintText: 'Sampaguita Street',
              ),
              const SizedBox(height: 10),

              // OTHER DETAILS
              _buildLabel('OTHER DETAILS'),
              const SizedBox(height: 4),
              _buildTextField(
                controller: _otherDetailsController,
                hintText: 'Near the plaza...',
                maxLines: 2,
              ),
              const SizedBox(height: 28),

              // ============================================================
              // CONTINUE BUTTON
              // ============================================================
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
  // SECTION TITLE
  // ============================================================
  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  // ============================================================
  // LABEL
  // ============================================================
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
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
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        maxLines: maxLines,
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
  // DROPDOWN
  // ============================================================
  Widget _buildDropdown({
    required String value,
    required String hint,
    required bool isOpen,
    required List<String> items,
    required VoidCallback onToggle,
    required Function(String) onSelect,
    bool isDisabled = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: isDisabled ? null : onToggle,
          child: Container(
            decoration: BoxDecoration(
              color: isDisabled ? AppColors.lightGray : AppColors.white,
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value.isEmpty ? hint : value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color:
                          value.isEmpty ? AppColors.gray : AppColors.darkGray,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Icon(
                  isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
        if (isOpen && items.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            constraints: const BoxConstraints(maxHeight: 150),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () => onSelect(item),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == items.length - 1
                              ? Colors.transparent
                              : AppColors.lightGray,
                        ),
                      ),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.darkGray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
