import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialClass()) {
    emit(WelcomeState());
  }
}
