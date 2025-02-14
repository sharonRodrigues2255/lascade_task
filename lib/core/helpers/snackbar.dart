import 'package:flutter/material.dart';

import '../../main.dart';

globalSnackBar(String toastMessage) {
  ScaffoldMessenger.of(rootNavigatorKey.currentContext!)
      .showSnackBar(SnackBar(content: Text(toastMessage)));
}
