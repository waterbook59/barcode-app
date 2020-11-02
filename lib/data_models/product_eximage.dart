

class ProductExImage{
  final String exImageUrl;
  final String exImageWidth;
  final String exImageHeight;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
  const ProductExImage({
     this.exImageUrl,
     this.exImageWidth,
     this.exImageHeight,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductExImage &&
          runtimeType == other.runtimeType &&
          exImageUrl == other.exImageUrl &&
          exImageWidth == other.exImageWidth &&
          exImageHeight == other.exImageHeight);

  @override
  int get hashCode =>
      exImageUrl.hashCode ^ exImageWidth.hashCode ^ exImageHeight.hashCode;

  @override
  String toString() {
    return 'ProductExImage{' +
        ' exImageUrl: $exImageUrl,' +
        ' exImageWidth: $exImageWidth,' +
        ' exImageHeight: $exImageHeight,' +
        '}';
  }

  ProductExImage copyWith({
    String exImageUrl,
    String exImageWidth,
    String exImageHeight,
  }) {
    return new ProductExImage(
      exImageUrl: exImageUrl ?? this.exImageUrl,
      exImageWidth: exImageWidth ?? this.exImageWidth,
      exImageHeight: exImageHeight ?? this.exImageHeight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exImageUrl': this.exImageUrl,
      'exImageWidth': this.exImageWidth,
      'exImageHeight': this.exImageHeight,
    };
  }

  factory ProductExImage.fromMap(Map<String, dynamic> map) {
    return new ProductExImage(
      exImageUrl: map['exImageUrl'] as String,
      exImageWidth: map['exImageWidth'] as String,
      exImageHeight: map['exImageHeight'] as String,
    );
  }

//</editor-fold>
}