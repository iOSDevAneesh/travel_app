import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_buddy/ApiServices/api_services.dart';
import 'package:travel_buddy/cubit/app_cubit_logics.dart';
import 'package:travel_buddy/cubit/app_cubits.dart';
import 'package:travel_buddy/features/travel_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider<AppCubit>(
          create: (context) => AppCubit(data: ApiClient()),
          child: const AppCubitLogics(),
        ));
  }
}
