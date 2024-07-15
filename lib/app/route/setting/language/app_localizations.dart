import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  void _loadLocalizedStrings() {
    final Map<String, Map<String, String>> localizedStrings = {
      'en': {
        'settings': 'Settings',
        'account': 'Account',
        'user': 'User',
        'admin': 'Admin',
        'language': 'Language',
        'notification': 'Notification',
        'dark_mode': 'Dark Mode',
        'help': 'Help',
        'email': 'Email',
        'dob': 'Date of Birth',
        'gender': 'Gender',
        'add_avatar': 'Add Avatar',
        'home': 'Home',
        'history': 'History',
        'cart': 'Cart',
        'category': 'Category',
        'product': 'Product',
        'favorite': 'Favorite',
        'list_favorite': 'Favorite List',
        'logout': 'Logout',
      },
      'vi': {
        'settings': 'Cài Đặt',
        'account': 'Tài Khoản',
        'user': 'Người Dùng',
        'admin': 'Quản Trị',
        'language': 'Ngôn Ngữ',
        'notification': 'Thông Báo',
        'dark_mode': 'Chế Độ Tối',
        'help': 'Giúp Đỡ',
        'email': 'Email',
        'dob': 'Ngày Sinh',
        'gender': 'Giới Tính',
        'add_avatar': 'Thêm Ảnh Đại Diện',
        'home': 'Trang Chủ',
        'history': 'Lịch Sử',
        'cart': 'Giỏ Hàng',
        'category': 'Danh Mục',
        'product': 'Sản Phẩm',
        'favorite': 'Yêu Thích',
        'list_favorite': 'Danh sách yêu thích',
        'logout': 'Đăng Xuất',
      },
    };
    _localizedStrings = localizedStrings[locale.languageCode] ?? localizedStrings['en']!;
  }

  String get settings => _localizedStrings['settings']!;
  String get account => _localizedStrings['account']!;
  String get user => _localizedStrings['user']!;
  String get admin => _localizedStrings['admin']!;
  String get language => _localizedStrings['language']!;
  String get notification => _localizedStrings['notification']!;
  String get darkMode => _localizedStrings['dark_mode']!;
  String get help => _localizedStrings['help']!;
  String get email => _localizedStrings['email']!;
  String get dob => _localizedStrings['dob']!;
  String get gender => _localizedStrings['gender']!;
  String get addAvatar => _localizedStrings['add_avatar']!;
  String get home => _localizedStrings['home']!;
  String get history => _localizedStrings['history']!;
  String get cart => _localizedStrings['cart']!;
  String get category => _localizedStrings['category']!;
  String get product => _localizedStrings['product']!;
  String get favorite => _localizedStrings['favorite']!;
  String get listFavorite => _localizedStrings['list_favorite'] ?? 'Favorite List';
  String get logout => _localizedStrings['logout']!;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    final localizations = AppLocalizations(locale);
    localizations._loadLocalizedStrings();
    return SynchronousFuture(localizations);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
