class Const {

  static const String RESULT_OK = "OK";
  static const String RESULT_CANCEL = "CANCEL";
  static const String STATUS = "status";
  static const String SUCCESS = "success";
  static const String FAILED = "failed";
  static const String MESSAGE = "message";

  static const String INTERNET_CONNECTION = "PLEASE CHECK YOUR INTERNET";
  static const String NETWORK_ISSUE = "PLEASE CHECK YOUR INTERNET";
  static const String PLACE_HOLDER = "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png";

}
extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}
