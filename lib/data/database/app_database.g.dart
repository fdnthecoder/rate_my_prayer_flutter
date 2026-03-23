// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SalahLogsTable extends SalahLogs
    with TableInfo<$SalahLogsTable, SalahLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalahLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _salahNameMeta =
      const VerificationMeta('salahName');
  @override
  late final GeneratedColumn<String> salahName = GeneratedColumn<String>(
      'salah_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loggedAtMeta =
      const VerificationMeta('loggedAt');
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
      'logged_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, salahName, rating, notes, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'salah_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SalahLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('salah_name')) {
      context.handle(_salahNameMeta,
          salahName.isAcceptableOrUnknown(data['salah_name']!, _salahNameMeta));
    } else if (isInserting) {
      context.missing(_salahNameMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('logged_at')) {
      context.handle(_loggedAtMeta,
          loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta));
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {date, salahName},
      ];
  @override
  SalahLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalahLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      salahName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}salah_name'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      loggedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}logged_at'])!,
    );
  }

  @override
  $SalahLogsTable createAlias(String alias) {
    return $SalahLogsTable(attachedDatabase, alias);
  }
}

class SalahLog extends DataClass implements Insertable<SalahLog> {
  final int id;
  final DateTime date;
  final String salahName;
  final int rating;
  final String? notes;
  final DateTime loggedAt;
  const SalahLog(
      {required this.id,
      required this.date,
      required this.salahName,
      required this.rating,
      this.notes,
      required this.loggedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['salah_name'] = Variable<String>(salahName);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  SalahLogsCompanion toCompanion(bool nullToAbsent) {
    return SalahLogsCompanion(
      id: Value(id),
      date: Value(date),
      salahName: Value(salahName),
      rating: Value(rating),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      loggedAt: Value(loggedAt),
    );
  }

  factory SalahLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalahLog(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      salahName: serializer.fromJson<String>(json['salahName']),
      rating: serializer.fromJson<int>(json['rating']),
      notes: serializer.fromJson<String?>(json['notes']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'salahName': serializer.toJson<String>(salahName),
      'rating': serializer.toJson<int>(rating),
      'notes': serializer.toJson<String?>(notes),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  SalahLog copyWith(
          {int? id,
          DateTime? date,
          String? salahName,
          int? rating,
          Value<String?> notes = const Value.absent(),
          DateTime? loggedAt}) =>
      SalahLog(
        id: id ?? this.id,
        date: date ?? this.date,
        salahName: salahName ?? this.salahName,
        rating: rating ?? this.rating,
        notes: notes.present ? notes.value : this.notes,
        loggedAt: loggedAt ?? this.loggedAt,
      );
  SalahLog copyWithCompanion(SalahLogsCompanion data) {
    return SalahLog(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      salahName: data.salahName.present ? data.salahName.value : this.salahName,
      rating: data.rating.present ? data.rating.value : this.rating,
      notes: data.notes.present ? data.notes.value : this.notes,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalahLog(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('salahName: $salahName, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, salahName, rating, notes, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalahLog &&
          other.id == this.id &&
          other.date == this.date &&
          other.salahName == this.salahName &&
          other.rating == this.rating &&
          other.notes == this.notes &&
          other.loggedAt == this.loggedAt);
}

class SalahLogsCompanion extends UpdateCompanion<SalahLog> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> salahName;
  final Value<int> rating;
  final Value<String?> notes;
  final Value<DateTime> loggedAt;
  const SalahLogsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.salahName = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.loggedAt = const Value.absent(),
  });
  SalahLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String salahName,
    required int rating,
    this.notes = const Value.absent(),
    required DateTime loggedAt,
  })  : date = Value(date),
        salahName = Value(salahName),
        rating = Value(rating),
        loggedAt = Value(loggedAt);
  static Insertable<SalahLog> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? salahName,
    Expression<int>? rating,
    Expression<String>? notes,
    Expression<DateTime>? loggedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (salahName != null) 'salah_name': salahName,
      if (rating != null) 'rating': rating,
      if (notes != null) 'notes': notes,
      if (loggedAt != null) 'logged_at': loggedAt,
    });
  }

  SalahLogsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? salahName,
      Value<int>? rating,
      Value<String?>? notes,
      Value<DateTime>? loggedAt}) {
    return SalahLogsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      salahName: salahName ?? this.salahName,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (salahName.present) {
      map['salah_name'] = Variable<String>(salahName.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalahLogsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('salahName: $salahName, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }
}

class $PracticeLogsTable extends PracticeLogs
    with TableInfo<$PracticeLogsTable, PracticeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _rakatMeta = const VerificationMeta('rakat');
  @override
  late final GeneratedColumn<int> rakat = GeneratedColumn<int>(
      'rakat', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loggedAtMeta =
      const VerificationMeta('loggedAt');
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
      'logged_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, rakat, rating, notes, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_logs';
  @override
  VerificationContext validateIntegrity(Insertable<PracticeLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('rakat')) {
      context.handle(
          _rakatMeta, rakat.isAcceptableOrUnknown(data['rakat']!, _rakatMeta));
    } else if (isInserting) {
      context.missing(_rakatMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('logged_at')) {
      context.handle(_loggedAtMeta,
          loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta));
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      rakat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rakat'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      loggedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}logged_at'])!,
    );
  }

  @override
  $PracticeLogsTable createAlias(String alias) {
    return $PracticeLogsTable(attachedDatabase, alias);
  }
}

