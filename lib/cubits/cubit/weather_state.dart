part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
