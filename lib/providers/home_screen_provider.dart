import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenState extends StateNotifier<int> {
  HomeScreenState() : super(0);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}

final homeScreenProvider = StateNotifierProvider<HomeScreenState, int>((ref) {
  return HomeScreenState();
});
