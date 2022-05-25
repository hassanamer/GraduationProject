

abstract class ShopStates {}

///General States
class InitialState extends ShopStates{}
class ChangeModeState extends ShopStates{}
class ChangeBottomNavState extends ShopStates{}
class ChangeSuffixIconState extends ShopStates{}
class GetTokenSuccessState extends ShopStates{}
class EditPressedState extends ShopStates{}
class CloseTopSheet extends ShopStates{}
class RefreshPage extends ShopStates{}
///End of General states

class FCMErrorState extends ShopStates{}
///End of FCM State

class LogOutErrorState extends ShopStates{}
///End of LogOut State

///Home State
class HomeLoadingState extends ShopStates{}
class HomeSuccessState extends ShopStates{}
class HomeErrorState extends ShopStates{}
///End of Home State


///Product State
class ProductLoadingState extends ShopStates{}
class ProductSuccessState extends ShopStates{}
class ProductErrorState extends ShopStates{}
///End of Product State

///Categories State
class CategoriesLoadingState extends ShopStates{}
class CategoriesSuccessState extends ShopStates{}
class CategoriesErrorState extends ShopStates{}
///End of Categories State


///CategoriesDetails State
class CategoryDetailsLoadingState extends ShopStates{}
class CategoryDetailsSuccessState extends ShopStates{}
class CategoryDetailsErrorState extends ShopStates{}
///End of CategoriesDetails State


///Search State
class SearchLoadingState extends ShopStates{}
class SearchSuccessState extends ShopStates{}
class SearchErrorState extends ShopStates{}
///End of Search State

///ChangeFavorites State
class ChangeFavoritesLoadingState extends ShopStates{}
class ChangeFavoritesManuallySuccessState extends ShopStates{}
class ChangeFavoritesErrorState extends ShopStates{}
///End of ChangeFavorites State



///Favorites State
class FavoritesLoadingState extends ShopStates{}
class FavoritesSuccessState extends ShopStates {}
class FavoritesErrorState extends ShopStates{}
///End of Favorites State

///Cart State
class CartLoadingState extends ShopStates{}
class CartSuccessState extends ShopStates {}
class CartErrorState extends ShopStates{}
///End of Cart State

///Cart State
class UpdateCartLoadingState extends ShopStates{}
class UpdateCartSuccessState extends ShopStates {}
class UpdateCartErrorState extends ShopStates{}
class MinusCartItemState extends ShopStates{}
class PlusCartItemState extends ShopStates{}

///Add Delete Address State
class DeleteAddressLoadingState extends ShopStates{}
class DeleteAddressSuccessState extends ShopStates {}
class DeleteAddressErrorState extends ShopStates{}
///End of delete Address State

///Addresses State
class AddressesLoadingState extends ShopStates{}
class AddressesSuccessState extends ShopStates {}
class AddressesErrorState extends ShopStates{}
///End of Addresses State

///FAQs State
class FAQsLoadingState extends ShopStates{}
class FAQsSuccessState extends ShopStates {}
class FAQsErrorState extends ShopStates{}
///End of FAQs State

///Profile State
class ProfileLoadingState extends ShopStates{}
class ProfileSuccessState extends ShopStates {}
class ProfileErrorState extends ShopStates{}
///End of Profile State



