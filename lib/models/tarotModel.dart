import 'package:lifeaste/common/tools.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tarotModel.g.dart';

/// 写在配置文件里的分类名字
const String TarotResultTypeToday = "today";
const String TarotResultTypeGeneralLove = "generalLove";
const String TarotResultTypeLoveFortune = "loveFortune";
const String TarotResultTypeNewLove = "newLove";
const String TarotResultTypeRelationship = "relationship";
const String TarotResultTypeYesOrNo = "yesOrNo";
const double TarotCardRatio = 357 / 546;

enum TarotType {
  unknown,
  generalLove,
  career,
  today,
  loveFortune,
  newLove,
  relationship,
  yesOrNo,
}

@JsonSerializable()
class TarotModel {

  /// 图片资源名字，唯一
  @JsonKey(defaultValue: '')
  String imgName;

  /// 卡片显示的名字
  @JsonKey(defaultValue: '')
  String displayName;

  /// 各种类型的解释
  @JsonKey(defaultValue: [])
  List<TarotResultModel> results;

  ///抽卡的时间戳，用于today抽卡
  @JsonKey(defaultValue: 0)
  int timestamp;

  TarotModel(
    this.displayName,
    this.imgName,
    this.results,
    this.timestamp,
  );


  factory TarotModel.fromJson(Map<String, dynamic> json) =>
      _$TarotModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$TarotModelToJson(this));

  String imagePath() {
    return 'lib/resources/pic_tarot/' + imgName + '.png';
  }

  TarotResultModel? todayResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeToday) {
        return model;
      }
    }
    return null;
  }

  TarotResultModel? yesNoResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeYesOrNo) {
        return model;
      }
    }
    return null;
  }

  TarotResultModel? generalLoveResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeGeneralLove) {
        return model;
      }
    }
    return null;
  }

  TarotResultModel? newLoveResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeNewLove) {
        return model;
      }
    }
    return null;
  }

  TarotResultModel? relationshipResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeRelationship) {
        return model;
      }
    }
    return null;
  }

  TarotResultModel? loveFortuneResult() {
    for (TarotResultModel model in results) {
      if (model.type == TarotResultTypeLoveFortune) {
        return model;
      }
    }
    return null;
  }
}

@JsonSerializable()
class TarotResultModel {
  /// 结果类型，跟抽牌入口对应
  @JsonKey(defaultValue: '')
  late String type;

  /// TarotResultTypeToday、TarotResultTypeLoveFuture的关键词
  @JsonKey(defaultValue: '')
  late String keywords;

  /// TarotResultTypeYesOrNo的选牌结果，YES或者NO
  @JsonKey(defaultValue: '')
  late String actions;

  /// 选一张牌时，取第一个元素做解释
  /// 选多张牌时，在对应位置的解释，从左往右，第几位就取第几个元素
  @JsonKey(defaultValue: [])
  late List<String> explanations;

  TarotResultModel();

  factory TarotResultModel.fromJson(Map<String, dynamic> json) =>
      _$TarotResultModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$TarotResultModelToJson(this));
}
