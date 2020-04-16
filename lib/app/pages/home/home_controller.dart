import 'package:flutter_slidy_modular/app/shared/model/pokemon_model.dart';
import 'package:flutter_slidy_modular/app/shared/repository/poke_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository pokeRepository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;
  
  _HomeControllerBase(this.pokeRepository){
    pokemons = pokeRepository.getAllPokemons().asObservable();
  }


}
