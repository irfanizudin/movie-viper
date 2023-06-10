# MoViper

MoViper is a movie app with viper architecture pattern

![moviper](https://github.com/irfanizudin/movie-viper/assets/67688261/eafbae8c-de52-4f8b-a901-008576bc7473)

## Features

- Show movie genre list
- Show movies based on genre
- Show movie details
- Show movie reviews
- Show movie trailer
- Infinite scrolling for movie list and movie review

## Tech Stack

- UIKit
- Programmatic UI
- WebKit

## Architecture

- VIPER architecture pattern

## Dependency

Swift Package Manager is used as a dependency manager. List of dependecies:

- [SDWebImage](https://github.com/SDWebImage/SDWebImage.git)

## API

- [TMDB API](https://developer.themoviedb.org/reference/intro/getting-started)
- [Youtube API](https://developers.google.com/youtube/v3)

## Usage

- To run this app properly, you will need an API key from TMDB API and YouTube API.
- After obtaining the API key, follow these steps:
  - Create a Swift file named "APIKey.swift" in the "Managers" folder.
  - Add the following code and replace "YOUR_TMDB_API_KEY" and "YOUR_YOUTUBE_API_KEY" with your respective API keys:
    ```
    struct APIKey {
        static let tmdbAPIKey = "YOUR_TMDB_API_KEY"
        static let youtubeAPIKey = "YOUR_YOUTUBE_API_KEY"
    }
    ```
  - The app is now ready to be run.
