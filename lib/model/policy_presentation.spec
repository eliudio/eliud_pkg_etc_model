{
  "id": "PolicyPresentation",
  "packageName": "eliud_pkg_etc_model",
  "packageFriendlyName": "etc",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this belongs",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "policies",
      "displayName": "Policy",
      "fieldType": "AppPolicy",
      "association": true,
      "optional": true,
      "group": "policy"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "policy",
        "description": "Policy"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
 ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main", "eliud_core_model" ]
}