import 'package:receipts/config/routes/app_page.dart';

class AppRoutingState {
  final AppPageSlug pageSlug;
  final Map<String, dynamic>? args;

  AppRoutingState({required this.pageSlug, this.args});
}
