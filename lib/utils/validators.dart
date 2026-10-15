// lib/utils/validators.dart

class AppValidators {
  // ============================================================
  // EMAIL
  // ============================================================
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w\.\-]+@[\w\-]+\.[\w\.\-]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if (value.length > 100) {
      return 'Email is too long';
    }
    return null;
  }

  // ============================================================
  // PASSWORD
  // ============================================================
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain at least 1 letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least 1 number';
    }
    if (value.length > 30) {
      return 'Password is too long (max 30 characters)';
    }
    return null;
  }

  // ============================================================
  // CONFIRM PASSWORD
  // ============================================================
  static String? confirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // ============================================================
  // PASSWORD STRENGTH
  // ============================================================
  static String passwordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 6) return 'Weak';
    if (password.length < 8) return 'Fair';

    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasSpecial = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);

    if (hasLetter && hasNumber && hasSpecial && password.length >= 10) {
      return 'Strong';
    }
    if (hasLetter && hasNumber && password.length >= 8) {
      return 'Good';
    }
    return 'Fair';
  }
}
