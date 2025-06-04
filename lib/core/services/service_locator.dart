import 'package:get_it/get_it.dart';
import 'package:real_eye/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/Features/chat_fake_detection/data/repos/chat_fake_detection_repo_impl.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/Features/contact_us/data/repos/contact_us_repo_impl.dart';
import 'package:real_eye/Features/contact_us/domain/repos/contact_us_repo.dart';
import 'package:real_eye/Features/create_post/data/repos/create_post_repo_impl.dart';
import 'package:real_eye/Features/create_post/domain/entities/create_post_repo.dart';
import 'package:real_eye/Features/posts/data/repos/comments_repo_impl.dart';
import 'package:real_eye/Features/posts/data/repos/posts_repo_impl.dart';
import 'package:real_eye/Features/posts/domain/repos/comments_repo.dart';
import 'package:real_eye/Features/posts/domain/repos/posts_repo.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/services/dio_factory.dart';
import 'package:real_eye/core/services/flask_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      DioFactory.getDio(),
    ),
  );
  getIt.registerSingleton<FlaskService>(
    FlaskService(
      DioFactory.getDio(),
    ),
  );
  getIt.registerSingleton<ContactUsRepo>(
    ContactUsRepoImpl(
      api: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      api: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<PostsRepo>(
    PostsRepoImpl(
      api: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<CreatePostRepo>(
    CreatePostRepoImpl(
      api: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<CommentsRepo>(
    CommentsRepoImpl(
      api: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<ChatFakeDetectionRepo>(
    ChatFakeDetectionRepoImpl(
      flaskApi: getIt<FlaskService>(),
    ),
  );
}
