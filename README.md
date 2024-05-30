# Flutter Developer Test Assignment

This repository contains the test assignment for a Flutter developer position. The main goal is to implement a screen based on the provided Figma design, adhering to all specified parameters such as size, color, and font. Additionally, the application should retrieve data from a REST API and implement pagination.

# Task Description

## Screen Implementation

- Implement the screen as per the Figma design.
- Each item in the ListView should have a colored Container.
- Each subsequent Container in the ListView should generate a random background color from 16777216 colors using - RGB values. Please avoid using packages for color generation.

## Data Retrieval

- Fetch data from the provided REST API.
- Implement pagination to load the next 15 items when scrolling down.

## Potential Improvements

### Error Handling
- Improve error handling to provide meaningful error messages to the user in case of API failures or network issues.

### Localization
- Add support for multiple languages to cater to a wider audience.

### Testing
- Write unit tests and integration tests to ensure the reliability and stability of the application.

## Installation

1. Clone the repository:
    ```sh
    git clone git@github.com:IliaKhuzhakhmetov/CryptoListWithPagination.git
    ```

2. Install the dependencies:
    ```sh
    flutter pub get
    ```

3. Create a `.env` file in the root directory with your API keys:
    ```env
    COIN_CAP_API_KEY=your_api_key
    ```

4. Run the application:
    ```sh
    flutter run
    ```

## Dependencies

- Dio, oauth2 (for HTTP requests)
- BLoC (for state management)
- Flutter_dotenv (for environment variables)

## Usage

1. Open the application.
2. Start typing the name of a city in the search bar.
3. Select the city from the dropdown list.
4. The current temperature for the selected city will be displayed below the search bar.


