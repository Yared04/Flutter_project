
abstract class AdminEvents{}

class DeletePost extends AdminEvents{
  final int id;

  DeletePost(this.id);
}
class Confirmation extends AdminEvents{
  bool sure;

  Confirmation(this.sure);
}