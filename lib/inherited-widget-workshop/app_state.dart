class AppState {
  AppState({
    required this.productList,
    this.itemsInCart = const <String>{},
  });

  final List<String> productList;
  final Set<String> itemsInCart;

  AppState copyWith({
    List<String>? productList,
    Set<String>? itemsInCart,
  }) {
    return AppState(
      productList: productList ?? this.productList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }

  @override
  bool operator ==(covariant AppState other) {
    return productList.hashCode == other.productList.hashCode &&
        itemsInCart.hashCode == other.itemsInCart.hashCode;
  }

  @override
  int get hashCode => Object.hashAll([productList, itemsInCart]);
}
