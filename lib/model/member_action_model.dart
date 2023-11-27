/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc_model/model/entity_export.dart';

import 'package:eliud_pkg_etc_model/model/member_action_entity.dart';

class MemberActionModel implements ModelBase {
  static const String packageName = 'eliud_pkg_etc_model';
  static const String id = 'memberActions';

  @override
  String documentID;
  String? text;
  String? description;
  ActionModel? action;

  MemberActionModel({
    required this.documentID,
    this.text,
    this.description,
    this.action,
  });

  @override
  MemberActionModel copyWith({
    String? documentID,
    String? text,
    String? description,
    ActionModel? action,
  }) {
    return MemberActionModel(
      documentID: documentID ?? this.documentID,
      text: text ?? this.text,
      description: description ?? this.description,
      action: action ?? this.action,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      text.hashCode ^
      description.hashCode ^
      action.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberActionModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          text == other.text &&
          description == other.description &&
          action == other.action;

  @override
  String toString() {
    return 'MemberActionModel{documentID: $documentID, text: $text, description: $description, action: $action}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (action != null) {
      referencesCollector.addAll(await action!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  MemberActionEntity toEntity({String? appId}) {
    return MemberActionEntity(
      text: (text != null) ? text : null,
      description: (description != null) ? description : null,
      action: (action != null) ? action!.toEntity(appId: appId) : null,
    );
  }

  static Future<MemberActionModel?> fromEntity(
      String documentID, MemberActionEntity? entity) async {
    if (entity == null) return null;
    return MemberActionModel(
      documentID: documentID,
      text: entity.text,
      description: entity.description,
      action: await ActionModel.fromEntity(entity.action),
    );
  }

  static Future<MemberActionModel?> fromEntityPlus(
      String documentID, MemberActionEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return MemberActionModel(
      documentID: documentID,
      text: entity.text,
      description: entity.description,
      action: await ActionModel.fromEntityPlus(entity.action, appId: appId),
    );
  }
}
