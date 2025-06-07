// features/chat/presentation/widgets/chat_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/manager/cubits/chat_cubit/chat_cubit.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/message_bubble.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatError) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final messages = context.read<ChatCubit>().messages;
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[messages.length - 1 - index];
            return MessageBubble(message: message);
          },
        );
      },
    );
  }
}
