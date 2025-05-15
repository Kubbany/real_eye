import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:real_eye/Features/contact_us/domain/repos/contact_us_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'contact_us_state.dart';
part 'contact_us_cubit.freezed.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool ignoreValidation = false;
  ContactUsCubit(this.contactUsRepo) : super(const ContactUsState.initial());
  final ContactUsRepo contactUsRepo;
  Future<void> sendMessage() async {
    ignoreValidation = false;
    if (formKey.currentState!.validate()) {
      safeEmit(const ContactUsState.loading());
      final MessageModel messageModel = MessageModel(fullname: fullName.text, email: email.text, message: message.text);
      final result = await contactUsRepo.sendMessage(message: messageModel);

      switch (result) {
        case Success():
          fullName.clear();
          email.clear();
          message.clear();
          ignoreValidation = true;
          safeEmit(const ContactUsState.success());
        case Fail(:final fail):
          safeEmit(ContactUsState.failure(fail.errorMessage));
      }
    }
  }

  @override
  Future<void> close() async {
    super.close();
    fullName.dispose();
    email.dispose();
    message.dispose();
  }
}
