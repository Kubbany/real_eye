import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/Features/posts/domain/repos/comments_repo.dart';
import 'package:real_eye/Features/posts/presentation/manager/comments_cubit/comments_cubit.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comments_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as PostEntity;
    return BlocProvider(
      create: (context) => CommentsCubit(getIt<CommentsRepo>())..getComments(extra.id),
      child: Scaffold(
        body: SafeArea(
          child: CommentsViewBody(
            post: extra,
          ),
        ),
      ),
    );
  }
}
