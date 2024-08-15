import 'Users.dart';
import 'Product.dart';

class Shop{
  late Users users;
  late List<Product> product;
  Shop(this.users, this.product);

  void addVisitor(String visname,String visemail){
    Users new1= Users(visname,visemail);
    users.visitors.add(new1);

  }
  void addProduct(String proname,double proprice,int proquantity,double prodiscount){
    Product new2 = Product(proname, proprice, proquantity, prodiscount);
    product.add(new2);
  }
  void removeProduct(String proname){
    int index =0;
    for(int i=0;i<product.length;i++){
      if(product[i].name.compareTo(proname)==1){
        product.removeAt(i-1);
        index=1;
      }
    }
    if(index==1){
      print("product is deleted successfully");
    }
    else{
      print("product name is not founded ");
    }
  }
  String searchByProductPrice(double proprice){
    String name1="empty";
    for(int i=0;i<product.length;i++){
      if(product[i].price==proprice){
        name1=product[i].name;
      }
    }
    return name1;

  }
  int searchByProductName(String proname){
    int index=-1;
    for(int i=0;i<product.length;i++){
      if(product[i].name.compareTo(proname)==1){
        index=i;
      }

    }
    if(index!=-1){
      print("Product is founded with index = ");
    }
    else{
      print("product is not founded");
    }
    return index;
  }
  void showProduct(){
    if(product.isEmpty==true){
      print("Product List is empty");
    }
    else {
      for (int i = 0; i < product.length; i++) {
        print("Product ${i+1} name = ${product[i].name} ");
        print("Product ${i+1} price = ${product[i].price} ");
        print("Product ${i+1} quantity = ${product[i].quantity} ");

      }
    }
  }

  void showVisitors(){
    if(users.visitors.isEmpty==true){
      print("Visitor List is empty");
      print("Please add visitors");
    }
    else {
      for (int i = 0; i < users.visitors.length; i++) {
        print("Visitor ${i} name = ${ users.visitors[i].name} ");
        print("Visitor ${i} email = ${ users.visitors[i].email} ");

      }
    }
  }
// visitor






}