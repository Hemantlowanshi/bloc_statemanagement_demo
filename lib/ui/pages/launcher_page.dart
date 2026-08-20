import 'package:bloc_statemanagement_demo/cubit/info_package_cubit.dart';
import 'package:bloc_statemanagement_demo/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    context.read<InfoPackageCubit>().getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AppLogo(height: 50,width: 50,),
          ),

          // version text
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: BlocBuilder<InfoPackageCubit, InfoPackageState>(
              builder: (context, state) {
                if (state is CurrentVersion) {
                  return Text(
                    'Version ${state.version}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  );
                }
                return const Text(
                  'Loading version...',
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
