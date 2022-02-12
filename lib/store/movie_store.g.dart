// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _HackerNewsStore, Store {
  final _$discoverMoviesAtom = Atom(name: '_HackerNewsStore.discoverMovies');

  @override
  ObservableFuture<List<Movie>>? get discoverMovies {
    _$discoverMoviesAtom.reportRead();
    return super.discoverMovies;
  }

  @override
  set discoverMovies(ObservableFuture<List<Movie>>? value) {
    _$discoverMoviesAtom.reportWrite(value, super.discoverMovies, () {
      super.discoverMovies = value;
    });
  }

  final _$_HackerNewsStoreActionController =
      ActionController(name: '_HackerNewsStore');

  @override
  Future<dynamic> fetchDiscover() {
    final _$actionInfo = _$_HackerNewsStoreActionController.startAction(
        name: '_HackerNewsStore.fetchDiscover');
    try {
      return super.fetchDiscover();
    } finally {
      _$_HackerNewsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
discoverMovies: ${discoverMovies}
    ''';
  }
}
