import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../logic/auth_cubit/auth_cubit.dart';

class BuildErrorWidget extends StatelessWidget {
  const BuildErrorWidget({super.key, required this.error});

  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          Text(error, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().getUserProfile();
            },
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
