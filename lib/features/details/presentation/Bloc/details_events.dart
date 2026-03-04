abstract class DetailsEvents {}

class getDetails extends DetailsEvents{
dynamic id;
  getDetails(this.id);
}
class getSuggest extends DetailsEvents{
  dynamic id;
  getSuggest(this.id);
}