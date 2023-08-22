import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/data/cart_items.dart';
import 'package:shoppingapp/data/wishlist_items.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

import '../../../data/grocery_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListNavigateButtonClickedEvent>(
        homeProductWishListNavigateButtonClickedEvent);
    on<HomeProductCartNavigateButtonClickedEvent>(
        homeProductCartNavigateButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
        //in this event run/show HomeLoadingState 
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
          products: GroceryData.groceryProducts
              .map(
                (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  imageName: e['imageName'],
                  price: e['price'],
                  // discription: e['discription'],
                ),
              )
              .toList()),
    );
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('You favorite this product');
    //i'm using this to add the products i liked on the homescreen to my list of wishlist items
    wishlistItems.add(event.clickedWishlistItem);
    //here i am passing the snackbar when the user likes a product
    emit(HomeWishlistSnackbarActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Item has been added to the cart');
    //i'm using this to add the products i carted on the homescreen to my list of cartList items
    cartItems.add(event.clickedCartItem);
    //here i am passing the snackbar when the user add a product to the cart
    emit(HomeCartSnackbarActionState());
  }

  FutureOr<void> homeProductWishListNavigateButtonClickedEvent(
      HomeProductWishListNavigateButtonClickedEvent event,
      Emitter<HomeState> emit) {
    debugPrint('Wishlist navigate button pressed');
    //This is when i work on the navigation part.
    emit(HomeNavigateToWishListActionState());
  }

  FutureOr<void> homeProductCartNavigateButtonClickedEvent(
      HomeProductCartNavigateButtonClickedEvent event,
      Emitter<HomeState> emit) {
    debugPrint('Cart Navigate button pressed');
    emit(HomeNavigateToCartListActionState());
  }
}
