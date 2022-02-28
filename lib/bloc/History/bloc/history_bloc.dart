import 'package:bloc/bloc.dart';
import 'package:dex/models/response/history_response.dart';
import 'package:dex/repository/history_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _historyRepository = HistoryRepository();
  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) async {
      if (event is FetchHistory) {
        await fetchHistory(emit, event);
      }
    });
  }

  Future<void> fetchHistory(
      Emitter<HistoryState> emit, FetchHistory event) async {
    try {
      emit(HistoryLoading());

      HistoryResponse historyResponse = await _historyRepository.fetchHistory();

      if (historyResponse.status) {
        emit(HistorySuccessful(historyResponse: historyResponse));
      } else {
        emit(HistoryError(error: historyResponse.message));
      }
    } catch (e) {
      emit(HistoryError(error: e.toString()));
    }
  }
}
