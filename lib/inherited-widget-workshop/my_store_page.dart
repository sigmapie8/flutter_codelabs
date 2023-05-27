import 'package:flutter/material.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/app_state_scope.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/app_state_widget.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/data.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/product_tile.dart';

part 'product_list_widget.dart';
part 'shopping_cart_icon.dart';

class MyStorePage extends StatefulWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  State<MyStorePage> createState() => _MyStorePageState();
}

class _MyStorePageState extends State<MyStorePage> {
  bool _inSearch = false;
  final TextEditingController _searchboxTextController =
      TextEditingController();
  final FocusNode _searchboxFocusNode = FocusNode();

  List<String> get productList => AppStateScope.of(context).productList;

  void _toggleSearch() {
    setState(() {
      _inSearch = !_inSearch;
    });
    AppStateWidget.of(context).setProductList(Server.getProductList());
    _searchboxTextController.clear();
  }

  void _handleSearch() {
    _searchboxFocusNode.unfocus();
    AppStateWidget.of(context).setProductList(
        Server.getProductList(filter: _searchboxTextController.text));
  }

  @override
  void dispose() {
    _searchboxFocusNode.dispose();
    _searchboxTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network('$baseAssetURL/google-logo.png'),
                ),
                title: _inSearch
                    ? TextField(
                        autofocus: true,
                        focusNode: _searchboxFocusNode,
                        controller: _searchboxTextController,
                        onSubmitted: (_) => _handleSearch(),
                        decoration: InputDecoration(
                          hintText: 'Search Google Store',
                          prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: _handleSearch),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: _toggleSearch),
                        ),
                      )
                    : null,
                actions: [
                  if (!_inSearch)
                    IconButton(
                      onPressed: _toggleSearch,
                      icon: const Icon(Icons.search, color: Colors.black),
                    ),
                  const ShoppingCartIcon(),
                ],
                backgroundColor: Colors.white,
                pinned: true,
              ),
              const SliverToBoxAdapter(
                child: ProductListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
