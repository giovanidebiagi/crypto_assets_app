import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:crypto_assets_app/app/shared/constants.dart';
import 'package:crypto_assets_app/app/shared/utils/text_formatting_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/remove_confirmation_dialog.dart';

class CryptoAssetsQuotationTable extends StatefulWidget {
  const CryptoAssetsQuotationTable({Key? key}) : super(key: key);

  @override
  State<CryptoAssetsQuotationTable> createState() => _CryptoAssetsQuotationTableState();
}

class _CryptoAssetsQuotationTableState extends State<CryptoAssetsQuotationTable> {
  late Future _getCryptoAssets;

  @override
  void initState() {
    _getCryptoAssets =
        // Provider.of<CryptoAssetsQuotationTableController>(context, listen: false)
        //     .generateCryptoAssetsDataMock();
        Provider.of<CryptoAssetsQuotationTableController>(context, listen: false)
            .fetchCryptoAssetsData(cryptoAssetsSymbols);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCryptoAssets,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width) * 0.1,
          child:
              Consumer<CryptoAssetsQuotationTableController>(builder: (context, controller, child) {
            return Table(
              border: const TableBorder(horizontalInside: BorderSide()),
              children: List<TableRow>.generate(
                controller.cryptoAssets.length + 1,
                (index) {
                  if (index == 0) {
                    return TableRow(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Symbol',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Current price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    );
                  } else {
                    return TableRow(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(controller.cryptoAssets[index - 1].name),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(controller.cryptoAssets[index - 1].symbol),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              TextFormattingUtils.doubleToCurrency(
                                  value: controller.cryptoAssets[index - 1].currentPrice),
                            ),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => RemoveCryptoAssetFromListConfirmationDialog(
                                  cryptoAsset: controller.cryptoAssets[index - 1],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            );
          }),
        );
      },
    );
  }
}
