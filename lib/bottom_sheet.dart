import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define the method channel
const platform = MethodChannel('flutter_method_channel');

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String distance = ''; // Variable to store the received data
  String date = '';
  String time = '';
  String start = '';
  String end = '';

  @override
  void initState() {
    super.initState();
    // Receive data from the native code
    _receiveDataFromNative();
  }

  // Receive data from the native code
  Future<void> _receiveDataFromNative() async {
    if (kDebugMode) {
      print(await platform.invokeMethod('getTravelDetails'));
    }
    Map<dynamic, dynamic> data =
        await platform.invokeMethod('getTravelDetails');
    setState(() {
      distance = data['distance'].toString();
      date = data['date'].toString();
      time = data['time'].toString();
      start = data['start_point'].toString();
      end = data['end_point'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 1.0,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    distance,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(
                height: 1,
                color: Colors.grey,
                thickness: 0.2,
              ),
              const SizedBox(height: 16),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8),
                  Text(
                    start,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(), // Add a spacer to push the next widget to the right edge
                  const Icon(Icons.menu), // Add the hamburger menu icon
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8),
                      Text(
                        end,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
