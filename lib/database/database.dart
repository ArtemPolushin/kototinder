import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Cats extends Table {
  TextColumn get imageUrl => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {imageUrl};
}

class LikedCats extends Table {
  TextColumn get imageUrl => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get likeTime => dateTime()();

  @override
  Set<Column> get primaryKey => {imageUrl};
}

class Stats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get likes => integer().withDefault(const Constant(0))();
  IntColumn get dislikes => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Cats, LikedCats, Stats])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Cat>> getAllCats() => select(cats).get();
  Future<List<LikedCat>> getLikedCats() => select(likedCats).get();

  Future<Cat?> getCat(String imageUrl) =>
      (select(cats)
        ..where((cat) => cat.imageUrl.equals(imageUrl))).getSingleOrNull();

  Future<void> insertCat(Cat cat) => into(cats).insertOnConflictUpdate(cat);

  Future<void> likeCat(LikedCat likedCat) =>
      into(likedCats).insertOnConflictUpdate(likedCat);

  Future<void> unlikeCat(String imageUrl) =>
      (delete(likedCats)..where((t) => t.imageUrl.equals(imageUrl))).go();

  Future<Stat> getStats() async {
    try {
      return await (select(stats)..where((t) => t.id.equals(1))).getSingle();
    } on StateError catch (_) {
      await into(stats).insert(
        StatsCompanion.insert(
          id: Value(1),
          likes: Value(0),
          dislikes: Value(0),
        ),
      );
      return await (select(stats)..where((t) => t.id.equals(1))).getSingle();
    }
  }

  Future<void> updateLikes(int value) async {
    await (update(
      stats,
    )..where((t) => t.id.equals(1))).write(StatsCompanion(likes: Value(value)));
  }

  Future<void> updateDislikes(int value) async {
    await (update(stats)..where(
      (t) => t.id.equals(1),
    )).write(StatsCompanion(dislikes: Value(value)));
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'cats_database',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}
