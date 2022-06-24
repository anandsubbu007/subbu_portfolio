import 'package:url_launcher/url_launcher_string.dart';

class Functions {
  static void launchUrl(String url) async {
    await launchUrlString(url);
  }
}
