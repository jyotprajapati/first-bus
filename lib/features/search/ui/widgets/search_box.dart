import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String fromDate;
  final String toDate;
  const SearchBox({
    super.key,
    required this.fromCity,
    required this.toCity,
    required this.fromDate,
    required this.toDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                  fromCity,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.swap_horiz,
                color: Theme.of(context).primaryColor,
                ),
              ),
             Text(
                  toCity,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
              Spacer(),
              // edit button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Date: $fromDate",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8),
                child: Text(
                  "•",
                  style: TextStyle(
                   color:
                      Theme.of(context).colorScheme.onSurface ,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "Return Date: $toDate",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
