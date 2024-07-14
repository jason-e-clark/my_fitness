import 'package:drift/drift.dart';
import 'package:my_fitness/models/weight_entry.dart';

@UseRowClass(WeightEntry)
class WeightEntries extends Table with AutoIncrementingPrimaryKey {
  DateTimeColumn get date => dateTime()();
  RealColumn get weight => real()();
}

// Tables can mix-in common definitions if needed
mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().nullable().autoIncrement()();
}
