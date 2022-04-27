import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';


// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'scheduledb.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get content =>text().withDefault(const Constant(''))();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get isNotify => boolean().withDefault(const Constant(true))();
  BoolColumn get isAllday => boolean().withDefault(const Constant(true))();
}



LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  // これは、ファイルのロケーションを探すのに使えるLazyDatabase utilを許可します。
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    // ここに、db.sqliteというファイルを、あなたのアプリのドキュメントフォルダに置きます。
    final dbFolder = await getApplicationDocumentsDirectory();
    //Path to a directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application.
    //データを配置することができるディレクトリのパス。
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  //7
  //以下追記
  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }
  
  Stream<List<Todo>> watchSamedayEntries(DateTime selectday) {
    return (select(todos)..where((tbl) => tbl.startDate.year.equals(selectday.year) & tbl.startDate.month.equals(selectday.month) & tbl.startDate.day.equals(selectday.day))).watch();
  }
  bool isSameDate(DateTime a,DateTime b){
    if(a.year==b.year&&a.month==b.month&&a.day==b.day){
      return true;
    }else{
      return false;
    }
  }
  //8
  //以下追記
  Future<List<Todo>> get allTodoEntries => select(todos).get();


  Future<int> addTodo(String title,String content,DateTime startDate,DateTime endDate,bool isAllday,bool isNotify) {
    return into(todos).insert(TodosCompanion(
      title: Value(title),
      content: Value(content),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isAllday: Value(isAllday),
      isNotify: Value(isNotify),
    ));
  }



  Future<int> updateTodo(Todo todo, String title,String content,DateTime startDate,DateTime endDate,bool isAllday,bool isNotify) {
    return (update(todos)..where((tbl) => tbl.id.equals(todo.id))).write(
      TodosCompanion(
        title: Value(title),
        content: Value(content),
        startDate: Value(startDate),
        endDate: Value(endDate),
        isAllday: Value(isAllday),
        isNotify: Value(isNotify),
      ),
    );
  }

  Future<void> deleteTodo(Todo todo) {
    return (delete(todos)..where((tbl) => tbl.id.equals(todo.id))).go();
  }
}