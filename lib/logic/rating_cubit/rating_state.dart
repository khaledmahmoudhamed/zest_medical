import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zest_medical/data/models/user_model/rating_model.dart';

class RatingState extends Equatable {
  final List<RatingModel> reviews;
  const RatingState({this.reviews = const []});
  @override
  List<Object?> get props => [reviews];
}
