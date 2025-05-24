import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/posts/domain/repos/posts_repo.dart';
import 'package:real_eye/Features/posts/presentation/manager/post_cubit/posts_cubit.dart';
import 'package:real_eye/Features/profile/presentation/widgets/profile_posts_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class ProfilePostsView extends StatelessWidget {
  const ProfilePostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as UserModel;
    return BlocProvider(
      create: (context) => PostsCubit(getIt<PostsRepo>())..getCurrentUserPost(),
      child: Scaffold(
        drawer: UserDrawer(user: extra),
        body: const ProfilePostsViewBody(),
      ),
    );
  }
}
