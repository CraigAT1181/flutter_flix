import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_flix/services/omdb.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // Declare a Map to hold the details of the movie and a loading state initialised to false
  Map<String, dynamic>? _movieDetails;
  bool _isLoading = false;

  // Function to retrieve movie details on receipt of the movie's ID
  void fetchFlickDetails(String imdbID) async {
    final OmdbService _omdbService = OmdbService();

    setState(() {
      _isLoading = true;
    });

    // Retrieve the movie details and update state variable _movieDetails
    try {
      final flickDetails = await _omdbService.fetchFlickDetails(imdbID);

      setState(() {
        _movieDetails = flickDetails;
      });
    } catch (error) {
      print('Error fetching flick details: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Using didChangeDependencies to access flickId after widget initialization
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final flickId = ModalRoute.of(context)?.settings.arguments as String?;
    if (flickId != null) {
      fetchFlickDetails(flickId);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.grey[850],
        body: const Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_movieDetails?['Title'] ?? 'No Title Found'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _movieDetails != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _movieDetails?['Poster'] != null &&
                          _movieDetails?['Poster'] != 'N/A'
                      ? Image.network(_movieDetails!['Poster'])
                      : const Icon(Icons.movie, size: 100),
                  const SizedBox(height: 16),
                  Text(
                    _movieDetails!['Title'] ?? 'Unknown Title',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _movieDetails!['Plot'] ?? 'No description available.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Starring',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(_movieDetails!['Actors']),
                  const SizedBox(height: 20.0),
                  Text(
                    _movieDetails!['Ratings'][1]['Source'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(_movieDetails!['Ratings'][1]['Value'])
                ],
              ),
            )
          : const Center(
              child: Text('Failed to load movie details'),
            ),
    );
  }
}
