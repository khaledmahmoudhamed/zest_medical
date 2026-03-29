import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/data/models/user_model/rating_model.dart';
import 'package:zest_medical/logic/rating_cubit/rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingState()) {
    loadReview();
  }

  void loadReview() {
    final cachedReviews = CacheHelper.user!.get("reviews");
    if (cachedReviews != null) {
      emit(RatingState(reviews: List<RatingModel>.from(cachedReviews)));
    }
  }

  void addReview(String text, double rate) async {
    final newRate = RatingModel(
      text: text,
      rating: rate,
      dateTime:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
    );

    final updatedList = List<RatingModel>.from(state.reviews)..add(newRate);
    emit(RatingState(reviews: updatedList));
    await CacheHelper.user!.put("reviews", updatedList);
  }
}
