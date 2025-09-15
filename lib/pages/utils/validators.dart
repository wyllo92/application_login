class Validators {
  static final RegExp _emailReg = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');
  static final RegExp _passwordReg = RegExp(
    r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,16}$',
  );

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingrese un correo';
    }
    if (!_emailReg.hasMatch(value.trim())) {
      return 'Ingrese un correo válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese la contraseña';
    }
    if (!_passwordReg.hasMatch(value)) {
      return 'La contraseña debe tener 8-16 caracteres, al menos 1 dígito, 1 minúscula, 1 mayúscula y 1 carácter especial';
    }
    return null;
  }
}
