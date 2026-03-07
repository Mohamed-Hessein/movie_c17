import '../../../search/data/model/search_model.dart';

abstract class BrowserEvent {}
class getBrowserChips extends BrowserEvent{

  getBrowserChips();

}
class FilterByGenreEvent extends BrowserEvent{

  dynamic selectedGenre;
  FilterByGenreEvent(this.selectedGenre);

}