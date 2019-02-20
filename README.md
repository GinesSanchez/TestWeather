# Test Weather App

## Building the app

### Prerequisites


### Building the app

At the Terminal prompt:
1. Clone the test-weather repo at GinesSanchez in Github, i.e. run `git clone git@github.com:GinesSanchez/TestWeather.git`.
2. Switch to the project directory.
3. Open `TestWeather.xcodeproj` and build the project in Xcode.

#### Note: 
* The city by default is `Karachi`. It is possible to change it in `Constants` file. In the `WeatherAPIDetails.defaultCityValue`  property.

* The api for getting the current temperature of the city is `api.openweathermap.org`.

* The localization is not implemented.

* The `View Model` is not implemented in the `Secondary` view. It is just for testing the navigation.

* The  `Network Manager` is very simple. There are the functions that we need for getting the data that we need. It is possible to create a more complex one that includes all the possible calls: Post, Put...

* It is possible to test the navigation using `Coordinators` tapping on the `red` button. In the new view controller, it is possible to come back to the previous view tapping the `blue` button.

