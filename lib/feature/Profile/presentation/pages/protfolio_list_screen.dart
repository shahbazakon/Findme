import 'package:flutter/material.dart';

import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/dialogBox/portolio_list_pop.dart';

class PortfolioListScreen extends StatefulWidget {
  const PortfolioListScreen({super.key, this.bgImage});
  final String? bgImage;
  @override
  State<PortfolioListScreen> createState() => _PortfolioListScreenState();
}

class _PortfolioListScreenState extends State<PortfolioListScreen> {
  @override
  void initState() {
    portfolioListPop(isTransparent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.bgImage == null
            ? const SizedBox.shrink()
            : Hero(
                tag: "BackgroundImageTag",
                child: Image.network(
                  widget.bgImage!,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                )));
  }
}
