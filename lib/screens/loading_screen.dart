import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//  double longitude;
//  double latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

//  void getLocation() async {
//    Location location = Location();
//    await location.getLocation();
////    print('Latitude: ${location.latitude}');
////    print('Longitude: ${location.longitude}');
//    latitude = location.latitude;
//    longitude = location.longitude;
//
//    getData();
//  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

//    print(weatherData);
    // Introduce delay for smooth transition from Spinner
    // to Location Data
    //Duration duration = Duration(seconds: 1);

    //await Future.delayed(duration);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

//  void getData() async {
//    double temperature = decodedData['main']['temp'];
//    int condition = decodedData['weather'][0]['id'];
//    String cityName = decodedData['name'];
//  }

  @override
  Widget build(BuildContext context) {
//    String myMargin = 'abc';
//    double myMarginAsDouble;
//    try {
//      myMarginAsDouble = double.parse(myMargin);
//    } catch (e) {
//      // Respond to the exception
//      myMarginAsDouble = 30;
//    }
//
//    return Scaffold(
//      body: Container(
//        margin: EdgeInsets.all(myMarginAsDouble),
//        color: Colors.red,
//      ),
//    );
//    getData();
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// OLD build() method
//@override
//Widget build(BuildContext context) {
//  return Scaffold(
//    body: Center(
//      child: RaisedButton(
//        onPressed: () {
//          //Get the current location
//          getLocation();
//        },
//        child: Text('Get Location'),
//      ),
//    ),
//  );
//}
