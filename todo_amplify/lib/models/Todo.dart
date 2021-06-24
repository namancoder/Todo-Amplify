/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String title;
  final bool isDone;
  final TemporalDateTime timeAdded;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Todo._internal(
      {
      required this.id,
      required this.title,
      required this.isDone,
      required this.timeAdded });

  factory Todo(
      {
        required String id,
      required String title,
      required bool isDone,
      required TemporalDateTime timeAdded}) {
    return Todo._internal(
        id: id == null ? UUID.getUUID() : id,
        title: title,
        isDone: isDone,
        timeAdded: timeAdded);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        title == other.title &&
        isDone == other.isDone &&
        timeAdded == other.timeAdded;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$title" + ", ");
    buffer.write(
        "isDone=" + (isDone != null ? isDone.toString() : "null") + ", ");
    buffer.write(
        "timeAdded=" + (timeAdded != null ? timeAdded.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Todo copyWith(
      {String ?id, String ?title, bool ?isDone, TemporalDateTime ?timeAdded}) {
    return Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        timeAdded: timeAdded ?? this.timeAdded);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        isDone = json['isDone'],
        timeAdded =  json['timeAdded'] != null
            ? TemporalDateTime.fromString(json['timeAdded'])
            : null! ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'timeAdded': timeAdded?.format()
      };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField ISDONE = QueryField(fieldName: "isDone");
  static final QueryField TIMEADDED = QueryField(fieldName: "timeAdded");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.TITLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.ISDONE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.TIMEADDED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();

  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
