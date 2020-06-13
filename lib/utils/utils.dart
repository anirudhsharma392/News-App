class Utils{

  String parseDateTime(value) {
    try {
      final DateTime _dateTime = DateTime.parse(value);

      return "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}";
    } catch (e) {
      print('Error while parsing date and time');
      print(e);
      return "";
    }
  }
}
final Utils utils = new Utils();