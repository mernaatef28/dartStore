import 'dart:io';


import 'Product.dart';

import 'Shop.dart';
import 'Users.dart';

main() {
  print("choose : \n 1.user \n 2.admin");
  int choose = int.parse(stdin.readLineSync()!);
  List<Product> productlist = [];
  Users admin1 = Users("admin", "email");
  Shop shop = Shop(admin1, productlist);
  do {

    if (choose == 1) {
      stdout.write('enter your name :') ;
      String name = stdin.readLineSync()! ;
      stdout.write('enter your email :') ;
      String email = stdin.readLineSync()! ;
      if (admin1.visitors.isNotEmpty){
        for (int i = 0 ; i <admin1.visitors.length ; i++  ){
          if (admin1.visitors[i].name == name && admin1.visitors[i].email == email  ) {
            shop.showProduct () ;
            print ("do you want to : \n 1.add to the cart \n 2.remove from the cart \n 3.show cart details \n 0: exit user ") ;
            int choice0 = int.parse(stdin.readLineSync()!) ;
            do{
              if (choice0== 1 ){
                print('how many products do you want to add to your cart :') ;
                int num = int.parse(stdin.readLineSync()!) ;

                // user add a product to the shopping cart
                for (int i=0 ; i< num ; i++) {
                  print ("choose the number of the product you want to add ") ;
                  int choice = int.parse(stdin.readLineSync()!) ;
                  admin1.cart.addProduct(productlist[choice-1] ) ;
                  print("how many product of this type do you want to add");
                  int quantity2 = int.parse(stdin.readLineSync()!) ;
                  admin1.cart.product[i].quantity = quantity2 ;
                }

              }
              else if (choice0==2) {
                if (admin1.cart.product.isEmpty){
                  print ("product cart is empty ") ;
                  stdout.write('how many products do you want to add to your cart :') ;
                  int num = int.parse(stdin.readLineSync()!) ;
                  // user add a product to the shopping cart
                  for (int i=0 ; i<num ; i++) {
                    print ("choose which product you want to add ") ;
                    int choice = int.parse(stdin.readLineSync()!) ;
                    admin1.cart.addProduct(productlist[choice]);
                    print("how many product of this type do you want to add");
                    int quantity2 = int.parse(stdin.readLineSync()!) ;
                    admin1.cart.product[i].quantity = quantity2 ;
                  }
                }
                else {
                  stdout.write ("enter the name of the product you want to remove ") ;
                  String productname = stdin.readLineSync()! ;
                  admin1.cart.removeProduct(productname) ;
                }


              }
              else if (choice0==3) {
                admin1.cart.showCart() ;
                print ("total price = : ${admin1.cart.totalPrice()} ");
                print ("total price after discount = : ${admin1.cart.totalAfterDiscount()} ");
              }

              print ("do you want to : \n 1.add to the cart \n 2.remove from the cart \n 3.show cart details \n 0: exit user ") ;
              choice0 = int.parse(stdin.readLineSync()!) ;

            } while(choice0 != 0);

          }
          else {
            print ("error wrong username or email  ") ;
          }
        }
      }
      else {
        print ("user not found visitors list is empty ") ;
      }
    }


    else if (choose==2) {
      appList();
      int admincode = int.parse(stdin.readLineSync()!);
      do {
        if (admincode == 1) {
          shop.showProduct();
        }
        else if (admincode == 2) {
          print("How many products do you want to enter");
          int productnum = int.parse(stdin.readLineSync()!);
          for (int i = 0; i < productnum; i++) {
            print("Please enter product ${i + 1} name");
            String productname = stdin.readLineSync()!;
            print("Please enter product ${i + 1} price");
            double productprice = double.parse(stdin.readLineSync()!);
            print("Please enter product ${i + 1} quantity");
            int productquantity = int.parse(stdin.readLineSync()!);
            print("Please enter product ${i + 1} discount");
            double productdiscount = double.parse(stdin.readLineSync()!);
            shop.addProduct(
                productname, productprice, productquantity, productdiscount);
            print("product ${i + 1} is added successfully");
          }
        }
        else if (admincode == 3) {
          //added an if condition
          if (admin1.cart.product.isNotEmpty) {
            print("Please enter name of the product you want to delete");
            String productname1 = stdin.readLineSync()!;
            shop.removeProduct(productname1);
          }
          else
            print('please add product to the cart because cart is empty ') ;
        }
        else if (admincode == 4) {
          print("How many visitors do you want to add");
          int visitorsnum = int.parse(stdin.readLineSync()!);
          for (int i = 0; i < visitorsnum; i++) {
            print("Please enter visitor ${i + 1} name");
            String visitorname = stdin.readLineSync()!;
            print("Please enter visitor ${i + 1} email");
            String visitoremail = stdin.readLineSync()!;
            shop.addVisitor(visitorname, visitoremail);
            print("visitor ${i + 1} is added successfully");
          }
          print("All visitors are added succesfully");
        }
        else if (admincode == 5) {
          print("Please enter name of product ");
          String productname1 = stdin.readLineSync()!;
          int searchproductname = shop.searchByProductName(productname1);
          print(searchproductname);
        }
        else if (admincode == 6) {
          print("Please enter price of product ");
          double searchproductprice = double.parse(stdin.readLineSync()!);
          String searchproductname1 = shop.searchByProductPrice(
              searchproductprice);
          print(searchproductname1);
        }
        else if (admincode == 7) {
          shop.showVisitors();
        }
        else {
          print("wrong number was chosen please choose from the given list");
        }
        appList();
        admincode = int.parse(stdin.readLineSync()!);
      } while (admincode != 0);
    }
    print("choose : \n 1.user \n 2.admin");
    choose = int.parse(stdin.readLineSync()!);
  }while(choose!=0);
//
}
// added a function to one time use
void appList(){
  print("1- Show product");
  print("2- Add product ");
  print("3- Remove product");
  print("4- Add visitor ");
  print("5- Search by product name");
  print("6- Search By Product Price");
  print("7- Show visitor");
  print("For exit please press 0");
}