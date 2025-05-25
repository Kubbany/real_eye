part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsStateInitial extends ContactUsState {}

final class ContactUsStateLoading extends ContactUsState {}

final class ContactUsStateSuccess extends ContactUsState {}

final class ContactUsStateFailure extends ContactUsState {
  final String errorMessage;

  ContactUsStateFailure({required this.errorMessage});
}
