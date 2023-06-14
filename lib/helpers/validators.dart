bool validarEmail(String email) {
  final RegExp regex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
  );
  return regex.hasMatch(email);
}
