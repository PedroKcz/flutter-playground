extension StringExtension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
}
