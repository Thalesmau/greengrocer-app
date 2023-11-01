import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(int) updatedQuantity;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.updatedQuantity,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
          leading: Image.asset(
            widget.cartItem.item.imgUrl,
            height: 60,
            width: 60,
          ),
          title: Text(
            widget.cartItem.item.itemName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
            style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            ),
            //maxLines: 2,
            //overflow: TextOverflow.ellipsis,
          ),
          trailing: QuantityWidget(
            value: widget.cartItem.quantity,
            suffixText: widget.cartItem.item.unit,
            result: widget.updatedQuantity,
            isRemovable: true,
          )),
    );
  }
}
