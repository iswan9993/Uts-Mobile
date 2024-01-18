part of 'pages.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 130;
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          color: Colors.white,
          width: width,
          margin: const EdgeInsets.only(top: 25, bottom: 5),
          child: Headtitle(
            text: "Promo For You!",
            size: 30,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: width,
          height: width * 9 / 16,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  width: width / 1.1,
                  height: width * 9 / 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/picture$index.png.jpg"),
                          fit: BoxFit.cover)),
                ),
              );
            },
          ),
        ),
        Container(
          width: width,
          margin: const EdgeInsets.only(top: 25, bottom: 5),
          child: Headtitle(
            text: "Now Playing",
            size: 25.0,
          ),
        ),
        FutureBuilder(
          future: Api.futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Data is still loading
              return Padding(
                padding:
                    EdgeInsets.fromLTRB(width / 2.15, 50, width / 2.15, 50),
                child:const  Center(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              // Error occurred
              debugPrint("API failed: ${snapshot.error}");
              return Container(
                alignment: Alignment.center,
                child: const Text(
                  'Failed to load data. Please try again later.',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              // No data available
              return Container(
                alignment: Alignment.center,
                child: const Text(
                  'No movies available.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              // Data is available
              List<Film> films = snapshot.data as List<Film>;
              return Container(
                margin: const EdgeInsets.only(top: 10),
                width: width,
                height: height * 2 / 8,
                color: Colors.transparent,
                child: RawScrollbar(
                  controller: _scrollController,
                  thumbColor: Colors.deepPurple,
                  thumbVisibility: true,
                  trackVisibility: false,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: films.length,
                    itemBuilder: (BuildContext context, int index) {
                      Film film = films[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MovieDetailPage(
                                film: film,
                              );
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              left: 12.5, right: 12.5, bottom: 15),
                          width: (height * 2 / 8 - 45) / 1.1,
                          height: height * 2 / 8 - 45,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: NetworkImage(film.thumbnailUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
        Container(
          width: width,
          margin: const EdgeInsets.only(top: 25, bottom: 5),
          child: Headtitle(
            text: "Coming Soon",
            size: 25.0,
          ),
        ),
        Container(
          width: width,
          height: height * 3 / 8,
          color: Colors.transparent,
          child: FutureBuilder<List<Film>>(
            future: Api.futureDataSoon,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched, show a loading indicator
                return Padding(
                  padding:
                      EdgeInsets.fromLTRB(width / 2.2, 100, width / 2.2, 100),
                  child: const Center(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // If there is an error, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // If data is successfully fetched, build the UI with the film information
                List<Film> films = snapshot.data ?? [];
                return RawScrollbar(
                  controller: _scrollController2,
                  thumbColor: Colors.deepPurple,
                  thumbVisibility: true,
                  trackVisibility: false,
                  child: ListView.builder(
                    controller: _scrollController2,
                    scrollDirection: Axis.horizontal,
                    itemCount: films.length,
                    itemBuilder: (BuildContext context, int index) {
                      Film film = films[index];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 5, 25),
                        width: width * 6 / 8,
                        height: height * 3 / 8 - 35,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: NetworkImage(film.backdropUrl ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 6 / 8,
                              height: (height * 3 / 8 - 35) * 6 / 8,
                            ),
                            Container(
                              width: width * 6 / 8,
                              height: (height * 3 / 8 - 35) * 2 / 8,
                              padding: EdgeInsets.all(
                                  ((height * 2 / 8) * 2 / 8) / 4),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Colors.deepPurple,
                              ),
                              child: Text(
                                film.title ?? '',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Raleway",
                                  fontSize: 17,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
