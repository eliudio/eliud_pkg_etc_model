/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/policy_presentation_repository.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

PolicyPresentationRepository? policyPresentationRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.policyPresentationRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [];
  static late AbstractRepositorySingleton singleton;

  PolicyPresentationRepository? policyPresentationRepository(String? appId);

  void flush(String? appId) {
    policyPresentationRepository(appId)!.flush();
  }
}
