import 'package:flutter/material.dart';
import 'package:map_assignment/src/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await AssigmentApp.create();
  runApp(app);
}
