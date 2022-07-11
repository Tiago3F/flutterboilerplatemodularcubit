import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Importação de paginas
import 'views/list_product_page.dart';
import 'views/product_page.dart';

class ProductModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ProductPage(), children: [
          ChildRoute(
            '/red',
            child: (_, __) => Container(
              color: Colors.red,
            ),
            transition: TransitionType.noTransition,
          ),
          ChildRoute(
            '/blue',
            child: (_, __) => Container(
              color: Colors.blue,
            ),
            transition: TransitionType.noTransition,
          ),
          ChildRoute(
            '/yellow',
            child: (_, __) => Container(
              color: Colors.yellow,
            ),
            transition: TransitionType.noTransition,
          )
        ]),
        ChildRoute(
          '/list',
          child: (_, args) => ListProductPage(id: args.data ?? ''),
          // Animação das rotas
          transition: TransitionType.fadeIn,
          // duration: const Duration(seconds: 1)
        ),
      ];
}
