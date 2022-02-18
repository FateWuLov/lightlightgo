
import 'package:lifeaste/manager/database/userDao.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseTable {
  static final String user = 'user_table';
  static final String xmpp = 'xmpp_table';
  static final String order = 'order_table';
  static final String conversion = 'conversion_table';
}

class DatabaseManager {

  static DatabaseManager get instance => _getInstance();

  static DatabaseManager? _databaseManager;

  // 数据库名
  String databaseName = 'lifeaste';

  // 数据库路径
  String? databasePath;

  // 数据库版本号，1.0改为1
  int version = 1;

  Database? _database;

  static DatabaseManager _getInstance() {
    var obj = _databaseManager ?? DatabaseManager();
    if (_databaseManager == null) {
      _databaseManager = obj;
    }
    return obj;
  }

  Future<Database?> openDb(String dbName) async {
    if (_database != null && _database?.isOpen == true) {
      return _database!;
    }
    var path = databasePath ?? '';
    if (path.isEmpty) {
      path = await getDatabasesPath();
      databasePath = path;
    }
    _database = await openDatabase(join(path, dbName + '.db'),
        version: version, onCreate: (Database db, int version) async {
          // 用户表
          var batch = db.batch();
          batch.execute('CREATE TABLE ${DatabaseTable.user} (identify TEXT,'
              'isAdmin INTEGER,'
              'loginType TEXT,'
              'lastLoginType TEXT,'
              'loginId TEXT,'
              'userId TEXT PRIMARY KEY,'
              'createTime INTEGER,'
              'avatar TEXT,'
              'name TEXT,'
              'bio TEXT,'
              'about TEXT,'
              'birthday TEXT,'
              'gender INTEGER,'
              'realName TEXT,'
              'xmppPwd TEXT,'
              'coin INTEGER,'
              'totalCost REAL,'
              'loveTarotTickets INTEGER,'
              'newLoveTarotTickets INTEGER,'
              'loveFortuneTarotTickets INTEGER,'
              'relationshipTarotTickets INTEGER,'
              'yesOrNoTarotTickets INTEGER,'
              'orderInstruction TEXT,'
              'coverImage TEXT,'
              'availableService TEXT,'
              'premiumServices TEXT,'
              'goodAtCategories TEXT,'
              'accuracy REAL,'
              'accuracyCount INTEGER,'
              'rate REAL,'
              'orderCount INTEGER,'
              'orderCompleted INTEGER,'
              'orderExpired INTEGER,'
              'commentCount INTEGER,'
              'followUpDeadline INTEGER,'
              'workStatus INTEGER,'
              'hot INTEGER,'
              'interestTags TEXT,'
              'interestCategories TEXT,'
              'expressionWay INTEGER,'
              'starExperience INTEGER,'
              'approved INTEGER,'
              'awards TEXT,'
              'autoMessage TEXT,'
              'coverVideo TEXT,'
              'featureCover TEXT,'
              'nrtOrderCount INTEGER,'
              'rtOrderCompleted INTEGER,'
              'isBlockingHim INTEGER,'
              'isBlockingMe INTEGER,'
              'showRank INTEGER,'
              'adChannel TEXT,'
              'appVersion TEXT,'
              'platform TEXT,'
              'product TEXT,'
              'inviterId TEXT,'
              'inviteCode TEXT,'
              'inviteCount INTEGER,'
              'quickReadingMode TEXT,'
              'avgDeliverTime TEXT,'
              'assistantId TEXT,'
              'liveStatus INTEGER,'
              'notifyType INTEGER,'
              'firstBindEmailAt INTEGER,'
              'dailyBonus INTEGER,'
              'favorite INTEGER,'
              'threeMinutesTickets INTEGER,'
              'liveAutoMessage TEXT,'
              'facebookEmail TEXT)');

          // 消息表
          batch.execute(
              'CREATE TABLE ${DatabaseTable.xmpp} (messageId TEXT PRIMARY KEY,'
                  ' timestamp INTEGER,'
                  ' conversationId TEXT,'
                  ' messageType INTEGER,'
                  'cmdActionType INTEGER,'
                  'messageStatus INTEGER,'
                  'senderId TEXT,'
                  'senderIdentify TEXT,'
                  'receiverId TEXT,'
                  'senderName TEXT,'
                  'senderAvatar TEXT,'
                  'text TEXT,'
                  'imgRatio REAL,'
                  'thumbnailRemoteUrl TEXT,'
                  'fullImgRemoteUrl TEXT,'
                  'thumbnailLocalFileName TEXT,'
                  'fullImgLocalFileName TEXT,'
                  'orderId TEXT,'
                  'senderPlatform INTEGER,'
                  'msgVersion INTEGER,'
                  'didRead INTEGER,'
                  'easyMsg INTEGER,'
                  'premiumMsg INTEGER,'
                  'orderType INTEGER,'
                  'agoraCallContent TEXT,'
                  'showTime INTEGER,'
                  'senderProduct TEXT)');

          // 订单表
          batch.execute(
              'CREATE TABLE ${DatabaseTable.order} (orderId TEXT PRIMARY KEY,'
                  'userInfo TEXT,'
                  ' starInfo TEXT,'
                  ' status INTEGER,'
                  ' userUnread INTEGER,'
                  ' starUnread INTEGER,'
                  ' createTime INTEGER,'
                  ' expireTime INTEGER,'
                  ' updateTime INTEGER,'
                  ' question TEXT,'
                  ' situation TEXT,'
                  ' attachedPictureUrl TEXT,'
                  ' answer TEXT,'
                  ' discount TEXT,'
                  ' service TEXT,'
                  ' comment TEXT,'
                  ' rushStatus INTEGER,'
                  ' rushExpiredAt INTEGER,'
                  ' orderPrice INTEGER,'
                  ' followUpDeadline INTEGER,'
                  ' needAccuracy INTEGER)');

          // 会话表
          batch.execute('CREATE TABLE ${DatabaseTable.conversion} ('
              'conversationId TEXT PRIMARY KEY,'
              'mateIdentify TEXT,'
              'myId TEXT,'
              'mateAvatar TEXT,'
              'mateName TEXT,'
              'lastMessage TEXT)');
          await batch.commit();
        }, onUpgrade: (Database db, int oldVersion, int newVersion) {
          if (oldVersion < newVersion) {

          }
        });
    return _database;
  }

  closeDb() async {
    if (null != _database && _database?.isOpen == true) {
      _database?.close();
      _database = null;
    }
  }

  deleteDb(String dbName) async {
    var path = databasePath ?? '';
    if (path.isEmpty) {
      path = await getDatabasesPath();
      databasePath = path;
    }
    await deleteDatabase(join(path, dbName) + '.db');
  }

  Future<void> initDb(String userId) async {
    await openDb('${userId}_$databaseName');
  }

  UserDao getUserDao() {
    return UserDao(_database);
  }

  Future<UserInfoModel?> getUser(String userId) async {
    if (_database?.isOpen != true) Future.value(null);
    try {
      return getUserDao().query(userId);
    } on Exception catch (_) {
      return Future.value(null);
    }
  }

  Future<bool> updateUser(UserInfoModel model) async {
    if (_database?.isOpen != true) Future.value(false);
    try {
      return getUserDao().update(model);
    } on Exception catch (_) {
      return Future.value(false);
    }
  }
}
