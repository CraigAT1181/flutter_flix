# FlutterFlix

FlutterFlix is a simple Flutter-based movie search application that fetches and displays movie details using the OMDb API. The app includes features like search functionality, movie details display, and loading indicators for a smooth user experience.

## Features

### Search for Movies: 
Quickly search for movies by title using the OMDb API.

### Detailed Movie Information: 
View detailed information about movies, including posters, plots, actors, and ratings.

### Loading Indicators: 
Enjoy a seamless experience with stylish loading spinners using Flutter Spinkit.

## Screens

### Home:
Search for a movie, pick a movie from the Flick picker or browse new movies in the carousel (Only Search Bar currently functional).

#### Search Widget
- A search bar to look up movies
- Displays search results in a list with poster, title and year
- Handles "No Results Found" and loading states gracefully

### Flick Details:
Provides an in-depth view of a selected movie, including:
- Poster
- Title and Plot
- Cast
- Ratings from Rotten Tomatoes

## Installation

### Clone the repo
https://github.com/CraigAT1181/flutter_flix.git

### Navigate to the project directory
cd ...

### Install dependencies
flutter pub get

### Run the app on an emulator or connected device
flutter run

## Dependencies

- flutter_spinkit: For loading animations
- http: For making API requests to OMDB
- OMDB API: Provides movie data

## Usage

- Open the app
- Use the search bar to look up a movie by title
- Tap on a movie to view detailed information

## API Configuration

- Obtain an API key from OMDB API
- Add your API key to the OmdbService class in the lib/services/omdb.dart file:
  final String apiKey = '<api_key>';