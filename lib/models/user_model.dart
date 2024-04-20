import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  static CollectionReference<Map<String, dynamic>> get collection =>
      FirebaseFirestore.instance.collection('users');

  static DocumentReference<Map<String, dynamic>> doc(String? id) =>
      collection.doc(id);
  final String? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? profile;

  const UserData({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.profile,
  });

  static UserData empty() => const UserData(
        uid: '',
        name: '',
        email: '',
        profile: '',
      );

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "profile": profile,
    };
  }

  factory UserData.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      return UserData(
        id: doc.id,
        uid: doc['uid'] ?? '',
        name: doc['name'] ?? '',
        email: doc['email'] ?? '',
        profile: doc['email'] ?? '',
      );
    } else {
      return UserData.empty();
    }
  }
}
