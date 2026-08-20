
import 'package:bloc_statemanagement_demo/cubit/info_package_cubit.dart';
import 'package:bloc_statemanagement_demo/ui/pages/launcher_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => InfoPackageCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
    );
  }
}