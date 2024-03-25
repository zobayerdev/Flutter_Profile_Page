import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/nayem.png'),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                "Md. Zobayer Hasan Nayem",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                "Software Engineer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Complete your profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "(1/5)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          // sized box for spacing
          // Row is designed by expanded views
          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  width: 10,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // box shape implement
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              card.subtitle,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    elevation: 0,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(customTiles.length, (index) {
            final titls = customTiles[index];
            return Card(
              elevation: 4,
              shadowColor: Colors.black12,
              child: ListTile(
                title: Text(titls.titles),
                leading: Icon(titls.icons),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String subtitle;
  final IconData icon;

  ProfileCompletionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set your profile picture",
    subtitle: "Upload",
    icon: CupertinoIcons.person_circle,
  ),
  ProfileCompletionCard(
    title: "Upload your certificated",
    subtitle: "Upload",
    icon: CupertinoIcons.paperplane,
  ),
  ProfileCompletionCard(
    title: "Upload Banking Informations",
    subtitle: "Upload",
    icon: CupertinoIcons.creditcard,
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    subtitle: "Upload",
    icon: CupertinoIcons.doc,
  ),
];

class customTile {
  final String titles;
  final IconData icons;

  customTile({
    required this.titles,
    required this.icons,
  });
}

List<customTile> customTiles = [
  customTile(titles: "Activity", icons: Icons.insights),
  customTile(titles: "Notifications", icons: Icons.notifications),
  customTile(titles: "Location", icons: Icons.location_on_outlined),
  customTile(titles: "Settings", icons: Icons.settings),
  customTile(titles: "Privacy", icons: Icons.privacy_tip),
  customTile(titles: "Log out", icons: Icons.logout),
];
