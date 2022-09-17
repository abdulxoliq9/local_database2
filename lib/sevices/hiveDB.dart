import 'package:hive/hive.dart';
import 'package:local_database2/user/user.dart';

class HiveDB{
  
  var box = Hive.box('data');

  storeUser(User user)async{
    box.put('user', user.toJson());
  }
  User loadUser(){
    var user = User.fromJson(box.get('user'));
    return user;
  }
  removeUser(){
    box.delete('user');
  }
}