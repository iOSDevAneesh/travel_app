import 'package:bloc/bloc.dart';
import 'package:travel_buddy/ApiServices/api_services.dart';
import 'package:travel_buddy/Model/data_model.dart';
import 'package:travel_buddy/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialStates()) {
    emit(WelcomeStates());
  }

  final ApiClient data;
  late final places;

  getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e.toString());
    }
  }

  navigateToDetailPage(DataModel data) {
    emit(DetailPageState(data));
  }
  
  navigateToHome(){
    emit(LoadedState(places));
  }
}
