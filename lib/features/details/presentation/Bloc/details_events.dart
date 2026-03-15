abstract class DetailsEvents {}

class getDetails extends DetailsEvents{
dynamic id;
  getDetails(this.id);
}
class getSuggest extends DetailsEvents{
  dynamic id;
  getSuggest(this.id);
}
class AddToFav extends DetailsEvents{
  dynamic id;
  AddToFav(this.id);
}