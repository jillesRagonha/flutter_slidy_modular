import 'package:dio/dio.dart';
import 'package:flutter_slidy_modular/app/shared/model/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> lista = [];
    

    for (var item in (response.data['results']) as List) {
      PokemonModel pokemon = PokemonModel(item['name']);
      lista.add(pokemon);
    }


    return lista;

  }
}
