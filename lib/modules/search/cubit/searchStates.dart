abstract class SearchStates {}

///General States
class InitialState extends SearchStates{}
class ChangeModeState extends SearchStates{}
class ChangeBottomNavState extends SearchStates{}
class ChangeSuffixIconState extends SearchStates{}
class GetTokenSuccessState extends SearchStates{}
class EditPressedState extends SearchStates{}
class CloseTopSheet extends SearchStates{}
class RefreshPage extends SearchStates{}
///End of General states

class FCMErrorState extends SearchStates{}
///End of FCM State

class LogOutErrorState extends SearchStates{}
///End of LogOut State

///Home State
class HomeLoadingState extends SearchStates{}
class HomeSuccessState extends SearchStates{}
class HomeErrorState extends SearchStates{}
///End of Home State


///Product State
class ProductLoadingState extends SearchStates{}
class ProductSuccessState extends SearchStates{}
class ProductErrorState extends SearchStates{}
///End of Product State

///Categories State
class CategoriesLoadingState extends SearchStates{}
class CategoriesSuccessState extends SearchStates{}
class CategoriesErrorState extends SearchStates{}
///End of Categories State


///CategoriesDetails State
class CategoryDetailsLoadingState extends SearchStates{}
class CategoryDetailsSuccessState extends SearchStates{}
class CategoryDetailsErrorState extends SearchStates{}
///End of CategoriesDetails State


///Search State
class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{}
class SearchErrorState extends SearchStates{}
///End of Search State

///ChangeFavorites State
class ChangeFavoritesLoadingState extends SearchStates{}
class ChangeFavoritesManuallySuccessState extends SearchStates{}
class ChangeFavoritesErrorState extends SearchStates{}
///End of ChangeFavorites State



///Favorites State
class FavoritesLoadingState extends SearchStates{}
class FavoritesSuccessState extends SearchStates {}
class FavoritesErrorState extends SearchStates{}
///End of Favorites State

///Cart State
class CartLoadingState extends SearchStates{}
class CartSuccessState extends SearchStates {}
class CartErrorState extends SearchStates{}
///End of Cart State

///Cart State
class UpdateCartLoadingState extends SearchStates{}
class UpdateCartSuccessState extends SearchStates {}
class UpdateCartErrorState extends SearchStates{}
class MinusCartItemState extends SearchStates{}
class PlusCartItemState extends SearchStates{}

///Add Delete Address State
class DeleteAddressLoadingState extends SearchStates{}
class DeleteAddressSuccessState extends SearchStates {}
class DeleteAddressErrorState extends SearchStates{}
///End of delete Address State

///Addresses State
class AddressesLoadingState extends SearchStates{}
class AddressesSuccessState extends SearchStates {}
class AddressesErrorState extends SearchStates{}
///End of Addresses State

///FAQs State
class FAQsLoadingState extends SearchStates{}
class FAQsSuccessState extends SearchStates {}
class FAQsErrorState extends SearchStates{}
///End of FAQs State

///Profile State
class ProfileLoadingState extends SearchStates{}
class ProfileSuccessState extends SearchStates {}
class ProfileErrorState extends SearchStates{}
///End of Profile State



