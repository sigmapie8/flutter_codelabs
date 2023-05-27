import 'package:flutter/material.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/app_state.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/app_state_scope.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/data.dart';
import 'package:flutter/foundation.dart';

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(productList: Server.getProductList());

  void setProductList(List<String> newProductList) {
    if (!listEquals(newProductList, _data.productList)) {
      setState(() {
        _data = _data.copyWith(
          productList: newProductList,
        );
      });
    }
  }

  void addToCart(String id) {
    if (!_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
    }
  }

  void removeFromCart(String id) {
    if (_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}
