import 'package:flutter/material.dart';
import '../data/app_colors.dart';
import '../models/field2_model.dart';

class Humidity extends StatelessWidget {
  String icon;
  Stream stream;

  Humidity({
    super.key,
    required this.icon,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.mainColor, width: 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/5,
            height: MediaQuery.of(context).size.width/5,
            child: Image.asset(icon, fit: BoxFit.fill,),
          ),
          Center(
            child: StreamBuilder(
              stream: stream,
              builder: (_, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return CircularProgressIndicator();
                // }
                if (snapshot.hasError) {
                  return const Text('Error');
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data');
                }
                Field2Model field = snapshot.data;
                return Text(field.field2);
              },
            ),)
        ],
      ),
    );
  }
}