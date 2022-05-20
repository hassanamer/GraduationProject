import 'package:flutter/material.dart';
import '../../layout/cubit/cubit.dart';
import '../../models/post.dart';
import '../../shared/network/remote/network.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final List<Post> _posts = <Post>[];
  List<Post> _postsDisplay = <Post>[];
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (!_isLoading) {
            return index == 0 ? _searchBar() : _checkList(index - 1);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        itemCount: AppCubit.get(context).homeModel!.data.home_places.length,
      ),
    );
  }

  @override
  void initState() {
    fetchPost().then((dynamic value) {
      setState(() {
        _isLoading = false;
        AppCubit.get(context).homeModel!.data.home_places.addAll(value);
        _postsDisplay = _posts;
      });
    });
    super.initState();
  }

  //This Class Shows The KeyWord That Will Be Used To Search
  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: const InputDecoration(
          suffix: Icon(Icons.search),
          hintText: 'search...',
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _postsDisplay = _posts.where((post) {
              var postPlaceName = post.placename!.toLowerCase();
              var postCategory = post.category!.toLowerCase();
              var postEvent = post.eventName.toLowerCase();
              var postOffer = post.offerName.toLowerCase();
              return (postPlaceName.contains(text) |
                  postCategory.contains(text) |
                  postEvent.contains(text) |
                  postOffer.contains(text));
            }).toList();
          });
        },
      ),
    );
  }

  //This Class Checks Which Card Will Be Displayed
  _checkList(index) {
    if (_postsDisplay[index].placename!.isNotEmpty) {
      return _listOfPlcaes(index);
    } else if (_postsDisplay[index].eventName.isNotEmpty) {
      return _listOfEvents(index);
    } else if (_postsDisplay[index].offerName.isNotEmpty) {
      return _listOfOffers(index);
    }
    return _checkList(index);
  }

  //The Card That Shows The List Of Events
  _listOfEvents(index) {
    var image = _postsDisplay[index].img.toString();
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(100, 50.0)),
      child: Card(
        color: AppColors.backgroundColor,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${_postsDisplay[index].eventName.toString()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 95.0,
                      ),
                      Text(
                        " ${_postsDisplay[index].date.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.date_range,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //The Card That Shows The List Of Offers
  _listOfOffers(index) {
    var image = _postsDisplay[index].img.toString();
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(100, 50.0)),
      child: Card(
        color: AppColors.backgroundColor,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${_postsDisplay[index].offerName.toString()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100.0,
                      ),
                      Icon(
                        Icons.attach_money,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //The Card That Shows The List Of Places
  _listOfPlcaes(index) {
    var image = AppCubit.get(context).homeModel!.data.home_places[index].image;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
      child: Card(
        color: AppColors.backgroundColor,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //path
                Text(
                  ' ${AppCubit.get(context).homeModel!.data.home_places[index].placeName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: AppCubit.get(context)
                            .homeModel!
                            .data
                            .home_places[index].rate,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                        ),
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 90.0,
                      ),
                      Text(
                        " ${_postsDisplay[index].price.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      Icon(
                        Icons.attach_money,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: AppColors.primaryColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: Text(
                              'View',
                              style: TextStyle(color: Colors.white),
                            )),
                            SizedBox(
                              width: 60.0,
                            ),
                            IconButton(
                              onPressed: () {
                                // PlacesScreen(
                                //   catIndex1: index,
                                //   catName1: ,
                                // );
                              },
                              icon: Icon(Icons.play_arrow_rounded),
                              autofocus: true,
                              color: Colors.white,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
