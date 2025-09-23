import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';
import 'package:j3enterprise/src/ui/app_logger/bloc/applogger_bloc.dart';

import 'applogger_detail.dart';

class AppLoggerForm extends StatefulWidget {
  const AppLoggerForm({super.key});

  @override
  State<AppLoggerForm> createState() => _AppLoggerForm();
}

class _AppLoggerForm extends State<AppLoggerForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApploggerBloc, ApploggerState>(listener:
        (context, state) {
      if (state is ApploggerFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
    }, child:
        BlocBuilder<ApploggerBloc, ApploggerState>(builder: (context, state) {
      var bloc = BlocProvider.of<ApploggerBloc>(context);
      return _buildForm(bloc);
    }));
  }

  String searchText = '';
  Widget _buildForm(ApploggerBloc bloc) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 55,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Center(
                  child: ListFilter(
                    placeholder: 'Search',
                    filter: searchText,
                    onFilterChanged: (search) {
                      setState(() {
                        searchText = search;
                      });
                    },
                    function: () {},
                  ),
                ),
              )),
          StreamBuilder(
              stream: bloc.applicationLoggerDao.watchAllAppLog(searchText),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ApplicationLoggerData>? data = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (_, index) {
                          return Container(
                            color: (index % 2 == 0)
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).cardColor.withOpacity(0.8),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Divider(
                                      height: 0.5,
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoggerDetailPage(
                                                        data[index])));
                                      },
                                      title: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  data[index].functionName)),
                                          Expanded(
                                              child: Text(
                                                  '${data[index].logDateTime}')),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  data[index].logDescription)),
                                          Expanded(
                                              child:
                                                  Text(data[index].documentNo)),
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          );
                        }),
                  );
                }
                return const BuildProgressIndicator();
              }),
        ],
      ),
    );
  }
}
