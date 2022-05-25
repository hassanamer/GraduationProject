import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/models/city_search_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import 'cubit/searchCubit.dart';
import 'cubit/searchStates.dart';


class CitySearchScreen extends StatelessWidget {
  AppCubit appCubit;
  CitySearchScreen(this.appCubit);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,ShopStates>(
        listener: (context, state){},
        builder:(context, state) {
          var cubit = SearchCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                title: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 250,
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText1,
                          controller: searchController,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Where to go ?',
                            hintStyle: TextStyle(fontSize: 15),
                            prefixIcon: Icon(Icons.search,color: AppColors.primaryColor,),
                          ),
                          onChanged: (value) {
                            cubit.getSearchData(value);
                          },
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: ()
                          {
                            Navigator.pop(context);
                          },
                          child: Text('cancel',style: TextStyle(color: Colors.black),)
                      ),
                    ],
                  ),
                ),
              ),
              body: state is SearchLoadingState ?
              Center(child: CircularProgressIndicator()):
              cubit.citySearchModel != null?
              searchController.text.isEmpty?
              Container(): ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index) =>searchItemBuilder(cubit.citySearchModel!.data.places[index],appCubit,context) ,
                separatorBuilder:(context,index) => divider(),
                itemCount:cubit.citySearchModel?.data.places.length ?? 10,
              ) :
              Container()
          );
        },

      ),
    );
  }
  Widget searchItemBuilder(Places? model,AppCubit appCubit,context){
    return  InkWell(
      onTap: (){
        appCubit.getPlaceDetails(placeId: model!.id);
        navigateTo(context: context,widget: PlaceDetailsScreen());
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        child: Row(
          children:
          [
            Image(image: NetworkImage('${model!.image}'),width: 100,height: 100,),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text('${model.placeName}',
                    style: TextStyle(fontSize: 15,),maxLines: 3,overflow: TextOverflow.ellipsis,),
                  Spacer(),
                  Text('EGP '+'${model.city}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
