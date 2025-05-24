import 'package:dio/dio.dart';
import 'package:real_eye/Features/authentication/data/models/login_request.dart';
import 'package:real_eye/Features/authentication/data/models/login_response.dart';
import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:real_eye/Features/create_post/data/models/create_post_request.dart';
import 'package:real_eye/Features/create_post/data/models/create_post_response.dart';
import 'package:real_eye/Features/posts/data/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.2:5555/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('/contact')
  Future<void> postMessage(@Body() MessageModel message);

  @POST('/auth/register')
  Future<void> postRegister(@Body() RegisterRequest userRequest);

  @POST('/auth/login')
  Future<LoginResponse> postLogin(@Body() LoginRequest loginRequest);

  @GET('/users/user')
  Future<UserModel> getCurrentUser();

  @GET("posts")
  Future<List<PostModel>> getPosts(@Header("Authorization") String token);

  @POST('posts')
  Future<CreatePostResponse> createPost(@Header('Authorization') String token, @Body() CreatePostRequest request);
}
