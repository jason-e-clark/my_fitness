import 'package:get_it/get_it.dart';
import 'package:my_fitness/blocs/weight_tracker/weight_tracker_bloc.dart';
import 'package:my_fitness/data/repositories/sqlite/sqlite_weight_repository.dart';
import 'package:my_fitness/data/repositories/weight_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<WeightRepository>(() => SqliteWeightRepository());
  getIt.registerLazySingleton<WeightTrackerBloc>(
    () => WeightTrackerBloc(repository: getIt()),
  );
}
