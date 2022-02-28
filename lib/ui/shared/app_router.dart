import 'package:dex/ui/screens/history_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static String history = '/history';

  static Map<String, WidgetBuilder> routes = {
    history: (context) => const HistoryScreen()
  };
}
