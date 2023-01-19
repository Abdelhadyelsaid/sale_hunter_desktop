

import 'package:flutter/material.dart';
import 'package:sale_hunter/shared/style/text.dart';


class BoardingModel {
  final String image;
  final String title;
  final String tButton;
  final String skip;
  final String descriotion;

  BoardingModel({
    this.image,
    this.title,
    this.tButton,
    this.skip,
    this.descriotion,

  });
}

List<BoardingModel> boarding =[
  BoardingModel(
    image: 'assets/images/intro1.PNG',
    title: 'Cashier in your pocket',
    descriotion: "Scan any product barcode to get it's price & info instantly in few clicks using your phone",
    tButton: 'Next',
    skip: 'skip',
  ),
  BoardingModel(
    image: 'assets/images/intro2.PNG',
    title: 'Have a store?',
    descriotion: 'Get rid of creating website costs & efforts, we help you reach more customers for free'  ,
    tButton: 'Next',
    skip: 'skip',
  ),
  BoardingModel(
    image: 'assets/images/intro3.PNG',
    title: 'Find products easily',
    descriotion: 'Search for any product to get its price in market & nearest stores that selling it',
    tButton: 'Next',
    skip: 'skip',
  ),

  BoardingModel(
    image: 'assets/images/intro4.PNG',
    title: 'Hunt the best deals!',
    descriotion: "Find best price & don't miss any discounts or price drops on your favourite products",
    tButton: 'StartNow',
    skip: '',
  ),
];