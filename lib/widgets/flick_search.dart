import 'package:flutter/material.dart';
import 'package:flutter_flix/services/omdb.dart';

class FlickSearch extends StatefulWidget {
  const FlickSearch({super.key});

  @override
  State<FlickSearch> createState() => _FlickSearchState();
}

class _FlickSearchState extends State<FlickSearch> {
  // Declare a controller, initialise private variable flicks as an empty list and set loading state to false
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _flicks = [];
  bool _isLoading = false;

  // Instantiate the OmdbService
  final OmdbService _omdbService = OmdbService();

  // Function to call omdbService's searchFlick and store result in flicks
  void _searchFlicks(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    List<dynamic> flicks = await _omdbService.searchFlick(query);

    setState(() {
      _flicks = flicks;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Searchbar body with controller. Calls searchFlicks onSubmitted
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
              hintText: 'Looking for anything in particular?',
              prefixIcon: Icon(Icons.search)),
          onSubmitted: (query) => _searchFlicks(query),
        ),
        const SizedBox(height: 10),
        // Conditional render of ListView based on isLoading state
        Expanded(
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _flicks.isEmpty && _searchController.text.isNotEmpty
                  ? const Center(
                      child: Text('No results found.'),
                    )
                  : ListView.builder(
                      itemCount: _flicks.length,
                      itemBuilder: (context, index) {
                        final flick = _flicks[index];
                        return ListTile(
                          leading: flick['Poster'] != null &&
                                  flick['Poster'] != 'N/A'
                              ? Image.network(
                                  flick['Poster'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.movie),
                          title: Text(flick['Title']),
                          subtitle: Text(flick['Year']),
                          onTap: () {
                            Navigator.pushNamed(context, '/details',
                                arguments: flick['imdbID']);
                          },
                        );
                      },
                    ),
        )
      ],
    );
  }
}
