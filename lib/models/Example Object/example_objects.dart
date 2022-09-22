import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/price_choose_list.dart';
import 'package:estibafy_user/models/Classes/Profile%20Class/country_choose.dart';
import 'package:estibafy_user/models/Classes/Profile%20Class/province_choose.dart';
import 'package:estibafy_user/models/Classes/user.dart';

class ExampleObjects {
  static User user = User(
    name: 'Emilia Clarke',
    email: 'emiliaclarke@gmail.com',
    phoneNumber: '305-667-5677',
    password: 'meowmeow',
  );
 static List provinceChooseList =[
    'Guayas',
    'Alabama',
    'Alaska',
    'Arizona',
    'California',
    'Colorado',
    'Delaware',
    'Florida',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
  ];

 static List countryChooseList=[
    'Ecuador',
    'Brazil',
    'Colombia',
    'Argentina',
    'Peru',
    'Chile',
    'Paraguay',
    'Uruguay',
    'Guyana',
    'Suriname',
  ];

  static List<String> priceChoose = <String>[
    ' 100',
    ' 200',
    ' 300',
    ' 400',
    ' 500',
    ' 600',
    ' 700',
    ' 800',
    ' 900',
  ];
}
