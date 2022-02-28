part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {}

class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistorySuccessful extends HistoryState {
  HistoryResponse historyResponse;

  HistorySuccessful({
    required this.historyResponse,
  });

  @override
  List<Object> get props => [historyResponse];
}

class HistoryError extends HistoryState {
  final String error;

  HistoryError({required this.error});

  @override
  List<Object> get props => [error];
}
