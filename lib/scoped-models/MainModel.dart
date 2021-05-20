import 'package:demo_skill_mine/scoped-models/PassData.dart';
import 'package:scoped_model/scoped_model.dart';

import 'RestAPI.dart';



class MainModel extends Model with  RestAPI,PassData {}
