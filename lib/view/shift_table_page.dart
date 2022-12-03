import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/model/shift_model.dart';
import 'package:shift_calculator/state/shift_state.dart';

class ShiftTablePage extends StatelessWidget {
  const ShiftTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Text(
          'Şift Tablosu',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
      ],
    );
  }
}
