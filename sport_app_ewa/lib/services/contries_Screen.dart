import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
final List<Map<String, dynamic>> countries = [
    {'Aruba': 'Country', 'flag': 'assets/flags/flag1.png'},
    {'Africa': 'Country', 'flag': 'assets/flags/flag2.png'},
    {'name': 'Afghanistan', 'flag': 'assets/flags/flag3.png'},
    {'name': 'frica Eastern and Southern', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Africa Western and Central', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Angola', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Albania', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Andorra', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Arab World', 'flag': 'assets/flags/flag3.png'},
    {'name': 'United Arab Emirates', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Argentina', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Armenia', 'flag': 'assets/flags/flag3.png'},
    {'name': 'American Samoa', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Antigua and Barbuda', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Australia', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Austria', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Azerbaijan', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Burundi', 'flag': 'assets/flags/flag3.png'},
    {'name': 'East Asia & Pacific', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Europe & Central Asia ', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Belgium', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Benin', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Burkina', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bangladesh', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bulgaria', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bahrain', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bahamas', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bosnia and Herzegovina', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Latin America & the Caribbean', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Belarus', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Belize', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Middle East & North Africa', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bermuda', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bolivia', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Brazil', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Barbados', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Brunei Darussalam', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Sub-Saharan Africa', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Bhutan', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Botswana', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Sub-Saharan Africa', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Central African Republic', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Canada', 'flag': 'assets/flags/flag3.png'},
    {'name': 'East Asia and the Pacific', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Central Europe and the Baltics', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Europe and Central Asia', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Switzerland', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Channel Islands', 'flag': 'assets/flags/flag3.png'},
    {'name': 'Chile', 'flag': 'assets/flags/flag3.png'},
    

    // Add more countries here
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Center(
        child: const Text('List of countries'),
      ),
    );
  }

  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Image.asset(
                    country['flag'],
                    width: 32,
                    height: 32,
                  ),
                  title: Text(country['name']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.location_on),
                        onPressed: () {
                          showLocationDetails(context, currentPosition);
                        },
                      ),
                      if (currentPosition != null)
                        Text(
                          'Lat: ${currentPosition!.latitude.toStringAsFixed(2)}, '
                          'Long: ${currentPosition!.longitude.toStringAsFixed(2)}',
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (currentPosition != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Current Location: Lat: ${currentPosition!.latitude.toStringAsFixed(2)}, '
                'Long: ${currentPosition!.longitude.toStringAsFixed(2)}',
              ),
            ),
        ],
      ),
    );
  }

  void showLocationDetails(BuildContext context, Position? position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Details'),
          content: Text(
            'Latitude: ${position?.latitude}\nLongitude: ${position?.longitude}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}