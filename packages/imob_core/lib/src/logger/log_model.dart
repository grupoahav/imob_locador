import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'log_level_enum.dart';

class Log extends Equatable {
  /// Deixar nulo, será gerado pela base de dados automaticamente.
  final String? id;

  /// Uma descrição padrão do LOG. Uma observação importante é que essa descrição deve identificar o que houve, mas nunca conter dados que são particulares daquele uso, pois será usada para filtro.
  /// - Description válida: "Erro ao buscar usuarios /api/v1/user"
  /// - Description inválida: "Erro ao buscar usuarios /api/v1/user, usuarioLogado: 123. empresa: 456, codigo: 789"
  final String description;

  /// Detalhes pertinentes ao LOG. Aqui é o local correto de inserir todas as informações disponíveis que facilitarão a análise de log. Em casos de erro por exemplo, podemos inserir os dados usados da operação, assim como o stacktrace completo, etc.
  final String? details;

  /// O momento exato em que o log foi gerado, em formato UTC
  final DateTime date;

  /// Enum que identifica o nível do LOG
  final LogLevel level;

  const Log({
    this.id,
    required this.description,
    this.details,
    required this.date,
    required this.level,
  });

  Log copyWith({
    String? id,
    String? description,
    String? details,
    DateTime? date,
    LogLevel? level,
  }) {
    return Log(
      id: id ?? this.id,
      description: description ?? this.description,
      details: details ?? this.details,
      date: date ?? this.date,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'description': description,
      if (details != null) 'details': details,
      'dateTime': date.toIso8601String(),
      'level': level.index,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      id: map['id'],
      description: map['description'],
      details: map['details'],
      date: DateTime.parse(map['dateTime']),
      level: LogLevel.values[map['level']],
    );
  }

  String toJson() => json.encode(toMap());

  factory Log.fromJson(String source) => Log.fromMap(json.decode(source));

  factory Log.forTest() {
    return Log(
      description: 'Description',
      date: DateTime.now(),
      level: LogLevel.information,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      description,
      details,
      date,
      level,
    ];
  }
}
