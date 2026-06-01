class BaseUrl {
  static const String baseUrl = "http://10.0.2.2:3000";

  static Uri parseUri(String endpoint) {
    return Uri.parse("$baseUrl/$endpoint");
  }
}
