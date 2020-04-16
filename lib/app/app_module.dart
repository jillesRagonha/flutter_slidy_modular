import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy_modular/app/app_controller.dart';
import 'package:flutter_slidy_modular/app/app_widget.dart';
import 'package:flutter_slidy_modular/app/pages/home/home_controller.dart';
import 'package:flutter_slidy_modular/app/pages/home/home_page.dart';
import 'package:flutter_slidy_modular/app/pages/other/other_page.dart';
import 'package:flutter_slidy_modular/app/shared/repository/poke_repository.dart';
import 'package:flutter_slidy_modular/app/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/other',
          child: (_, args) => OtherPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
