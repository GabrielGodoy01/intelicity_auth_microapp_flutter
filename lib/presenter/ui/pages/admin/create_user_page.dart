import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/infra/models/group_model.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/create_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/drop_down_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final AuthController authController = Modular.get();
  var groups = <GroupModel>[];

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  var role;

  @override
  void initState() {
    for (String item in authController.user!.groups) {
      groups.add(GroupModel(groupName: item, isSelected: false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CreateUserController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    List<RoleEnum> items = authController.user!.role == RoleEnum.ADMIN
        ? [RoleEnum.ADMIN, RoleEnum.USER]
        : RoleEnum.values.toList();

    return LandingPage(
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                S.of(context).createUser,
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).createUserText,
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextFielCustom(
                hintText: S.of(context).name,
                onChanged: (value) {
                  _nameController.text = value;
                },
                prefixIcon: Icons.person,
                validation: ValidationFieldHelper.validateRequiredField,
              ),
              const SizedBox(height: 16),
              TextFielCustom(
                hintText: S.of(context).email,
                onChanged: (value) {
                  _emailController.text = value;
                },
                prefixIcon: Icons.email,
                validation: ValidationFieldHelper.validateRequiredField,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Observer(builder: (_) {
                      return DropDownFieldWidget<RoleEnum>(
                        hintText: S.of(context).role,
                        prefixIcon: Icons.work,
                        onChanged: (value) {
                          role = value;
                        },
                        validation: ValidationFieldHelper.validateRole,
                        items: items.map((RoleEnum value) {
                          return DropdownMenuItem<RoleEnum>(
                            value: value,
                            child: Text(value.typeName),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Tooltip(
                    message:
                        'Administrador: possui acesso total a gestão de usuários do sistema.\nColaborador: possui acesso apenas de autenticação de usuário.',
                    child: Icon(
                      Icons.help,
                      color: AppColors.primaryPurple,
                    ),
                  )
                ],
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
                    title: Text(groups[index].groupName),
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
              // prefixIcon: Icons.diversity_3,
              const SizedBox(height: 16),
              ButtonCustom(
                text: S.of(context).register,
                isLoading: controller.state is BasicLoadingState,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await controller.createUser(
                        _emailController.text,
                        _nameController.text,
                        role,
                        groups
                            .where((element) => element.isSelected)
                            .map((e) => e.groupName)
                            .toList());
                  }
                },
              ),
            ],
          )),
    );
  }
}
