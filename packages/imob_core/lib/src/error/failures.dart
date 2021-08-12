import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({this.message = ''});

  @override
  List<Object> get props => [message];
}

class Failure extends IFailure {
  const Failure({
    String message = 'Houve um erro no servidor',
  }) : super(message: message);
}

class ServerFailure extends IFailure {
  const ServerFailure({
    String message = 'Houve um erro no servidor',
  }) : super(message: message);
}

class InternetConectionFailure extends IFailure {
  const InternetConectionFailure({
    String message = 'Sem conexão com à internet',
  }) : super(message: message);
}

class CacheFailure extends IFailure {
  const CacheFailure({
    String message = 'Houve um erro no armazenamento interno',
  }) : super(message: message);
}

class NullFailure extends IFailure {
  const NullFailure({
    String message = 'Valor Null encontrado',
  }) : super(message: message);
}

class InternalFailure extends IFailure {
  const InternalFailure({
    String message = 'Falha Interna',
  }) : super(message: message);
}

class EmptyFailure extends IFailure {
  const EmptyFailure({
    String message = 'Não encontramos as informações',
  }) : super(message: message);
}

class LocationFailure extends IFailure {
  const LocationFailure({
    String message = 'Falha na localização',
  }) : super(message: message);
}

class UserFailure extends IFailure {
  const UserFailure({
    String message = 'Falha no Usuário',
  }) : super(message: message);
}

class CancelSmsCodeFailure extends IFailure {
  const CancelSmsCodeFailure({
    String message = 'Usuário cancelou a inserção do sms',
  }) : super(message: message);
}
