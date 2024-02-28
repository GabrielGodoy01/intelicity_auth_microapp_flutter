import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/group_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/infra/models/group_model.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/management_group_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/update_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/drop_down_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class UpdateUserDialog extends StatefulWidget {
  final UserInfo user;
  const UpdateUserDialog({super.key, required this.user});

  @override
  State<UpdateUserDialog> createState() => _UpdateUserDialogState();
}

class _UpdateUserDialogState extends State<UpdateUserDialog> {
  final AuthController authController = Modular.get();
  final UpdateUserController controller = Modular.get();
  final ManagementGroupController managementGroupController = Modular.get();
  final nameController = TextEditingController();
  var groups = <GroupModel>[];
  RoleEnum? role;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    setState(() {
      for (GroupEnum item in GroupEnum.values) {
        groups.add(GroupModel(
            groupName: item, isSelected: widget.user.groups.contains(item)));
      }
      role = widget.user.role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Atualizar usuário: ${widget.user.email}',
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 24),
              TextFielCustom(
                hintText: 'Nome',
                controller: nameController,
                prefixIcon: Icons.person,
                validation: ValidationFieldHelper.validateRequiredField,
              ),
              const SizedBox(height: 8),
              DropDownFieldWidget<RoleEnum>(
                hintText: S.of(context).role,
                value: role,
                prefixIcon: Icons.work,
                onChanged: (value) {
                  role = value;
                },
                validation: ValidationFieldHelper.validateRole,
                items: RoleEnum.values.map((RoleEnum value) {
                  return DropdownMenuItem<RoleEnum>(
                    value: value,
                    child: Text(value.typeName),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Permissão de Sistemas:',
                  style: AppTextStyles.bodyText1,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(groups[index].groupName.name),
                    value: groups[index].isSelected,
                    activeColor: AppColors.primaryPurple,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      setState(() {
                        groups[index].isSelected = value!;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ButtonCustom(
                text: S.of(context).updateUser,
                isLoading: controller.state is BasicLoadingState,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await controller.updateUser(
                      widget.user.email,
                      nameController.text,
                      role!,
                      groups
                          .where((element) => element.isSelected)
                          .map((e) => e.groupName.name)
                          .toList(),
                    );
                  }
                  if (controller.state is BasicInitialState) {
                    Modular.to.pop();
                    managementGroupController.getUsersInGroup();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
