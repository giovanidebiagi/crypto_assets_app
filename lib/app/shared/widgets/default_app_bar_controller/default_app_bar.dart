import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'default_app_bar_controller.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Crypto Assets App'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('The most expensive crypto asset is: '),
              ),
              Consumer<DefaultAppBarController>(
                builder: (_, controller, child) => controller.mostExpensiveCryptoAsset == null
                    ? const Text('')
                    : Text(
                        controller.mostExpensiveCryptoAsset!.symbol,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
