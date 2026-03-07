abstract class HistoryEvent {}
class HistorySave extends HistoryEvent{
dynamic id;
  HistorySave(this.id);
}class HistoryGet extends HistoryEvent{

}
