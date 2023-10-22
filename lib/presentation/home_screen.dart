import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connected/logic/blocs/internet_bloc.dart';
import 'package:internet_connected/logic/blocs/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internet"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is InternetConnectedState) {
                  return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wifi,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "Connected",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ));
                } else if (state is InternetDisconnectedState) {
                  return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wifi_off_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "Disconnected",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ));
                } else {
                  return Text("Loading");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
