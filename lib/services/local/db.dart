import 'package:objectbox/objectbox.dart';
import 'package:private_app/data/models/posts.dart';
import 'package:private_app/objectbox.g.dart';

class DbService {
  late Store store;
  late Box<Posts> box;

  Future<void> init() async {
    store = await openStore(directory: 'private-app');
    box = store.box();
  }

  List<Posts> getAllPost() {
    return box.getAll();
  }

  void pickImage() {}

  void addPost(Posts post) {
    box.put(post);
  }

  void changePost(Posts post) {
    box.put(post);
  }

  void removePost(Posts post) {
    box.remove(post.id);
  }
}
