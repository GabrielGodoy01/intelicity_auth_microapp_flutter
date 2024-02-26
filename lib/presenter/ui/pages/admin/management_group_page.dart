import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/screen_helper.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/management_group_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/management_group_state.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/dialogs/update_user_dialog.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ManagementGroupPage extends StatefulWidget {
  const ManagementGroupPage({super.key});

  @override
  State<ManagementGroupPage> createState() => _ManagementGroupPageState();
}

class _ManagementGroupPageState extends State<ManagementGroupPage> {
  ManagementGroupController controller = Modular.get();
  final DataGridController _dataGridController = DataGridController();
  final int _rowsPerPage = 30;
  final double _dataPagerHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return LandingPage(
      maxWidth: ScreenHelper.width(context) * 0.9,
      child: Observer(builder: (_) {
        var state = controller.state;
        return state is ManagementGroupErrorState
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erro ao carregar dados: ${state.error.message}')
                ],
              )
            : state is ManagementGroupSuccessState
                ? LayoutBuilder(builder: (context, constraints) {
                    var obraTableDataSource = ObraDataSourceTable(
                        users: state.users, context: context);
                    return Column(
                      children: [
                        SizedBox(
                          height: ScreenHelper.height(context) * 0.8,
                          child: SfDataGrid(
                            controller: _dataGridController,
                            allowSorting: true,
                            allowMultiColumnSorting: true,
                            columnWidthMode: ColumnWidthMode.lastColumnFill,
                            rowHeight: 80,
                            selectionMode: SelectionMode.multiple,
                            source: obraTableDataSource,
                            columns: [
                              _getColumn('id', 'ID'),
                              _getColumn('fonte', 'Fonte'),
                              _getColumn('status', 'Status'),
                              _getColumn('via', 'Via'),
                              _getColumn('de', 'De'),
                              _getColumn('ate', 'Até'),
                              _getColumn('subprefeitura', 'Subprefeitura'),
                              _getColumn('dataTermino', 'Data Término'),
                              _getColumn('statusGeometria', 'Status Geometria'),
                              _getColumn('edit', null),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: _dataPagerHeight,
                            child: SfDataPagerTheme(
                              data: SfDataPagerThemeData(
                                selectedItemColor: AppColors.primaryPurple,
                                backgroundColor: Colors.white,
                              ),
                              child: SfDataPager(
                                delegate: obraTableDataSource,
                                pageCount: state.users.length / _rowsPerPage,
                                direction: Axis.horizontal,
                              ),
                            ))
                      ],
                    );
                  })
                : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  GridColumn _getColumn(String columnName, String? label) {
    return GridColumn(
      columnName: columnName,
      label: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: label == null
            ? null
            : Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.headline3,
              ),
      ),
    );
  }
}

class ObraDataSourceTable extends DataGridSource {
  ObraDataSourceTable(
      {required List<UserInfo> users, required BuildContext context}) {
    _users = users
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(
                columnName: 'sub',
                value: int.parse(e.sub),
              ),
              DataGridCell<String>(columnName: 'role', value: e.role.typeName),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<UserInfo>(
                columnName: 'edit',
                value: e,
              ),
            ]))
        .toList();
  }

  List<DataGridRow> _users = [];

  @override
  List<DataGridRow> get rows => _users.isEmpty ? [] : _users;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'edit'
            ? LayoutBuilder(builder: (context, BoxConstraints constraints) {
                return IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => UpdateUserDialog(
                          user: dataGridCell.value,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primaryPurple,
                      size: 24,
                    ));
              })
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}