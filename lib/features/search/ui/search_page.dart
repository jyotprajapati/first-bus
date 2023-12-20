import 'package:first_bus/features/search/ui/bloc/search_cubit.dart';
import 'package:first_bus/features/search/ui/widgets/result_box.dart';
import 'package:first_bus/features/search/ui/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit(fromCity: "4292",toCity: "6772", date: "2023-12-25" )..search();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body:   Column(
        children: [
          SearchBox(
            fromCity: "Ahmedabad",
            toCity: "Bangalore",
            fromDate: "25 Dec' 23",
            toDate: "25 Dec' 23",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  // TODO: This should be a button
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                           ,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.tune,
                    ),
                  ),
                  const SizedBox(width: 8),
                     Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                           ,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                        ),
                        const SizedBox(width: 8),
                        // TODO: This should be a dropdown
                        Text(
                          "Sort by",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                   const SizedBox(width: 8),
                  // TODO: This should be a button
                     Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                           ,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "AC",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                     
                      ],
                    ),
                  ),
                    const SizedBox(width: 8),
                     Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                           ,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "AC",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                     
                      ],
                    ),
                  ),  const SizedBox(width: 8),
                     Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                           ,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "AC",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                     
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
         BlocBuilder<SearchCubit, SearchState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchSuccess) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical:10.0),
                        child: SearchResultBox(
                          bus: state.results[index],
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is SearchError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          },
         )
        ],
      ),
    );
  }
}