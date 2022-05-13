import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readmore/readmore.dart';
import 'package:favorite_button/favorite_button.dart';

final CollectionReference data = FirebaseFirestore.instance.collection('Data').doc('Cat').collection('Beach tourism');
final CollectionReference data2 = FirebaseFirestore.instance.collection('Data').doc('Cat').collection('Coptic tourism');
final CollectionReference data3 = FirebaseFirestore.instance.collection('Data').doc('Cat').collection('Historic tourism');
final CollectionReference data4 = FirebaseFirestore.instance.collection('Data').doc('Cat').collection('Islamic tourism');
final CollectionReference data5 = FirebaseFirestore.instance.collection('Data').doc('Cat').collection('Medical tourism');


// get BeachTourism data
class BeachTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Beach Tourism'),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                streamSnapshot;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                  child: Card(
                    color: AppColors.backgroundColor,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Column(
                        children:
                        [
                          Text(
                            '${documentSnapshot['placename']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    '${documentSnapshot['img'].toString()}'),
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ReadMoreText(
                            '${documentSnapshot['description']} ',
                            style: TextStyle(color: Colors.black),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'price : ${documentSnapshot['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: documentSnapshot['rate'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 30.5,
                                direction: Axis.horizontal,
                              ),
                              Spacer(),
                              FavoriteButton(
                                isFavorite: documentSnapshot['FAV'],
                                iconColor: AppColors.primaryColor,
                                valueChanged: (_isFavorite)
                                async
                                {
                                  if (_isFavorite != null ) {
                                    if( _isFavorite == false)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});

                                    }else if ( _isFavorite == true)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});
                                    }

                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// get CopticTourism data
class CopticTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Beach Tourism'),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                streamSnapshot;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                  child: Card(
                    color: AppColors.backgroundColor,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            '${documentSnapshot['placename']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    '${documentSnapshot['img'].toString()}'),
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ReadMoreText(
                            '${documentSnapshot['description']} ',
                            style: TextStyle(color: Colors.black),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'price : ${documentSnapshot['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: documentSnapshot['rate'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 30.5,
                                direction: Axis.horizontal,
                              ),
                              Spacer(),
                              FavoriteButton(
                                isFavorite: documentSnapshot['FAV'],
                                iconColor: AppColors.primaryColor,
                                valueChanged: (_isFavorite)
                                async
                                {
                                  if (_isFavorite != null ) {
                                    if( _isFavorite == false)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});

                                    }else if ( _isFavorite == true)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});
                                    }

                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// get HistoricTourism data
class HistoricTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Beach Tourism'),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                streamSnapshot;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                  child: Card(
                    color: AppColors.backgroundColor,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            '${documentSnapshot['placename']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    '${documentSnapshot['img'].toString()}'),
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ReadMoreText(
                            '${documentSnapshot['description']} ',
                            style: TextStyle(color: Colors.black),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'price : ${documentSnapshot['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: documentSnapshot['rate'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 30.5,
                                direction: Axis.horizontal,
                              ),
                              Spacer(),
                              FavoriteButton(
                                isFavorite: documentSnapshot['FAV'],
                                iconColor: AppColors.primaryColor,
                                valueChanged: (_isFavorite)
                                async
                                {
                                  if (_isFavorite != null ) {
                                    if( _isFavorite == false)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});

                                    }else if ( _isFavorite == true)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});
                                    }

                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// get IslamicTourism data
class IslamicTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Beach Tourism'),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                streamSnapshot;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                  child: Card(
                    color: AppColors.backgroundColor,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            '${documentSnapshot['placename']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    '${documentSnapshot['img'].toString()}'),
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ReadMoreText(
                            '${documentSnapshot['description']} ',
                            style: TextStyle(color: Colors.black),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'price : ${documentSnapshot['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: documentSnapshot['rate'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 30.5,
                                direction: Axis.horizontal,
                              ),
                              Spacer(),
                              FavoriteButton(
                                isFavorite: documentSnapshot['FAV'],
                                iconColor: AppColors.primaryColor,
                                valueChanged: (_isFavorite)
                                async
                                {
                                  if (_isFavorite != null ) {
                                    if( _isFavorite == false)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});

                                    }else if ( _isFavorite == true)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});
                                    }

                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// get MedicalTourism data
class MedicalTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Beach Tourism'),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                streamSnapshot;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                  child: Card(
                    color: AppColors.backgroundColor,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            '${documentSnapshot['placename']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    '${documentSnapshot['img'].toString()}'),
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ReadMoreText(
                            '${documentSnapshot['description']} ',
                            style: TextStyle(color: Colors.black),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'price : ${documentSnapshot['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: documentSnapshot['rate'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 30.5,
                                direction: Axis.horizontal,
                              ),
                              Spacer(),
                              FavoriteButton(
                                isFavorite: documentSnapshot['FAV'],
                                iconColor: AppColors.primaryColor,
                                valueChanged: (_isFavorite)
                                async
                                {
                                  if (_isFavorite != null ) {
                                    if( _isFavorite == false)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});

                                    }else if ( _isFavorite == true)
                                    {
                                      await data.doc(documentSnapshot.id).update({"FAV": _isFavorite});
                                    }

                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
