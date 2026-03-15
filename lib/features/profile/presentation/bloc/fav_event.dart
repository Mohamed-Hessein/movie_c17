abstract class FavEvent {}
class AddToFav extends FavEvent{
  dynamic id;
  AddToFav(this.id);
}
class getFav extends FavEvent{

  getFav();
}