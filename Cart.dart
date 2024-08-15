

import 'Product.dart';

class Cart{
  late List<Product> product  =[] ;
  void addProduct(Product newProduct ){
    product.add(newProduct);
  }
  void removeProduct(String productName){
    for (int i = 0 ; i < product.length ; i++){
      if ( productName == product[i].name ){
        product.removeAt(i);
      }
    }
  }
  void showCart (){
    for (int i = 0 ; i < product.length ; i++)
    {
      print("Product ${i} name = ${product[i].name} ");
      print("Product ${i} price = ${product[i].price} ");
    }
  }
  double totalPrice (){
    double sum =0 ;
    for ( int i =0 ; i < product.length ; i++){
      if (product[i].quantity.isNaN) {
        sum += product[i].price ;
      }
      else {
        sum += product[i].price*product[i].quantity ;
      }
    }
    return sum ;
  }
  double totalAfterDiscount () {
    double sum =0 ;
    double priceAfterD =0 ;

      for ( int i =0 ; i < product.length ; i++){
        if (product[i].quantity.isNaN) {
        priceAfterD = product[i].price - (((product[i].price)*(product[i].discount))/100 )  ;
        sum += priceAfterD ;
      }
        else
          {
            priceAfterD = (product[i].price*product[i].quantity) - (((product[i].price*product[i].quantity)*(product[i].discount))/100 )  ;
            sum += priceAfterD ;
          }
    }
    return sum ;
  }
}