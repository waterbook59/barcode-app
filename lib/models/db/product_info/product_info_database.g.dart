// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ProductRecord extends DataClass implements Insertable<ProductRecord> {
  final String productId;
  final String name;
  final String description;
  ProductRecord(
      {@required this.productId,
      @required this.name,
      @required this.description});
  factory ProductRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return ProductRecord(
      productId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ProductRecordsCompanion toCompanion(bool nullToAbsent) {
    return ProductRecordsCompanion(
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory ProductRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductRecord(
      productId: serializer.fromJson<String>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  ProductRecord copyWith({String productId, String name, String description}) =>
      ProductRecord(
        productId: productId ?? this.productId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('ProductRecord(')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(productId.hashCode, $mrjc(name.hashCode, description.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductRecord &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.description == this.description);
}

class ProductRecordsCompanion extends UpdateCompanion<ProductRecord> {
  final Value<String> productId;
  final Value<String> name;
  final Value<String> description;
  const ProductRecordsCompanion({
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  ProductRecordsCompanion.insert({
    @required String productId,
    @required String name,
    @required String description,
  })  : productId = Value(productId),
        name = Value(name),
        description = Value(description);
  static Insertable<ProductRecord> custom({
    Expression<String> productId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  ProductRecordsCompanion copyWith(
      {Value<String> productId,
      Value<String> name,
      Value<String> description}) {
    return ProductRecordsCompanion(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductRecordsCompanion(')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $ProductRecordsTable extends ProductRecords
    with TableInfo<$ProductRecordsTable, ProductRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductRecordsTable(this._db, [this._alias]);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  GeneratedTextColumn _productId;
  @override
  GeneratedTextColumn get productId => _productId ??= _constructProductId();
  GeneratedTextColumn _constructProductId() {
    return GeneratedTextColumn(
      'product_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [productId, name, description];
  @override
  $ProductRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'product_records';
  @override
  final String actualTableName = 'product_records';
  @override
  VerificationContext validateIntegrity(Insertable<ProductRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id'], _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  ProductRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductRecordsTable createAlias(String alias) {
    return $ProductRecordsTable(_db, alias);
  }
}

class ProductRecordImage extends DataClass
    implements Insertable<ProductRecordImage> {
  final String productId;
  final String imageId;
  final String small;
  final String medium;
  ProductRecordImage(
      {@required this.productId,
      @required this.imageId,
      @required this.small,
      @required this.medium});
  factory ProductRecordImage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return ProductRecordImage(
      productId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      imageId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_id']),
      small:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}small']),
      medium:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}medium']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || imageId != null) {
      map['image_id'] = Variable<String>(imageId);
    }
    if (!nullToAbsent || small != null) {
      map['small'] = Variable<String>(small);
    }
    if (!nullToAbsent || medium != null) {
      map['medium'] = Variable<String>(medium);
    }
    return map;
  }

  ProductRecordImagesCompanion toCompanion(bool nullToAbsent) {
    return ProductRecordImagesCompanion(
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      imageId: imageId == null && nullToAbsent
          ? const Value.absent()
          : Value(imageId),
      small:
          small == null && nullToAbsent ? const Value.absent() : Value(small),
      medium:
          medium == null && nullToAbsent ? const Value.absent() : Value(medium),
    );
  }

  factory ProductRecordImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductRecordImage(
      productId: serializer.fromJson<String>(json['productId']),
      imageId: serializer.fromJson<String>(json['imageId']),
      small: serializer.fromJson<String>(json['small']),
      medium: serializer.fromJson<String>(json['medium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'imageId': serializer.toJson<String>(imageId),
      'small': serializer.toJson<String>(small),
      'medium': serializer.toJson<String>(medium),
    };
  }

  ProductRecordImage copyWith(
          {String productId, String imageId, String small, String medium}) =>
      ProductRecordImage(
        productId: productId ?? this.productId,
        imageId: imageId ?? this.imageId,
        small: small ?? this.small,
        medium: medium ?? this.medium,
      );
  @override
  String toString() {
    return (StringBuffer('ProductRecordImage(')
          ..write('productId: $productId, ')
          ..write('imageId: $imageId, ')
          ..write('small: $small, ')
          ..write('medium: $medium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(productId.hashCode,
      $mrjc(imageId.hashCode, $mrjc(small.hashCode, medium.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductRecordImage &&
          other.productId == this.productId &&
          other.imageId == this.imageId &&
          other.small == this.small &&
          other.medium == this.medium);
}

class ProductRecordImagesCompanion extends UpdateCompanion<ProductRecordImage> {
  final Value<String> productId;
  final Value<String> imageId;
  final Value<String> small;
  final Value<String> medium;
  const ProductRecordImagesCompanion({
    this.productId = const Value.absent(),
    this.imageId = const Value.absent(),
    this.small = const Value.absent(),
    this.medium = const Value.absent(),
  });
  ProductRecordImagesCompanion.insert({
    @required String productId,
    @required String imageId,
    @required String small,
    @required String medium,
  })  : productId = Value(productId),
        imageId = Value(imageId),
        small = Value(small),
        medium = Value(medium);
  static Insertable<ProductRecordImage> custom({
    Expression<String> productId,
    Expression<String> imageId,
    Expression<String> small,
    Expression<String> medium,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (imageId != null) 'image_id': imageId,
      if (small != null) 'small': small,
      if (medium != null) 'medium': medium,
    });
  }

  ProductRecordImagesCompanion copyWith(
      {Value<String> productId,
      Value<String> imageId,
      Value<String> small,
      Value<String> medium}) {
    return ProductRecordImagesCompanion(
      productId: productId ?? this.productId,
      imageId: imageId ?? this.imageId,
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    if (small.present) {
      map['small'] = Variable<String>(small.value);
    }
    if (medium.present) {
      map['medium'] = Variable<String>(medium.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductRecordImagesCompanion(')
          ..write('productId: $productId, ')
          ..write('imageId: $imageId, ')
          ..write('small: $small, ')
          ..write('medium: $medium')
          ..write(')'))
        .toString();
  }
}

class $ProductRecordImagesTable extends ProductRecordImages
    with TableInfo<$ProductRecordImagesTable, ProductRecordImage> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductRecordImagesTable(this._db, [this._alias]);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  GeneratedTextColumn _productId;
  @override
  GeneratedTextColumn get productId => _productId ??= _constructProductId();
  GeneratedTextColumn _constructProductId() {
    return GeneratedTextColumn(
      'product_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  GeneratedTextColumn _imageId;
  @override
  GeneratedTextColumn get imageId => _imageId ??= _constructImageId();
  GeneratedTextColumn _constructImageId() {
    return GeneratedTextColumn(
      'image_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _smallMeta = const VerificationMeta('small');
  GeneratedTextColumn _small;
  @override
  GeneratedTextColumn get small => _small ??= _constructSmall();
  GeneratedTextColumn _constructSmall() {
    return GeneratedTextColumn(
      'small',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mediumMeta = const VerificationMeta('medium');
  GeneratedTextColumn _medium;
  @override
  GeneratedTextColumn get medium => _medium ??= _constructMedium();
  GeneratedTextColumn _constructMedium() {
    return GeneratedTextColumn(
      'medium',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [productId, imageId, small, medium];
  @override
  $ProductRecordImagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'product_record_images';
  @override
  final String actualTableName = 'product_record_images';
  @override
  VerificationContext validateIntegrity(Insertable<ProductRecordImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id'], _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id'], _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    if (data.containsKey('small')) {
      context.handle(
          _smallMeta, small.isAcceptableOrUnknown(data['small'], _smallMeta));
    } else if (isInserting) {
      context.missing(_smallMeta);
    }
    if (data.containsKey('medium')) {
      context.handle(_mediumMeta,
          medium.isAcceptableOrUnknown(data['medium'], _mediumMeta));
    } else if (isInserting) {
      context.missing(_mediumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {imageId};
  @override
  ProductRecordImage map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductRecordImage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductRecordImagesTable createAlias(String alias) {
    return $ProductRecordImagesTable(_db, alias);
  }
}

abstract class _$MyProductInfoDB extends GeneratedDatabase {
  _$MyProductInfoDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ProductRecordsTable _productRecords;
  $ProductRecordsTable get productRecords =>
      _productRecords ??= $ProductRecordsTable(this);
  $ProductRecordImagesTable _productRecordImages;
  $ProductRecordImagesTable get productRecordImages =>
      _productRecordImages ??= $ProductRecordImagesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [productRecords, productRecordImages];
}
