import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/product/product_module.dart';
import 'splash_page.dart';


class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    ModuleRoute('/auth', module: AuthModule()),
     ModuleRoute('/home', module: HomeModule()),
    ModuleRoute(
      '/products', module: ProductModule(),
      // guards: [AuthGuard()]
    ),
    WildcardRoute(
        child: (_, __) => const Scaffold(
              body: Center(child: Text("A página não existe!")),
            )),
  ];
}
