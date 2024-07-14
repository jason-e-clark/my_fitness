part of 'weight_tracker_bloc.dart';

abstract class WeightTrackerState {}

class WeightTrackerInitial extends WeightTrackerState {}

class WeightTrackerLoading extends WeightTrackerState {}

class WeightTrackerLoaded extends WeightTrackerState {
  final List<WeightEntry> entries;

  WeightTrackerLoaded(this.entries);
}

class WeightTrackerError extends WeightTrackerState {
  final String message;

  WeightTrackerError(this.message);
}
