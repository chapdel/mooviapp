
import 'package:mobx/mobx.dart';
import 'package:mooviapp/models/movie.dart';
import 'package:mooviapp/utils/api.dart';

part 'movie_store.g.dart';


class MovieStore = _HackerNewsStore with _$MovieStore;

abstract class _HackerNewsStore with Store {
  final _Api = Api();

  @observable
  ObservableFuture<List<Movie>>? discoverMovies;


  @action
  Future fetchDiscover() => discoverMovies = ObservableFuture(_Api.discover().then((List<Movie> result) {
    print(result);
    return result;
  }));
}
