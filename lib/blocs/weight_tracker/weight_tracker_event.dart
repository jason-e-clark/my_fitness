part of 'weight_tracker_bloc.dart';

abstract class WeightTrackerEvent {}

class LoadWeightEntries extends WeightTrackerEvent {}

class AddWeightEntry extends WeightTrackerEvent {
  final WeightEntry entry;

  AddWeightEntry(this.entry);
}

class UpdateWeightEntry extends WeightTrackerEvent {
  final WeightEntry entry;

  UpdateWeightEntry(this.entry);
}

class DeleteWeightEntry extends WeightTrackerEvent {
  final WeightEntry entry;

  DeleteWeightEntry(this.entry);
}
