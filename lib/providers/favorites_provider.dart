import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hyper_car_showcase/models/car.dart';

class FavoriteCarsNotifier extends StateNotifier<List<Car>> {
  FavoriteCarsNotifier() : super([]);

  bool toggleCarFavoriteStatus(Car car) {
    final carIsFavorite =
        state.any((c) => c.model == car.model && c.brand == car.brand);

    if (carIsFavorite) {
      state = state
          .where((c) => c.model != car.model || c.brand != car.brand)
          .toList();
      return false;
    } else {
      if (!state.any((c) => c.model == car.model && c.brand == car.brand)) {
        state = [...state, car];
        return true;
      }
      return false;
    }
  }
}

final favoriteCarsProvider =
    StateNotifierProvider<FavoriteCarsNotifier, List<Car>>((ref) {
  return FavoriteCarsNotifier();
});
