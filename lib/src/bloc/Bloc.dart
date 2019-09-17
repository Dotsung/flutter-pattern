import 'package:english_words/english_words.dart';
import 'dart:async';

class Bloc {
  Set<WordPair> saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _savedController.stream;

  get addCorrendSaved => _savedController.sink.add(saved);

  addToOrRemoveFromSavedList(WordPair item) {
    if (saved.contains(item)) {
      saved.remove(item);
    } else {
      saved.add(item);
    }

    _savedController.sink.add(saved);
  }

  dispose() {
    _savedController.close();
  }
}

var bloc = Bloc();
