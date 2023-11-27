/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc_model/model/member_action_model.dart';

abstract class MemberActionListState extends Equatable {
  const MemberActionListState();

  @override
  List<Object?> get props => [];
}

class MemberActionListLoading extends MemberActionListState {}

class MemberActionListLoaded extends MemberActionListState {
  final List<MemberActionModel?>? values;
  final bool? mightHaveMore;

  const MemberActionListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'MemberActionListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MemberActionListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MemberActionNotLoaded extends MemberActionListState {}