class PracticeLog extends DataClass implements Insertable<PracticeLog> {
  final int id;
  final DateTime date;
  final int rakat;
  final int rating;
  final String? notes;
  final DateTime loggedAt;
  const PracticeLog(
      {required this.id,
      required this.date,
      required this.rakat,
      required this.rating,
      this.notes,
      required this.loggedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['rakat'] = Variable<int>(rakat);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  PracticeLogsCompanion toCompanion(bool nullToAbsent) {
    return PracticeLogsCompanion(
      id: Value(id),
      date: Value(date),
      rakat: Value(rakat),
      rating: Value(rating),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      loggedAt: Value(loggedAt),
    );
  }

  factory PracticeLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeLog(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      rakat: serializer.fromJson<int>(json['rakat']),
      rating: serializer.fromJson<int>(json['rating']),
      notes: serializer.fromJson<String?>(json['notes']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'rakat': serializer.toJson<int>(rakat),
      'rating': serializer.toJson<int>(rating),
      'notes': serializer.toJson<String?>(notes),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  PracticeLog copyWith(
          {int? id,
          DateTime? date,
          int? rakat,
          int? rating,
          Value<String?> notes = const Value.absent(),
          DateTime? loggedAt}) =>
      PracticeLog(
        id: id ?? this.id,
        date: date ?? this.date,
        rakat: rakat ?? this.rakat,
        rating: rating ?? this.rating,
        notes: notes.present ? notes.value : this.notes,
        loggedAt: loggedAt ?? this.loggedAt,
      );
  PracticeLog copyWithCompanion(PracticeLogsCompanion data) {
    return PracticeLog(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      rakat: data.rakat.present ? data.rakat.value : this.rakat,
      rating: data.rating.present ? data.rating.value : this.rating,
      notes: data.notes.present ? data.notes.value : this.notes,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLog(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('rakat: $rakat, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, rakat, rating, notes, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeLog &&
          other.id == this.id &&
          other.date == this.date &&
          other.rakat == this.rakat &&
          other.rating == this.rating &&
          other.notes == this.notes &&
          other.loggedAt == this.loggedAt);
}

class PracticeLogsCompanion extends UpdateCompanion<PracticeLog> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> rakat;
  final Value<int> rating;
  final Value<String?> notes;
  final Value<DateTime> loggedAt;
  const PracticeLogsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.rakat = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.loggedAt = const Value.absent(),
  });
  PracticeLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int rakat,
    required int rating,
    this.notes = const Value.absent(),
    required DateTime loggedAt,
  })  : date = Value(date),
        rakat = Value(rakat),
        rating = Value(rating),
        loggedAt = Value(loggedAt);
  static Insertable<PracticeLog> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? rakat,
    Expression<int>? rating,
    Expression<String>? notes,
    Expression<DateTime>? loggedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (rakat != null) 'rakat': rakat,
      if (rating != null) 'rating': rating,
      if (notes != null) 'notes': notes,
      if (loggedAt != null) 'logged_at': loggedAt,
    });
  }

  PracticeLogsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? rakat,
      Value<int>? rating,
      Value<String?>? notes,
      Value<DateTime>? loggedAt}) {
    return PracticeLogsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      rakat: rakat ?? this.rakat,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rakat.present) {
      map['rakat'] = Variable<int>(rakat.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLogsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('rakat: $rakat, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDarkModeMeta =
      const VerificationMeta('isDarkMode');
  @override
  late final GeneratedColumn<bool> isDarkMode = GeneratedColumn<bool>(
      'is_dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_dark_mode" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, isDarkMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_dark_mode')) {
      context.handle(
          _isDarkModeMeta,
          isDarkMode.isAcceptableOrUnknown(
              data['is_dark_mode']!, _isDarkModeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isDarkMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dark_mode'])!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
  final int id;
  final bool isDarkMode;
  const AppSettingsTableData({required this.id, required this.isDarkMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_dark_mode'] = Variable<bool>(isDarkMode);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      isDarkMode: Value(isDarkMode),
    );
  }

  factory AppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      isDarkMode: serializer.fromJson<bool>(json['isDarkMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isDarkMode': serializer.toJson<bool>(isDarkMode),
    };
  }

  AppSettingsTableData copyWith({int? id, bool? isDarkMode}) =>
      AppSettingsTableData(
        id: id ?? this.id,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      isDarkMode:
          data.isDarkMode.present ? data.isDarkMode.value : this.isDarkMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('id: $id, ')
          ..write('isDarkMode: $isDarkMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isDarkMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.id == this.id &&
          other.isDarkMode == this.isDarkMode);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<int> id;
  final Value<bool> isDarkMode;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.isDarkMode = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.isDarkMode = const Value.absent(),
  });
  static Insertable<AppSettingsTableData> custom({
    Expression<int>? id,
    Expression<bool>? isDarkMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDarkMode != null) 'is_dark_mode': isDarkMode,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<int>? id, Value<bool>? isDarkMode}) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isDarkMode.present) {
      map['is_dark_mode'] = Variable<bool>(isDarkMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('isDarkMode: $isDarkMode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SalahLogsTable salahLogs = $SalahLogsTable(this);
  late final $PracticeLogsTable practiceLogs = $PracticeLogsTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [salahLogs, practiceLogs, appSettingsTable];
}

typedef $$SalahLogsTableCreateCompanionBuilder = SalahLogsCompanion Function({
  Value<int> id,
  required DateTime date,
  required String salahName,
  required int rating,
  Value<String?> notes,
  required DateTime loggedAt,
});
typedef $$SalahLogsTableUpdateCompanionBuilder = SalahLogsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<String> salahName,
  Value<int> rating,
  Value<String?> notes,
  Value<DateTime> loggedAt,
});

class $$SalahLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SalahLogsTable> {
  $$SalahLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get salahName => $composableBuilder(
      column: $table.salahName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnFilters(column));
}

class $$SalahLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalahLogsTable> {
  $$SalahLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get salahName => $composableBuilder(
      column: $table.salahName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnOrderings(column));
}

class $$SalahLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalahLogsTable> {
  $$SalahLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get salahName =>
      $composableBuilder(column: $table.salahName, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$SalahLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalahLogsTable,
    SalahLog,
    $$SalahLogsTableFilterComposer,
    $$SalahLogsTableOrderingComposer,
    $$SalahLogsTableAnnotationComposer,
    $$SalahLogsTableCreateCompanionBuilder,
    $$SalahLogsTableUpdateCompanionBuilder,
    (SalahLog, BaseReferences<_$AppDatabase, $SalahLogsTable, SalahLog>),
    SalahLog,
    PrefetchHooks Function()> {
  $$SalahLogsTableTableManager(_$AppDatabase db, $SalahLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalahLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalahLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalahLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> salahName = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> loggedAt = const Value.absent(),
          }) =>
              SalahLogsCompanion(
            id: id,
            date: date,
            salahName: salahName,
            rating: rating,
            notes: notes,
            loggedAt: loggedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            required String salahName,
            required int rating,
            Value<String?> notes = const Value.absent(),
            required DateTime loggedAt,
          }) =>
              SalahLogsCompanion.insert(
            id: id,
            date: date,
            salahName: salahName,
            rating: rating,
            notes: notes,
            loggedAt: loggedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SalahLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalahLogsTable,
    SalahLog,
    $$SalahLogsTableFilterComposer,
    $$SalahLogsTableOrderingComposer,
    $$SalahLogsTableAnnotationComposer,
    $$SalahLogsTableCreateCompanionBuilder,
    $$SalahLogsTableUpdateCompanionBuilder,
    (SalahLog, BaseReferences<_$AppDatabase, $SalahLogsTable, SalahLog>),
    SalahLog,
    PrefetchHooks Function()>;
typedef $$PracticeLogsTableCreateCompanionBuilder = PracticeLogsCompanion
    Function({
  Value<int> id,
  required DateTime date,
  required int rakat,
  required int rating,
  Value<String?> notes,
  required DateTime loggedAt,
});
typedef $$PracticeLogsTableUpdateCompanionBuilder = PracticeLogsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> rakat,
  Value<int> rating,
  Value<String?> notes,
  Value<DateTime> loggedAt,
});

class $$PracticeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rakat => $composableBuilder(
      column: $table.rakat, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnFilters(column));
}

class $$PracticeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rakat => $composableBuilder(
      column: $table.rakat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnOrderings(column));
}

