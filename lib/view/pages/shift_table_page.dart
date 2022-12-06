import 'package:buy_me_a_coffee_widget/buy_me_a_coffee_widget.dart';
import 'package:flutter/material.dart';

import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

import 'package:shift_calculator/state/shift_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ShiftTablePage extends StatelessWidget {
  const ShiftTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            Text('Şift Tablosu', style: Theme.of(context).textTheme.headline6),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pushNamed('/'),
        ),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(24), child: ShiftTable()),
      ),
    );
  }
}

class ShiftTable extends StatelessWidget {
  const ShiftTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var shiftState = context.read<ShiftController>();

    List<PlutoColumn> columns = [
      PlutoColumn(
        enableFilterMenuItem: false,
        enableSorting: false,
        enableContextMenu: false,
        title: 'Zaman',
        field: 'time',
        type: PlutoColumnType.text(),
      ),
      ...List.generate(
          shiftState.numberOfWorkingPlaces,
          (index) => PlutoColumn(
              enableFilterMenuItem: false,
              enableSorting: false,
              enableContextMenu: false,
              title: '${index + 1}. Alan',
              field: '$index. alan',
              type: PlutoColumnType.text())),
    ];

    List<PlutoRow> rows = [
      ...List.generate(
          shiftState.numberOfWorkers,
          (index) => PlutoRow(cells: {
                'time': PlutoCell(
                  value: shiftState.shift.startTime
                      .add(Duration(
                          hours: ((shiftState.shift.shiftDuraion * index) / 60)
                              .floor(),
                          minutes:
                              ((shiftState.shift.shiftDuraion * index) % 60)
                                  .round()))
                      .toString()
                      .substring(11, 16),
                ),
                ...Map.fromIterable(
                  List.generate(
                      shiftState.numberOfWorkingPlaces, (index) => index),
                  key: (e) => '$e. alan',
                  value: (e) => PlutoCell(
                      value:
                          '${shiftState.workers[shiftState.shift.matrix[index][e]]}'),
                )
              }, key: ValueKey(index)))
    ];

    late final PlutoGridStateManager stateManager;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: PlutoGrid(
            columns: columns,
            rows: rows,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              stateManager = event.stateManager;
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            configuration: const PlutoGridConfiguration(
              style: PlutoGridStyleConfig(
                cellTextStyle: TextStyle(fontSize: 15),
                columnTextStyle: TextStyle(fontSize: 20),
              ),
              columnSize: PlutoGridColumnSizeConfig(
                  autoSizeMode: PlutoAutoSizeMode.equal),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Made with '),
                  Icon(Icons.favorite, color: Colors.red, size: 20),
                  Text(' by'),
                  TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://twitter.com/yakubsubasi'));
                    },
                    child: Text(
                      'yakup',
                    ),
                  ),
                ],
              ),
              // 'Made with love by yakub' text and that directs to my twitter account

              BuyMeACoffeeWidget(
                sponsorID: "yakup",
                theme: TealTheme(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
