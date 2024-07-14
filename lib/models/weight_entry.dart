import 'package:my_fitness/models/base_model.dart';

class WeightEntry extends BaseModel {
  final double weight;
  final DateTime date;

  WeightEntry({
    super.id,
    required this.weight,
    required this.date,
  });

  WeightEntry copyWith({
    int? id,
    double? weight,
    DateTime? date,
  }) {
    return WeightEntry(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      date: date ?? this.date,
    );
  }
}
