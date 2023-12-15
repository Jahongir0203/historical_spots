import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:historical_spots/data/services/network_service.dart';
import 'package:historical_spots/ui/consts/app_colors.dart';
import 'package:historical_spots/ui/consts/app_text_style.dart';

import '../../../data/blocs/home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc(NetworkService(Dio()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc..add(HomeLoadedEvent()),
        builder: (context, state) {
          return Scaffold(
            body: getBody(context, state),
          );
        },
      ),
    );
  }

  getBody(BuildContext context, HomeState state) {
    if (state is HomeLoadInProgressState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeLoadSuccessState) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: AppTextStyle.kExploreTextStyle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      Text('Tashkent,Uzb'),
                    ],
                  ),
                ],
              ),
              Text(
                'Uzbekistan',
                style: AppTextStyle.kUzbTextStyle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Find historical places',
                      filled: true,
                      fillColor: AppColors.kTextFieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Popular',
                  style: AppTextStyle.kUzbTextStyle,
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.places.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: state.places[index]?.xid);
                    },
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${state.places[index]?.name}',
                              style: AppTextStyle.kExploreTextStyle,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.kStarColor,
                              ),
                              Text('${state.places[index]?.rate}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(child: Text('Error'));
    }
  }
}
