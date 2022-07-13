import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterboilerplatemodularcubit/app/modules/product/controllers/post_fetch_cubit.dart';

import '../repository/api_repository.dart';
import '../service/api_service.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({ Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchPostApi(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
        ),
        body: Row(
          children: [
            Container(
              color: Colors.grey[200],
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Red"),
                    onTap: () {
                      Modular.to.navigate('./red');
                    },
                  ),
                  ListTile(
                    title: const Text("Blue"),
                    onTap: () {
                      Modular.to.navigate('./blue');
                    },
                  ),
                  ListTile(
                    title: const Text("Yellow"),
                    onTap: () {
                      Modular.to.navigate('./yellow');
                    },
                  )
                ],
              ),
            ),
            // Center(
            //   child: BlocBuilder<PostFetchCubit, PostFetchCubitState>(
            //     // ignore: missing_return
            //     builder: (context, state) {
            //       if (state is PostFetchLoading) {
            //         return const CircularProgressIndicator();
            //       } else if (state is PostFetchError) {
            //         return Text(state.failure.message);
            //       } else if (state is PostFetchLoaded) {
            //         final postList = state.postList;
            //         return postList.isEmpty
            //             ? const Text("No any posts")
            //             : ListView.builder(
            //                 itemCount: postList.length,
            //                 itemBuilder: (context, index) {
            //                   final Post singlePost = postList[index];
            //                   return ListTile(
            //                     leading: CircleAvatar(
            //                       child: Text(singlePost.id.toString()),
            //                     ),
            //                     title: Text(singlePost.title),
            //                     subtitle: Text(singlePost.body),
            //                   );
            //                 },
            //               );
            //       }
            //     },
            //   ),
            // ),
            const Expanded(child: RouterOutlet()),
          ],
        ),
      ),
    );
  }
}

//     BlocBuilder<PostFetchCubit, PostFetchCubitState>(
//   // ignore: missing_return
//   builder: (context, state) {
//     if (state is PostFetchLoading) {
//       return const CircularProgressIndicator();
//     } else if (state is PostFetchError) {
//       return Text(state.failure.message);
//     } else if (state is PostFetchLoaded) {
//       final postList = state.postList;
//       return postList.isEmpty
//           ? Text("No any posts")
//           : ListView.builder(
//               itemBuilder: (context, index) {
//                 final Post singlePost = postList[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(singlePost.id.toString()),
//                   ),
//                   title: Text(singlePost.title),
//                   subtitle: Text(singlePost.body),
//                 );
//               },
//             );
//     }
//   },
// ),

// MultiBlocProvider(
//   providers: [
//     BlocProvider<PostFetchCubit>(
//       create: (context) => PostFetchCubit(
//         apiRepository: ApiRepository(
//           apiService: apiService,
//         ),
//       )..fetchPostApi()
//     )
//   ],
// )
