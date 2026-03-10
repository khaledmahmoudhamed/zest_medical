import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'rating_model.g.dart';

@HiveType(typeId: 1)
class RatingModel extends Equatable {
  @HiveField(0)
  final double rating;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String dateTime;

  const RatingModel({
    required this.text,
    required this.rating,
    required this.dateTime,
  });

  List<RatingModel> ratingFun() {
    return [
      RatingModel(
        text:
            'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
        rating: 3.5,
        dateTime: "25/2",
      ),
    ];
  }

  @override
  List<Object> get props => [rating, text, dateTime];
}
