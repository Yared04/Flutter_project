import 'package:meta/meta.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:gada_ethiopia_mobile/posts/data_provider/post_data_provider.dart';

class PostRepository {
  final PostDataProvider dataProvider;

  PostRepository({required this.dataProvider});

  Future<Post?> createPost(Post post) async {
    return await dataProvider.createPost(post);
  }
}
// class CourseRepository {
//   final CourseDataProvider dataProvider;

//   CourseRepository({@required this.dataProvider})
//       : assert(dataProvider != null);

//   Future<Course> createCourse(Course course) async {
//     return await dataProvider.createCourse(course);
//   }

//   Future<List<Course>> getCourses() async {
//     return await dataProvider.getCourses();
//   }

//   Future<void> updateCourse(Course course) async {
//     await dataProvider.updateCourse(course);
//   }

//   Future<void> deleteCourse(String id) async {
//     await dataProvider.deleteCourse(id);
//   }
// }
