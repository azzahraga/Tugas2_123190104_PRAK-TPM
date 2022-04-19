import 'package:hive/hive.dart';

part 'contact_list_model.g.dart';

@HiveType(typeId: 1)
class ContactListModel{

  ContactListModel({required this.username, required this.password});

  @HiveField(0)
  String username;
  String password;

  @override
  String toString() {
    return 'ContactListModel{name: $username, password : $password}';
  }
}