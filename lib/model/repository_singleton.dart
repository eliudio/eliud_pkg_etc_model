/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/policy_presentation_firestore.dart';
import '../model/policy_presentation_repository.dart';
import '../model/policy_presentation_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _policyPresentationRepository =
      HashMap<String, PolicyPresentationRepository>();

  @override
  PolicyPresentationRepository? policyPresentationRepository(String? appId) {
    if ((appId != null) && (_policyPresentationRepository[appId] == null)) {
      _policyPresentationRepository[appId] = PolicyPresentationCache(
          PolicyPresentationFirestore(
              () => appRepository()!
                  .getSubCollection(appId, 'policypresentation'),
              appId));
    }
    return _policyPresentationRepository[appId];
  }
}
