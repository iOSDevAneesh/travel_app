
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_buddy/cubit/app_cubit_states.dart';
import 'package:travel_buddy/cubit/app_cubits.dart';
import 'package:travel_buddy/features/navigation_pages/home_page.dart';
import 'package:travel_buddy/features/travel_detail_page.dart';
import 'package:travel_buddy/features/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if(state is WelcomeStates){
            return const WelcomePage();
          } if(state is DetailPageState){
            return const DetailPage();
          } if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(),);
          } if(state is LoadedState){
            return const HomePage();
          }else{
            return Container(child: const Center(child: Text("no data found")),);
          }
        },
      ),
    );
  }
}
