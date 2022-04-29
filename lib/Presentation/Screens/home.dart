import 'package:cubotest/Presentation/state_manager.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

StateManager stateManager = Get.find();

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    stateManager.fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await addProductDialog(context);
        },
      ),
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: Get.height*0.1,
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Minha Lista",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(() => Text(
                        "${stateManager.qtdOfItems.value} Items",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(() => Text(
                        "R\$ ${stateManager.totalPrice.value} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ],
          ),
            ),

          ),
          Expanded(
            child: Container(
              child: Obx(() => stateManager.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  :  stateManager.qtdOfItems.value!=0?ListView(
                      children: [
                        for (var product in stateManager.listOfSavedPrducts)
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.08),
                            child: ListTile(
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      stateManager.deleteProduct(product);
                                    });
                                  },
                                ),
                                leading: Checkbox(
                                  onChanged: (newValue) {
                                    setState(() {
                                      product.isSelected = newValue;
                                      stateManager.getTotalOfList();
                                    });
                                  },
                                  value: product.isSelected! ? true : false,
                                ),
                                subtitle:
                                    Text("R\$ " + product.price.toString()),
                                title: Text(product.name!)),
                          )
                      ],
                    ):const Center(child: Text("Sem Items Adicionados"),)),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
            ),
          )
        ],
      ),
    ));
  }


  _buildAppBar(){

    List<String> monthsOfYear = [
      "",
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez"
    ];
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              stateManager.fetchAllProducts();
            },
            icon: const Icon(Icons.refresh))
      ],
      leading: const Icon(EvaIcons.shoppingCart),
      title: Text(DateTime.now().day.toString() +
          " , " +
          monthsOfYear[DateTime.now().month]),
    );
  }
}
