import 'dart:async';

import 'package:rxdart/subjects.dart';

class MainBlock {
  final BehaviorSubject<MainPageState> stateSubject = BehaviorSubject();

  Stream<MainPageState> observeMainPageState() => stateSubject;

  MainBlock() {
    stateSubject.add(MainPageState.noFavorites);
  }

  void nextState() {
    final currentState = stateSubject.value;
    final nextState = MainPageState.values[
        (MainPageState.values.indexOf(currentState) + 1) %
            MainPageState.values.length];
    stateSubject.add(nextState);
  }

  void dispose() {
    stateSubject.close();
  }
}

enum MainPageState {
  noFavorites,
  minSymbols,
  loading,
  nothingFound,
  loadingError,
  searchResult,
  favorites,
}
