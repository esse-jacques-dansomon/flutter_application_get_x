// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassRoom {
     String niveau;
     String filiere;
  ClassRoom({
    required this.niveau,
    required this.filiere,
  });

  ClassRoom copyWith({
    String? niveau,
    String? filiere,
  }) {

    return ClassRoom(
      niveau: niveau ?? this.niveau,
      filiere: filiere ?? this.filiere
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'niveau': niveau,
      'filiere': filiere,
    };
  }

  factory ClassRoom.fromMap(Map<String, dynamic> map) {
    return ClassRoom(
      niveau: map['niveau'] as String,
      filiere: map['filiere'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassRoom.fromJson(String source) => ClassRoom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClassRoom(niveau: $niveau, filiere $filiere ) ';

  @override
  bool operator ==(covariant ClassRoom other) {
    if (identical(this, other)) return true;
  
    return 
      other.niveau == niveau ;
  }

  @override
  int get hashCode => niveau.hashCode;
}
