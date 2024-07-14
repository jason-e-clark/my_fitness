import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_fitness/data/repositories/weight_repository.dart';
import 'package:my_fitness/models/weight_entry.dart';

part 'weight_tracker_event.dart';
part 'weight_tracker_state.dart';

class WeightTrackerBloc extends Bloc<WeightTrackerEvent, WeightTrackerState> {
  final WeightRepository repository;

  WeightTrackerBloc(this.repository) : super(WeightTrackerInitial()) {
    on<LoadWeightEntries>(_onLoadWeightEntries);
    on<AddWeightEntry>(_onAddWeightEntry);
    on<UpdateWeightEntry>(_onUpdateWeightEntry);
    on<DeleteWeightEntry>(_onDeleteWeightEntry);
  }

  Future<void> _onLoadWeightEntries(
      LoadWeightEntries event, Emitter<WeightTrackerState> emit) async {
    emit(WeightTrackerLoading());
    try {
      final entries = await repository.getItems();
      emit(WeightTrackerLoaded(entries));
    } catch (e) {
      emit(WeightTrackerError(e.toString()));
    }
  }

  Future<void> _onAddWeightEntry(
      AddWeightEntry event, Emitter<WeightTrackerState> emit) async {
    try {
      await repository.insertItem(event.entry);
      add(LoadWeightEntries());
    } catch (e) {
      emit(WeightTrackerError(e.toString()));
    }
  }

  Future<void> _onUpdateWeightEntry(
      UpdateWeightEntry event, Emitter<WeightTrackerState> emit) async {
    try {
      await repository.updateItem(event.entry);
      add(LoadWeightEntries());
    } catch (e) {
      emit(WeightTrackerError(e.toString()));
    }
  }

  Future<void> _onDeleteWeightEntry(
      DeleteWeightEntry event, Emitter<WeightTrackerState> emit) async {
    try {
      await repository.deleteItem(event.entry.id!);
      add(LoadWeightEntries());
    } catch (e) {
      emit(WeightTrackerError(e.toString()));
    }
  }
}
