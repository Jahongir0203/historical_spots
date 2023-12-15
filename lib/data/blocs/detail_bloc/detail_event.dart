part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class DetailLoadedEvent extends DetailEvent {
  final String xid;

  DetailLoadedEvent(this.xid);
}
