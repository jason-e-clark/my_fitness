import 'package:drift/drift.dart';
import 'package:my_fitness/data/database.dart';
import 'package:my_fitness/data/repositories/weight_repository.dart';
import 'package:my_fitness/models/weight_entry.dart';

class SqliteWeightRepository implements WeightRepository {
  final AppDatabase _database = AppDatabase();

  @override
  Future insertItem(WeightEntry entry) async {
    await _database.into(_database.weightEntries).insert(
          WeightEntriesCompanion(
            date: Value(entry.date),
            weight: Value(entry.weight),
          ),
        );
  }

  @override
  Future<List<WeightEntry>> getItems() async {
    final entries = await _database.select(_database.weightEntries).get();

    return entries
        .map((e) => WeightEntry(id: e.id, date: e.date, weight: e.weight))
        .toList();
  }

  @override
  Future updateItem(WeightEntry entry) async =>
      await _database.update(_database.weightEntries).replace(
            WeightEntriesCompanion(
              date: Value(entry.date),
              weight: Value(entry.weight),
            ),
          );

  @override
  Future deleteItem(int id) async =>
      (_database.delete(_database.weightEntries)..where((t) => t.id.equals(id)))
          .go();
}
