String? fullNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Esse campo é obrigatório';
  } else if (value.split(' ').length < 2 || value.length < 10) {
    return 'Precisamos do seu nome completo';
  }

  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Esse campo é obrigatório';
  } else if (value.length != 20) {
    return 'Número incorreto';
  }

  return null;
}
