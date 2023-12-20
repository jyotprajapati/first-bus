import 'package:intl/intl.dart';
extension FormatExtension on DateTime{
  String busTimeFormat() {
    // use intl package to format to 24 hour time
    return DateFormat('HH:mm').format(this);
    
  }
}