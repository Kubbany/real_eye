import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/manager/cubits/chat_cubit/chat_cubit.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/chat_fake_detection_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class ChatFakeDetectionView extends StatelessWidget {
  const ChatFakeDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as UserModel;
    return BlocProvider(
      create: (context) => ChatCubit(chatFakeDetectionRepo: getIt<ChatFakeDetectionRepo>()),
      child: Scaffold(
        drawer: UserDrawer(
          user: extra,
        ),
        body: const ChatFakeDetectionViewBody(),
      ),
    );
  }
}
