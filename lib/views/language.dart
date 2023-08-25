import 'package:get/get.dart';

class Languages extends Translations{


  @override
  Map<String, Map<String, String>> get keys =>{
    'en_us':{
      'News' : 'News',
      'Discover~':'Discover',
      'Search...':'Search...',
      'Trending News~':'Trending News~',
      'Settings':'Settings',
      'FOR ANY HELP':'FOR ANY HELP',
      'Article Details~':'Article Details~',
      'Dark':'Dark',
      'Light':'Light',
      'Language':'Language',
      'English':'English',
      'Theme':'Theme'
    },
    'ar_sy':{
      'News' : 'الأخبار',
      'Discover~':'اكتشف',
      'Settings':'الإعدادات',
      'Article Details~':'تفاصيل المقالة~',
      'Trending News~':'الاخبار الشائعة~',
      'FOR ANY HELP':'من اجل أي مساعدة',
      'Search...':'...بحث',
      'Dark':'ليلي',
      'Light':'نهاري',
      'Language':'اللغة',
      'English':'العربية',
      'Theme':'الوضع'
    },

  };
}