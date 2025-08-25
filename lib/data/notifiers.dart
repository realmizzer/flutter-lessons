// ValueNotifier: hold the data
// ValueListenableBulider: listen to the data (dont need the setstate)

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
