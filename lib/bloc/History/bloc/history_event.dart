part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class FetchHistory extends HistoryEvent {
  List<Object> get props => [];
}
