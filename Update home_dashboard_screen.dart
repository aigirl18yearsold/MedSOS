Scaffold(

  floatingActionButton: FloatingActionButton(

    onPressed: () {
      // Notifications
    },

    child: const Icon(Icons.notifications),

  ),

  bottomNavigationBar: NavigationBar(

    selectedIndex: 0,

    destinations: const [

      NavigationDestination(
        icon: Icon(Icons.home),
        label: "Home",
      ),

      NavigationDestination(
        icon: Icon(Icons.medication),
        label: "Medicine",
      ),

      NavigationDestination(
        icon: Icon(Icons.smart_toy),
        label: "AI",
      ),

      NavigationDestination(
        icon: Icon(Icons.sos),
        label: "Emergency",
      ),

      NavigationDestination(
        icon: Icon(Icons.person),
        label: "Profile",
      ),

    ],

  ),

);
