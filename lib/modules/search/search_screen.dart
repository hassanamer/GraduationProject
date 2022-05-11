import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../shared/network/remote/network.dart';
import '../../shared/styles/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}


class SearchScreenState extends State<SearchScreen> {
  final List<Post> _posts =  <Post>[];
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
        itemBuilder: (context, index)
        {
          if(!_isLoading)
          {
            return index == 0 ? _searchBar() : _checkList(index - 1);
          }else
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        itemCount: _postsDisplay.length + 1,
      ),
    );
  }


  @override
  void initState() {
    fetchPost().then((dynamic value)
    {
      setState(()
      {
        _isLoading = false;
        _posts.addAll(value);
        _postsDisplay = _posts;
      });
    });
    super.initState();
  }



  //This Class Shows The KeyWord That Will Be Used To Search
  _searchBar()
  {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(decoration:  const InputDecoration(hintText: 'search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _postsDisplay = _posts.where((post) {
              var postPlaceName= post.placename!.toLowerCase();
              var postCategory= post.category!.toLowerCase();
              var postEvent = post.eventName.toLowerCase();
              var postOffer = post.offerName.toLowerCase();
              return  (postPlaceName.contains(text) | postCategory.contains(text) | postEvent.contains(text) | postOffer.contains(text)   );
            }).toList();
          });
        },
      ),
    );
  }
  //This Class Checks Which Card Will Be Displayed
  _checkList(index){
    if(_postsDisplay[index].placename!.isNotEmpty)
    {
      return _listOfPlcaes(index);
    }
    else if(_postsDisplay[index].eventName.isNotEmpty)
    {
      return _listOfEvents(index);
    }
    else if(_postsDisplay[index].offerName.isNotEmpty)
    {
      return _listOfOffers(index);
    }
    return _checkList(index);
  }
  //The Card That Shows The List Of Events
  _listOfEvents(index){
    var image = _postsDisplay[index].img.toString();
    return Card(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              //path
              Text(
                '${_postsDisplay[index].category.toString() } >${ _postsDisplay[index].eventName.toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              //date
              Text("Date :${ _postsDisplay[index].date.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              //image
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                child: Image(image: NetworkImage(image),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //The Card That Shows The List Of Offers
  _listOfOffers(index){
    var image = _postsDisplay[index].img.toString();
    return Card(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              //path
              Text(
                '${_postsDisplay[index].category.toString() } > ${ _postsDisplay[index].offerName.toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              //price1
              Text("Price1 :${ _postsDisplay[index].price1.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              //price2
              Text("Price2 :${ _postsDisplay[index].price2.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              //image
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                child: Image(image: NetworkImage(image),),
              ),


            ],
          ),
        ),
      ),
    );
  }
  //The Card That Shows The List Of Places
  _listOfPlcaes(index){
    var image = _postsDisplay[index].img.toString();
    return Card(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              //path
              Text(
                "${_postsDisplay[index].category.toString() } > ${_postsDisplay[index].placename.toString()} ",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SmoothStarRating(
                rating:  _postsDisplay[index].rate,
                size: 40,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
              ),
              Text("price :${ _postsDisplay[index].price.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              // image
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                child: Image(image: NetworkImage(image),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
