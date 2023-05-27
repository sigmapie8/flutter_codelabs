part of 'my_store_page.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  set itemsInCart(Set<String> value) {}

  void _handleAddToCart(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  void _handleRemoveFromCart(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  Widget _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: AppStateScope.of(context).itemsInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id, context),
      onRemoveFromCart: () => _handleRemoveFromCart(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppStateScope.of(context)
          .productList
          .map((item) => _buildProductTile(item, context))
          .toList(),
    );
  }
}
