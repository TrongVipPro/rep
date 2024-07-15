import 'package:app_api/app/route/setting/widget/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:app_api/app/model/product.dart';
import 'package:provider/provider.dart';

import '../../route/setting/language/app_localizations.dart';
import '../../route/setting/language/language_privider.dart';
class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List<ProductModel> _favoriteProducts = [];
  

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.listFavorite),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
          ],
        ),
      ),
      
    );
  }
}