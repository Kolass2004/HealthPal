class TextFieldModel {
  String hint, icon;
  Function(String?)? onSaved;
  String? Function(String?)? validator;

  TextFieldModel({
    required this.hint,
    required this.icon,
    this.onSaved,
    this.validator,
  });
}
