/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
//import 'package:eliud_core_model/package/packages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/tools/component/update_component.dart';

import 'package:eliud_pkg_etc_model/model/policy_presentation_list_bloc.dart';
import 'package:eliud_pkg_etc_model/model/policy_presentation_list_state.dart';
import 'package:eliud_pkg_etc_model/model/policy_presentation_list_event.dart';
import 'package:eliud_pkg_etc_model/model/policy_presentation_model.dart';
//import 'package:eliud_core_main/tools/component/update_component.dart';

typedef PolicyPresentationChanged = Function(
  String? value,
  int? privilegeLevel,
);

/* 
 * PolicyPresentationDropdownButtonWidget is the drop down widget to allow to select an instance of PolicyPresentation
 */
class PolicyPresentationDropdownButtonWidget extends StatefulWidget {
  final AppModel app;
  final int? privilegeLevel;
  final String? value;
  final PolicyPresentationChanged? trigger;
  final bool? optional;

  /* 
   * construct a PolicyPresentationDropdownButtonWidget
   */
  PolicyPresentationDropdownButtonWidget(
      {required this.app,
      this.privilegeLevel,
      this.value,
      this.trigger,
      this.optional,
      super.key});

  /* 
   * create state of PolicyPresentationDropdownButtonWidget
   */
  @override
  State<StatefulWidget> createState() {
    return _PolicyPresentationDropdownButtonWidgetState(value);
  }
}

class _PolicyPresentationDropdownButtonWidgetState
    extends State<PolicyPresentationDropdownButtonWidget> {
  PolicyPresentationListBloc? bloc;
  String? value;

  _PolicyPresentationDropdownButtonWidgetState(this.value);

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<PolicyPresentationListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (bloc != null) bloc!.close();
    super.dispose();
  }

  List<Widget> _widgets(PolicyPresentationModel value) {
    var app = widget.app;
    var widgets = <Widget>[];
    widgets.add(value.description != null
        ? Center(child: text(app, context, value.description!))
        : Center(child: text(app, context, value.documentID)));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    return BlocBuilder<PolicyPresentationListBloc, PolicyPresentationListState>(
        builder: (context, state) {
      if (state is PolicyPresentationListLoading) {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      } else if (state is PolicyPresentationListLoaded) {
        int? privilegeChosen = widget.privilegeLevel;
        if ((value != null) && (privilegeChosen == null)) {
          if (state.values != null) {
            var selectedValue = state.values!.firstWhere(
                (v) => (v!.documentID == value),
                orElse: () => null);
            privilegeChosen = selectedValue != null &&
                    selectedValue.conditions != null &&
                    selectedValue.conditions!.privilegeLevelRequired != null
                ? selectedValue.conditions!.privilegeLevelRequired!.index
                : 0;
          }
        }

//        final values = state.values;
        final items = <DropdownMenuItem<String>>[];
        if (state.values!.isNotEmpty) {
          if (widget.optional != null && widget.optional!) {
            items.add(DropdownMenuItem<String>(
                value: null,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[Text("None")],
                  ),
                )));
          }
          for (var element in state.values!) {
            items.add(DropdownMenuItem<String>(
                value: element!.documentID,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgets(element),
                  ),
                )));
          }
        }
        return ListView(physics: ScrollPhysics(), shrinkWrap: true, children: [
          dropdownButton<int>(
            widget.app,
            context,
            isDense: false,
            isExpanded: false,
            items: [
              DropdownMenuItem<int>(
                value: 0,
                child: text(widget.app, context, 'No privilege Required'),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: text(widget.app, context, 'Level 1 privilege required'),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: text(widget.app, context, 'Level 2 privilege required'),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: text(widget.app, context, 'Must be owner'),
              ),
            ],
            value: privilegeChosen,
            hint: text(widget.app, context, 'Select a privilege'),
            onChanged: _onPrivilegeLevelChange,
          ),
          Row(children: [
            ((false) == true)
                ? Container(
                    height: 48,
                    child: dropdownButton<String>(
                      widget.app,
                      context,
                      isDense: false,
                      isExpanded: false,
                      items: items,
                      value: value,
                      hint: text(
                          widget.app, context, 'Select a policyPresentation'),
                      onChanged: _onValueChange,
                    ))
                : dropdownButton<String>(
                    widget.app,
                    context,
                    isDense: false,
                    isExpanded: false,
                    items: items,
                    value: value,
                    hint: text(
                        widget.app, context, 'Select a policyPresentation'),
                    onChanged: _onValueChange,
                  ),
            if (value != null) Spacer(),
            if (value != null)
              Align(
                  alignment: Alignment.topRight,
                  child: button(
                    widget.app,
                    context,
                    icon: Icon(
                      Icons.edit,
                    ),
                    label: 'Update',
                    onPressed: () {
                      updateComponent(
                          context, widget.app, 'policyPresentations', value,
                          (newValue, _) {
                        setState(() {
                          value = value;
                        });
                      });
                    },
                  ))
          ])
        ]);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onValueChange(String? value) {
    widget.trigger!(value, null);
  }

  void _onPrivilegeLevelChange(int? value) {
    BlocProvider.of<PolicyPresentationListBloc>(context)
        .add(PolicyPresentationChangeQuery(
      newQuery: EliudQuery(theConditions: [
        EliudQueryCondition('conditions.privilegeLevelRequired',
            isEqualTo: value ?? 0),
        EliudQueryCondition('appId', isEqualTo: widget.app.documentID),
      ]),
    ));
    widget.trigger!(null, value);
  }
}
