import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImp implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImp({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByUser(String userId) {
    // TODO: implement getTrendingVideosByUser
    throw UnimplementedError();
  }
}
