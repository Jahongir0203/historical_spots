import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:historical_spots/data/blocs/detail_bloc/detail_bloc.dart';
import 'package:historical_spots/data/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:historical_spots/data/services/network_service.dart';
import 'package:historical_spots/ui/consts/app_colors.dart';
import 'package:historical_spots/ui/consts/app_text_style.dart';
import 'package:historical_spots/ui/pages/map_page/map_page.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.xid}) : super(key: key);
  final String xid;
  DetailBloc detailBloc = DetailBloc(NetworkService(Dio()));
FavoriteBloc favoriteBloc=FavoriteBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: BlocBuilder<DetailBloc, DetailState>(
        bloc: detailBloc..add(DetailLoadedEvent(xid)),
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: getBody(context, state),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  state is DetailLoadSuccessState
                      ? Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              MapPage(
                                point: state.placesDetailModel.point!,
                                title: state.placesDetailModel
                                    .wikipediaExtracts?.title ??
                                    'no',
                              )))
                      : null;
                },
                child: const Icon(Icons.map),
              ),
            ),
          );
        },
      ),
    );
  }

  getBody(BuildContext context, DetailState state) {
    if (state is DetailLoadInProgressState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is DetailLoadSuccessState) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1.6,
                        child: BlurHash(
                          hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                          image: '${state.placesDetailModel.preview?.source}',
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.kMainColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 5,
                                spreadRadius: 5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => FavoriteBloc(),
                        child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          bloc: favoriteBloc..add(FavoriteStopededEvent()),
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 130, right: 15),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.kMainColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: AppColors.kBoxShadow,
                                          offset: Offset(1, 2),
                                          blurRadius: 5,
                                          spreadRadius: 5,
                                        ),
                                      ]),
                                  child: IconButton(
                                    onPressed: () {
                                      if(state is FavoriteFailState){
                                        favoriteBloc.add(FavoriteLoadedEvent());
                                      }

                                      if(state is FavoriteLoadState){
                                        favoriteBloc.add(FavoriteStopededEvent());
                                      }

                                    },
                                    icon: Icon(
                                      state is FavoriteFailState? Icons.favorite_border : Icons.favorite,
                                      size: 22,
                                      color:state is FavoriteFailState ? Colors.black : Colors.red ,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  state.placesDetailModel.wikipediaExtracts?.title ?? "",
                  style: AppTextStyle.kTitleTextStyle,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.kStarColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('${state.placesDetailModel.rate}'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  state.placesDetailModel.wikipediaExtracts?.text ?? "",
                  style: AppTextStyle.kDescriptionTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text('Error');
    }
  }
}
