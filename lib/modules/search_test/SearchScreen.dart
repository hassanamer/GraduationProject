import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/models/search_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/modules/search_test/searchCubit.dart';
import 'package:smarttouristguide/modules/search_test/states.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/components/components.dart';


class SearchScreenn extends StatelessWidget {
  AppCubit appCubit;
  SearchScreenn(this.appCubit);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,ShopStates>(
        listener: (context, state){},
        builder:(context, state) {
          SearchCubit cubit = SearchCubit.get(context);

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
                          hintText: 'What are you looking for ?',
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(Icons.search,color: Colors.red,),
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
                        },
                        child: Text('cancel',style: TextStyle(color: Colors.black),)
                    ),
                  ],
                ),
              ),
            ),
            body: state is SearchLoadingState ?
            Center(child: CircularProgressIndicator()):
            cubit.searchModel != null?
            searchController.text.isEmpty?
            Container(): ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index) =>searchItemBuilder(cubit.searchModel?.data!.places![index],appCubit,context) ,
              separatorBuilder:(context,index) => SizedBox(
                height: 10,
              ),
              itemCount:cubit.searchModel?.data!.places!.length ?? 10,
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
       navigateTo(
         widget: PlaceDetailsScreen(),
         context: context,
       );
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
                  Text('EGP '+'${model.rate}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
