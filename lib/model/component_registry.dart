/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

import 'policy_presentation_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor policyPresentationComponentConstructorDefault,
    ComponentEditorConstructor policyPresentationComponentEditorConstructor,
  ) {
    Apis.apis().getRegistryApi().addInternalComponents('eliud_pkg_etc_model', [
      "policyPresentations",
    ]);

    Apis.apis().getRegistryApi().register(
        componentName: "eliud_pkg_etc_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "policyPresentations", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "policyPresentations",
        componentConstructor: policyPresentationComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addComponentSpec('eliud_pkg_etc_model', 'etc', [
      ComponentSpec(
          'policyPresentations',
          policyPresentationComponentConstructorDefault,
          PolicyPresentationComponentSelector(),
          policyPresentationComponentEditorConstructor,
          ({String? appId}) => policyPresentationRepository(appId: appId)!),
    ]);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_etc_model',
        'policyPresentations',
        ({String? appId}) => policyPresentationRepository(appId: appId)!);
  }
}
