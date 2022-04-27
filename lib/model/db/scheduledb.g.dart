// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduledb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String content;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isNotify;
  final bool isAllday;
  Todo(
      {required this.id,
      required this.title,
      required this.content,
      this.startDate,
      this.endDate,
      required this.isNotify,
      required this.isAllday});
  factory Todo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      startDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      isNotify: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_notify'])!,
      isAllday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allday'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime?>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime?>(endDate);
    }
    map['is_notify'] = Variable<bool>(isNotify);
    map['is_allday'] = Variable<bool>(isAllday);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isNotify: Value(isNotify),
      isAllday: Value(isAllday),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      isNotify: serializer.fromJson<bool>(json['isNotify']),
      isAllday: serializer.fromJson<bool>(json['isAllday']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'isNotify': serializer.toJson<bool>(isNotify),
      'isAllday': serializer.toJson<bool>(isAllday),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          String? content,
          DateTime? startDate,
          DateTime? endDate,
          bool? isNotify,
          bool? isAllday}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isNotify: isNotify ?? this.isNotify,
        isAllday: isAllday ?? this.isAllday,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isNotify: $isNotify, ')
          ..write('isAllday: $isAllday')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, content, startDate, endDate, isNotify, isAllday);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isNotify == this.isNotify &&
          other.isAllday == this.isAllday);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> isNotify;
  final Value<bool> isAllday;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isNotify = const Value.absent(),
    this.isAllday = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isNotify = const Value.absent(),
    this.isAllday = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime?>? startDate,
    Expression<DateTime?>? endDate,
    Expression<bool>? isNotify,
    Expression<bool>? isAllday,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isNotify != null) 'is_notify': isNotify,
      if (isAllday != null) 'is_allday': isAllday,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<bool>? isNotify,
      Value<bool>? isAllday}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isNotify: isNotify ?? this.isNotify,
      isAllday: isAllday ?? this.isAllday,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime?>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime?>(endDate.value);
    }
    if (isNotify.present) {
      map['is_notify'] = Variable<bool>(isNotify.value);
    }
    if (isAllday.present) {
      map['is_allday'] = Variable<bool>(isAllday.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isNotify: $isNotify, ')
          ..write('isAllday: $isAllday')
          ..write(')'))
        .toString();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title =
      GeneratedColumn<String?>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime?> startDate = GeneratedColumn<DateTime?>(
      'start_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime?> endDate = GeneratedColumn<DateTime?>(
      'end_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isNotifyMeta = const VerificationMeta('isNotify');
  @override
  late final GeneratedColumn<bool?> isNotify = GeneratedColumn<bool?>(
      'is_notify', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_notify IN (0, 1))',
      defaultValue: const Constant(true));
  final VerificationMeta _isAlldayMeta = const VerificationMeta('isAllday');
  @override
  late final GeneratedColumn<bool?> isAllday = GeneratedColumn<bool?>(
      'is_allday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_allday IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, startDate, endDate, isNotify, isAllday];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('is_notify')) {
      context.handle(_isNotifyMeta,
          isNotify.isAcceptableOrUnknown(data['is_notify']!, _isNotifyMeta));
    }
    if (data.containsKey('is_allday')) {
      context.handle(_isAlldayMeta,
          isAllday.isAcceptableOrUnknown(data['is_allday']!, _isAlldayMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Todo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodosTable todos = $TodosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}
