import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_logic.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/themes.dart';
import 'package:travel_app/services/date_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: textTheme),
      home: BlocProvider<AppCubits>(
        create: (context) {
          return AppCubits(data: DataServices());
        },
        child: const AppCubitLogic(),
      ),
    );
  }
}
