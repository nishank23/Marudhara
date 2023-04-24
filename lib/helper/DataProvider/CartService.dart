import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _cartCollection =
      FirebaseFirestore.instance.collection('carts');

  // Get the current user's cart document reference
  Future<DocumentReference> _getCurrentUserCartRef() async {
    final User? user = _auth.currentUser;
    if (user == null) throw Exception('User is not logged in');
    return _cartCollection.doc(user.uid);
  }

  // Add an item to the current user's cart
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    final DocumentReference cartRef = await _getCurrentUserCartRef();

//    final DocumentSnapshot cartSnapshot = await cartRef.get();
//    if (!cartSnapshot.exists) {
//      // Create the cart document if it doesn't exist
//      await cartRef.set({'items': []});
//    }
//    await cartRef.update({
//      'items': FieldValue.arrayUnion([item])
//    });
    final QuerySnapshot cartSnapshot = await cartRef
        .collection('items')
        .where('pid', isEqualTo: item['pid'])
        .get();

    // If the product is already in the cart, update its quantity
    if (cartSnapshot.size > 0) {
      final DocumentReference itemRef = cartSnapshot.docs[0].reference;
      final int currentQuantity =
          (cartSnapshot.docs[0].data() as Map<String, dynamic>)['quantity'] ??
              0;
      await itemRef.update({'quantity': currentQuantity + item['quantity']});
    } else {
      // Otherwise, add the new item to the cart
      await cartRef.collection('items').add(item);
    }
  }

  // Get the current user's cart items
  Stream<List<Map<String, dynamic>>> getCartItems() async* {
    final DocumentReference cartRef = await _getCurrentUserCartRef();
    final QuerySnapshot cartSnapshot = await cartRef.collection('items').get();

    List<Map<String, dynamic>> cartItems = [];
    for (QueryDocumentSnapshot item in cartSnapshot.docs) {
      cartItems.add(item.data() as Map<String, dynamic>);
    }

    yield cartItems;
  }

  Stream<List<Map<String, dynamic>>> getCartItemsStream() async* {
    final DocumentReference cartRef = await _getCurrentUserCartRef();
    yield* cartRef
        .collection('items')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              final id = doc.id;
              final data = doc.data();
              final quantity = data['quantity'];
              final price = data['Price'];
              final total = quantity * price;
              return Map<String, dynamic>.from(data)
                ..['id'] = id
                ..['quantity'] = quantity
                ..['Price'] = price
                ..['total'] = total;
            }).toList());
  }

  Stream<List<Map<String, dynamic>>> getMCartItemsStream() async* {
    final DocumentReference cartRef = await _getCurrentUserCartRef();
    yield* cartRef.collection('items').snapshots().map((querySnapshot) {
      List<Map<String, dynamic>> cartItems = [];
      num total = 0;

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> itemData = Map<String, dynamic>.from(doc.data());
        itemData['id'] = doc.id;
        total += itemData['quantity'] * itemData['Price'];
        cartItems.add(itemData);
      });

      cartItems.add({'total': total});

      return cartItems;
    });
  }

  Stream<List<Map<String, dynamic>>> getMCartItems() async* {
    List<Map<String, dynamic>> cartItems = [];
    final User? user = _auth.currentUser;

    QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
        .collection('carts')
        .doc(user!.getIdToken(false).toString())
        .collection('items')
        .get();

    cartSnapshot.docs.forEach((doc) {
      Map<String, dynamic> itemData = doc.data() as Map<String, dynamic>;
      itemData['id'] = doc.id;

      cartItems.add(itemData);
      print("\n \n \n \n finally data ${doc.id.toString()}");
    });

    yield cartItems;
  }

  Stream<List<Map<String, dynamic>>> getAllOrders() async* {
    final QuerySnapshot ordersSnapshot =
        await FirebaseFirestore.instance.collection('orders').get();

    List<Map<String, dynamic>> orders = [];
    for (QueryDocumentSnapshot order in ordersSnapshot.docs) {
      orders.add(order.data() as Map<String, dynamic>);
    }

    yield orders;
  }

  // Remove an item from the current user's cart
  Future<void> removeItemFromCart(String itemId) async {
    final DocumentReference cartRef = await _getCurrentUserCartRef();
    await cartRef.update({
      'items': FieldValue.arrayRemove([
        {'id': itemId}
      ])
    });
  }

  Future<void> updateCartItemQuantity(
      String cartItemId, int newQuantity) async {
    final DocumentReference cartRef = await _getCurrentUserCartRef();

    final DocumentReference cartItemRef =
        cartRef.collection('items').doc(cartItemId);
    if (newQuantity <= 0) {
      await cartItemRef.delete(); // remove item from Firestore
    } else {
      await cartItemRef.update({'quantity': newQuantity});
    }
  }

  // Clear the current user's cart
  Future<void> clearCart() async {
    final DocumentReference cartRef = await _getCurrentUserCartRef();
    await cartRef.delete();
  }
}
