
class ProductImage{
//  final String url;
////  final String height;
////  final String width;

final String small;
final String medium;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
  const ProductImage({
    ///あってもなくても良いので@requiredを削除
     this.small,
     this.medium,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImage &&
          runtimeType == other.runtimeType &&
          small == other.small &&
          medium == other.medium);

  @override
  int get hashCode => small.hashCode ^ medium.hashCode;

  @override
  ///結合の仕方を変更(Replace with interpolation)
  String toString() {
    return 'ProductImage{${' small: $small,'}${' medium: $medium,'}}';
  }


  ///new削除
  ProductImage copyWith({
    String small,
    String medium,
  }) {
    return  ProductImage(
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  ///returnの後ろへ<String,dynamic>追加、this.削除
  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      'small': small,
      'medium': medium,
    };
  }

  ///Productの前のnewを削除
  // ignore: sort_constructors_first
  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return  ProductImage(
      small: map['small'] as String,
      medium: map['medium'] as String,
    );
  }

//</editor-fold>
}