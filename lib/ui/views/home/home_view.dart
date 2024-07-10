import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:timbu/ui/common/app_colors.dart';
import 'package:timbu/ui/common/app_strings.dart';
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
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            verticalSpaceMedium,
            viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kblack,
                    ),
                  )
                : GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: viewModel.product!.items.length,
                    itemBuilder: (context, index) {
                      String imgurl =
                          "$kimg/${viewModel.product!.items.first.photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey";

                      print(imgurl);

                      // double currentPrice = viewModel.getCurrentPrice(
                      //     viewModel.product!.items[index].currentPrice);
                      return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kblack, width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.network(
                                      height: 90,
                                      width: 200,
                                      "$kimg/${viewModel.product!.items[index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
                                      fit: BoxFit.contain,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    viewModel.product!.items[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "₦${viewModel.formatPrice(viewModel.product!.items[index].currentPrice.first.prices['NGN'][0])}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ]),
                          ));
                    })
          ]),
        ),
      )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
