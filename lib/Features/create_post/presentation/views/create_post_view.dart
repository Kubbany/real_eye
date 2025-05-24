import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/create_post/domain/entities/create_post_repo.dart';
import 'package:real_eye/Features/create_post/presentation/managers/create_post_cubit/create_post_cubit.dart';
import 'package:real_eye/Features/create_post/presentation/widgets/create_post_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as UserModel;
    return BlocProvider(
      create: (context) => CreatePostCubit(getIt<CreatePostRepo>()),
      child: Scaffold(
        drawer: UserDrawer(
          user: extra,
        ),
        body: const CreatePostViewBody(),
      ),
    );
  }
}
