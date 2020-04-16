import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy_modular/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.pokemons.error != null) {
            return Center(
              child: Text("Erro"),
            );
          }

          if (controller.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = controller.pokemons.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(list[index].name),
              );
            }, 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed('/other');
        },
      ),
    );
  }
}
