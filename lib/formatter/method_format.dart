import 'package:clean_architecture_generator/models/usecase_model.dart';

class MethodFormat {
  String space = " " * 15;

  String parameters(List<CommendType> parameters) {
    String data = '{';
    for (var para in parameters) {
      data += 'required ${para.type.toString()} ${para.name.toString()},';
    }
    if (data == '{') {
      return '';
    }
    return "$data }";
  }

  String requestParameters(List<CommendType> parameters) {
    String data = '';
    for (var para in parameters) {
      data += '${para.name.toString()}: request!.${para.name.toString()},';
    }
    return data;
  }

  String passingParameters(List<CommendType> parameters) {
    String data = '';
    for (var para in parameters) {
      data += '${para.name.toString()}: ${para.name.toString()},';
    }
    return data;
  }

  String parametersWithValues(List<CommendType> parameters) {
    String data = '';
    for (var para in parameters) {
      data +=
          '${para.name.toString()}: ${initData(para.type.toString(), para.name.toString())},';
    }
    return data;
  }

  String returnType(String type) {
    return type
        .replaceFirst('Future<', '')
        .replaceFirst('>', '')
        .replaceFirst('?>>', '>?>');
  }

  String responseType(String value) {
    return value
        .replaceFirst('BaseResponse<', "")
        .replaceFirst('>', "")
        .replaceFirst('?', '');
  }

  dynamic initData(String type, String name) {
    if (type == 'String') {
      return '"$name"';
    } else if (type == 'double') {
      return 2.0;
    } else if (type == 'int') {
      return 2;
    } else if (type == 'bool') {
      return true;
    } else if (type == 'num') {
      return 2.0;
    } else if (type == 'List') {
      return [];
    }
  }
}
