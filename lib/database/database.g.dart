// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CatsTable extends Cats with TableInfo<$CatsTable, Cat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [imageUrl, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {imageUrl};
  @override
  Cat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cat(
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
    );
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(attachedDatabase, alias);
  }
}

class Cat extends DataClass implements Insertable<Cat> {
  final String imageUrl;
  final String name;
  final String description;
  const Cat({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['image_url'] = Variable<String>(imageUrl);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      imageUrl: Value(imageUrl),
      name: Value(name),
      description: Value(description),
    );
  }

  factory Cat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cat(
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'imageUrl': serializer.toJson<String>(imageUrl),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Cat copyWith({String? imageUrl, String? name, String? description}) => Cat(
    imageUrl: imageUrl ?? this.imageUrl,
    name: name ?? this.name,
    description: description ?? this.description,
  );
  Cat copyWithCompanion(CatsCompanion data) {
    return Cat(
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cat(')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(imageUrl, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cat &&
          other.imageUrl == this.imageUrl &&
          other.name == this.name &&
          other.description == this.description);
}

class CatsCompanion extends UpdateCompanion<Cat> {
  final Value<String> imageUrl;
  final Value<String> name;
  final Value<String> description;
  final Value<int> rowid;
  const CatsCompanion({
    this.imageUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsCompanion.insert({
    required String imageUrl,
    required String name,
    required String description,
    this.rowid = const Value.absent(),
  }) : imageUrl = Value(imageUrl),
       name = Value(name),
       description = Value(description);
  static Insertable<Cat> custom({
    Expression<String>? imageUrl,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (imageUrl != null) 'image_url': imageUrl,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsCompanion copyWith({
    Value<String>? imageUrl,
    Value<String>? name,
    Value<String>? description,
    Value<int>? rowid,
  }) {
    return CatsCompanion(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likeTimeMeta = const VerificationMeta(
    'likeTime',
  );
  @override
  late final GeneratedColumn<DateTime> likeTime = GeneratedColumn<DateTime>(
    'like_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [imageUrl, name, description, likeTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('like_time')) {
      context.handle(
        _likeTimeMeta,
        likeTime.isAcceptableOrUnknown(data['like_time']!, _likeTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_likeTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {imageUrl};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      likeTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}like_time'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String imageUrl;
  final String name;
  final String description;
  final DateTime likeTime;
  const LikedCat({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.likeTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['image_url'] = Variable<String>(imageUrl);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['like_time'] = Variable<DateTime>(likeTime);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      imageUrl: Value(imageUrl),
      name: Value(name),
      description: Value(description),
      likeTime: Value(likeTime),
    );
  }

  factory LikedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      likeTime: serializer.fromJson<DateTime>(json['likeTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'imageUrl': serializer.toJson<String>(imageUrl),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'likeTime': serializer.toJson<DateTime>(likeTime),
    };
  }

  LikedCat copyWith({
    String? imageUrl,
    String? name,
    String? description,
    DateTime? likeTime,
  }) => LikedCat(
    imageUrl: imageUrl ?? this.imageUrl,
    name: name ?? this.name,
    description: description ?? this.description,
    likeTime: likeTime ?? this.likeTime,
  );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      likeTime: data.likeTime.present ? data.likeTime.value : this.likeTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('likeTime: $likeTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(imageUrl, name, description, likeTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.imageUrl == this.imageUrl &&
          other.name == this.name &&
          other.description == this.description &&
          other.likeTime == this.likeTime);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> imageUrl;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> likeTime;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.imageUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.likeTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String imageUrl,
    required String name,
    required String description,
    required DateTime likeTime,
    this.rowid = const Value.absent(),
  }) : imageUrl = Value(imageUrl),
       name = Value(name),
       description = Value(description),
       likeTime = Value(likeTime);
  static Insertable<LikedCat> custom({
    Expression<String>? imageUrl,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? likeTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (imageUrl != null) 'image_url': imageUrl,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (likeTime != null) 'like_time': likeTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? imageUrl,
    Value<String>? name,
    Value<String>? description,
    Value<DateTime>? likeTime,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      likeTime: likeTime ?? this.likeTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (likeTime.present) {
      map['like_time'] = Variable<DateTime>(likeTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('likeTime: $likeTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatsTable extends Stats with TableInfo<$StatsTable, Stat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int> likes = GeneratedColumn<int>(
    'likes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dislikesMeta = const VerificationMeta(
    'dislikes',
  );
  @override
  late final GeneratedColumn<int> dislikes = GeneratedColumn<int>(
    'dislikes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, likes, dislikes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
        _likesMeta,
        likes.isAcceptableOrUnknown(data['likes']!, _likesMeta),
      );
    }
    if (data.containsKey('dislikes')) {
      context.handle(
        _dislikesMeta,
        dislikes.isAcceptableOrUnknown(data['dislikes']!, _dislikesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      likes:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}likes'],
          )!,
      dislikes:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}dislikes'],
          )!,
    );
  }

  @override
  $StatsTable createAlias(String alias) {
    return $StatsTable(attachedDatabase, alias);
  }
}

class Stat extends DataClass implements Insertable<Stat> {
  final int id;
  final int likes;
  final int dislikes;
  const Stat({required this.id, required this.likes, required this.dislikes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['likes'] = Variable<int>(likes);
    map['dislikes'] = Variable<int>(dislikes);
    return map;
  }

  StatsCompanion toCompanion(bool nullToAbsent) {
    return StatsCompanion(
      id: Value(id),
      likes: Value(likes),
      dislikes: Value(dislikes),
    );
  }

  factory Stat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stat(
      id: serializer.fromJson<int>(json['id']),
      likes: serializer.fromJson<int>(json['likes']),
      dislikes: serializer.fromJson<int>(json['dislikes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'likes': serializer.toJson<int>(likes),
      'dislikes': serializer.toJson<int>(dislikes),
    };
  }

  Stat copyWith({int? id, int? likes, int? dislikes}) => Stat(
    id: id ?? this.id,
    likes: likes ?? this.likes,
    dislikes: dislikes ?? this.dislikes,
  );
  Stat copyWithCompanion(StatsCompanion data) {
    return Stat(
      id: data.id.present ? data.id.value : this.id,
      likes: data.likes.present ? data.likes.value : this.likes,
      dislikes: data.dislikes.present ? data.dislikes.value : this.dislikes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('id: $id, ')
          ..write('likes: $likes, ')
          ..write('dislikes: $dislikes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, likes, dislikes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stat &&
          other.id == this.id &&
          other.likes == this.likes &&
          other.dislikes == this.dislikes);
}

class StatsCompanion extends UpdateCompanion<Stat> {
  final Value<int> id;
  final Value<int> likes;
  final Value<int> dislikes;
  const StatsCompanion({
    this.id = const Value.absent(),
    this.likes = const Value.absent(),
    this.dislikes = const Value.absent(),
  });
  StatsCompanion.insert({
    this.id = const Value.absent(),
    this.likes = const Value.absent(),
    this.dislikes = const Value.absent(),
  });
  static Insertable<Stat> custom({
    Expression<int>? id,
    Expression<int>? likes,
    Expression<int>? dislikes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (likes != null) 'likes': likes,
      if (dislikes != null) 'dislikes': dislikes,
    });
  }

  StatsCompanion copyWith({
    Value<int>? id,
    Value<int>? likes,
    Value<int>? dislikes,
  }) {
    return StatsCompanion(
      id: id ?? this.id,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (dislikes.present) {
      map['dislikes'] = Variable<int>(dislikes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsCompanion(')
          ..write('id: $id, ')
          ..write('likes: $likes, ')
          ..write('dislikes: $dislikes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  late final $StatsTable stats = $StatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cats, likedCats, stats];
}

typedef $$CatsTableCreateCompanionBuilder =
    CatsCompanion Function({
      required String imageUrl,
      required String name,
      required String description,
      Value<int> rowid,
    });
typedef $$CatsTableUpdateCompanionBuilder =
    CatsCompanion Function({
      Value<String> imageUrl,
      Value<String> name,
      Value<String> description,
      Value<int> rowid,
    });

class $$CatsTableFilterComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CatsTableOrderingComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$CatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatsTable,
          Cat,
          $$CatsTableFilterComposer,
          $$CatsTableOrderingComposer,
          $$CatsTableAnnotationComposer,
          $$CatsTableCreateCompanionBuilder,
          $$CatsTableUpdateCompanionBuilder,
          (Cat, BaseReferences<_$AppDatabase, $CatsTable, Cat>),
          Cat,
          PrefetchHooks Function()
        > {
  $$CatsTableTableManager(_$AppDatabase db, $CatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> imageUrl = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion(
                imageUrl: imageUrl,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String imageUrl,
                required String name,
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion.insert(
                imageUrl: imageUrl,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatsTable,
      Cat,
      $$CatsTableFilterComposer,
      $$CatsTableOrderingComposer,
      $$CatsTableAnnotationComposer,
      $$CatsTableCreateCompanionBuilder,
      $$CatsTableUpdateCompanionBuilder,
      (Cat, BaseReferences<_$AppDatabase, $CatsTable, Cat>),
      Cat,
      PrefetchHooks Function()
    >;
typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String imageUrl,
      required String name,
      required String description,
      required DateTime likeTime,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> imageUrl,
      Value<String> name,
      Value<String> description,
      Value<DateTime> likeTime,
      Value<int> rowid,
    });

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likeTime => $composableBuilder(
    column: $table.likeTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likeTime => $composableBuilder(
    column: $table.likeTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get likeTime =>
      $composableBuilder(column: $table.likeTime, builder: (column) => column);
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCat,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
          LikedCat,
          PrefetchHooks Function()
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> imageUrl = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> likeTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                imageUrl: imageUrl,
                name: name,
                description: description,
                likeTime: likeTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String imageUrl,
                required String name,
                required String description,
                required DateTime likeTime,
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                imageUrl: imageUrl,
                name: name,
                description: description,
                likeTime: likeTime,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCat,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
      LikedCat,
      PrefetchHooks Function()
    >;
typedef $$StatsTableCreateCompanionBuilder =
    StatsCompanion Function({
      Value<int> id,
      Value<int> likes,
      Value<int> dislikes,
    });
typedef $$StatsTableUpdateCompanionBuilder =
    StatsCompanion Function({
      Value<int> id,
      Value<int> likes,
      Value<int> dislikes,
    });

class $$StatsTableFilterComposer extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dislikes => $composableBuilder(
    column: $table.dislikes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StatsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dislikes => $composableBuilder(
    column: $table.dislikes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get likes =>
      $composableBuilder(column: $table.likes, builder: (column) => column);

  GeneratedColumn<int> get dislikes =>
      $composableBuilder(column: $table.dislikes, builder: (column) => column);
}

class $$StatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatsTable,
          Stat,
          $$StatsTableFilterComposer,
          $$StatsTableOrderingComposer,
          $$StatsTableAnnotationComposer,
          $$StatsTableCreateCompanionBuilder,
          $$StatsTableUpdateCompanionBuilder,
          (Stat, BaseReferences<_$AppDatabase, $StatsTable, Stat>),
          Stat,
          PrefetchHooks Function()
        > {
  $$StatsTableTableManager(_$AppDatabase db, $StatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$StatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$StatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$StatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> likes = const Value.absent(),
                Value<int> dislikes = const Value.absent(),
              }) => StatsCompanion(id: id, likes: likes, dislikes: dislikes),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> likes = const Value.absent(),
                Value<int> dislikes = const Value.absent(),
              }) => StatsCompanion.insert(
                id: id,
                likes: likes,
                dislikes: dislikes,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatsTable,
      Stat,
      $$StatsTableFilterComposer,
      $$StatsTableOrderingComposer,
      $$StatsTableAnnotationComposer,
      $$StatsTableCreateCompanionBuilder,
      $$StatsTableUpdateCompanionBuilder,
      (Stat, BaseReferences<_$AppDatabase, $StatsTable, Stat>),
      Stat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableManager get cats => $$CatsTableTableManager(_db, _db.cats);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
  $$StatsTableTableManager get stats =>
      $$StatsTableTableManager(_db, _db.stats);
}
