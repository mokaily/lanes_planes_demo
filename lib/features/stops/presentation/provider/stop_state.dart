import 'package:equatable/equatable.dart';
import '../../domain/entities/stop.dart';

abstract class StopState extends Equatable {
  const StopState();

  @override
  List<Object?> get props => [];
}

class StopInitial extends StopState {}

class StopLoading extends StopState {}

class StopLoaded extends StopState {
  final List<Stop> stops;

  const StopLoaded(this.stops);

  @override
  List<Object?> get props => [stops];
}

class StopEmpty extends StopState {}

class StopError extends StopState {
  final String message;

  const StopError(this.message);

  @override
  List<Object?> get props => [message];
}
