import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:historical_spots/ui/consts/app_png.dart';
import 'package:historical_spots/ui/consts/app_text_style.dart';

import '../../../data/blocs/splash_bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  SplashBloc splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashBloc,
      child: BlocListener<SplashBloc, SplashState>(
        bloc: splashBloc..add(SplashEvent()),
        listener: (context, state) {
          if (state is SplashCompleteState) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  AppPng.kSplashPng,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Uzbekistan',
                        style: AppTextStyle.kUzbekistanETxtStyle,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 400),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plan your',
                            style: AppTextStyle.kPlanTextStyle,
                          ),
                          Text(
                            'Historical',
                            style: AppTextStyle.kHistoricalTextStyle,
                          ),
                          Text(
                            'Vacation',
                            style: AppTextStyle.kHistoricalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