class $$PracticeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get rakat =>
      $composableBuilder(column: $table.rakat, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$PracticeLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PracticeLogsTable,
    PracticeLog,
    $$PracticeLogsTableFilterComposer,
    $$PracticeLogsTableOrderingComposer,
    $$PracticeLogsTableAnnotationComposer,
    $$PracticeLogsTableCreateCompanionBuilder,
    $$PracticeLogsTableUpdateCompanionBuilder,
    (
      PracticeLog,
      BaseReferences<_$AppDatabase, $PracticeLogsTable, PracticeLog>
    ),
    PracticeLog,
    PrefetchHooks Function()> {
  $$PracticeLogsTableTableManager(_$AppDatabase db, $PracticeLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rakat = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> loggedAt = const Value.absent(),
          }) =>
              PracticeLogsCompanion(
            id: id,
            date: date,
            rakat: rakat,
            rating: rating,
            notes: notes,
            loggedAt: loggedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            required int rakat,
            required int rating,
            Value<String?> notes = const Value.absent(),
            required DateTime loggedAt,
          }) =>
              PracticeLogsCompanion.insert(
            id: id,
            date: date,
            rakat: rakat,
            rating: rating,
            notes: notes,
            loggedAt: loggedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PracticeLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PracticeLogsTable,
    PracticeLog,
    $$PracticeLogsTableFilterComposer,
    $$PracticeLogsTableOrderingComposer,
    $$PracticeLogsTableAnnotationComposer,
    $$PracticeLogsTableCreateCompanionBuilder,
    $$PracticeLogsTableUpdateCompanionBuilder,
    (
      PracticeLog,
      BaseReferences<_$AppDatabase, $PracticeLogsTable, PracticeLog>
    ),
    PracticeLog,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> isDarkMode,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> isDarkMode,
});

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isDarkMode = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            id: id,
            isDarkMode: isDarkMode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isDarkMode = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            id: id,
            isDarkMode: isDarkMode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SalahLogsTableTableManager get salahLogs =>
      $$SalahLogsTableTableManager(_db, _db.salahLogs);
  $$PracticeLogsTableTableManager get practiceLogs =>
      $$PracticeLogsTableTableManager(_db, _db.practiceLogs);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
