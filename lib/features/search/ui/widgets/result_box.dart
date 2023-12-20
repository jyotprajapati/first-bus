import 'package:first_bus/core/utils.dart';
import 'package:first_bus/features/search/repository/search_result.dart';
import 'package:flutter/material.dart';

class SearchResultBox extends StatelessWidget {
  final Bus bus;
  const SearchResultBox({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // TODO: add deal marker here
            Row(
              children: [
                Text(
                  bus.arrTime.busTimeFormat(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 8),
                Text(
                  "•",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 42,
                  ),
                ),
                // horizontal divider
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                ),

                Text(
                  "•",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 42),
                ),
                const SizedBox(width: 8),
                Text(bus.deptTime.busTimeFormat(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                Spacer(),
                Text(
                  "₹${bus.busStatus.baseFares[0]}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Text(bus.duration,
                    style: Theme.of(context).textTheme.titleMedium),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("|"),
                ),
                Text("${bus.busStatus.availability} seats available",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(bus.companyName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),),
            const SizedBox(height: 8),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(bus.displayBusType,
                    style: Theme.of(context).textTheme.bodySmall, )),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
              onPressed: () {},
              child: Text('Select Seat',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
