import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/lang_provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('tr'),
  ];
 

  static String getText(BuildContext context,
      {String? ar, String? en, String? tr}) {
    String local = Provider.of<localeProvider>(context).locale.toString();
    String? transalte;
    switch (local) {
      case "tr":
        transalte = tr!;
        break;
      case "en":
        transalte = en!;
        break;
      default:
        transalte = ar!;
    }
    return transalte;
  }
}
