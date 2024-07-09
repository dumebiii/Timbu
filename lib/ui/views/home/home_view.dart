import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timbu/ui/common/app_colors.dart';
import 'package:timbu/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: Text(
              'TIMBU.',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
          ),
          const Center(
            child: Text(
              'The market at your reach. . .',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          verticalSpaceMedium,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              'assets/img/burg.png',
              height: 24,
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                'assets/img/girl.png',
                height: 50,
                width: 50,
              ),
            )
          ]),
          viewModel.product == null
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kblack,
                    ),
                  ),
                )
              : GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemCount: viewModel.product!.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 200,
                        width: 200,
                        color: Colors.amber,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                viewModel.product!.items[index].name!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ]));
                  })
        ]),
      )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
