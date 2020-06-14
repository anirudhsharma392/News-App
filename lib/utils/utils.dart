class Utils{

  ///parse the date time into correct format
  String parseDateTime(value) {
    try {
      final DateTime _dateTime = DateTime.parse(value);

      return "${monthIntToString(_dateTime.month)} ${_dateTime.day}, ${_dateTime.year}";
    } catch (e) {
      print('Error while parsing date and time');
      print(e);
      return "";
    }
  }

  ///return the month string from int
  String monthIntToString(int value) {
    String month;
    switch (value) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "Jun";
        break;
      case 7:
        month = "Jul";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sept";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
      default:
        month = "";
        break;
    }
    return month;
  }
}
final Utils utils = new Utils();