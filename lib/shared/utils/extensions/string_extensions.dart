extension StringExtensions on String {
  bool isValidUuid() {
    final regex = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$');
    return regex.hasMatch(this);
  }

  String cleanText() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }
}
