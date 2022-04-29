import 'package:cubotest/Domain/Entities/products_entity.dart';
import 'package:cubotest/Presentation/state_manager.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

addProductDialog(ctx) async {

  var nameTextController = TextEditingController();
  StateManager stateManager = Get.find();
  var priceTextController = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  return await showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          title: const Text("Novo Produto"),
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: nameTextController,
                  decoration: InputDecoration(hintText: "Produto"),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceTextController,
                  decoration: const InputDecoration(hintText: "Preço"),
                )),
         TextButton(
                onPressed: () => Navigator.pop(context),
                child:    const Text(
                  "Cancelar",
                )),
            Container(
                color: Colors.lightBlue.shade800,
                child: TextButton(
                    onPressed: () async {
                      Product product = Product(
                          name: nameTextController.text,
                          price: priceTextController.numberValue);
                      await stateManager.repository
                          .insertProduct(product.toJson());
                      await stateManager.fetchAllProducts();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        );
      });
}
