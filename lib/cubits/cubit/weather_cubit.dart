import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  String? cityName;
  final WeatherService weatherService;
  WeatherModel? weatherModel;
  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (_) {
      emit(WeatherFailureState());
    }
  }
}
