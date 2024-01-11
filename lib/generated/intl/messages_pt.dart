// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(schema) => "${Intl.select(schema, {
            'invalidStateException': 'Usuário já está conectado',
            'codeDeliveryFailure':
                'Falha ao enviar código para o e-mail, tente novamente',
            'codeMismatch': 'Código fornecido está errado, tente novamente',
            'invalidParameter': 'E-mail, provavelmente, já confirmado',
            'usernameExists': 'Já existe um cadastro com este e-mail',
            'notAuthorized': 'E-mail ou senha incorretos',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o',
            'signedOut': 'E-mail ou senha incorretos',
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde',
            'tooManyFailedAttempts':
                'Parece que você tentou errou o código muitas vezes, entre em contato',
            'userNotFound': 'Não encontramos este e-mail cadastrado',
            'internalError': 'Estamos com problemas internos, tente mais tarde',
            'other': 'Ocorreu algum erro ao confirmar e-mail',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "access": MessageLookupByLibrary.simpleMessage("Acessar"),
        "adminPage":
            MessageLookupByLibrary.simpleMessage("Página de administração"),
        "authErrorsSchema": m0,
        "backToLogin":
            MessageLookupByLibrary.simpleMessage("Voltar para o login"),
        "code": MessageLookupByLibrary.simpleMessage("Código"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirme a nova senha"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirme a senha"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "fieldConfirmPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("As senhas não conferem"),
        "fieldEmailInvalid":
            MessageLookupByLibrary.simpleMessage("Email inválido"),
        "fieldPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("Senha inválida"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu sua senha?"),
        "goToHome":
            MessageLookupByLibrary.simpleMessage("Ir para a página inicial"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginNewPasswordText": MessageLookupByLibrary.simpleMessage(
            "Por favor, informe sua nova senha"),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login bem-sucedido"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Nova senha"),
        "newPasswordNeeded":
            MessageLookupByLibrary.simpleMessage("Nova senha necessária"),
        "newPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Preencha o código recebido por e-mail e sua nova senha para redefini-la"),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "register": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "resetPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Digite o e-mail que você usou para criar sua conta para que possamos enviar um código para redefinir sua senha"),
        "send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "verifyEmail":
            MessageLookupByLibrary.simpleMessage("Verifique seu e-mail")
      };
}
