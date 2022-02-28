import 'package:dex/bloc/History/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map> cryptoResponse = [];
  late HistoryBloc historyBloc;
  var dateFormat = DateFormat();
  @override
  void initState() {
    historyBloc = HistoryBloc();
    historyBloc.add(FetchHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xf9f9f9fa),
      appBar: AppBar(
        backgroundColor: const Color(0xf9f9f9fa),
        elevation: 0.0,
        title: Container(
          color: const Color(0xf9f9f9fa),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "History",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 100.0,
              ),
              Row(
                children: const [
                  Image(
                    image: AssetImage('assets/controls.png'),
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  Text("Sort/Filter",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocConsumer<HistoryBloc, HistoryState>(
            bloc: historyBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HistoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HistorySuccessful) {
                return state.historyResponse.data != null
                    ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.historyResponse.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var change = state.historyResponse.data![index]
                              .priceChangePercentage24H!
                              .toString()
                              .split('');

                          var sign = change[0] != '-' ? '+' : '-';
                          var val = change[0] != '-'
                              ? change[0] +
                                  change[1] +
                                  change[2] +
                                  change[3] +
                                  change[4] +
                                  change[5]
                              : change[1] +
                                  change[2] +
                                  change[3] +
                                  change[4] +
                                  change[5];

                          return SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 70,
                                  padding: const EdgeInsets.all(25),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(state
                                          .historyResponse.data![index].image!),
                                      scale: 1.0,
                                    )),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Recieved",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xadadadbd),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          state.historyResponse.data![index]
                                              .currentPrice!
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          state.historyResponse.data![index]
                                              .name!
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                        DateFormat('mm:ss,').add_yMMMd().format(
                                            state.historyResponse.data![index]
                                                .lastUpdated!),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xadadadbd),
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Text("$sign\$$val",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: state
                                                .historyResponse
                                                .data![index]
                                                .priceChangePercentage24H!
                                                .isNegative
                                            ? Colors.red
                                            : Colors.green,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: Theme.of(context).canvasColor);
                        },
                      )
                    : Container();
              }
              if (state is HistoryError) {
                return Center(child: Text(state.error.toString()));
              }
              return Container();
            }),
      ),
    );
  }
}
