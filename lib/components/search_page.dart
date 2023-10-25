import 'package:flutter/material.dart';

class Business {
  final String name;
  final String address;
  final String description;

  Business(
      {required this.name, required this.address, required this.description});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Business> restaurants = [
    // Your list of restaurants goes here
    Business(
      name: "Alice's Corner",
      address: "37 W. New York St, Aurora, IL 60506",
      description:
          "Alice's Corner is a locally owned and operated Bolivian family restaurant. We bring to the community a new concept of flavors, coming from South America we bring delicious Bolivian food prepared with care and love.",
    ),
    Business(
      name: "Altiro Latin Fusion",
      address: "1 S. Stolp Ave., Aurora 60506",
      description:
          "Altiro Latin Fusion owners Roberto and Erika provide patrons with an experience. Enjoy tasty tacos, soups, and more delivered tapas style.",
    ),
    Business(
      name: "Aurora Tap House",
      address: "134 W. Downer Pl., Aurora",
      description:
          "The longest bar in town! Visit this old-time bar and take in the nostalgia of a tin ceiling and friendly patrons. It’ll soon become your favorite neighborhood hangout. Visit the Aurora Tap House Facebook page!",
    ),
    Business(
      name: "Ballydoyle Irish Pub",
      address: "28 W. New York St., Aurora, IL 60506",
      description:
          "Ballydoyle is situated along Restaurant Row in downtown Aurora and offers the best in comfort food and live entertainment. The friendly Irish pub and restaurant are open for lunch and dinner. Enjoy mac and cheese bites at the bar or a vegetable boxty out on the deck that overlooks the Fox River. It’s a great place to get away from it all.",
    ),
    Business(
      name: "Calla Lily Victorian Tea Room",
      address: "83 S. LaSalle St., Aurora, IL",
      description:
          "The beautiful Calla Lily tea room is located in Historic downtown Aurora. The Calla Lily Victorian Tea Room serves the Chicagoland area making your event something more than just a tea party. Come for just lunch or plan a party with us. We want you to know just how special your occasion is to us, even if the occasion is simply “Just because.” We serve the freshest foods and highest quality teas. You simply pick the date, pick your menu, and leave the rest to us. We love creating personalized packages to fit every budget!",
    ),
    Business(
      name: "Charlie’s Silver Spoon Creamery",
      address: "6 E. Downer Pl., Aurora",
      description:
          "An ice cream shop passionate about rich flavors and fresh ingredients. Charlie’s Silver Spoon Creamery is named in homage to the Silverplate building that it is housed in at the northeast corner of Downer Place and Stolp Avenue. The shop serves up about a dozen small batch, homemade ice cream flavors.",
    ),
    Business(
      name: "Chupacabra Puerto Rican Kitchen",
      address: "31 N. Broadway, Aurora 60505",
      description:
          "We're a family of foodies who are passionate about cooking. We are also blessed to have four beautiful daughters who are also passionate about cooking. We hope you'll taste all the love in our food.",
    ),
    Business(
      name: "Cinco de Mayo Bakery",
      address: "102 N. Lake St., Aurora 60506",
      description: "A bakery in Aurora, IL",
    ),
    Business(
      name: "Craft Urban",
      address: "41 S. Stolp Ave., Aurora 60505",
      description:
          "Creating food and beverage pairings you crave, highlighting local artisan producers, and presenting them in a fun and approachable way.",
    ),
    Business(
      name: "Dairy Queen",
      address: "31 N. Broadway, Aurora 60505",
      description:
          "Stop by Dairy Queen on Lake Street near downtown for some classic soft serve ice cream. A staple for years, Dairy Queen is a perfect treat after dinner or after a show. Now open year-round!",
    ),
    Business(
      name: "Doughballs Pizza Palace",
      address: "40 W. New York St., Aurora",
      description:
          "Doughballs Pizza is a great place to pick up a quick slice of yummy New York-style pizza. Or call ahead and pick up a pie to eat in or go. A handful of tables offer the chance to sit and relax.",
    ),
    Business(
      name: "Endiro Coffee",
      address: "29 W. New York St., Aurora, IL",
      description:
          "A better menu, better coffee, better locations, and better careers. Enter the world of Endiro. A world that sees an end to child vulnerability. Enjoy lunch on their patio along the Fox River Trail or waffles on the deck, and read more about their mission HERE.",
    ),
    Business(
      name: "French 75 Gallery and Lounge",
      address: "56 E. Galena Blvd., Aurora 60505",
      description:
          "French 75 is a fine art gallery and cocktail lounge combined.",
    ),
    Business(
      name: "Hollywood Casino",
      address: "1 W. New York St., Aurora",
      description:
          "Try award-winning steak at Fairbanks or treat yourself to a bite from Take Two. Hollywood Casino Aurora boasts some of the best casino dining options in the Chicago area. They offer a variety of choices, each with its own unique experience. From a quick bit to eat at Take Two between spins on the slots, to a truly fine dining experience at Fairbanks Steakhouse, Hollywood Casino Aurora dining can’t be beaten.",
    ),
    Business(
      name: "Jake’s Bagels",
      address: "220 N. Broadway, Aurora",
      description:
          "At Jake’s the bagels are made from scratch and steam-baked daily. Because the bagels are steamed and not boiled they’re soft both on the inside and out. Not only are the bagels homemade right in the shop, so is everything sold at Jake’s. With 15 different kinds of bagels and over 10 flavors of cream cheese, and a featured flavor of the month, there’s sure to be something to please everyone’s taste buds!",
    ),
    Business(
      name: "Jimmy John’s",
      address: "160 S. River St., Aurora",
      description:
          "Jimmy John’s sandwich shop is located on the ground floor of River Street Plaza. Dine in or get quick delivery. Enjoy a river view in the rear or an enjoyable lunch on the front patio.",
    ),
    Business(
      name: "Kathryn’s Place",
      address: "61 S. Stolp Ave, Aurora 60506",
      description:
          "Kathryn’s Place is an urban service hub, designed to create healthy alternatives with all-natural juices, acai bowls, protein shakes, and more!",
    ),
    Business(
      name: "La Central",
      address: "110 E Galena Blvd, Aurora, IL 60505",
      description: "A restaurant in Aurora, IL",
    ),
    Business(
      name: "La France Bakery",
      address: "118 E. Galena Blvd., Aurora",
      description:
          "Pick up cakes, bakery items, doughnuts, delicious flan, and dos leches cake out of their eye-popping, lip-licking display cases. La France welcomes you with an elegant ambiance and delicious, sweet treats. Enjoy quality-crafted custom cakes or a dessert after dinner in downtown Aurora. They offer indoor and outdoor cafe seating.",
    ),
    Business(
      name: "La Quinta de los Reyes",
      address: "36 E. New York St., Aurora",
      description:
          "La Quinta de los Reyes is a fine Mexican restaurant located on the northwest corner of New York and Broadway. Famed for their fresh table-side salsa and guacamole, La Quinta is a standout in downtown Aurora. The two-story building boasts lots of room and an outdoor patio. Live mariachi music and karaoke add to the festive ambiance.",
    ),
    Business(
      name: "Miss Lee’s Lounge",
      address: "215 E. Galena Blvd., Aurora",
      description:
          "Welcome to your new neighborhood bar! Miss Lee's Lounge is a friendly stop for a beverage or a game of pool. Join the fun at karaoke night. Enjoy a night out under the stars in their back patio oasis.",
    ),
    Business(
      name: "New China Hut",
      address: "140 S. River St., Aurora",
      description:
          "Dine in, carry out, or deliver. Noodles! Veggies! Tofu! And more. New China Hut #3 is a great choice for lunch or dinner in downtown Aurora.",
    ),
    Business(
      name: "Stolp Island Social",
      address: "5 E. Galena",
      description:
          "Where 1920s Aurora meets refined timelessness. A place that makes you feel like you belong, Amy Morton’s newest eatery boasts steaks, pasta, and a seasonal menu, and is located directly next to the Paramount Theater. Amy Morton’s seasonal kitchen and steakhouse are welcoming, relaxed, and warm.",
    ),
    Business(
      name: "Society 57",
      address: "100 S. River St., Aurora",
      description:
          "Located in Aurora’s historical Pocus building, Society 57 is a seven-day a week social space designed to imaginatively bring people together from all walks of life. Our first phase, includes over 9,000 square feet of space and features a premiere wedding and event venue, an innovative coffeehouse, mid-size meeting rooms and more. Society 57. Where culture, coffee, and community build a legacy to be remembered.",
    ),
    Business(
      name: "Subway",
      address: "5 E. Downer Pl., Aurora",
      description:
          "In a hurry? Grab a quick bite to eat at everyone’s favorite sandwich shop. Subway sandwich shop is located on the ground floor of the parking garage at Downer Place and Stolp Avenue in downtown Aurora.",
    ),
    Business(
      name: "Tavern on Broadway",
      address: "24 N. Broadway",
      description:
          "Cozy, welcoming tavern in Downtown Aurora with a full menu of lunch and dinner options that pair well with a wide array of craft beverages. A wall by the bar contains a bourbon, rye, and Scotch whiskey collection. Outdoor patio seating provides sunset views over Paramount Theatre and Hollywood Casino. Enclosed, heated patio space gives diners a winter and springtime option for seating.",
    ),
    Business(
      name: "Taqueria Durango",
      address: "101 S. LaSalle St., Aurora",
      description:
          "Facebook review: “My favorite place for tacos. Great portions. Pastor and Lengua tacos are awesome! Mi lugar favorito para comer tacos. Las porciones son excelentes! Los tacos de Lengua y al Pastor de lujo!”",
    ),
    Business(
      name: "Taqueria El Tio",
      address: "81 S. River St, Aurora",
      description:
          "Popular among locals, Taqueria El Tio boasts 1 dollar tacos on Mondays and a full menu for lunch and dinner. It’s conveniently located across from the Santori Library on River Street.",
    ),
    Business(
      name: "Tecalitlan Mexican Restaurant",
      address: "35 S. Broadway, Aurora",
      description:
          "Review from Yelp: “This place is probably one of the best Mexican places I’ve ever eaten at. The staff is sweet, and the restaurant itself is nice and clean. They start you off with chips and salsa which is ridiculously delicious! The salsa is spicy, but so so good! Once you start eating the salsa you won’t be able to stop..we asked for seconds and the lady was more than willing to give us more.”",
    ),
    Business(
      name: "Torresmania",
      address: "3 S. Lincoln Ave, Aurora",
      description:
          "Enjoy authentic Mexican food at Torresmania #3 just east of the river. A cozy booth awaits you for lunch or dinner. Rated 4 1/2 stars on Yelp!",
    ),
    Business(
      name: "Tortas Guadalajara",
      address: "100 S. River St., Aurora",
      description: "Enjoy authentic Mexican food at Tortas Guadalajara.",
    ),
    Business(
      name: "Two Brothers Roundhouse",
      address: "205 N. Broadway, Aurora",
      description:
          "Two Brothers Roundhouse is an Aurora destination. Passion for beer, love of food, and appreciation for great architecture flourishes in the walls of this historic 70,000 square foot facility. Listed on the National Register of Historic Places, Two Brothers Roundhouse is the oldest limestone roundhouse in the United States. As with their beer and food, the live entertainment has a local flair. Whether it be a wedding, reunion, or corporate event, Two Brothers has a variety of spaces for friends and family to gather.",
    ),
    Business(
      name: "Wyckwood House",
      address: "80 S. River St., Aurora",
      description:
          "Shop local! Wyckwood House offers a unique shopping experience featuring goods and gifts from local artisans in downtown Aurora. Find the latest fashions, too. Love the next item you buy for your home or for yourself at Wyckwood House. Now with a lounge and cocktail bar!",
    ),
  ];

  List<Business> searchResults = [];

  void searchBusinesses(String query) {
    setState(() {
      searchResults = restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
              restaurant.description
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142464),
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for restaurants or businesses',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: searchBusinesses,
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final business = searchResults[index];
                  return _buildBusinessItem(business);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBusinessDetails(BuildContext context, Business business) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            business.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                business.address,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                business.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBusinessItem(Business business) {
    return Card(
      child: ListTile(
        title: Text(business.name),
        onTap: () {
          _showBusinessDetails(context, business);
        },
      ),
    );
  }
}
