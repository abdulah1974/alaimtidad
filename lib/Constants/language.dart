import 'package:get_storage/get_storage.dart';

class Language {
  final EnWords = {
    "Recent transactions": "Recent transactions",
    "Common conversions": "Common conversions",
    "Dinar": "IQD",
    "Current balance": "Current balance",
    "Wallet": "Wallet",
    'settings': 'Settings',
    "Change Password": "Change Password",
    "Who are we": "Who are we",
    "Notifications": "Notifications",
    "Connection type": "Connection type",
    "Finger print": "Finger print",
    "Language": "Language",
    "Night mode": "Night mode",
    "Profile personly":"Profile personly",
    "Name":"Name",
    "Telephone number":"Telephone number",
    "Email":"Email",
    "The address":"The address",
    "Welcome":"Welcome",
    "Mission":"Mission",
    "More":"More",
    "Categories":"Categories",
    "Language":"Language",
    "Connection type": "Connection type",
    "You are now online via":"You are now online via",
    "Bello company":"Bello company",
    "For the leading logistics services in the field of electronic solutions":"For the leading logistics services in the field of electronic solutions",
    "To contact us, please contact":"To contact us, please contact",
    "Contact us via WhatsApp":"Contact us via WhatsApp",
    "Old password":"Old password",
    "New password":"New password",
    "Confirm the password":"Confirm the password",
    "Edit account":"Edit account"
  };
  final ArWords = {
    "Recent transactions": "المعاملات الاخيره",
    "Common conversions": "التحويلات الشائعه",
    "Dinar": "IQD",
    "Current balance": "الرصيد الحالي",
    "Wallet": "محفظة",
    'settings': 'الاعدادات',
    'Change Password': 'تغير كلمه المرور',
    "Who are we": "من نحن",
    "Notifications": "الاشعارات",
    "Connection type": "نوع الاتصال",
    "Finger print": "بصمه الاصبع",
    "Language": "لغة",
    "Night mode": "الوضع الليلي",
    "Profile personly":"الملف الشخصي",
    "Name":"الاسم",
    "Telephone number":"رقم الهاتف",
    "Email":"البريد الاكتروني",
    "The address":"العنوان",
    "Welcome":"مرحبا بك",
    "Mission":"المهام",
    "More":"المزيد",
    "Categories":"التصنيفات",
    "Language":"لغة",
    "Connection type":"نوع الاتصال",
    "You are now online via":"انت الان متصل عبر ال",
    "Bello company":"شركه بيلو",
    "For the leading logistics services in the field of electronic solutions":"للخدمات اللوجستية الرائدة في مجال الحلول الالكترونية",
    "To contact us, please contact":"للتواصل معنا يرجى الاتصال ب",
    "Contact us via WhatsApp":"للتواصل معنا عبر الواتساب",
    "Old password":" الباسورد القديم",
    "New password":"كلمة السر الجديدة",
    "Confirm the password":"قم بتأكيد كلمة المرور",
    "Edit account":"تعديل الحساب"
  };
  final storage = GetStorage();

  late int language;

  Language() {
    language = int.parse(storage.read('Language').toString());
  }

  void ChangeLanguge() async {
    print('Language changed');
    if (language == 1) {
      language = int.parse("2");
      await storage.write('Language', 2);
    } else {
      language = int.parse("1");
      await storage.write('Language', 1);
    }
  }

  dynamic GetLanguge() async {
    return language;
  }

  dynamic GetWord(key) {
    if (language == 1) {
      return ArWords[key];
    } else {
      return EnWords[key];
    }
  }
}
