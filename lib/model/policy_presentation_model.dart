/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_pkg_etc_model/model/entity_export.dart';

import 'package:eliud_pkg_etc_model/model/policy_presentation_entity.dart';

class PolicyPresentationModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_etc_model';
  static const String id = 'policyPresentations';

  @override
  String documentID;

  // This is the identifier of the app to which this belongs
  @override
  String appId;
  String? description;
  AppPolicyModel? policies;
  StorageConditionsModel? conditions;

  PolicyPresentationModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.policies,
    this.conditions,
  });

  @override
  PolicyPresentationModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    AppPolicyModel? policies,
    StorageConditionsModel? conditions,
  }) {
    return PolicyPresentationModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      policies: policies ?? this.policies,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      policies.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PolicyPresentationModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          policies == other.policies &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PolicyPresentationModel{documentID: $documentID, appId: $appId, description: $description, policies: $policies, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (policies != null) {
      referencesCollector.add(ModelReference(
          AppPolicyModel.packageName, AppPolicyModel.id, policies!));
    }
    if (policies != null) {
      referencesCollector
          .addAll(await policies!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  PolicyPresentationEntity toEntity({String? appId}) {
    return PolicyPresentationEntity(
      appId: appId,
      description: (description != null) ? description : null,
      policiesId: (policies != null) ? policies!.documentID : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<PolicyPresentationModel?> fromEntity(
      String documentID, PolicyPresentationEntity? entity) async {
    if (entity == null) return null;
    return PolicyPresentationModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<PolicyPresentationModel?> fromEntityPlus(
      String documentID, PolicyPresentationEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    AppPolicyModel? policiesHolder;
    if (entity.policiesId != null) {
      try {
        policiesHolder =
            await appPolicyRepository(appId: appId)!.get(entity.policiesId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise policies');
        print('Error whilst retrieving appPolicy with id ${entity.policiesId}');
        print('Exception: $e');
      }
    }

    return PolicyPresentationModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      policies: policiesHolder,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
