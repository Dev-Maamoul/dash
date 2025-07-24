import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/stores/stores/cubit/stores_cubit.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoresCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<StoresCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100.sw,
                child: BlocBuilder<StoresCubit, StoresState>(
                  builder: (context, state) {
                    if (state is! UpdateStoreState) {
                      print(cubit.authLocater.stores.length);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "المتاجر",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              HomeCardSearch(),
                            ],
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: _calculateCrossAxisCount(
                                      context,
                                    ),
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio:
                                        _calculateChildAspectRatio(context),
                                  ),
                              itemCount: cubit.authLocater.stores.length,
                              itemBuilder: (context, index) => Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 150,
                                    maxWidth: 500,
                                  ),

                                  child: CardDisplayAccount(
                                    imageURL: cubit
                                        .authLocater
                                        .stores[index]
                                        .avatarImg,
                                    name:
                                        cubit
                                            .authLocater
                                            .stores[index]
                                            .storeName ??
                                        "------",
                                    subtitle1:
                                        cubit
                                            .authLocater
                                            .stores[index]
                                            .typeCategory
                                            ?.ar ??
                                        "------",
                                    subtitle2:
                                        cubit
                                            .authLocater
                                            .stores[index]
                                            .city
                                            ?.cityAr ??
                                        "------",
                                    onTap: () {
                                      context.go(
                                        Routes.storeDisplay,
                                        extra: cubit.authLocater.stores[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);
    if (width <= 900) return 2;
    if (width <= 1050) return 3;
    if (width < 1300) return 4;

    return 4;
  }

  double _calculateChildAspectRatio(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);
    if (width < 900) return 7 / 1.6;
    if (width < 1050) return 7 / 2.5;
    if (width < 1200) return 7 / 2.4;
    if (width < 1400) return 7 / 2.3;

    return 7 / 1.8;
  }
}

class CardDisplayAccount extends StatelessWidget {
  const CardDisplayAccount({
    super.key,
    required this.name,
    required this.subtitle1,
    required this.subtitle2,
    this.imageURL,
    this.onTap,
  });
  final String name;
  final String subtitle1;
  final String subtitle2;
  final String? imageURL;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 0.09.sw,
        width: 0.30.sw,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(maxHeight: 80, minHeight: 65),
        child: ListTile(
          isThreeLine: true,
          leading: CachedNetworkImage(
            imageUrl:
                imageURL ??
                "https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account//logo.png",
            // errorListener: (value) => "----",
            scale: 1,

            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(
            name,
            maxLines: 2,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle1,
                maxLines: 1,

                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
              ),
              Text(
                subtitle2,
                maxLines: 1,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
