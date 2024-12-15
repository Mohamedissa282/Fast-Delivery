import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
   Locale _locale = Locale('fr');
  Locale get local => _locale;
  void changeLanguage(String _languageCode){
    _locale = Locale(_languageCode);
    notifyListeners();
  }
}