import 'package:flutter/cupertino.dart';

//https://tutorialmore.com/questions-1167387.htm参考にして作ったけど意味なし

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();
  @override
  bool isSupported(Locale locale) => true;
  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      DefaultCupertinoLocalizations.load(locale);
  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}