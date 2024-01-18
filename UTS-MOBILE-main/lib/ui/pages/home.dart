part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> navMenu = [
      const TicketPage(),
      const Movies(),
      const ProfilePage()
    ];
    return Scaffold(
        appBar: _index == 2
            ? null
            : AppBar(
                toolbarHeight: 80,
                title: const HomeAppBarTitle(),
                backgroundColor: Colors.deepPurple,
                automaticallyImplyLeading: false,
              ),
        body: navMenu[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepPurple,
          unselectedItemColor:Colors.white,
          selectedItemColor: Colors.black87,
          currentIndex: _index,
          // onTap: ,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_outlined),
              label: "Ticket",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            )
          ],
        ));
  }
}

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Row(
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                  image: NetworkImage(userData.data!.profile!),
                ))),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  userData.data!.nama!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600
                    ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Rp. ${NumberFormat("#,##0", "id_ID").format(userData.data!.wallet)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
