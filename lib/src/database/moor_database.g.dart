// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int tenantId;
  final int id;
  final String userName;
  final String name;
  final String surname;
  final String emailAddress;
  final bool isActive;
  final String fullName;
  final String mobileHash;
  final bool enableOfflineLogin;
  final String firebaseToken;
  final DateTime creationTime;
  final DateTime lastLoginTime;
  final String currency;
  final String themeData;
  User(
      {this.tenantId,
      @required this.id,
      @required this.userName,
      @required this.name,
      @required this.surname,
      @required this.emailAddress,
      @required this.isActive,
      @required this.fullName,
      this.mobileHash,
      @required this.enableOfflineLogin,
      this.firebaseToken,
      this.creationTime,
      this.lastLoginTime,
      this.currency,
      this.themeData});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return User(
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      surname:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}surname']),
      emailAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}email_address']),
      isActive:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      fullName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      mobileHash: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mobile_hash']),
      enableOfflineLogin: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}enable_offline_login']),
      firebaseToken: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firebase_token']),
      creationTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      lastLoginTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_login_time']),
      currency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      themeData: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}theme_data']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    if (!nullToAbsent || emailAddress != null) {
      map['email_address'] = Variable<String>(emailAddress);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<bool>(isActive);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || mobileHash != null) {
      map['mobile_hash'] = Variable<String>(mobileHash);
    }
    if (!nullToAbsent || enableOfflineLogin != null) {
      map['enable_offline_login'] = Variable<bool>(enableOfflineLogin);
    }
    if (!nullToAbsent || firebaseToken != null) {
      map['firebase_token'] = Variable<String>(firebaseToken);
    }
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime>(creationTime);
    }
    if (!nullToAbsent || lastLoginTime != null) {
      map['last_login_time'] = Variable<DateTime>(lastLoginTime);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || themeData != null) {
      map['theme_data'] = Variable<String>(themeData);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
      emailAddress: emailAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(emailAddress),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      mobileHash: mobileHash == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileHash),
      enableOfflineLogin: enableOfflineLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(enableOfflineLogin),
      firebaseToken: firebaseToken == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseToken),
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      lastLoginTime: lastLoginTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginTime),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      themeData: themeData == null && nullToAbsent
          ? const Value.absent()
          : Value(themeData),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      fullName: serializer.fromJson<String>(json['fullName']),
      mobileHash: serializer.fromJson<String>(json['mobileHash']),
      enableOfflineLogin: serializer.fromJson<bool>(json['enableOfflineLogin']),
      firebaseToken: serializer.fromJson<String>(json['firebaseToken']),
      creationTime: serializer.fromJson<DateTime>(json['creationTime']),
      lastLoginTime: serializer.fromJson<DateTime>(json['lastLoginTime']),
      currency: serializer.fromJson<String>(json['currency']),
      themeData: serializer.fromJson<String>(json['themeData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'isActive': serializer.toJson<bool>(isActive),
      'fullName': serializer.toJson<String>(fullName),
      'mobileHash': serializer.toJson<String>(mobileHash),
      'enableOfflineLogin': serializer.toJson<bool>(enableOfflineLogin),
      'firebaseToken': serializer.toJson<String>(firebaseToken),
      'creationTime': serializer.toJson<DateTime>(creationTime),
      'lastLoginTime': serializer.toJson<DateTime>(lastLoginTime),
      'currency': serializer.toJson<String>(currency),
      'themeData': serializer.toJson<String>(themeData),
    };
  }

  User copyWith(
          {int tenantId,
          int id,
          String userName,
          String name,
          String surname,
          String emailAddress,
          bool isActive,
          String fullName,
          String mobileHash,
          bool enableOfflineLogin,
          String firebaseToken,
          DateTime creationTime,
          DateTime lastLoginTime,
          String currency,
          String themeData}) =>
      User(
        tenantId: tenantId ?? this.tenantId,
        id: id ?? this.id,
        userName: userName ?? this.userName,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        emailAddress: emailAddress ?? this.emailAddress,
        isActive: isActive ?? this.isActive,
        fullName: fullName ?? this.fullName,
        mobileHash: mobileHash ?? this.mobileHash,
        enableOfflineLogin: enableOfflineLogin ?? this.enableOfflineLogin,
        firebaseToken: firebaseToken ?? this.firebaseToken,
        creationTime: creationTime ?? this.creationTime,
        lastLoginTime: lastLoginTime ?? this.lastLoginTime,
        currency: currency ?? this.currency,
        themeData: themeData ?? this.themeData,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('tenantId: $tenantId, ')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('isActive: $isActive, ')
          ..write('fullName: $fullName, ')
          ..write('mobileHash: $mobileHash, ')
          ..write('enableOfflineLogin: $enableOfflineLogin, ')
          ..write('firebaseToken: $firebaseToken, ')
          ..write('creationTime: $creationTime, ')
          ..write('lastLoginTime: $lastLoginTime, ')
          ..write('currency: $currency, ')
          ..write('themeData: $themeData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tenantId.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(
              userName.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      surname.hashCode,
                      $mrjc(
                          emailAddress.hashCode,
                          $mrjc(
                              isActive.hashCode,
                              $mrjc(
                                  fullName.hashCode,
                                  $mrjc(
                                      mobileHash.hashCode,
                                      $mrjc(
                                          enableOfflineLogin.hashCode,
                                          $mrjc(
                                              firebaseToken.hashCode,
                                              $mrjc(
                                                  creationTime.hashCode,
                                                  $mrjc(
                                                      lastLoginTime.hashCode,
                                                      $mrjc(
                                                          currency.hashCode,
                                                          themeData
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.tenantId == this.tenantId &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.emailAddress == this.emailAddress &&
          other.isActive == this.isActive &&
          other.fullName == this.fullName &&
          other.mobileHash == this.mobileHash &&
          other.enableOfflineLogin == this.enableOfflineLogin &&
          other.firebaseToken == this.firebaseToken &&
          other.creationTime == this.creationTime &&
          other.lastLoginTime == this.lastLoginTime &&
          other.currency == this.currency &&
          other.themeData == this.themeData);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> tenantId;
  final Value<int> id;
  final Value<String> userName;
  final Value<String> name;
  final Value<String> surname;
  final Value<String> emailAddress;
  final Value<bool> isActive;
  final Value<String> fullName;
  final Value<String> mobileHash;
  final Value<bool> enableOfflineLogin;
  final Value<String> firebaseToken;
  final Value<DateTime> creationTime;
  final Value<DateTime> lastLoginTime;
  final Value<String> currency;
  final Value<String> themeData;
  const UsersCompanion({
    this.tenantId = const Value.absent(),
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.isActive = const Value.absent(),
    this.fullName = const Value.absent(),
    this.mobileHash = const Value.absent(),
    this.enableOfflineLogin = const Value.absent(),
    this.firebaseToken = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.lastLoginTime = const Value.absent(),
    this.currency = const Value.absent(),
    this.themeData = const Value.absent(),
  });
  UsersCompanion.insert({
    this.tenantId = const Value.absent(),
    this.id = const Value.absent(),
    @required String userName,
    @required String name,
    @required String surname,
    @required String emailAddress,
    this.isActive = const Value.absent(),
    @required String fullName,
    this.mobileHash = const Value.absent(),
    this.enableOfflineLogin = const Value.absent(),
    this.firebaseToken = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.lastLoginTime = const Value.absent(),
    this.currency = const Value.absent(),
    this.themeData = const Value.absent(),
  })  : userName = Value(userName),
        name = Value(name),
        surname = Value(surname),
        emailAddress = Value(emailAddress),
        fullName = Value(fullName);
  static Insertable<User> custom({
    Expression<int> tenantId,
    Expression<int> id,
    Expression<String> userName,
    Expression<String> name,
    Expression<String> surname,
    Expression<String> emailAddress,
    Expression<bool> isActive,
    Expression<String> fullName,
    Expression<String> mobileHash,
    Expression<bool> enableOfflineLogin,
    Expression<String> firebaseToken,
    Expression<DateTime> creationTime,
    Expression<DateTime> lastLoginTime,
    Expression<String> currency,
    Expression<String> themeData,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (emailAddress != null) 'email_address': emailAddress,
      if (isActive != null) 'is_active': isActive,
      if (fullName != null) 'full_name': fullName,
      if (mobileHash != null) 'mobile_hash': mobileHash,
      if (enableOfflineLogin != null)
        'enable_offline_login': enableOfflineLogin,
      if (firebaseToken != null) 'firebase_token': firebaseToken,
      if (creationTime != null) 'creation_time': creationTime,
      if (lastLoginTime != null) 'last_login_time': lastLoginTime,
      if (currency != null) 'currency': currency,
      if (themeData != null) 'theme_data': themeData,
    });
  }

  UsersCompanion copyWith(
      {Value<int> tenantId,
      Value<int> id,
      Value<String> userName,
      Value<String> name,
      Value<String> surname,
      Value<String> emailAddress,
      Value<bool> isActive,
      Value<String> fullName,
      Value<String> mobileHash,
      Value<bool> enableOfflineLogin,
      Value<String> firebaseToken,
      Value<DateTime> creationTime,
      Value<DateTime> lastLoginTime,
      Value<String> currency,
      Value<String> themeData}) {
    return UsersCompanion(
      tenantId: tenantId ?? this.tenantId,
      id: id ?? this.id,
      userName: userName ?? this.userName,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      emailAddress: emailAddress ?? this.emailAddress,
      isActive: isActive ?? this.isActive,
      fullName: fullName ?? this.fullName,
      mobileHash: mobileHash ?? this.mobileHash,
      enableOfflineLogin: enableOfflineLogin ?? this.enableOfflineLogin,
      firebaseToken: firebaseToken ?? this.firebaseToken,
      creationTime: creationTime ?? this.creationTime,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      currency: currency ?? this.currency,
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (mobileHash.present) {
      map['mobile_hash'] = Variable<String>(mobileHash.value);
    }
    if (enableOfflineLogin.present) {
      map['enable_offline_login'] = Variable<bool>(enableOfflineLogin.value);
    }
    if (firebaseToken.present) {
      map['firebase_token'] = Variable<String>(firebaseToken.value);
    }
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime>(creationTime.value);
    }
    if (lastLoginTime.present) {
      map['last_login_time'] = Variable<DateTime>(lastLoginTime.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (themeData.present) {
      map['theme_data'] = Variable<String>(themeData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('isActive: $isActive, ')
          ..write('fullName: $fullName, ')
          ..write('mobileHash: $mobileHash, ')
          ..write('enableOfflineLogin: $enableOfflineLogin, ')
          ..write('firebaseToken: $firebaseToken, ')
          ..write('creationTime: $creationTime, ')
          ..write('lastLoginTime: $lastLoginTime, ')
          ..write('currency: $currency, ')
          ..write('themeData: $themeData')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn('user_name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 300);
  }

  final VerificationMeta _surnameMeta = const VerificationMeta('surname');
  GeneratedTextColumn _surname;
  @override
  GeneratedTextColumn get surname => _surname ??= _constructSurname();
  GeneratedTextColumn _constructSurname() {
    return GeneratedTextColumn('surname', $tableName, false,
        minTextLength: 1, maxTextLength: 150);
  }

  final VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  GeneratedTextColumn _emailAddress;
  @override
  GeneratedTextColumn get emailAddress =>
      _emailAddress ??= _constructEmailAddress();
  GeneratedTextColumn _constructEmailAddress() {
    return GeneratedTextColumn('email_address', $tableName, false,
        minTextLength: 5, maxTextLength: 400);
  }

  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  GeneratedBoolColumn _isActive;
  @override
  GeneratedBoolColumn get isActive => _isActive ??= _constructIsActive();
  GeneratedBoolColumn _constructIsActive() {
    return GeneratedBoolColumn('is_active', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  GeneratedTextColumn _fullName;
  @override
  GeneratedTextColumn get fullName => _fullName ??= _constructFullName();
  GeneratedTextColumn _constructFullName() {
    return GeneratedTextColumn('full_name', $tableName, false,
        minTextLength: 1, maxTextLength: 300);
  }

  final VerificationMeta _mobileHashMeta = const VerificationMeta('mobileHash');
  GeneratedTextColumn _mobileHash;
  @override
  GeneratedTextColumn get mobileHash => _mobileHash ??= _constructMobileHash();
  GeneratedTextColumn _constructMobileHash() {
    return GeneratedTextColumn(
      'mobile_hash',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enableOfflineLoginMeta =
      const VerificationMeta('enableOfflineLogin');
  GeneratedBoolColumn _enableOfflineLogin;
  @override
  GeneratedBoolColumn get enableOfflineLogin =>
      _enableOfflineLogin ??= _constructEnableOfflineLogin();
  GeneratedBoolColumn _constructEnableOfflineLogin() {
    return GeneratedBoolColumn('enable_offline_login', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _firebaseTokenMeta =
      const VerificationMeta('firebaseToken');
  GeneratedTextColumn _firebaseToken;
  @override
  GeneratedTextColumn get firebaseToken =>
      _firebaseToken ??= _constructFirebaseToken();
  GeneratedTextColumn _constructFirebaseToken() {
    return GeneratedTextColumn(
      'firebase_token',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  GeneratedDateTimeColumn _creationTime;
  @override
  GeneratedDateTimeColumn get creationTime =>
      _creationTime ??= _constructCreationTime();
  GeneratedDateTimeColumn _constructCreationTime() {
    return GeneratedDateTimeColumn(
      'creation_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastLoginTimeMeta =
      const VerificationMeta('lastLoginTime');
  GeneratedDateTimeColumn _lastLoginTime;
  @override
  GeneratedDateTimeColumn get lastLoginTime =>
      _lastLoginTime ??= _constructLastLoginTime();
  GeneratedDateTimeColumn _constructLastLoginTime() {
    return GeneratedDateTimeColumn(
      'last_login_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedTextColumn _currency;
  @override
  GeneratedTextColumn get currency => _currency ??= _constructCurrency();
  GeneratedTextColumn _constructCurrency() {
    return GeneratedTextColumn(
      'currency',
      $tableName,
      true,
    );
  }

  final VerificationMeta _themeDataMeta = const VerificationMeta('themeData');
  GeneratedTextColumn _themeData;
  @override
  GeneratedTextColumn get themeData => _themeData ??= _constructThemeData();
  GeneratedTextColumn _constructThemeData() {
    return GeneratedTextColumn(
      'theme_data',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        id,
        userName,
        name,
        surname,
        emailAddress,
        isActive,
        fullName,
        mobileHash,
        enableOfflineLogin,
        firebaseToken,
        creationTime,
        lastLoginTime,
        currency,
        themeData
      ];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname'], _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address'], _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active'], _isActiveMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name'], _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('mobile_hash')) {
      context.handle(
          _mobileHashMeta,
          mobileHash.isAcceptableOrUnknown(
              data['mobile_hash'], _mobileHashMeta));
    }
    if (data.containsKey('enable_offline_login')) {
      context.handle(
          _enableOfflineLoginMeta,
          enableOfflineLogin.isAcceptableOrUnknown(
              data['enable_offline_login'], _enableOfflineLoginMeta));
    }
    if (data.containsKey('firebase_token')) {
      context.handle(
          _firebaseTokenMeta,
          firebaseToken.isAcceptableOrUnknown(
              data['firebase_token'], _firebaseTokenMeta));
    }
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time'], _creationTimeMeta));
    }
    if (data.containsKey('last_login_time')) {
      context.handle(
          _lastLoginTimeMeta,
          lastLoginTime.isAcceptableOrUnknown(
              data['last_login_time'], _lastLoginTimeMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    }
    if (data.containsKey('theme_data')) {
      context.handle(_themeDataMeta,
          themeData.isAcceptableOrUnknown(data['theme_data'], _themeDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class CommunicationData extends DataClass
    implements Insertable<CommunicationData> {
  final DateTime creationTime;
  final DateTime deleteTime;
  final int createUserId;
  final String creatorUser;
  final String lastModifierUser;
  final int lastModifierUserId;
  final int deleteUserId;
  final String deleterUserId;
  final bool isDeleted;
  final DateTime importDateTime;
  final DateTime exportDateTime;
  final String exportStatus;
  final String importStatus;
  final String syncError;
  final int id;
  final String serverUrl;
  final String userName;
  final String newPasskey;
  final String confirmPasskey;
  final String syncFrequency;
  final String communicationType;
  final String typeofErp;
  final int tenantId;
  CommunicationData(
      {this.creationTime,
      this.deleteTime,
      this.createUserId,
      this.creatorUser,
      this.lastModifierUser,
      this.lastModifierUserId,
      this.deleteUserId,
      this.deleterUserId,
      @required this.isDeleted,
      this.importDateTime,
      this.exportDateTime,
      @required this.exportStatus,
      @required this.importStatus,
      this.syncError,
      @required this.id,
      @required this.serverUrl,
      this.userName,
      this.newPasskey,
      this.confirmPasskey,
      @required this.syncFrequency,
      @required this.communicationType,
      this.typeofErp,
      this.tenantId});
  factory CommunicationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CommunicationData(
      creationTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      deleteTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}delete_time']),
      createUserId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_user_id']),
      creatorUser: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}creator_user']),
      lastModifierUser: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_modifier_user']),
      lastModifierUserId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_modifier_user_id']),
      deleteUserId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}delete_user_id']),
      deleterUserId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleter_user_id']),
      isDeleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      importDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}import_date_time']),
      exportDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_date_time']),
      exportStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_status']),
      importStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}import_status']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      serverUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_url']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      newPasskey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}new_passkey']),
      confirmPasskey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}confirm_passkey']),
      syncFrequency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_frequency']),
      communicationType: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}communication_type']),
      typeofErp: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}typeof_erp']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime>(creationTime);
    }
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || createUserId != null) {
      map['create_user_id'] = Variable<int>(createUserId);
    }
    if (!nullToAbsent || creatorUser != null) {
      map['creator_user'] = Variable<String>(creatorUser);
    }
    if (!nullToAbsent || lastModifierUser != null) {
      map['last_modifier_user'] = Variable<String>(lastModifierUser);
    }
    if (!nullToAbsent || lastModifierUserId != null) {
      map['last_modifier_user_id'] = Variable<int>(lastModifierUserId);
    }
    if (!nullToAbsent || deleteUserId != null) {
      map['delete_user_id'] = Variable<int>(deleteUserId);
    }
    if (!nullToAbsent || deleterUserId != null) {
      map['deleter_user_id'] = Variable<String>(deleterUserId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || importDateTime != null) {
      map['import_date_time'] = Variable<DateTime>(importDateTime);
    }
    if (!nullToAbsent || exportDateTime != null) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime);
    }
    if (!nullToAbsent || exportStatus != null) {
      map['export_status'] = Variable<String>(exportStatus);
    }
    if (!nullToAbsent || importStatus != null) {
      map['import_status'] = Variable<String>(importStatus);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || serverUrl != null) {
      map['server_url'] = Variable<String>(serverUrl);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || newPasskey != null) {
      map['new_passkey'] = Variable<String>(newPasskey);
    }
    if (!nullToAbsent || confirmPasskey != null) {
      map['confirm_passkey'] = Variable<String>(confirmPasskey);
    }
    if (!nullToAbsent || syncFrequency != null) {
      map['sync_frequency'] = Variable<String>(syncFrequency);
    }
    if (!nullToAbsent || communicationType != null) {
      map['communication_type'] = Variable<String>(communicationType);
    }
    if (!nullToAbsent || typeofErp != null) {
      map['typeof_erp'] = Variable<String>(typeofErp);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  CommunicationCompanion toCompanion(bool nullToAbsent) {
    return CommunicationCompanion(
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      deleteTime: deleteTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteTime),
      createUserId: createUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createUserId),
      creatorUser: creatorUser == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorUser),
      lastModifierUser: lastModifierUser == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifierUser),
      lastModifierUserId: lastModifierUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifierUserId),
      deleteUserId: deleteUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteUserId),
      deleterUserId: deleterUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(deleterUserId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      importDateTime: importDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(importDateTime),
      exportDateTime: exportDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exportDateTime),
      exportStatus: exportStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(exportStatus),
      importStatus: importStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(importStatus),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      serverUrl: serverUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUrl),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      newPasskey: newPasskey == null && nullToAbsent
          ? const Value.absent()
          : Value(newPasskey),
      confirmPasskey: confirmPasskey == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmPasskey),
      syncFrequency: syncFrequency == null && nullToAbsent
          ? const Value.absent()
          : Value(syncFrequency),
      communicationType: communicationType == null && nullToAbsent
          ? const Value.absent()
          : Value(communicationType),
      typeofErp: typeofErp == null && nullToAbsent
          ? const Value.absent()
          : Value(typeofErp),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory CommunicationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CommunicationData(
      creationTime: serializer.fromJson<DateTime>(json['creationTime']),
      deleteTime: serializer.fromJson<DateTime>(json['deleteTime']),
      createUserId: serializer.fromJson<int>(json['createUserId']),
      creatorUser: serializer.fromJson<String>(json['creatorUser']),
      lastModifierUser: serializer.fromJson<String>(json['lastModifierUser']),
      lastModifierUserId: serializer.fromJson<int>(json['lastModifierUserId']),
      deleteUserId: serializer.fromJson<int>(json['deleteUserId']),
      deleterUserId: serializer.fromJson<String>(json['deleterUserId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      importDateTime: serializer.fromJson<DateTime>(json['importDateTime']),
      exportDateTime: serializer.fromJson<DateTime>(json['exportDateTime']),
      exportStatus: serializer.fromJson<String>(json['exportStatus']),
      importStatus: serializer.fromJson<String>(json['importStatus']),
      syncError: serializer.fromJson<String>(json['syncError']),
      id: serializer.fromJson<int>(json['id']),
      serverUrl: serializer.fromJson<String>(json['serverUrl']),
      userName: serializer.fromJson<String>(json['userName']),
      newPasskey: serializer.fromJson<String>(json['newPasskey']),
      confirmPasskey: serializer.fromJson<String>(json['confirmPasskey']),
      syncFrequency: serializer.fromJson<String>(json['syncFrequency']),
      communicationType: serializer.fromJson<String>(json['communicationType']),
      typeofErp: serializer.fromJson<String>(json['typeofErp']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'creationTime': serializer.toJson<DateTime>(creationTime),
      'deleteTime': serializer.toJson<DateTime>(deleteTime),
      'createUserId': serializer.toJson<int>(createUserId),
      'creatorUser': serializer.toJson<String>(creatorUser),
      'lastModifierUser': serializer.toJson<String>(lastModifierUser),
      'lastModifierUserId': serializer.toJson<int>(lastModifierUserId),
      'deleteUserId': serializer.toJson<int>(deleteUserId),
      'deleterUserId': serializer.toJson<String>(deleterUserId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'importDateTime': serializer.toJson<DateTime>(importDateTime),
      'exportDateTime': serializer.toJson<DateTime>(exportDateTime),
      'exportStatus': serializer.toJson<String>(exportStatus),
      'importStatus': serializer.toJson<String>(importStatus),
      'syncError': serializer.toJson<String>(syncError),
      'id': serializer.toJson<int>(id),
      'serverUrl': serializer.toJson<String>(serverUrl),
      'userName': serializer.toJson<String>(userName),
      'newPasskey': serializer.toJson<String>(newPasskey),
      'confirmPasskey': serializer.toJson<String>(confirmPasskey),
      'syncFrequency': serializer.toJson<String>(syncFrequency),
      'communicationType': serializer.toJson<String>(communicationType),
      'typeofErp': serializer.toJson<String>(typeofErp),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  CommunicationData copyWith(
          {DateTime creationTime,
          DateTime deleteTime,
          int createUserId,
          String creatorUser,
          String lastModifierUser,
          int lastModifierUserId,
          int deleteUserId,
          String deleterUserId,
          bool isDeleted,
          DateTime importDateTime,
          DateTime exportDateTime,
          String exportStatus,
          String importStatus,
          String syncError,
          int id,
          String serverUrl,
          String userName,
          String newPasskey,
          String confirmPasskey,
          String syncFrequency,
          String communicationType,
          String typeofErp,
          int tenantId}) =>
      CommunicationData(
        creationTime: creationTime ?? this.creationTime,
        deleteTime: deleteTime ?? this.deleteTime,
        createUserId: createUserId ?? this.createUserId,
        creatorUser: creatorUser ?? this.creatorUser,
        lastModifierUser: lastModifierUser ?? this.lastModifierUser,
        lastModifierUserId: lastModifierUserId ?? this.lastModifierUserId,
        deleteUserId: deleteUserId ?? this.deleteUserId,
        deleterUserId: deleterUserId ?? this.deleterUserId,
        isDeleted: isDeleted ?? this.isDeleted,
        importDateTime: importDateTime ?? this.importDateTime,
        exportDateTime: exportDateTime ?? this.exportDateTime,
        exportStatus: exportStatus ?? this.exportStatus,
        importStatus: importStatus ?? this.importStatus,
        syncError: syncError ?? this.syncError,
        id: id ?? this.id,
        serverUrl: serverUrl ?? this.serverUrl,
        userName: userName ?? this.userName,
        newPasskey: newPasskey ?? this.newPasskey,
        confirmPasskey: confirmPasskey ?? this.confirmPasskey,
        syncFrequency: syncFrequency ?? this.syncFrequency,
        communicationType: communicationType ?? this.communicationType,
        typeofErp: typeofErp ?? this.typeofErp,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('CommunicationData(')
          ..write('creationTime: $creationTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('createUserId: $createUserId, ')
          ..write('creatorUser: $creatorUser, ')
          ..write('lastModifierUser: $lastModifierUser, ')
          ..write('lastModifierUserId: $lastModifierUserId, ')
          ..write('deleteUserId: $deleteUserId, ')
          ..write('deleterUserId: $deleterUserId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('importDateTime: $importDateTime, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('importStatus: $importStatus, ')
          ..write('syncError: $syncError, ')
          ..write('id: $id, ')
          ..write('serverUrl: $serverUrl, ')
          ..write('userName: $userName, ')
          ..write('newPasskey: $newPasskey, ')
          ..write('confirmPasskey: $confirmPasskey, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('communicationType: $communicationType, ')
          ..write('typeofErp: $typeofErp, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      creationTime.hashCode,
      $mrjc(
          deleteTime.hashCode,
          $mrjc(
              createUserId.hashCode,
              $mrjc(
                  creatorUser.hashCode,
                  $mrjc(
                      lastModifierUser.hashCode,
                      $mrjc(
                          lastModifierUserId.hashCode,
                          $mrjc(
                              deleteUserId.hashCode,
                              $mrjc(
                                  deleterUserId.hashCode,
                                  $mrjc(
                                      isDeleted.hashCode,
                                      $mrjc(
                                          importDateTime.hashCode,
                                          $mrjc(
                                              exportDateTime.hashCode,
                                              $mrjc(
                                                  exportStatus.hashCode,
                                                  $mrjc(
                                                      importStatus.hashCode,
                                                      $mrjc(
                                                          syncError.hashCode,
                                                          $mrjc(
                                                              id.hashCode,
                                                              $mrjc(
                                                                  serverUrl
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      userName
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          newPasskey
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              confirmPasskey.hashCode,
                                                                              $mrjc(syncFrequency.hashCode, $mrjc(communicationType.hashCode, $mrjc(typeofErp.hashCode, tenantId.hashCode)))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CommunicationData &&
          other.creationTime == this.creationTime &&
          other.deleteTime == this.deleteTime &&
          other.createUserId == this.createUserId &&
          other.creatorUser == this.creatorUser &&
          other.lastModifierUser == this.lastModifierUser &&
          other.lastModifierUserId == this.lastModifierUserId &&
          other.deleteUserId == this.deleteUserId &&
          other.deleterUserId == this.deleterUserId &&
          other.isDeleted == this.isDeleted &&
          other.importDateTime == this.importDateTime &&
          other.exportDateTime == this.exportDateTime &&
          other.exportStatus == this.exportStatus &&
          other.importStatus == this.importStatus &&
          other.syncError == this.syncError &&
          other.id == this.id &&
          other.serverUrl == this.serverUrl &&
          other.userName == this.userName &&
          other.newPasskey == this.newPasskey &&
          other.confirmPasskey == this.confirmPasskey &&
          other.syncFrequency == this.syncFrequency &&
          other.communicationType == this.communicationType &&
          other.typeofErp == this.typeofErp &&
          other.tenantId == this.tenantId);
}

class CommunicationCompanion extends UpdateCompanion<CommunicationData> {
  final Value<DateTime> creationTime;
  final Value<DateTime> deleteTime;
  final Value<int> createUserId;
  final Value<String> creatorUser;
  final Value<String> lastModifierUser;
  final Value<int> lastModifierUserId;
  final Value<int> deleteUserId;
  final Value<String> deleterUserId;
  final Value<bool> isDeleted;
  final Value<DateTime> importDateTime;
  final Value<DateTime> exportDateTime;
  final Value<String> exportStatus;
  final Value<String> importStatus;
  final Value<String> syncError;
  final Value<int> id;
  final Value<String> serverUrl;
  final Value<String> userName;
  final Value<String> newPasskey;
  final Value<String> confirmPasskey;
  final Value<String> syncFrequency;
  final Value<String> communicationType;
  final Value<String> typeofErp;
  final Value<int> tenantId;
  const CommunicationCompanion({
    this.creationTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.createUserId = const Value.absent(),
    this.creatorUser = const Value.absent(),
    this.lastModifierUser = const Value.absent(),
    this.lastModifierUserId = const Value.absent(),
    this.deleteUserId = const Value.absent(),
    this.deleterUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.importDateTime = const Value.absent(),
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    this.id = const Value.absent(),
    this.serverUrl = const Value.absent(),
    this.userName = const Value.absent(),
    this.newPasskey = const Value.absent(),
    this.confirmPasskey = const Value.absent(),
    this.syncFrequency = const Value.absent(),
    this.communicationType = const Value.absent(),
    this.typeofErp = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  CommunicationCompanion.insert({
    this.creationTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.createUserId = const Value.absent(),
    this.creatorUser = const Value.absent(),
    this.lastModifierUser = const Value.absent(),
    this.lastModifierUserId = const Value.absent(),
    this.deleteUserId = const Value.absent(),
    this.deleterUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.importDateTime = const Value.absent(),
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    this.id = const Value.absent(),
    @required String serverUrl,
    this.userName = const Value.absent(),
    this.newPasskey = const Value.absent(),
    this.confirmPasskey = const Value.absent(),
    @required String syncFrequency,
    @required String communicationType,
    this.typeofErp = const Value.absent(),
    this.tenantId = const Value.absent(),
  })  : serverUrl = Value(serverUrl),
        syncFrequency = Value(syncFrequency),
        communicationType = Value(communicationType);
  static Insertable<CommunicationData> custom({
    Expression<DateTime> creationTime,
    Expression<DateTime> deleteTime,
    Expression<int> createUserId,
    Expression<String> creatorUser,
    Expression<String> lastModifierUser,
    Expression<int> lastModifierUserId,
    Expression<int> deleteUserId,
    Expression<String> deleterUserId,
    Expression<bool> isDeleted,
    Expression<DateTime> importDateTime,
    Expression<DateTime> exportDateTime,
    Expression<String> exportStatus,
    Expression<String> importStatus,
    Expression<String> syncError,
    Expression<int> id,
    Expression<String> serverUrl,
    Expression<String> userName,
    Expression<String> newPasskey,
    Expression<String> confirmPasskey,
    Expression<String> syncFrequency,
    Expression<String> communicationType,
    Expression<String> typeofErp,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (creationTime != null) 'creation_time': creationTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (createUserId != null) 'create_user_id': createUserId,
      if (creatorUser != null) 'creator_user': creatorUser,
      if (lastModifierUser != null) 'last_modifier_user': lastModifierUser,
      if (lastModifierUserId != null)
        'last_modifier_user_id': lastModifierUserId,
      if (deleteUserId != null) 'delete_user_id': deleteUserId,
      if (deleterUserId != null) 'deleter_user_id': deleterUserId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (importDateTime != null) 'import_date_time': importDateTime,
      if (exportDateTime != null) 'export_date_time': exportDateTime,
      if (exportStatus != null) 'export_status': exportStatus,
      if (importStatus != null) 'import_status': importStatus,
      if (syncError != null) 'sync_error': syncError,
      if (id != null) 'id': id,
      if (serverUrl != null) 'server_url': serverUrl,
      if (userName != null) 'user_name': userName,
      if (newPasskey != null) 'new_passkey': newPasskey,
      if (confirmPasskey != null) 'confirm_passkey': confirmPasskey,
      if (syncFrequency != null) 'sync_frequency': syncFrequency,
      if (communicationType != null) 'communication_type': communicationType,
      if (typeofErp != null) 'typeof_erp': typeofErp,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  CommunicationCompanion copyWith(
      {Value<DateTime> creationTime,
      Value<DateTime> deleteTime,
      Value<int> createUserId,
      Value<String> creatorUser,
      Value<String> lastModifierUser,
      Value<int> lastModifierUserId,
      Value<int> deleteUserId,
      Value<String> deleterUserId,
      Value<bool> isDeleted,
      Value<DateTime> importDateTime,
      Value<DateTime> exportDateTime,
      Value<String> exportStatus,
      Value<String> importStatus,
      Value<String> syncError,
      Value<int> id,
      Value<String> serverUrl,
      Value<String> userName,
      Value<String> newPasskey,
      Value<String> confirmPasskey,
      Value<String> syncFrequency,
      Value<String> communicationType,
      Value<String> typeofErp,
      Value<int> tenantId}) {
    return CommunicationCompanion(
      creationTime: creationTime ?? this.creationTime,
      deleteTime: deleteTime ?? this.deleteTime,
      createUserId: createUserId ?? this.createUserId,
      creatorUser: creatorUser ?? this.creatorUser,
      lastModifierUser: lastModifierUser ?? this.lastModifierUser,
      lastModifierUserId: lastModifierUserId ?? this.lastModifierUserId,
      deleteUserId: deleteUserId ?? this.deleteUserId,
      deleterUserId: deleterUserId ?? this.deleterUserId,
      isDeleted: isDeleted ?? this.isDeleted,
      importDateTime: importDateTime ?? this.importDateTime,
      exportDateTime: exportDateTime ?? this.exportDateTime,
      exportStatus: exportStatus ?? this.exportStatus,
      importStatus: importStatus ?? this.importStatus,
      syncError: syncError ?? this.syncError,
      id: id ?? this.id,
      serverUrl: serverUrl ?? this.serverUrl,
      userName: userName ?? this.userName,
      newPasskey: newPasskey ?? this.newPasskey,
      confirmPasskey: confirmPasskey ?? this.confirmPasskey,
      syncFrequency: syncFrequency ?? this.syncFrequency,
      communicationType: communicationType ?? this.communicationType,
      typeofErp: typeofErp ?? this.typeofErp,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime>(creationTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (createUserId.present) {
      map['create_user_id'] = Variable<int>(createUserId.value);
    }
    if (creatorUser.present) {
      map['creator_user'] = Variable<String>(creatorUser.value);
    }
    if (lastModifierUser.present) {
      map['last_modifier_user'] = Variable<String>(lastModifierUser.value);
    }
    if (lastModifierUserId.present) {
      map['last_modifier_user_id'] = Variable<int>(lastModifierUserId.value);
    }
    if (deleteUserId.present) {
      map['delete_user_id'] = Variable<int>(deleteUserId.value);
    }
    if (deleterUserId.present) {
      map['deleter_user_id'] = Variable<String>(deleterUserId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (importDateTime.present) {
      map['import_date_time'] = Variable<DateTime>(importDateTime.value);
    }
    if (exportDateTime.present) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime.value);
    }
    if (exportStatus.present) {
      map['export_status'] = Variable<String>(exportStatus.value);
    }
    if (importStatus.present) {
      map['import_status'] = Variable<String>(importStatus.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverUrl.present) {
      map['server_url'] = Variable<String>(serverUrl.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (newPasskey.present) {
      map['new_passkey'] = Variable<String>(newPasskey.value);
    }
    if (confirmPasskey.present) {
      map['confirm_passkey'] = Variable<String>(confirmPasskey.value);
    }
    if (syncFrequency.present) {
      map['sync_frequency'] = Variable<String>(syncFrequency.value);
    }
    if (communicationType.present) {
      map['communication_type'] = Variable<String>(communicationType.value);
    }
    if (typeofErp.present) {
      map['typeof_erp'] = Variable<String>(typeofErp.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommunicationCompanion(')
          ..write('creationTime: $creationTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('createUserId: $createUserId, ')
          ..write('creatorUser: $creatorUser, ')
          ..write('lastModifierUser: $lastModifierUser, ')
          ..write('lastModifierUserId: $lastModifierUserId, ')
          ..write('deleteUserId: $deleteUserId, ')
          ..write('deleterUserId: $deleterUserId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('importDateTime: $importDateTime, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('importStatus: $importStatus, ')
          ..write('syncError: $syncError, ')
          ..write('id: $id, ')
          ..write('serverUrl: $serverUrl, ')
          ..write('userName: $userName, ')
          ..write('newPasskey: $newPasskey, ')
          ..write('confirmPasskey: $confirmPasskey, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('communicationType: $communicationType, ')
          ..write('typeofErp: $typeofErp, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $CommunicationTable extends Communication
    with TableInfo<$CommunicationTable, CommunicationData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommunicationTable(this._db, [this._alias]);
  final VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  GeneratedDateTimeColumn _creationTime;
  @override
  GeneratedDateTimeColumn get creationTime =>
      _creationTime ??= _constructCreationTime();
  GeneratedDateTimeColumn _constructCreationTime() {
    return GeneratedDateTimeColumn(
      'creation_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleteTimeMeta = const VerificationMeta('deleteTime');
  GeneratedDateTimeColumn _deleteTime;
  @override
  GeneratedDateTimeColumn get deleteTime =>
      _deleteTime ??= _constructDeleteTime();
  GeneratedDateTimeColumn _constructDeleteTime() {
    return GeneratedDateTimeColumn(
      'delete_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createUserIdMeta =
      const VerificationMeta('createUserId');
  GeneratedIntColumn _createUserId;
  @override
  GeneratedIntColumn get createUserId =>
      _createUserId ??= _constructCreateUserId();
  GeneratedIntColumn _constructCreateUserId() {
    return GeneratedIntColumn(
      'create_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creatorUserMeta =
      const VerificationMeta('creatorUser');
  GeneratedTextColumn _creatorUser;
  @override
  GeneratedTextColumn get creatorUser =>
      _creatorUser ??= _constructCreatorUser();
  GeneratedTextColumn _constructCreatorUser() {
    return GeneratedTextColumn(
      'creator_user',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifierUserMeta =
      const VerificationMeta('lastModifierUser');
  GeneratedTextColumn _lastModifierUser;
  @override
  GeneratedTextColumn get lastModifierUser =>
      _lastModifierUser ??= _constructLastModifierUser();
  GeneratedTextColumn _constructLastModifierUser() {
    return GeneratedTextColumn(
      'last_modifier_user',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifierUserIdMeta =
      const VerificationMeta('lastModifierUserId');
  GeneratedIntColumn _lastModifierUserId;
  @override
  GeneratedIntColumn get lastModifierUserId =>
      _lastModifierUserId ??= _constructLastModifierUserId();
  GeneratedIntColumn _constructLastModifierUserId() {
    return GeneratedIntColumn(
      'last_modifier_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleteUserIdMeta =
      const VerificationMeta('deleteUserId');
  GeneratedIntColumn _deleteUserId;
  @override
  GeneratedIntColumn get deleteUserId =>
      _deleteUserId ??= _constructDeleteUserId();
  GeneratedIntColumn _constructDeleteUserId() {
    return GeneratedIntColumn(
      'delete_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleterUserIdMeta =
      const VerificationMeta('deleterUserId');
  GeneratedTextColumn _deleterUserId;
  @override
  GeneratedTextColumn get deleterUserId =>
      _deleterUserId ??= _constructDeleterUserId();
  GeneratedTextColumn _constructDeleterUserId() {
    return GeneratedTextColumn(
      'deleter_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  GeneratedBoolColumn _isDeleted;
  @override
  GeneratedBoolColumn get isDeleted => _isDeleted ??= _constructIsDeleted();
  GeneratedBoolColumn _constructIsDeleted() {
    return GeneratedBoolColumn('is_deleted', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _importDateTimeMeta =
      const VerificationMeta('importDateTime');
  GeneratedDateTimeColumn _importDateTime;
  @override
  GeneratedDateTimeColumn get importDateTime =>
      _importDateTime ??= _constructImportDateTime();
  GeneratedDateTimeColumn _constructImportDateTime() {
    return GeneratedDateTimeColumn(
      'import_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _exportDateTimeMeta =
      const VerificationMeta('exportDateTime');
  GeneratedDateTimeColumn _exportDateTime;
  @override
  GeneratedDateTimeColumn get exportDateTime =>
      _exportDateTime ??= _constructExportDateTime();
  GeneratedDateTimeColumn _constructExportDateTime() {
    return GeneratedDateTimeColumn(
      'export_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _exportStatusMeta =
      const VerificationMeta('exportStatus');
  GeneratedTextColumn _exportStatus;
  @override
  GeneratedTextColumn get exportStatus =>
      _exportStatus ??= _constructExportStatus();
  GeneratedTextColumn _constructExportStatus() {
    return GeneratedTextColumn('export_status', $tableName, false,
        defaultValue: Constant('Pending'));
  }

  final VerificationMeta _importStatusMeta =
      const VerificationMeta('importStatus');
  GeneratedTextColumn _importStatus;
  @override
  GeneratedTextColumn get importStatus =>
      _importStatus ??= _constructImportStatus();
  GeneratedTextColumn _constructImportStatus() {
    return GeneratedTextColumn('import_status', $tableName, false,
        defaultValue: Constant('Pending'));
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _serverUrlMeta = const VerificationMeta('serverUrl');
  GeneratedTextColumn _serverUrl;
  @override
  GeneratedTextColumn get serverUrl => _serverUrl ??= _constructServerUrl();
  GeneratedTextColumn _constructServerUrl() {
    return GeneratedTextColumn(
      'server_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _newPasskeyMeta = const VerificationMeta('newPasskey');
  GeneratedTextColumn _newPasskey;
  @override
  GeneratedTextColumn get newPasskey => _newPasskey ??= _constructNewPasskey();
  GeneratedTextColumn _constructNewPasskey() {
    return GeneratedTextColumn(
      'new_passkey',
      $tableName,
      true,
    );
  }

  final VerificationMeta _confirmPasskeyMeta =
      const VerificationMeta('confirmPasskey');
  GeneratedTextColumn _confirmPasskey;
  @override
  GeneratedTextColumn get confirmPasskey =>
      _confirmPasskey ??= _constructConfirmPasskey();
  GeneratedTextColumn _constructConfirmPasskey() {
    return GeneratedTextColumn(
      'confirm_passkey',
      $tableName,
      true,
    );
  }

  final VerificationMeta _syncFrequencyMeta =
      const VerificationMeta('syncFrequency');
  GeneratedTextColumn _syncFrequency;
  @override
  GeneratedTextColumn get syncFrequency =>
      _syncFrequency ??= _constructSyncFrequency();
  GeneratedTextColumn _constructSyncFrequency() {
    return GeneratedTextColumn(
      'sync_frequency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _communicationTypeMeta =
      const VerificationMeta('communicationType');
  GeneratedTextColumn _communicationType;
  @override
  GeneratedTextColumn get communicationType =>
      _communicationType ??= _constructCommunicationType();
  GeneratedTextColumn _constructCommunicationType() {
    return GeneratedTextColumn(
      'communication_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeofErpMeta = const VerificationMeta('typeofErp');
  GeneratedTextColumn _typeofErp;
  @override
  GeneratedTextColumn get typeofErp => _typeofErp ??= _constructTypeofErp();
  GeneratedTextColumn _constructTypeofErp() {
    return GeneratedTextColumn(
      'typeof_erp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        creationTime,
        deleteTime,
        createUserId,
        creatorUser,
        lastModifierUser,
        lastModifierUserId,
        deleteUserId,
        deleterUserId,
        isDeleted,
        importDateTime,
        exportDateTime,
        exportStatus,
        importStatus,
        syncError,
        id,
        serverUrl,
        userName,
        newPasskey,
        confirmPasskey,
        syncFrequency,
        communicationType,
        typeofErp,
        tenantId
      ];
  @override
  $CommunicationTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'communication';
  @override
  final String actualTableName = 'communication';
  @override
  VerificationContext validateIntegrity(Insertable<CommunicationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time'], _creationTimeMeta));
    }
    if (data.containsKey('delete_time')) {
      context.handle(
          _deleteTimeMeta,
          deleteTime.isAcceptableOrUnknown(
              data['delete_time'], _deleteTimeMeta));
    }
    if (data.containsKey('create_user_id')) {
      context.handle(
          _createUserIdMeta,
          createUserId.isAcceptableOrUnknown(
              data['create_user_id'], _createUserIdMeta));
    }
    if (data.containsKey('creator_user')) {
      context.handle(
          _creatorUserMeta,
          creatorUser.isAcceptableOrUnknown(
              data['creator_user'], _creatorUserMeta));
    }
    if (data.containsKey('last_modifier_user')) {
      context.handle(
          _lastModifierUserMeta,
          lastModifierUser.isAcceptableOrUnknown(
              data['last_modifier_user'], _lastModifierUserMeta));
    }
    if (data.containsKey('last_modifier_user_id')) {
      context.handle(
          _lastModifierUserIdMeta,
          lastModifierUserId.isAcceptableOrUnknown(
              data['last_modifier_user_id'], _lastModifierUserIdMeta));
    }
    if (data.containsKey('delete_user_id')) {
      context.handle(
          _deleteUserIdMeta,
          deleteUserId.isAcceptableOrUnknown(
              data['delete_user_id'], _deleteUserIdMeta));
    }
    if (data.containsKey('deleter_user_id')) {
      context.handle(
          _deleterUserIdMeta,
          deleterUserId.isAcceptableOrUnknown(
              data['deleter_user_id'], _deleterUserIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted'], _isDeletedMeta));
    }
    if (data.containsKey('import_date_time')) {
      context.handle(
          _importDateTimeMeta,
          importDateTime.isAcceptableOrUnknown(
              data['import_date_time'], _importDateTimeMeta));
    }
    if (data.containsKey('export_date_time')) {
      context.handle(
          _exportDateTimeMeta,
          exportDateTime.isAcceptableOrUnknown(
              data['export_date_time'], _exportDateTimeMeta));
    }
    if (data.containsKey('export_status')) {
      context.handle(
          _exportStatusMeta,
          exportStatus.isAcceptableOrUnknown(
              data['export_status'], _exportStatusMeta));
    }
    if (data.containsKey('import_status')) {
      context.handle(
          _importStatusMeta,
          importStatus.isAcceptableOrUnknown(
              data['import_status'], _importStatusMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('server_url')) {
      context.handle(_serverUrlMeta,
          serverUrl.isAcceptableOrUnknown(data['server_url'], _serverUrlMeta));
    } else if (isInserting) {
      context.missing(_serverUrlMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    }
    if (data.containsKey('new_passkey')) {
      context.handle(
          _newPasskeyMeta,
          newPasskey.isAcceptableOrUnknown(
              data['new_passkey'], _newPasskeyMeta));
    }
    if (data.containsKey('confirm_passkey')) {
      context.handle(
          _confirmPasskeyMeta,
          confirmPasskey.isAcceptableOrUnknown(
              data['confirm_passkey'], _confirmPasskeyMeta));
    }
    if (data.containsKey('sync_frequency')) {
      context.handle(
          _syncFrequencyMeta,
          syncFrequency.isAcceptableOrUnknown(
              data['sync_frequency'], _syncFrequencyMeta));
    } else if (isInserting) {
      context.missing(_syncFrequencyMeta);
    }
    if (data.containsKey('communication_type')) {
      context.handle(
          _communicationTypeMeta,
          communicationType.isAcceptableOrUnknown(
              data['communication_type'], _communicationTypeMeta));
    } else if (isInserting) {
      context.missing(_communicationTypeMeta);
    }
    if (data.containsKey('typeof_erp')) {
      context.handle(_typeofErpMeta,
          typeofErp.isAcceptableOrUnknown(data['typeof_erp'], _typeofErpMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommunicationData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CommunicationData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CommunicationTable createAlias(String alias) {
    return $CommunicationTable(_db, alias);
  }
}

class BackgroundJobScheduleData extends DataClass
    implements Insertable<BackgroundJobScheduleData> {
  final int id;
  final String jobName;
  final DateTime startDateTime;
  final String syncFrequency;
  final bool enableJob;
  final DateTime lastRun;
  final String jobStatus;
  final int tenantId;
  BackgroundJobScheduleData(
      {@required this.id,
      @required this.jobName,
      @required this.startDateTime,
      @required this.syncFrequency,
      @required this.enableJob,
      @required this.lastRun,
      @required this.jobStatus,
      this.tenantId});
  factory BackgroundJobScheduleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return BackgroundJobScheduleData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      jobName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}job_name']),
      startDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date_time']),
      syncFrequency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_frequency']),
      enableJob: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}enable_job']),
      lastRun: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_run']),
      jobStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}job_status']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || jobName != null) {
      map['job_name'] = Variable<String>(jobName);
    }
    if (!nullToAbsent || startDateTime != null) {
      map['start_date_time'] = Variable<DateTime>(startDateTime);
    }
    if (!nullToAbsent || syncFrequency != null) {
      map['sync_frequency'] = Variable<String>(syncFrequency);
    }
    if (!nullToAbsent || enableJob != null) {
      map['enable_job'] = Variable<bool>(enableJob);
    }
    if (!nullToAbsent || lastRun != null) {
      map['last_run'] = Variable<DateTime>(lastRun);
    }
    if (!nullToAbsent || jobStatus != null) {
      map['job_status'] = Variable<String>(jobStatus);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  BackgroundJobScheduleCompanion toCompanion(bool nullToAbsent) {
    return BackgroundJobScheduleCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      jobName: jobName == null && nullToAbsent
          ? const Value.absent()
          : Value(jobName),
      startDateTime: startDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startDateTime),
      syncFrequency: syncFrequency == null && nullToAbsent
          ? const Value.absent()
          : Value(syncFrequency),
      enableJob: enableJob == null && nullToAbsent
          ? const Value.absent()
          : Value(enableJob),
      lastRun: lastRun == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRun),
      jobStatus: jobStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(jobStatus),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory BackgroundJobScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BackgroundJobScheduleData(
      id: serializer.fromJson<int>(json['id']),
      jobName: serializer.fromJson<String>(json['jobName']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      syncFrequency: serializer.fromJson<String>(json['syncFrequency']),
      enableJob: serializer.fromJson<bool>(json['enableJob']),
      lastRun: serializer.fromJson<DateTime>(json['lastRun']),
      jobStatus: serializer.fromJson<String>(json['jobStatus']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobName': serializer.toJson<String>(jobName),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'syncFrequency': serializer.toJson<String>(syncFrequency),
      'enableJob': serializer.toJson<bool>(enableJob),
      'lastRun': serializer.toJson<DateTime>(lastRun),
      'jobStatus': serializer.toJson<String>(jobStatus),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  BackgroundJobScheduleData copyWith(
          {int id,
          String jobName,
          DateTime startDateTime,
          String syncFrequency,
          bool enableJob,
          DateTime lastRun,
          String jobStatus,
          int tenantId}) =>
      BackgroundJobScheduleData(
        id: id ?? this.id,
        jobName: jobName ?? this.jobName,
        startDateTime: startDateTime ?? this.startDateTime,
        syncFrequency: syncFrequency ?? this.syncFrequency,
        enableJob: enableJob ?? this.enableJob,
        lastRun: lastRun ?? this.lastRun,
        jobStatus: jobStatus ?? this.jobStatus,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('BackgroundJobScheduleData(')
          ..write('id: $id, ')
          ..write('jobName: $jobName, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('enableJob: $enableJob, ')
          ..write('lastRun: $lastRun, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          jobName.hashCode,
          $mrjc(
              startDateTime.hashCode,
              $mrjc(
                  syncFrequency.hashCode,
                  $mrjc(
                      enableJob.hashCode,
                      $mrjc(lastRun.hashCode,
                          $mrjc(jobStatus.hashCode, tenantId.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BackgroundJobScheduleData &&
          other.id == this.id &&
          other.jobName == this.jobName &&
          other.startDateTime == this.startDateTime &&
          other.syncFrequency == this.syncFrequency &&
          other.enableJob == this.enableJob &&
          other.lastRun == this.lastRun &&
          other.jobStatus == this.jobStatus &&
          other.tenantId == this.tenantId);
}

class BackgroundJobScheduleCompanion
    extends UpdateCompanion<BackgroundJobScheduleData> {
  final Value<int> id;
  final Value<String> jobName;
  final Value<DateTime> startDateTime;
  final Value<String> syncFrequency;
  final Value<bool> enableJob;
  final Value<DateTime> lastRun;
  final Value<String> jobStatus;
  final Value<int> tenantId;
  const BackgroundJobScheduleCompanion({
    this.id = const Value.absent(),
    this.jobName = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.syncFrequency = const Value.absent(),
    this.enableJob = const Value.absent(),
    this.lastRun = const Value.absent(),
    this.jobStatus = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  BackgroundJobScheduleCompanion.insert({
    this.id = const Value.absent(),
    @required String jobName,
    @required DateTime startDateTime,
    @required String syncFrequency,
    this.enableJob = const Value.absent(),
    @required DateTime lastRun,
    @required String jobStatus,
    this.tenantId = const Value.absent(),
  })  : jobName = Value(jobName),
        startDateTime = Value(startDateTime),
        syncFrequency = Value(syncFrequency),
        lastRun = Value(lastRun),
        jobStatus = Value(jobStatus);
  static Insertable<BackgroundJobScheduleData> custom({
    Expression<int> id,
    Expression<String> jobName,
    Expression<DateTime> startDateTime,
    Expression<String> syncFrequency,
    Expression<bool> enableJob,
    Expression<DateTime> lastRun,
    Expression<String> jobStatus,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobName != null) 'job_name': jobName,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (syncFrequency != null) 'sync_frequency': syncFrequency,
      if (enableJob != null) 'enable_job': enableJob,
      if (lastRun != null) 'last_run': lastRun,
      if (jobStatus != null) 'job_status': jobStatus,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  BackgroundJobScheduleCompanion copyWith(
      {Value<int> id,
      Value<String> jobName,
      Value<DateTime> startDateTime,
      Value<String> syncFrequency,
      Value<bool> enableJob,
      Value<DateTime> lastRun,
      Value<String> jobStatus,
      Value<int> tenantId}) {
    return BackgroundJobScheduleCompanion(
      id: id ?? this.id,
      jobName: jobName ?? this.jobName,
      startDateTime: startDateTime ?? this.startDateTime,
      syncFrequency: syncFrequency ?? this.syncFrequency,
      enableJob: enableJob ?? this.enableJob,
      lastRun: lastRun ?? this.lastRun,
      jobStatus: jobStatus ?? this.jobStatus,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobName.present) {
      map['job_name'] = Variable<String>(jobName.value);
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (syncFrequency.present) {
      map['sync_frequency'] = Variable<String>(syncFrequency.value);
    }
    if (enableJob.present) {
      map['enable_job'] = Variable<bool>(enableJob.value);
    }
    if (lastRun.present) {
      map['last_run'] = Variable<DateTime>(lastRun.value);
    }
    if (jobStatus.present) {
      map['job_status'] = Variable<String>(jobStatus.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackgroundJobScheduleCompanion(')
          ..write('id: $id, ')
          ..write('jobName: $jobName, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('enableJob: $enableJob, ')
          ..write('lastRun: $lastRun, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $BackgroundJobScheduleTable extends BackgroundJobSchedule
    with TableInfo<$BackgroundJobScheduleTable, BackgroundJobScheduleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BackgroundJobScheduleTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _jobNameMeta = const VerificationMeta('jobName');
  GeneratedTextColumn _jobName;
  @override
  GeneratedTextColumn get jobName => _jobName ??= _constructJobName();
  GeneratedTextColumn _constructJobName() {
    return GeneratedTextColumn(
      'job_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startDateTimeMeta =
      const VerificationMeta('startDateTime');
  GeneratedDateTimeColumn _startDateTime;
  @override
  GeneratedDateTimeColumn get startDateTime =>
      _startDateTime ??= _constructStartDateTime();
  GeneratedDateTimeColumn _constructStartDateTime() {
    return GeneratedDateTimeColumn(
      'start_date_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _syncFrequencyMeta =
      const VerificationMeta('syncFrequency');
  GeneratedTextColumn _syncFrequency;
  @override
  GeneratedTextColumn get syncFrequency =>
      _syncFrequency ??= _constructSyncFrequency();
  GeneratedTextColumn _constructSyncFrequency() {
    return GeneratedTextColumn(
      'sync_frequency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _enableJobMeta = const VerificationMeta('enableJob');
  GeneratedBoolColumn _enableJob;
  @override
  GeneratedBoolColumn get enableJob => _enableJob ??= _constructEnableJob();
  GeneratedBoolColumn _constructEnableJob() {
    return GeneratedBoolColumn('enable_job', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _lastRunMeta = const VerificationMeta('lastRun');
  GeneratedDateTimeColumn _lastRun;
  @override
  GeneratedDateTimeColumn get lastRun => _lastRun ??= _constructLastRun();
  GeneratedDateTimeColumn _constructLastRun() {
    return GeneratedDateTimeColumn(
      'last_run',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jobStatusMeta = const VerificationMeta('jobStatus');
  GeneratedTextColumn _jobStatus;
  @override
  GeneratedTextColumn get jobStatus => _jobStatus ??= _constructJobStatus();
  GeneratedTextColumn _constructJobStatus() {
    return GeneratedTextColumn(
      'job_status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        jobName,
        startDateTime,
        syncFrequency,
        enableJob,
        lastRun,
        jobStatus,
        tenantId
      ];
  @override
  $BackgroundJobScheduleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'background_job_schedule';
  @override
  final String actualTableName = 'background_job_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<BackgroundJobScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('job_name')) {
      context.handle(_jobNameMeta,
          jobName.isAcceptableOrUnknown(data['job_name'], _jobNameMeta));
    } else if (isInserting) {
      context.missing(_jobNameMeta);
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
          _startDateTimeMeta,
          startDateTime.isAcceptableOrUnknown(
              data['start_date_time'], _startDateTimeMeta));
    } else if (isInserting) {
      context.missing(_startDateTimeMeta);
    }
    if (data.containsKey('sync_frequency')) {
      context.handle(
          _syncFrequencyMeta,
          syncFrequency.isAcceptableOrUnknown(
              data['sync_frequency'], _syncFrequencyMeta));
    } else if (isInserting) {
      context.missing(_syncFrequencyMeta);
    }
    if (data.containsKey('enable_job')) {
      context.handle(_enableJobMeta,
          enableJob.isAcceptableOrUnknown(data['enable_job'], _enableJobMeta));
    }
    if (data.containsKey('last_run')) {
      context.handle(_lastRunMeta,
          lastRun.isAcceptableOrUnknown(data['last_run'], _lastRunMeta));
    } else if (isInserting) {
      context.missing(_lastRunMeta);
    }
    if (data.containsKey('job_status')) {
      context.handle(_jobStatusMeta,
          jobStatus.isAcceptableOrUnknown(data['job_status'], _jobStatusMeta));
    } else if (isInserting) {
      context.missing(_jobStatusMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackgroundJobScheduleData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BackgroundJobScheduleData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $BackgroundJobScheduleTable createAlias(String alias) {
    return $BackgroundJobScheduleTable(_db, alias);
  }
}

class BackgroundJobLog extends DataClass
    implements Insertable<BackgroundJobLog> {
  final int id;
  final String jobName;
  final DateTime lastRun;
  final String jobStatus;
  final String jobDescription;
  final int tenantId;
  BackgroundJobLog(
      {@required this.id,
      @required this.jobName,
      @required this.lastRun,
      @required this.jobStatus,
      @required this.jobDescription,
      this.tenantId});
  factory BackgroundJobLog.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BackgroundJobLog(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      jobName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}job_name']),
      lastRun: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_run']),
      jobStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}job_status']),
      jobDescription: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}job_description']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || jobName != null) {
      map['job_name'] = Variable<String>(jobName);
    }
    if (!nullToAbsent || lastRun != null) {
      map['last_run'] = Variable<DateTime>(lastRun);
    }
    if (!nullToAbsent || jobStatus != null) {
      map['job_status'] = Variable<String>(jobStatus);
    }
    if (!nullToAbsent || jobDescription != null) {
      map['job_description'] = Variable<String>(jobDescription);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  BackgroundJobLogsCompanion toCompanion(bool nullToAbsent) {
    return BackgroundJobLogsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      jobName: jobName == null && nullToAbsent
          ? const Value.absent()
          : Value(jobName),
      lastRun: lastRun == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRun),
      jobStatus: jobStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(jobStatus),
      jobDescription: jobDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(jobDescription),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory BackgroundJobLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BackgroundJobLog(
      id: serializer.fromJson<int>(json['id']),
      jobName: serializer.fromJson<String>(json['jobName']),
      lastRun: serializer.fromJson<DateTime>(json['lastRun']),
      jobStatus: serializer.fromJson<String>(json['jobStatus']),
      jobDescription: serializer.fromJson<String>(json['jobDescription']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobName': serializer.toJson<String>(jobName),
      'lastRun': serializer.toJson<DateTime>(lastRun),
      'jobStatus': serializer.toJson<String>(jobStatus),
      'jobDescription': serializer.toJson<String>(jobDescription),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  BackgroundJobLog copyWith(
          {int id,
          String jobName,
          DateTime lastRun,
          String jobStatus,
          String jobDescription,
          int tenantId}) =>
      BackgroundJobLog(
        id: id ?? this.id,
        jobName: jobName ?? this.jobName,
        lastRun: lastRun ?? this.lastRun,
        jobStatus: jobStatus ?? this.jobStatus,
        jobDescription: jobDescription ?? this.jobDescription,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('BackgroundJobLog(')
          ..write('id: $id, ')
          ..write('jobName: $jobName, ')
          ..write('lastRun: $lastRun, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('jobDescription: $jobDescription, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          jobName.hashCode,
          $mrjc(
              lastRun.hashCode,
              $mrjc(jobStatus.hashCode,
                  $mrjc(jobDescription.hashCode, tenantId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BackgroundJobLog &&
          other.id == this.id &&
          other.jobName == this.jobName &&
          other.lastRun == this.lastRun &&
          other.jobStatus == this.jobStatus &&
          other.jobDescription == this.jobDescription &&
          other.tenantId == this.tenantId);
}

class BackgroundJobLogsCompanion extends UpdateCompanion<BackgroundJobLog> {
  final Value<int> id;
  final Value<String> jobName;
  final Value<DateTime> lastRun;
  final Value<String> jobStatus;
  final Value<String> jobDescription;
  final Value<int> tenantId;
  const BackgroundJobLogsCompanion({
    this.id = const Value.absent(),
    this.jobName = const Value.absent(),
    this.lastRun = const Value.absent(),
    this.jobStatus = const Value.absent(),
    this.jobDescription = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  BackgroundJobLogsCompanion.insert({
    this.id = const Value.absent(),
    @required String jobName,
    @required DateTime lastRun,
    @required String jobStatus,
    @required String jobDescription,
    this.tenantId = const Value.absent(),
  })  : jobName = Value(jobName),
        lastRun = Value(lastRun),
        jobStatus = Value(jobStatus),
        jobDescription = Value(jobDescription);
  static Insertable<BackgroundJobLog> custom({
    Expression<int> id,
    Expression<String> jobName,
    Expression<DateTime> lastRun,
    Expression<String> jobStatus,
    Expression<String> jobDescription,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobName != null) 'job_name': jobName,
      if (lastRun != null) 'last_run': lastRun,
      if (jobStatus != null) 'job_status': jobStatus,
      if (jobDescription != null) 'job_description': jobDescription,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  BackgroundJobLogsCompanion copyWith(
      {Value<int> id,
      Value<String> jobName,
      Value<DateTime> lastRun,
      Value<String> jobStatus,
      Value<String> jobDescription,
      Value<int> tenantId}) {
    return BackgroundJobLogsCompanion(
      id: id ?? this.id,
      jobName: jobName ?? this.jobName,
      lastRun: lastRun ?? this.lastRun,
      jobStatus: jobStatus ?? this.jobStatus,
      jobDescription: jobDescription ?? this.jobDescription,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobName.present) {
      map['job_name'] = Variable<String>(jobName.value);
    }
    if (lastRun.present) {
      map['last_run'] = Variable<DateTime>(lastRun.value);
    }
    if (jobStatus.present) {
      map['job_status'] = Variable<String>(jobStatus.value);
    }
    if (jobDescription.present) {
      map['job_description'] = Variable<String>(jobDescription.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackgroundJobLogsCompanion(')
          ..write('id: $id, ')
          ..write('jobName: $jobName, ')
          ..write('lastRun: $lastRun, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('jobDescription: $jobDescription, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $BackgroundJobLogsTable extends BackgroundJobLogs
    with TableInfo<$BackgroundJobLogsTable, BackgroundJobLog> {
  final GeneratedDatabase _db;
  final String _alias;
  $BackgroundJobLogsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jobNameMeta = const VerificationMeta('jobName');
  GeneratedTextColumn _jobName;
  @override
  GeneratedTextColumn get jobName => _jobName ??= _constructJobName();
  GeneratedTextColumn _constructJobName() {
    return GeneratedTextColumn(
      'job_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastRunMeta = const VerificationMeta('lastRun');
  GeneratedDateTimeColumn _lastRun;
  @override
  GeneratedDateTimeColumn get lastRun => _lastRun ??= _constructLastRun();
  GeneratedDateTimeColumn _constructLastRun() {
    return GeneratedDateTimeColumn(
      'last_run',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jobStatusMeta = const VerificationMeta('jobStatus');
  GeneratedTextColumn _jobStatus;
  @override
  GeneratedTextColumn get jobStatus => _jobStatus ??= _constructJobStatus();
  GeneratedTextColumn _constructJobStatus() {
    return GeneratedTextColumn(
      'job_status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jobDescriptionMeta =
      const VerificationMeta('jobDescription');
  GeneratedTextColumn _jobDescription;
  @override
  GeneratedTextColumn get jobDescription =>
      _jobDescription ??= _constructJobDescription();
  GeneratedTextColumn _constructJobDescription() {
    return GeneratedTextColumn(
      'job_description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, jobName, lastRun, jobStatus, jobDescription, tenantId];
  @override
  $BackgroundJobLogsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'background_job_logs';
  @override
  final String actualTableName = 'background_job_logs';
  @override
  VerificationContext validateIntegrity(Insertable<BackgroundJobLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('job_name')) {
      context.handle(_jobNameMeta,
          jobName.isAcceptableOrUnknown(data['job_name'], _jobNameMeta));
    } else if (isInserting) {
      context.missing(_jobNameMeta);
    }
    if (data.containsKey('last_run')) {
      context.handle(_lastRunMeta,
          lastRun.isAcceptableOrUnknown(data['last_run'], _lastRunMeta));
    } else if (isInserting) {
      context.missing(_lastRunMeta);
    }
    if (data.containsKey('job_status')) {
      context.handle(_jobStatusMeta,
          jobStatus.isAcceptableOrUnknown(data['job_status'], _jobStatusMeta));
    } else if (isInserting) {
      context.missing(_jobStatusMeta);
    }
    if (data.containsKey('job_description')) {
      context.handle(
          _jobDescriptionMeta,
          jobDescription.isAcceptableOrUnknown(
              data['job_description'], _jobDescriptionMeta));
    } else if (isInserting) {
      context.missing(_jobDescriptionMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackgroundJobLog map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BackgroundJobLog.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BackgroundJobLogsTable createAlias(String alias) {
    return $BackgroundJobLogsTable(_db, alias);
  }
}

class PreferenceData extends DataClass implements Insertable<PreferenceData> {
  final int id;
  final int tenantId;
  final String code;
  final String preferenceName;
  final String value;
  final String description;
  final String domain;
  final bool isGlobal;
  final String syncError;
  final DateTime expiredDateTime;
  final String dataType;
  final String dataValue;
  final String groups;
  PreferenceData(
      {@required this.id,
      @required this.tenantId,
      @required this.code,
      this.preferenceName,
      @required this.value,
      this.description,
      this.domain,
      @required this.isGlobal,
      this.syncError,
      this.expiredDateTime,
      this.dataType,
      this.dataValue,
      this.groups});
  factory PreferenceData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PreferenceData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      preferenceName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}preference_name']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      domain:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}domain']),
      isGlobal:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_global']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      expiredDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expired_date_time']),
      dataType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_type']),
      dataValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_value']),
      groups:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groups']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || preferenceName != null) {
      map['preference_name'] = Variable<String>(preferenceName);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    if (!nullToAbsent || isGlobal != null) {
      map['is_global'] = Variable<bool>(isGlobal);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || expiredDateTime != null) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime);
    }
    if (!nullToAbsent || dataType != null) {
      map['data_type'] = Variable<String>(dataType);
    }
    if (!nullToAbsent || dataValue != null) {
      map['data_value'] = Variable<String>(dataValue);
    }
    if (!nullToAbsent || groups != null) {
      map['groups'] = Variable<String>(groups);
    }
    return map;
  }

  PreferenceCompanion toCompanion(bool nullToAbsent) {
    return PreferenceCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      preferenceName: preferenceName == null && nullToAbsent
          ? const Value.absent()
          : Value(preferenceName),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      isGlobal: isGlobal == null && nullToAbsent
          ? const Value.absent()
          : Value(isGlobal),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      expiredDateTime: expiredDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expiredDateTime),
      dataType: dataType == null && nullToAbsent
          ? const Value.absent()
          : Value(dataType),
      dataValue: dataValue == null && nullToAbsent
          ? const Value.absent()
          : Value(dataValue),
      groups:
          groups == null && nullToAbsent ? const Value.absent() : Value(groups),
    );
  }

  factory PreferenceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PreferenceData(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      code: serializer.fromJson<String>(json['code']),
      preferenceName: serializer.fromJson<String>(json['preferenceName']),
      value: serializer.fromJson<String>(json['value']),
      description: serializer.fromJson<String>(json['description']),
      domain: serializer.fromJson<String>(json['domain']),
      isGlobal: serializer.fromJson<bool>(json['isGlobal']),
      syncError: serializer.fromJson<String>(json['syncError']),
      expiredDateTime: serializer.fromJson<DateTime>(json['expiredDateTime']),
      dataType: serializer.fromJson<String>(json['dataType']),
      dataValue: serializer.fromJson<String>(json['dataValue']),
      groups: serializer.fromJson<String>(json['groups']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<int>(tenantId),
      'code': serializer.toJson<String>(code),
      'preferenceName': serializer.toJson<String>(preferenceName),
      'value': serializer.toJson<String>(value),
      'description': serializer.toJson<String>(description),
      'domain': serializer.toJson<String>(domain),
      'isGlobal': serializer.toJson<bool>(isGlobal),
      'syncError': serializer.toJson<String>(syncError),
      'expiredDateTime': serializer.toJson<DateTime>(expiredDateTime),
      'dataType': serializer.toJson<String>(dataType),
      'dataValue': serializer.toJson<String>(dataValue),
      'groups': serializer.toJson<String>(groups),
    };
  }

  PreferenceData copyWith(
          {int id,
          int tenantId,
          String code,
          String preferenceName,
          String value,
          String description,
          String domain,
          bool isGlobal,
          String syncError,
          DateTime expiredDateTime,
          String dataType,
          String dataValue,
          String groups}) =>
      PreferenceData(
        id: id ?? this.id,
        tenantId: tenantId ?? this.tenantId,
        code: code ?? this.code,
        preferenceName: preferenceName ?? this.preferenceName,
        value: value ?? this.value,
        description: description ?? this.description,
        domain: domain ?? this.domain,
        isGlobal: isGlobal ?? this.isGlobal,
        syncError: syncError ?? this.syncError,
        expiredDateTime: expiredDateTime ?? this.expiredDateTime,
        dataType: dataType ?? this.dataType,
        dataValue: dataValue ?? this.dataValue,
        groups: groups ?? this.groups,
      );
  @override
  String toString() {
    return (StringBuffer('PreferenceData(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('code: $code, ')
          ..write('preferenceName: $preferenceName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('isGlobal: $isGlobal, ')
          ..write('syncError: $syncError, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          tenantId.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(
                  preferenceName.hashCode,
                  $mrjc(
                      value.hashCode,
                      $mrjc(
                          description.hashCode,
                          $mrjc(
                              domain.hashCode,
                              $mrjc(
                                  isGlobal.hashCode,
                                  $mrjc(
                                      syncError.hashCode,
                                      $mrjc(
                                          expiredDateTime.hashCode,
                                          $mrjc(
                                              dataType.hashCode,
                                              $mrjc(dataValue.hashCode,
                                                  groups.hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PreferenceData &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.code == this.code &&
          other.preferenceName == this.preferenceName &&
          other.value == this.value &&
          other.description == this.description &&
          other.domain == this.domain &&
          other.isGlobal == this.isGlobal &&
          other.syncError == this.syncError &&
          other.expiredDateTime == this.expiredDateTime &&
          other.dataType == this.dataType &&
          other.dataValue == this.dataValue &&
          other.groups == this.groups);
}

class PreferenceCompanion extends UpdateCompanion<PreferenceData> {
  final Value<int> id;
  final Value<int> tenantId;
  final Value<String> code;
  final Value<String> preferenceName;
  final Value<String> value;
  final Value<String> description;
  final Value<String> domain;
  final Value<bool> isGlobal;
  final Value<String> syncError;
  final Value<DateTime> expiredDateTime;
  final Value<String> dataType;
  final Value<String> dataValue;
  final Value<String> groups;
  const PreferenceCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.code = const Value.absent(),
    this.preferenceName = const Value.absent(),
    this.value = const Value.absent(),
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.isGlobal = const Value.absent(),
    this.syncError = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
  });
  PreferenceCompanion.insert({
    @required int id,
    @required int tenantId,
    @required String code,
    this.preferenceName = const Value.absent(),
    @required String value,
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.isGlobal = const Value.absent(),
    this.syncError = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
  })  : id = Value(id),
        tenantId = Value(tenantId),
        code = Value(code),
        value = Value(value);
  static Insertable<PreferenceData> custom({
    Expression<int> id,
    Expression<int> tenantId,
    Expression<String> code,
    Expression<String> preferenceName,
    Expression<String> value,
    Expression<String> description,
    Expression<String> domain,
    Expression<bool> isGlobal,
    Expression<String> syncError,
    Expression<DateTime> expiredDateTime,
    Expression<String> dataType,
    Expression<String> dataValue,
    Expression<String> groups,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (code != null) 'code': code,
      if (preferenceName != null) 'preference_name': preferenceName,
      if (value != null) 'value': value,
      if (description != null) 'description': description,
      if (domain != null) 'domain': domain,
      if (isGlobal != null) 'is_global': isGlobal,
      if (syncError != null) 'sync_error': syncError,
      if (expiredDateTime != null) 'expired_date_time': expiredDateTime,
      if (dataType != null) 'data_type': dataType,
      if (dataValue != null) 'data_value': dataValue,
      if (groups != null) 'groups': groups,
    });
  }

  PreferenceCompanion copyWith(
      {Value<int> id,
      Value<int> tenantId,
      Value<String> code,
      Value<String> preferenceName,
      Value<String> value,
      Value<String> description,
      Value<String> domain,
      Value<bool> isGlobal,
      Value<String> syncError,
      Value<DateTime> expiredDateTime,
      Value<String> dataType,
      Value<String> dataValue,
      Value<String> groups}) {
    return PreferenceCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      code: code ?? this.code,
      preferenceName: preferenceName ?? this.preferenceName,
      value: value ?? this.value,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      isGlobal: isGlobal ?? this.isGlobal,
      syncError: syncError ?? this.syncError,
      expiredDateTime: expiredDateTime ?? this.expiredDateTime,
      dataType: dataType ?? this.dataType,
      dataValue: dataValue ?? this.dataValue,
      groups: groups ?? this.groups,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (preferenceName.present) {
      map['preference_name'] = Variable<String>(preferenceName.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (isGlobal.present) {
      map['is_global'] = Variable<bool>(isGlobal.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (expiredDateTime.present) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime.value);
    }
    if (dataType.present) {
      map['data_type'] = Variable<String>(dataType.value);
    }
    if (dataValue.present) {
      map['data_value'] = Variable<String>(dataValue.value);
    }
    if (groups.present) {
      map['groups'] = Variable<String>(groups.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('code: $code, ')
          ..write('preferenceName: $preferenceName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('isGlobal: $isGlobal, ')
          ..write('syncError: $syncError, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups')
          ..write(')'))
        .toString();
  }
}

class $PreferenceTable extends Preference
    with TableInfo<$PreferenceTable, PreferenceData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PreferenceTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _preferenceNameMeta =
      const VerificationMeta('preferenceName');
  GeneratedTextColumn _preferenceName;
  @override
  GeneratedTextColumn get preferenceName =>
      _preferenceName ??= _constructPreferenceName();
  GeneratedTextColumn _constructPreferenceName() {
    return GeneratedTextColumn(
      'preference_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
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
      true,
    );
  }

  final VerificationMeta _domainMeta = const VerificationMeta('domain');
  GeneratedTextColumn _domain;
  @override
  GeneratedTextColumn get domain => _domain ??= _constructDomain();
  GeneratedTextColumn _constructDomain() {
    return GeneratedTextColumn(
      'domain',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isGlobalMeta = const VerificationMeta('isGlobal');
  GeneratedBoolColumn _isGlobal;
  @override
  GeneratedBoolColumn get isGlobal => _isGlobal ??= _constructIsGlobal();
  GeneratedBoolColumn _constructIsGlobal() {
    return GeneratedBoolColumn('is_global', $tableName, false,
        defaultValue: Constant(true));
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiredDateTimeMeta =
      const VerificationMeta('expiredDateTime');
  GeneratedDateTimeColumn _expiredDateTime;
  @override
  GeneratedDateTimeColumn get expiredDateTime =>
      _expiredDateTime ??= _constructExpiredDateTime();
  GeneratedDateTimeColumn _constructExpiredDateTime() {
    return GeneratedDateTimeColumn(
      'expired_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataTypeMeta = const VerificationMeta('dataType');
  GeneratedTextColumn _dataType;
  @override
  GeneratedTextColumn get dataType => _dataType ??= _constructDataType();
  GeneratedTextColumn _constructDataType() {
    return GeneratedTextColumn(
      'data_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataValueMeta = const VerificationMeta('dataValue');
  GeneratedTextColumn _dataValue;
  @override
  GeneratedTextColumn get dataValue => _dataValue ??= _constructDataValue();
  GeneratedTextColumn _constructDataValue() {
    return GeneratedTextColumn(
      'data_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupsMeta = const VerificationMeta('groups');
  GeneratedTextColumn _groups;
  @override
  GeneratedTextColumn get groups => _groups ??= _constructGroups();
  GeneratedTextColumn _constructGroups() {
    return GeneratedTextColumn(
      'groups',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        tenantId,
        code,
        preferenceName,
        value,
        description,
        domain,
        isGlobal,
        syncError,
        expiredDateTime,
        dataType,
        dataValue,
        groups
      ];
  @override
  $PreferenceTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'preference';
  @override
  final String actualTableName = 'preference';
  @override
  VerificationContext validateIntegrity(Insertable<PreferenceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('preference_name')) {
      context.handle(
          _preferenceNameMeta,
          preferenceName.isAcceptableOrUnknown(
              data['preference_name'], _preferenceNameMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain'], _domainMeta));
    }
    if (data.containsKey('is_global')) {
      context.handle(_isGlobalMeta,
          isGlobal.isAcceptableOrUnknown(data['is_global'], _isGlobalMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('expired_date_time')) {
      context.handle(
          _expiredDateTimeMeta,
          expiredDateTime.isAcceptableOrUnknown(
              data['expired_date_time'], _expiredDateTimeMeta));
    }
    if (data.containsKey('data_type')) {
      context.handle(_dataTypeMeta,
          dataType.isAcceptableOrUnknown(data['data_type'], _dataTypeMeta));
    }
    if (data.containsKey('data_value')) {
      context.handle(_dataValueMeta,
          dataValue.isAcceptableOrUnknown(data['data_value'], _dataValueMeta));
    }
    if (data.containsKey('groups')) {
      context.handle(_groupsMeta,
          groups.isAcceptableOrUnknown(data['groups'], _groupsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  PreferenceData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PreferenceData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PreferenceTable createAlias(String alias) {
    return $PreferenceTable(_db, alias);
  }
}

class MobileDeviceData extends DataClass
    implements Insertable<MobileDeviceData> {
  final DateTime creationTime;
  final DateTime deleteTime;
  final int createUserId;
  final String creatorUser;
  final String lastModifierUser;
  final int lastModifierUserId;
  final int deleteUserId;
  final String deleterUserId;
  final bool isDeleted;
  final DateTime importDateTime;
  final DateTime exportDateTime;
  final String exportStatus;
  final String importStatus;
  final String syncError;
  final String deviceId;
  final String deviceName;
  final String versionRelease;
  final String versionEnvrement;
  final String bootLoader;
  final String manufacture;
  final String model;
  final int sdkNumber;
  final String hardware;
  final String deviceHost;
  final DateTime deviceTime;
  final String deviceSerial;
  final String deviceMac;
  final String deviceIp;
  final String deviceMode;
  final DateTime activationDate;
  final DateTime expirationDate;
  final int deviceStatus;
  final String companyName;
  final String deviceNickName;
  final double latitude;
  final double longitude;
  final int tenantId;
  MobileDeviceData(
      {this.creationTime,
      this.deleteTime,
      this.createUserId,
      this.creatorUser,
      this.lastModifierUser,
      this.lastModifierUserId,
      this.deleteUserId,
      this.deleterUserId,
      @required this.isDeleted,
      this.importDateTime,
      this.exportDateTime,
      @required this.exportStatus,
      @required this.importStatus,
      this.syncError,
      this.deviceId,
      this.deviceName,
      this.versionRelease,
      this.versionEnvrement,
      this.bootLoader,
      this.manufacture,
      this.model,
      this.sdkNumber,
      this.hardware,
      this.deviceHost,
      this.deviceTime,
      this.deviceSerial,
      this.deviceMac,
      this.deviceIp,
      this.deviceMode,
      this.activationDate,
      this.expirationDate,
      this.deviceStatus,
      this.companyName,
      this.deviceNickName,
      this.latitude,
      this.longitude,
      this.tenantId});
  factory MobileDeviceData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MobileDeviceData(
      creationTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      deleteTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}delete_time']),
      createUserId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_user_id']),
      creatorUser: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}creator_user']),
      lastModifierUser: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_modifier_user']),
      lastModifierUserId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_modifier_user_id']),
      deleteUserId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}delete_user_id']),
      deleterUserId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleter_user_id']),
      isDeleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      importDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}import_date_time']),
      exportDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_date_time']),
      exportStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_status']),
      importStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}import_status']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      deviceId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id']),
      deviceName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_name']),
      versionRelease: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}version_release']),
      versionEnvrement: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}version_envrement']),
      bootLoader: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}boot_loader']),
      manufacture: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}manufacture']),
      model:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}model']),
      sdkNumber:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}sdk_number']),
      hardware: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}hardware']),
      deviceHost: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_host']),
      deviceTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_time']),
      deviceSerial: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_serial']),
      deviceMac: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_mac']),
      deviceIp: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_ip']),
      deviceMode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_mode']),
      activationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}activation_date']),
      expirationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expiration_date']),
      deviceStatus: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_status']),
      companyName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}company_name']),
      deviceNickName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_nick_name']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime>(creationTime);
    }
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || createUserId != null) {
      map['create_user_id'] = Variable<int>(createUserId);
    }
    if (!nullToAbsent || creatorUser != null) {
      map['creator_user'] = Variable<String>(creatorUser);
    }
    if (!nullToAbsent || lastModifierUser != null) {
      map['last_modifier_user'] = Variable<String>(lastModifierUser);
    }
    if (!nullToAbsent || lastModifierUserId != null) {
      map['last_modifier_user_id'] = Variable<int>(lastModifierUserId);
    }
    if (!nullToAbsent || deleteUserId != null) {
      map['delete_user_id'] = Variable<int>(deleteUserId);
    }
    if (!nullToAbsent || deleterUserId != null) {
      map['deleter_user_id'] = Variable<String>(deleterUserId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    if (!nullToAbsent || importDateTime != null) {
      map['import_date_time'] = Variable<DateTime>(importDateTime);
    }
    if (!nullToAbsent || exportDateTime != null) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime);
    }
    if (!nullToAbsent || exportStatus != null) {
      map['export_status'] = Variable<String>(exportStatus);
    }
    if (!nullToAbsent || importStatus != null) {
      map['import_status'] = Variable<String>(importStatus);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || deviceName != null) {
      map['device_name'] = Variable<String>(deviceName);
    }
    if (!nullToAbsent || versionRelease != null) {
      map['version_release'] = Variable<String>(versionRelease);
    }
    if (!nullToAbsent || versionEnvrement != null) {
      map['version_envrement'] = Variable<String>(versionEnvrement);
    }
    if (!nullToAbsent || bootLoader != null) {
      map['boot_loader'] = Variable<String>(bootLoader);
    }
    if (!nullToAbsent || manufacture != null) {
      map['manufacture'] = Variable<String>(manufacture);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || sdkNumber != null) {
      map['sdk_number'] = Variable<int>(sdkNumber);
    }
    if (!nullToAbsent || hardware != null) {
      map['hardware'] = Variable<String>(hardware);
    }
    if (!nullToAbsent || deviceHost != null) {
      map['device_host'] = Variable<String>(deviceHost);
    }
    if (!nullToAbsent || deviceTime != null) {
      map['device_time'] = Variable<DateTime>(deviceTime);
    }
    if (!nullToAbsent || deviceSerial != null) {
      map['device_serial'] = Variable<String>(deviceSerial);
    }
    if (!nullToAbsent || deviceMac != null) {
      map['device_mac'] = Variable<String>(deviceMac);
    }
    if (!nullToAbsent || deviceIp != null) {
      map['device_ip'] = Variable<String>(deviceIp);
    }
    if (!nullToAbsent || deviceMode != null) {
      map['device_mode'] = Variable<String>(deviceMode);
    }
    if (!nullToAbsent || activationDate != null) {
      map['activation_date'] = Variable<DateTime>(activationDate);
    }
    if (!nullToAbsent || expirationDate != null) {
      map['expiration_date'] = Variable<DateTime>(expirationDate);
    }
    if (!nullToAbsent || deviceStatus != null) {
      map['device_status'] = Variable<int>(deviceStatus);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || deviceNickName != null) {
      map['device_nick_name'] = Variable<String>(deviceNickName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  MobileDeviceCompanion toCompanion(bool nullToAbsent) {
    return MobileDeviceCompanion(
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      deleteTime: deleteTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteTime),
      createUserId: createUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createUserId),
      creatorUser: creatorUser == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorUser),
      lastModifierUser: lastModifierUser == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifierUser),
      lastModifierUserId: lastModifierUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifierUserId),
      deleteUserId: deleteUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteUserId),
      deleterUserId: deleterUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(deleterUserId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      importDateTime: importDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(importDateTime),
      exportDateTime: exportDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exportDateTime),
      exportStatus: exportStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(exportStatus),
      importStatus: importStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(importStatus),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      deviceName: deviceName == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceName),
      versionRelease: versionRelease == null && nullToAbsent
          ? const Value.absent()
          : Value(versionRelease),
      versionEnvrement: versionEnvrement == null && nullToAbsent
          ? const Value.absent()
          : Value(versionEnvrement),
      bootLoader: bootLoader == null && nullToAbsent
          ? const Value.absent()
          : Value(bootLoader),
      manufacture: manufacture == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacture),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      sdkNumber: sdkNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(sdkNumber),
      hardware: hardware == null && nullToAbsent
          ? const Value.absent()
          : Value(hardware),
      deviceHost: deviceHost == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceHost),
      deviceTime: deviceTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceTime),
      deviceSerial: deviceSerial == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceSerial),
      deviceMac: deviceMac == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceMac),
      deviceIp: deviceIp == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceIp),
      deviceMode: deviceMode == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceMode),
      activationDate: activationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(activationDate),
      expirationDate: expirationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expirationDate),
      deviceStatus: deviceStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceStatus),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      deviceNickName: deviceNickName == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceNickName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory MobileDeviceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MobileDeviceData(
      creationTime: serializer.fromJson<DateTime>(json['creationTime']),
      deleteTime: serializer.fromJson<DateTime>(json['deleteTime']),
      createUserId: serializer.fromJson<int>(json['createUserId']),
      creatorUser: serializer.fromJson<String>(json['creatorUser']),
      lastModifierUser: serializer.fromJson<String>(json['lastModifierUser']),
      lastModifierUserId: serializer.fromJson<int>(json['lastModifierUserId']),
      deleteUserId: serializer.fromJson<int>(json['deleteUserId']),
      deleterUserId: serializer.fromJson<String>(json['deleterUserId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      importDateTime: serializer.fromJson<DateTime>(json['importDateTime']),
      exportDateTime: serializer.fromJson<DateTime>(json['exportDateTime']),
      exportStatus: serializer.fromJson<String>(json['exportStatus']),
      importStatus: serializer.fromJson<String>(json['importStatus']),
      syncError: serializer.fromJson<String>(json['syncError']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
      versionRelease: serializer.fromJson<String>(json['versionRelease']),
      versionEnvrement: serializer.fromJson<String>(json['versionEnvrement']),
      bootLoader: serializer.fromJson<String>(json['bootLoader']),
      manufacture: serializer.fromJson<String>(json['manufacture']),
      model: serializer.fromJson<String>(json['model']),
      sdkNumber: serializer.fromJson<int>(json['sdkNumber']),
      hardware: serializer.fromJson<String>(json['hardware']),
      deviceHost: serializer.fromJson<String>(json['deviceHost']),
      deviceTime: serializer.fromJson<DateTime>(json['deviceTime']),
      deviceSerial: serializer.fromJson<String>(json['deviceSerial']),
      deviceMac: serializer.fromJson<String>(json['deviceMac']),
      deviceIp: serializer.fromJson<String>(json['deviceIp']),
      deviceMode: serializer.fromJson<String>(json['deviceMode']),
      activationDate: serializer.fromJson<DateTime>(json['activationDate']),
      expirationDate: serializer.fromJson<DateTime>(json['expirationDate']),
      deviceStatus: serializer.fromJson<int>(json['deviceStatus']),
      companyName: serializer.fromJson<String>(json['companyName']),
      deviceNickName: serializer.fromJson<String>(json['deviceNickName']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'creationTime': serializer.toJson<DateTime>(creationTime),
      'deleteTime': serializer.toJson<DateTime>(deleteTime),
      'createUserId': serializer.toJson<int>(createUserId),
      'creatorUser': serializer.toJson<String>(creatorUser),
      'lastModifierUser': serializer.toJson<String>(lastModifierUser),
      'lastModifierUserId': serializer.toJson<int>(lastModifierUserId),
      'deleteUserId': serializer.toJson<int>(deleteUserId),
      'deleterUserId': serializer.toJson<String>(deleterUserId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'importDateTime': serializer.toJson<DateTime>(importDateTime),
      'exportDateTime': serializer.toJson<DateTime>(exportDateTime),
      'exportStatus': serializer.toJson<String>(exportStatus),
      'importStatus': serializer.toJson<String>(importStatus),
      'syncError': serializer.toJson<String>(syncError),
      'deviceId': serializer.toJson<String>(deviceId),
      'deviceName': serializer.toJson<String>(deviceName),
      'versionRelease': serializer.toJson<String>(versionRelease),
      'versionEnvrement': serializer.toJson<String>(versionEnvrement),
      'bootLoader': serializer.toJson<String>(bootLoader),
      'manufacture': serializer.toJson<String>(manufacture),
      'model': serializer.toJson<String>(model),
      'sdkNumber': serializer.toJson<int>(sdkNumber),
      'hardware': serializer.toJson<String>(hardware),
      'deviceHost': serializer.toJson<String>(deviceHost),
      'deviceTime': serializer.toJson<DateTime>(deviceTime),
      'deviceSerial': serializer.toJson<String>(deviceSerial),
      'deviceMac': serializer.toJson<String>(deviceMac),
      'deviceIp': serializer.toJson<String>(deviceIp),
      'deviceMode': serializer.toJson<String>(deviceMode),
      'activationDate': serializer.toJson<DateTime>(activationDate),
      'expirationDate': serializer.toJson<DateTime>(expirationDate),
      'deviceStatus': serializer.toJson<int>(deviceStatus),
      'companyName': serializer.toJson<String>(companyName),
      'deviceNickName': serializer.toJson<String>(deviceNickName),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  MobileDeviceData copyWith(
          {DateTime creationTime,
          DateTime deleteTime,
          int createUserId,
          String creatorUser,
          String lastModifierUser,
          int lastModifierUserId,
          int deleteUserId,
          String deleterUserId,
          bool isDeleted,
          DateTime importDateTime,
          DateTime exportDateTime,
          String exportStatus,
          String importStatus,
          String syncError,
          String deviceId,
          String deviceName,
          String versionRelease,
          String versionEnvrement,
          String bootLoader,
          String manufacture,
          String model,
          int sdkNumber,
          String hardware,
          String deviceHost,
          DateTime deviceTime,
          String deviceSerial,
          String deviceMac,
          String deviceIp,
          String deviceMode,
          DateTime activationDate,
          DateTime expirationDate,
          int deviceStatus,
          String companyName,
          String deviceNickName,
          double latitude,
          double longitude,
          int tenantId}) =>
      MobileDeviceData(
        creationTime: creationTime ?? this.creationTime,
        deleteTime: deleteTime ?? this.deleteTime,
        createUserId: createUserId ?? this.createUserId,
        creatorUser: creatorUser ?? this.creatorUser,
        lastModifierUser: lastModifierUser ?? this.lastModifierUser,
        lastModifierUserId: lastModifierUserId ?? this.lastModifierUserId,
        deleteUserId: deleteUserId ?? this.deleteUserId,
        deleterUserId: deleterUserId ?? this.deleterUserId,
        isDeleted: isDeleted ?? this.isDeleted,
        importDateTime: importDateTime ?? this.importDateTime,
        exportDateTime: exportDateTime ?? this.exportDateTime,
        exportStatus: exportStatus ?? this.exportStatus,
        importStatus: importStatus ?? this.importStatus,
        syncError: syncError ?? this.syncError,
        deviceId: deviceId ?? this.deviceId,
        deviceName: deviceName ?? this.deviceName,
        versionRelease: versionRelease ?? this.versionRelease,
        versionEnvrement: versionEnvrement ?? this.versionEnvrement,
        bootLoader: bootLoader ?? this.bootLoader,
        manufacture: manufacture ?? this.manufacture,
        model: model ?? this.model,
        sdkNumber: sdkNumber ?? this.sdkNumber,
        hardware: hardware ?? this.hardware,
        deviceHost: deviceHost ?? this.deviceHost,
        deviceTime: deviceTime ?? this.deviceTime,
        deviceSerial: deviceSerial ?? this.deviceSerial,
        deviceMac: deviceMac ?? this.deviceMac,
        deviceIp: deviceIp ?? this.deviceIp,
        deviceMode: deviceMode ?? this.deviceMode,
        activationDate: activationDate ?? this.activationDate,
        expirationDate: expirationDate ?? this.expirationDate,
        deviceStatus: deviceStatus ?? this.deviceStatus,
        companyName: companyName ?? this.companyName,
        deviceNickName: deviceNickName ?? this.deviceNickName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('MobileDeviceData(')
          ..write('creationTime: $creationTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('createUserId: $createUserId, ')
          ..write('creatorUser: $creatorUser, ')
          ..write('lastModifierUser: $lastModifierUser, ')
          ..write('lastModifierUserId: $lastModifierUserId, ')
          ..write('deleteUserId: $deleteUserId, ')
          ..write('deleterUserId: $deleterUserId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('importDateTime: $importDateTime, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('importStatus: $importStatus, ')
          ..write('syncError: $syncError, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName, ')
          ..write('versionRelease: $versionRelease, ')
          ..write('versionEnvrement: $versionEnvrement, ')
          ..write('bootLoader: $bootLoader, ')
          ..write('manufacture: $manufacture, ')
          ..write('model: $model, ')
          ..write('sdkNumber: $sdkNumber, ')
          ..write('hardware: $hardware, ')
          ..write('deviceHost: $deviceHost, ')
          ..write('deviceTime: $deviceTime, ')
          ..write('deviceSerial: $deviceSerial, ')
          ..write('deviceMac: $deviceMac, ')
          ..write('deviceIp: $deviceIp, ')
          ..write('deviceMode: $deviceMode, ')
          ..write('activationDate: $activationDate, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('deviceStatus: $deviceStatus, ')
          ..write('companyName: $companyName, ')
          ..write('deviceNickName: $deviceNickName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      creationTime.hashCode,
      $mrjc(
          deleteTime.hashCode,
          $mrjc(
              createUserId.hashCode,
              $mrjc(
                  creatorUser.hashCode,
                  $mrjc(
                      lastModifierUser.hashCode,
                      $mrjc(
                          lastModifierUserId.hashCode,
                          $mrjc(
                              deleteUserId.hashCode,
                              $mrjc(
                                  deleterUserId.hashCode,
                                  $mrjc(
                                      isDeleted.hashCode,
                                      $mrjc(
                                          importDateTime.hashCode,
                                          $mrjc(
                                              exportDateTime.hashCode,
                                              $mrjc(
                                                  exportStatus.hashCode,
                                                  $mrjc(
                                                      importStatus.hashCode,
                                                      $mrjc(
                                                          syncError.hashCode,
                                                          $mrjc(
                                                              deviceId.hashCode,
                                                              $mrjc(
                                                                  deviceName
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      versionRelease
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          versionEnvrement
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              bootLoader.hashCode,
                                                                              $mrjc(manufacture.hashCode, $mrjc(model.hashCode, $mrjc(sdkNumber.hashCode, $mrjc(hardware.hashCode, $mrjc(deviceHost.hashCode, $mrjc(deviceTime.hashCode, $mrjc(deviceSerial.hashCode, $mrjc(deviceMac.hashCode, $mrjc(deviceIp.hashCode, $mrjc(deviceMode.hashCode, $mrjc(activationDate.hashCode, $mrjc(expirationDate.hashCode, $mrjc(deviceStatus.hashCode, $mrjc(companyName.hashCode, $mrjc(deviceNickName.hashCode, $mrjc(latitude.hashCode, $mrjc(longitude.hashCode, tenantId.hashCode)))))))))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MobileDeviceData &&
          other.creationTime == this.creationTime &&
          other.deleteTime == this.deleteTime &&
          other.createUserId == this.createUserId &&
          other.creatorUser == this.creatorUser &&
          other.lastModifierUser == this.lastModifierUser &&
          other.lastModifierUserId == this.lastModifierUserId &&
          other.deleteUserId == this.deleteUserId &&
          other.deleterUserId == this.deleterUserId &&
          other.isDeleted == this.isDeleted &&
          other.importDateTime == this.importDateTime &&
          other.exportDateTime == this.exportDateTime &&
          other.exportStatus == this.exportStatus &&
          other.importStatus == this.importStatus &&
          other.syncError == this.syncError &&
          other.deviceId == this.deviceId &&
          other.deviceName == this.deviceName &&
          other.versionRelease == this.versionRelease &&
          other.versionEnvrement == this.versionEnvrement &&
          other.bootLoader == this.bootLoader &&
          other.manufacture == this.manufacture &&
          other.model == this.model &&
          other.sdkNumber == this.sdkNumber &&
          other.hardware == this.hardware &&
          other.deviceHost == this.deviceHost &&
          other.deviceTime == this.deviceTime &&
          other.deviceSerial == this.deviceSerial &&
          other.deviceMac == this.deviceMac &&
          other.deviceIp == this.deviceIp &&
          other.deviceMode == this.deviceMode &&
          other.activationDate == this.activationDate &&
          other.expirationDate == this.expirationDate &&
          other.deviceStatus == this.deviceStatus &&
          other.companyName == this.companyName &&
          other.deviceNickName == this.deviceNickName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.tenantId == this.tenantId);
}

class MobileDeviceCompanion extends UpdateCompanion<MobileDeviceData> {
  final Value<DateTime> creationTime;
  final Value<DateTime> deleteTime;
  final Value<int> createUserId;
  final Value<String> creatorUser;
  final Value<String> lastModifierUser;
  final Value<int> lastModifierUserId;
  final Value<int> deleteUserId;
  final Value<String> deleterUserId;
  final Value<bool> isDeleted;
  final Value<DateTime> importDateTime;
  final Value<DateTime> exportDateTime;
  final Value<String> exportStatus;
  final Value<String> importStatus;
  final Value<String> syncError;
  final Value<String> deviceId;
  final Value<String> deviceName;
  final Value<String> versionRelease;
  final Value<String> versionEnvrement;
  final Value<String> bootLoader;
  final Value<String> manufacture;
  final Value<String> model;
  final Value<int> sdkNumber;
  final Value<String> hardware;
  final Value<String> deviceHost;
  final Value<DateTime> deviceTime;
  final Value<String> deviceSerial;
  final Value<String> deviceMac;
  final Value<String> deviceIp;
  final Value<String> deviceMode;
  final Value<DateTime> activationDate;
  final Value<DateTime> expirationDate;
  final Value<int> deviceStatus;
  final Value<String> companyName;
  final Value<String> deviceNickName;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> tenantId;
  const MobileDeviceCompanion({
    this.creationTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.createUserId = const Value.absent(),
    this.creatorUser = const Value.absent(),
    this.lastModifierUser = const Value.absent(),
    this.lastModifierUserId = const Value.absent(),
    this.deleteUserId = const Value.absent(),
    this.deleterUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.importDateTime = const Value.absent(),
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.versionRelease = const Value.absent(),
    this.versionEnvrement = const Value.absent(),
    this.bootLoader = const Value.absent(),
    this.manufacture = const Value.absent(),
    this.model = const Value.absent(),
    this.sdkNumber = const Value.absent(),
    this.hardware = const Value.absent(),
    this.deviceHost = const Value.absent(),
    this.deviceTime = const Value.absent(),
    this.deviceSerial = const Value.absent(),
    this.deviceMac = const Value.absent(),
    this.deviceIp = const Value.absent(),
    this.deviceMode = const Value.absent(),
    this.activationDate = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.deviceStatus = const Value.absent(),
    this.companyName = const Value.absent(),
    this.deviceNickName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  MobileDeviceCompanion.insert({
    this.creationTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.createUserId = const Value.absent(),
    this.creatorUser = const Value.absent(),
    this.lastModifierUser = const Value.absent(),
    this.lastModifierUserId = const Value.absent(),
    this.deleteUserId = const Value.absent(),
    this.deleterUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.importDateTime = const Value.absent(),
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.versionRelease = const Value.absent(),
    this.versionEnvrement = const Value.absent(),
    this.bootLoader = const Value.absent(),
    this.manufacture = const Value.absent(),
    this.model = const Value.absent(),
    this.sdkNumber = const Value.absent(),
    this.hardware = const Value.absent(),
    this.deviceHost = const Value.absent(),
    this.deviceTime = const Value.absent(),
    this.deviceSerial = const Value.absent(),
    this.deviceMac = const Value.absent(),
    this.deviceIp = const Value.absent(),
    this.deviceMode = const Value.absent(),
    this.activationDate = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.deviceStatus = const Value.absent(),
    this.companyName = const Value.absent(),
    this.deviceNickName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  static Insertable<MobileDeviceData> custom({
    Expression<DateTime> creationTime,
    Expression<DateTime> deleteTime,
    Expression<int> createUserId,
    Expression<String> creatorUser,
    Expression<String> lastModifierUser,
    Expression<int> lastModifierUserId,
    Expression<int> deleteUserId,
    Expression<String> deleterUserId,
    Expression<bool> isDeleted,
    Expression<DateTime> importDateTime,
    Expression<DateTime> exportDateTime,
    Expression<String> exportStatus,
    Expression<String> importStatus,
    Expression<String> syncError,
    Expression<String> deviceId,
    Expression<String> deviceName,
    Expression<String> versionRelease,
    Expression<String> versionEnvrement,
    Expression<String> bootLoader,
    Expression<String> manufacture,
    Expression<String> model,
    Expression<int> sdkNumber,
    Expression<String> hardware,
    Expression<String> deviceHost,
    Expression<DateTime> deviceTime,
    Expression<String> deviceSerial,
    Expression<String> deviceMac,
    Expression<String> deviceIp,
    Expression<String> deviceMode,
    Expression<DateTime> activationDate,
    Expression<DateTime> expirationDate,
    Expression<int> deviceStatus,
    Expression<String> companyName,
    Expression<String> deviceNickName,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (creationTime != null) 'creation_time': creationTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (createUserId != null) 'create_user_id': createUserId,
      if (creatorUser != null) 'creator_user': creatorUser,
      if (lastModifierUser != null) 'last_modifier_user': lastModifierUser,
      if (lastModifierUserId != null)
        'last_modifier_user_id': lastModifierUserId,
      if (deleteUserId != null) 'delete_user_id': deleteUserId,
      if (deleterUserId != null) 'deleter_user_id': deleterUserId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (importDateTime != null) 'import_date_time': importDateTime,
      if (exportDateTime != null) 'export_date_time': exportDateTime,
      if (exportStatus != null) 'export_status': exportStatus,
      if (importStatus != null) 'import_status': importStatus,
      if (syncError != null) 'sync_error': syncError,
      if (deviceId != null) 'device_id': deviceId,
      if (deviceName != null) 'device_name': deviceName,
      if (versionRelease != null) 'version_release': versionRelease,
      if (versionEnvrement != null) 'version_envrement': versionEnvrement,
      if (bootLoader != null) 'boot_loader': bootLoader,
      if (manufacture != null) 'manufacture': manufacture,
      if (model != null) 'model': model,
      if (sdkNumber != null) 'sdk_number': sdkNumber,
      if (hardware != null) 'hardware': hardware,
      if (deviceHost != null) 'device_host': deviceHost,
      if (deviceTime != null) 'device_time': deviceTime,
      if (deviceSerial != null) 'device_serial': deviceSerial,
      if (deviceMac != null) 'device_mac': deviceMac,
      if (deviceIp != null) 'device_ip': deviceIp,
      if (deviceMode != null) 'device_mode': deviceMode,
      if (activationDate != null) 'activation_date': activationDate,
      if (expirationDate != null) 'expiration_date': expirationDate,
      if (deviceStatus != null) 'device_status': deviceStatus,
      if (companyName != null) 'company_name': companyName,
      if (deviceNickName != null) 'device_nick_name': deviceNickName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  MobileDeviceCompanion copyWith(
      {Value<DateTime> creationTime,
      Value<DateTime> deleteTime,
      Value<int> createUserId,
      Value<String> creatorUser,
      Value<String> lastModifierUser,
      Value<int> lastModifierUserId,
      Value<int> deleteUserId,
      Value<String> deleterUserId,
      Value<bool> isDeleted,
      Value<DateTime> importDateTime,
      Value<DateTime> exportDateTime,
      Value<String> exportStatus,
      Value<String> importStatus,
      Value<String> syncError,
      Value<String> deviceId,
      Value<String> deviceName,
      Value<String> versionRelease,
      Value<String> versionEnvrement,
      Value<String> bootLoader,
      Value<String> manufacture,
      Value<String> model,
      Value<int> sdkNumber,
      Value<String> hardware,
      Value<String> deviceHost,
      Value<DateTime> deviceTime,
      Value<String> deviceSerial,
      Value<String> deviceMac,
      Value<String> deviceIp,
      Value<String> deviceMode,
      Value<DateTime> activationDate,
      Value<DateTime> expirationDate,
      Value<int> deviceStatus,
      Value<String> companyName,
      Value<String> deviceNickName,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> tenantId}) {
    return MobileDeviceCompanion(
      creationTime: creationTime ?? this.creationTime,
      deleteTime: deleteTime ?? this.deleteTime,
      createUserId: createUserId ?? this.createUserId,
      creatorUser: creatorUser ?? this.creatorUser,
      lastModifierUser: lastModifierUser ?? this.lastModifierUser,
      lastModifierUserId: lastModifierUserId ?? this.lastModifierUserId,
      deleteUserId: deleteUserId ?? this.deleteUserId,
      deleterUserId: deleterUserId ?? this.deleterUserId,
      isDeleted: isDeleted ?? this.isDeleted,
      importDateTime: importDateTime ?? this.importDateTime,
      exportDateTime: exportDateTime ?? this.exportDateTime,
      exportStatus: exportStatus ?? this.exportStatus,
      importStatus: importStatus ?? this.importStatus,
      syncError: syncError ?? this.syncError,
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      versionRelease: versionRelease ?? this.versionRelease,
      versionEnvrement: versionEnvrement ?? this.versionEnvrement,
      bootLoader: bootLoader ?? this.bootLoader,
      manufacture: manufacture ?? this.manufacture,
      model: model ?? this.model,
      sdkNumber: sdkNumber ?? this.sdkNumber,
      hardware: hardware ?? this.hardware,
      deviceHost: deviceHost ?? this.deviceHost,
      deviceTime: deviceTime ?? this.deviceTime,
      deviceSerial: deviceSerial ?? this.deviceSerial,
      deviceMac: deviceMac ?? this.deviceMac,
      deviceIp: deviceIp ?? this.deviceIp,
      deviceMode: deviceMode ?? this.deviceMode,
      activationDate: activationDate ?? this.activationDate,
      expirationDate: expirationDate ?? this.expirationDate,
      deviceStatus: deviceStatus ?? this.deviceStatus,
      companyName: companyName ?? this.companyName,
      deviceNickName: deviceNickName ?? this.deviceNickName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime>(creationTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (createUserId.present) {
      map['create_user_id'] = Variable<int>(createUserId.value);
    }
    if (creatorUser.present) {
      map['creator_user'] = Variable<String>(creatorUser.value);
    }
    if (lastModifierUser.present) {
      map['last_modifier_user'] = Variable<String>(lastModifierUser.value);
    }
    if (lastModifierUserId.present) {
      map['last_modifier_user_id'] = Variable<int>(lastModifierUserId.value);
    }
    if (deleteUserId.present) {
      map['delete_user_id'] = Variable<int>(deleteUserId.value);
    }
    if (deleterUserId.present) {
      map['deleter_user_id'] = Variable<String>(deleterUserId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (importDateTime.present) {
      map['import_date_time'] = Variable<DateTime>(importDateTime.value);
    }
    if (exportDateTime.present) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime.value);
    }
    if (exportStatus.present) {
      map['export_status'] = Variable<String>(exportStatus.value);
    }
    if (importStatus.present) {
      map['import_status'] = Variable<String>(importStatus.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    if (versionRelease.present) {
      map['version_release'] = Variable<String>(versionRelease.value);
    }
    if (versionEnvrement.present) {
      map['version_envrement'] = Variable<String>(versionEnvrement.value);
    }
    if (bootLoader.present) {
      map['boot_loader'] = Variable<String>(bootLoader.value);
    }
    if (manufacture.present) {
      map['manufacture'] = Variable<String>(manufacture.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (sdkNumber.present) {
      map['sdk_number'] = Variable<int>(sdkNumber.value);
    }
    if (hardware.present) {
      map['hardware'] = Variable<String>(hardware.value);
    }
    if (deviceHost.present) {
      map['device_host'] = Variable<String>(deviceHost.value);
    }
    if (deviceTime.present) {
      map['device_time'] = Variable<DateTime>(deviceTime.value);
    }
    if (deviceSerial.present) {
      map['device_serial'] = Variable<String>(deviceSerial.value);
    }
    if (deviceMac.present) {
      map['device_mac'] = Variable<String>(deviceMac.value);
    }
    if (deviceIp.present) {
      map['device_ip'] = Variable<String>(deviceIp.value);
    }
    if (deviceMode.present) {
      map['device_mode'] = Variable<String>(deviceMode.value);
    }
    if (activationDate.present) {
      map['activation_date'] = Variable<DateTime>(activationDate.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<DateTime>(expirationDate.value);
    }
    if (deviceStatus.present) {
      map['device_status'] = Variable<int>(deviceStatus.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (deviceNickName.present) {
      map['device_nick_name'] = Variable<String>(deviceNickName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MobileDeviceCompanion(')
          ..write('creationTime: $creationTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('createUserId: $createUserId, ')
          ..write('creatorUser: $creatorUser, ')
          ..write('lastModifierUser: $lastModifierUser, ')
          ..write('lastModifierUserId: $lastModifierUserId, ')
          ..write('deleteUserId: $deleteUserId, ')
          ..write('deleterUserId: $deleterUserId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('importDateTime: $importDateTime, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('importStatus: $importStatus, ')
          ..write('syncError: $syncError, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName, ')
          ..write('versionRelease: $versionRelease, ')
          ..write('versionEnvrement: $versionEnvrement, ')
          ..write('bootLoader: $bootLoader, ')
          ..write('manufacture: $manufacture, ')
          ..write('model: $model, ')
          ..write('sdkNumber: $sdkNumber, ')
          ..write('hardware: $hardware, ')
          ..write('deviceHost: $deviceHost, ')
          ..write('deviceTime: $deviceTime, ')
          ..write('deviceSerial: $deviceSerial, ')
          ..write('deviceMac: $deviceMac, ')
          ..write('deviceIp: $deviceIp, ')
          ..write('deviceMode: $deviceMode, ')
          ..write('activationDate: $activationDate, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('deviceStatus: $deviceStatus, ')
          ..write('companyName: $companyName, ')
          ..write('deviceNickName: $deviceNickName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $MobileDeviceTable extends MobileDevice
    with TableInfo<$MobileDeviceTable, MobileDeviceData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MobileDeviceTable(this._db, [this._alias]);
  final VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  GeneratedDateTimeColumn _creationTime;
  @override
  GeneratedDateTimeColumn get creationTime =>
      _creationTime ??= _constructCreationTime();
  GeneratedDateTimeColumn _constructCreationTime() {
    return GeneratedDateTimeColumn(
      'creation_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleteTimeMeta = const VerificationMeta('deleteTime');
  GeneratedDateTimeColumn _deleteTime;
  @override
  GeneratedDateTimeColumn get deleteTime =>
      _deleteTime ??= _constructDeleteTime();
  GeneratedDateTimeColumn _constructDeleteTime() {
    return GeneratedDateTimeColumn(
      'delete_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createUserIdMeta =
      const VerificationMeta('createUserId');
  GeneratedIntColumn _createUserId;
  @override
  GeneratedIntColumn get createUserId =>
      _createUserId ??= _constructCreateUserId();
  GeneratedIntColumn _constructCreateUserId() {
    return GeneratedIntColumn(
      'create_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creatorUserMeta =
      const VerificationMeta('creatorUser');
  GeneratedTextColumn _creatorUser;
  @override
  GeneratedTextColumn get creatorUser =>
      _creatorUser ??= _constructCreatorUser();
  GeneratedTextColumn _constructCreatorUser() {
    return GeneratedTextColumn(
      'creator_user',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifierUserMeta =
      const VerificationMeta('lastModifierUser');
  GeneratedTextColumn _lastModifierUser;
  @override
  GeneratedTextColumn get lastModifierUser =>
      _lastModifierUser ??= _constructLastModifierUser();
  GeneratedTextColumn _constructLastModifierUser() {
    return GeneratedTextColumn(
      'last_modifier_user',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifierUserIdMeta =
      const VerificationMeta('lastModifierUserId');
  GeneratedIntColumn _lastModifierUserId;
  @override
  GeneratedIntColumn get lastModifierUserId =>
      _lastModifierUserId ??= _constructLastModifierUserId();
  GeneratedIntColumn _constructLastModifierUserId() {
    return GeneratedIntColumn(
      'last_modifier_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleteUserIdMeta =
      const VerificationMeta('deleteUserId');
  GeneratedIntColumn _deleteUserId;
  @override
  GeneratedIntColumn get deleteUserId =>
      _deleteUserId ??= _constructDeleteUserId();
  GeneratedIntColumn _constructDeleteUserId() {
    return GeneratedIntColumn(
      'delete_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deleterUserIdMeta =
      const VerificationMeta('deleterUserId');
  GeneratedTextColumn _deleterUserId;
  @override
  GeneratedTextColumn get deleterUserId =>
      _deleterUserId ??= _constructDeleterUserId();
  GeneratedTextColumn _constructDeleterUserId() {
    return GeneratedTextColumn(
      'deleter_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  GeneratedBoolColumn _isDeleted;
  @override
  GeneratedBoolColumn get isDeleted => _isDeleted ??= _constructIsDeleted();
  GeneratedBoolColumn _constructIsDeleted() {
    return GeneratedBoolColumn('is_deleted', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _importDateTimeMeta =
      const VerificationMeta('importDateTime');
  GeneratedDateTimeColumn _importDateTime;
  @override
  GeneratedDateTimeColumn get importDateTime =>
      _importDateTime ??= _constructImportDateTime();
  GeneratedDateTimeColumn _constructImportDateTime() {
    return GeneratedDateTimeColumn(
      'import_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _exportDateTimeMeta =
      const VerificationMeta('exportDateTime');
  GeneratedDateTimeColumn _exportDateTime;
  @override
  GeneratedDateTimeColumn get exportDateTime =>
      _exportDateTime ??= _constructExportDateTime();
  GeneratedDateTimeColumn _constructExportDateTime() {
    return GeneratedDateTimeColumn(
      'export_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _exportStatusMeta =
      const VerificationMeta('exportStatus');
  GeneratedTextColumn _exportStatus;
  @override
  GeneratedTextColumn get exportStatus =>
      _exportStatus ??= _constructExportStatus();
  GeneratedTextColumn _constructExportStatus() {
    return GeneratedTextColumn('export_status', $tableName, false,
        defaultValue: Constant('Pending'));
  }

  final VerificationMeta _importStatusMeta =
      const VerificationMeta('importStatus');
  GeneratedTextColumn _importStatus;
  @override
  GeneratedTextColumn get importStatus =>
      _importStatus ??= _constructImportStatus();
  GeneratedTextColumn _constructImportStatus() {
    return GeneratedTextColumn('import_status', $tableName, false,
        defaultValue: Constant('Pending'));
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  GeneratedTextColumn _deviceId;
  @override
  GeneratedTextColumn get deviceId => _deviceId ??= _constructDeviceId();
  GeneratedTextColumn _constructDeviceId() {
    return GeneratedTextColumn(
      'device_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceNameMeta = const VerificationMeta('deviceName');
  GeneratedTextColumn _deviceName;
  @override
  GeneratedTextColumn get deviceName => _deviceName ??= _constructDeviceName();
  GeneratedTextColumn _constructDeviceName() {
    return GeneratedTextColumn(
      'device_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _versionReleaseMeta =
      const VerificationMeta('versionRelease');
  GeneratedTextColumn _versionRelease;
  @override
  GeneratedTextColumn get versionRelease =>
      _versionRelease ??= _constructVersionRelease();
  GeneratedTextColumn _constructVersionRelease() {
    return GeneratedTextColumn(
      'version_release',
      $tableName,
      true,
    );
  }

  final VerificationMeta _versionEnvrementMeta =
      const VerificationMeta('versionEnvrement');
  GeneratedTextColumn _versionEnvrement;
  @override
  GeneratedTextColumn get versionEnvrement =>
      _versionEnvrement ??= _constructVersionEnvrement();
  GeneratedTextColumn _constructVersionEnvrement() {
    return GeneratedTextColumn(
      'version_envrement',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bootLoaderMeta = const VerificationMeta('bootLoader');
  GeneratedTextColumn _bootLoader;
  @override
  GeneratedTextColumn get bootLoader => _bootLoader ??= _constructBootLoader();
  GeneratedTextColumn _constructBootLoader() {
    return GeneratedTextColumn(
      'boot_loader',
      $tableName,
      true,
    );
  }

  final VerificationMeta _manufactureMeta =
      const VerificationMeta('manufacture');
  GeneratedTextColumn _manufacture;
  @override
  GeneratedTextColumn get manufacture =>
      _manufacture ??= _constructManufacture();
  GeneratedTextColumn _constructManufacture() {
    return GeneratedTextColumn(
      'manufacture',
      $tableName,
      true,
    );
  }

  final VerificationMeta _modelMeta = const VerificationMeta('model');
  GeneratedTextColumn _model;
  @override
  GeneratedTextColumn get model => _model ??= _constructModel();
  GeneratedTextColumn _constructModel() {
    return GeneratedTextColumn(
      'model',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sdkNumberMeta = const VerificationMeta('sdkNumber');
  GeneratedIntColumn _sdkNumber;
  @override
  GeneratedIntColumn get sdkNumber => _sdkNumber ??= _constructSdkNumber();
  GeneratedIntColumn _constructSdkNumber() {
    return GeneratedIntColumn(
      'sdk_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hardwareMeta = const VerificationMeta('hardware');
  GeneratedTextColumn _hardware;
  @override
  GeneratedTextColumn get hardware => _hardware ??= _constructHardware();
  GeneratedTextColumn _constructHardware() {
    return GeneratedTextColumn(
      'hardware',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceHostMeta = const VerificationMeta('deviceHost');
  GeneratedTextColumn _deviceHost;
  @override
  GeneratedTextColumn get deviceHost => _deviceHost ??= _constructDeviceHost();
  GeneratedTextColumn _constructDeviceHost() {
    return GeneratedTextColumn(
      'device_host',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceTimeMeta = const VerificationMeta('deviceTime');
  GeneratedDateTimeColumn _deviceTime;
  @override
  GeneratedDateTimeColumn get deviceTime =>
      _deviceTime ??= _constructDeviceTime();
  GeneratedDateTimeColumn _constructDeviceTime() {
    return GeneratedDateTimeColumn(
      'device_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceSerialMeta =
      const VerificationMeta('deviceSerial');
  GeneratedTextColumn _deviceSerial;
  @override
  GeneratedTextColumn get deviceSerial =>
      _deviceSerial ??= _constructDeviceSerial();
  GeneratedTextColumn _constructDeviceSerial() {
    return GeneratedTextColumn(
      'device_serial',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceMacMeta = const VerificationMeta('deviceMac');
  GeneratedTextColumn _deviceMac;
  @override
  GeneratedTextColumn get deviceMac => _deviceMac ??= _constructDeviceMac();
  GeneratedTextColumn _constructDeviceMac() {
    return GeneratedTextColumn(
      'device_mac',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceIpMeta = const VerificationMeta('deviceIp');
  GeneratedTextColumn _deviceIp;
  @override
  GeneratedTextColumn get deviceIp => _deviceIp ??= _constructDeviceIp();
  GeneratedTextColumn _constructDeviceIp() {
    return GeneratedTextColumn(
      'device_ip',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceModeMeta = const VerificationMeta('deviceMode');
  GeneratedTextColumn _deviceMode;
  @override
  GeneratedTextColumn get deviceMode => _deviceMode ??= _constructDeviceMode();
  GeneratedTextColumn _constructDeviceMode() {
    return GeneratedTextColumn(
      'device_mode',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activationDateMeta =
      const VerificationMeta('activationDate');
  GeneratedDateTimeColumn _activationDate;
  @override
  GeneratedDateTimeColumn get activationDate =>
      _activationDate ??= _constructActivationDate();
  GeneratedDateTimeColumn _constructActivationDate() {
    return GeneratedDateTimeColumn(
      'activation_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expirationDateMeta =
      const VerificationMeta('expirationDate');
  GeneratedDateTimeColumn _expirationDate;
  @override
  GeneratedDateTimeColumn get expirationDate =>
      _expirationDate ??= _constructExpirationDate();
  GeneratedDateTimeColumn _constructExpirationDate() {
    return GeneratedDateTimeColumn(
      'expiration_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceStatusMeta =
      const VerificationMeta('deviceStatus');
  GeneratedIntColumn _deviceStatus;
  @override
  GeneratedIntColumn get deviceStatus =>
      _deviceStatus ??= _constructDeviceStatus();
  GeneratedIntColumn _constructDeviceStatus() {
    return GeneratedIntColumn(
      'device_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  GeneratedTextColumn _companyName;
  @override
  GeneratedTextColumn get companyName =>
      _companyName ??= _constructCompanyName();
  GeneratedTextColumn _constructCompanyName() {
    return GeneratedTextColumn(
      'company_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceNickNameMeta =
      const VerificationMeta('deviceNickName');
  GeneratedTextColumn _deviceNickName;
  @override
  GeneratedTextColumn get deviceNickName =>
      _deviceNickName ??= _constructDeviceNickName();
  GeneratedTextColumn _constructDeviceNickName() {
    return GeneratedTextColumn(
      'device_nick_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedRealColumn _latitude;
  @override
  GeneratedRealColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedRealColumn _constructLatitude() {
    return GeneratedRealColumn(
      'latitude',
      $tableName,
      true,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedRealColumn _longitude;
  @override
  GeneratedRealColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedRealColumn _constructLongitude() {
    return GeneratedRealColumn(
      'longitude',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        creationTime,
        deleteTime,
        createUserId,
        creatorUser,
        lastModifierUser,
        lastModifierUserId,
        deleteUserId,
        deleterUserId,
        isDeleted,
        importDateTime,
        exportDateTime,
        exportStatus,
        importStatus,
        syncError,
        deviceId,
        deviceName,
        versionRelease,
        versionEnvrement,
        bootLoader,
        manufacture,
        model,
        sdkNumber,
        hardware,
        deviceHost,
        deviceTime,
        deviceSerial,
        deviceMac,
        deviceIp,
        deviceMode,
        activationDate,
        expirationDate,
        deviceStatus,
        companyName,
        deviceNickName,
        latitude,
        longitude,
        tenantId
      ];
  @override
  $MobileDeviceTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'mobile_device';
  @override
  final String actualTableName = 'mobile_device';
  @override
  VerificationContext validateIntegrity(Insertable<MobileDeviceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time'], _creationTimeMeta));
    }
    if (data.containsKey('delete_time')) {
      context.handle(
          _deleteTimeMeta,
          deleteTime.isAcceptableOrUnknown(
              data['delete_time'], _deleteTimeMeta));
    }
    if (data.containsKey('create_user_id')) {
      context.handle(
          _createUserIdMeta,
          createUserId.isAcceptableOrUnknown(
              data['create_user_id'], _createUserIdMeta));
    }
    if (data.containsKey('creator_user')) {
      context.handle(
          _creatorUserMeta,
          creatorUser.isAcceptableOrUnknown(
              data['creator_user'], _creatorUserMeta));
    }
    if (data.containsKey('last_modifier_user')) {
      context.handle(
          _lastModifierUserMeta,
          lastModifierUser.isAcceptableOrUnknown(
              data['last_modifier_user'], _lastModifierUserMeta));
    }
    if (data.containsKey('last_modifier_user_id')) {
      context.handle(
          _lastModifierUserIdMeta,
          lastModifierUserId.isAcceptableOrUnknown(
              data['last_modifier_user_id'], _lastModifierUserIdMeta));
    }
    if (data.containsKey('delete_user_id')) {
      context.handle(
          _deleteUserIdMeta,
          deleteUserId.isAcceptableOrUnknown(
              data['delete_user_id'], _deleteUserIdMeta));
    }
    if (data.containsKey('deleter_user_id')) {
      context.handle(
          _deleterUserIdMeta,
          deleterUserId.isAcceptableOrUnknown(
              data['deleter_user_id'], _deleterUserIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted'], _isDeletedMeta));
    }
    if (data.containsKey('import_date_time')) {
      context.handle(
          _importDateTimeMeta,
          importDateTime.isAcceptableOrUnknown(
              data['import_date_time'], _importDateTimeMeta));
    }
    if (data.containsKey('export_date_time')) {
      context.handle(
          _exportDateTimeMeta,
          exportDateTime.isAcceptableOrUnknown(
              data['export_date_time'], _exportDateTimeMeta));
    }
    if (data.containsKey('export_status')) {
      context.handle(
          _exportStatusMeta,
          exportStatus.isAcceptableOrUnknown(
              data['export_status'], _exportStatusMeta));
    }
    if (data.containsKey('import_status')) {
      context.handle(
          _importStatusMeta,
          importStatus.isAcceptableOrUnknown(
              data['import_status'], _importStatusMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id'], _deviceIdMeta));
    }
    if (data.containsKey('device_name')) {
      context.handle(
          _deviceNameMeta,
          deviceName.isAcceptableOrUnknown(
              data['device_name'], _deviceNameMeta));
    }
    if (data.containsKey('version_release')) {
      context.handle(
          _versionReleaseMeta,
          versionRelease.isAcceptableOrUnknown(
              data['version_release'], _versionReleaseMeta));
    }
    if (data.containsKey('version_envrement')) {
      context.handle(
          _versionEnvrementMeta,
          versionEnvrement.isAcceptableOrUnknown(
              data['version_envrement'], _versionEnvrementMeta));
    }
    if (data.containsKey('boot_loader')) {
      context.handle(
          _bootLoaderMeta,
          bootLoader.isAcceptableOrUnknown(
              data['boot_loader'], _bootLoaderMeta));
    }
    if (data.containsKey('manufacture')) {
      context.handle(
          _manufactureMeta,
          manufacture.isAcceptableOrUnknown(
              data['manufacture'], _manufactureMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model'], _modelMeta));
    }
    if (data.containsKey('sdk_number')) {
      context.handle(_sdkNumberMeta,
          sdkNumber.isAcceptableOrUnknown(data['sdk_number'], _sdkNumberMeta));
    }
    if (data.containsKey('hardware')) {
      context.handle(_hardwareMeta,
          hardware.isAcceptableOrUnknown(data['hardware'], _hardwareMeta));
    }
    if (data.containsKey('device_host')) {
      context.handle(
          _deviceHostMeta,
          deviceHost.isAcceptableOrUnknown(
              data['device_host'], _deviceHostMeta));
    }
    if (data.containsKey('device_time')) {
      context.handle(
          _deviceTimeMeta,
          deviceTime.isAcceptableOrUnknown(
              data['device_time'], _deviceTimeMeta));
    }
    if (data.containsKey('device_serial')) {
      context.handle(
          _deviceSerialMeta,
          deviceSerial.isAcceptableOrUnknown(
              data['device_serial'], _deviceSerialMeta));
    }
    if (data.containsKey('device_mac')) {
      context.handle(_deviceMacMeta,
          deviceMac.isAcceptableOrUnknown(data['device_mac'], _deviceMacMeta));
    }
    if (data.containsKey('device_ip')) {
      context.handle(_deviceIpMeta,
          deviceIp.isAcceptableOrUnknown(data['device_ip'], _deviceIpMeta));
    }
    if (data.containsKey('device_mode')) {
      context.handle(
          _deviceModeMeta,
          deviceMode.isAcceptableOrUnknown(
              data['device_mode'], _deviceModeMeta));
    }
    if (data.containsKey('activation_date')) {
      context.handle(
          _activationDateMeta,
          activationDate.isAcceptableOrUnknown(
              data['activation_date'], _activationDateMeta));
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
          _expirationDateMeta,
          expirationDate.isAcceptableOrUnknown(
              data['expiration_date'], _expirationDateMeta));
    }
    if (data.containsKey('device_status')) {
      context.handle(
          _deviceStatusMeta,
          deviceStatus.isAcceptableOrUnknown(
              data['device_status'], _deviceStatusMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name'], _companyNameMeta));
    }
    if (data.containsKey('device_nick_name')) {
      context.handle(
          _deviceNickNameMeta,
          deviceNickName.isAcceptableOrUnknown(
              data['device_nick_name'], _deviceNickNameMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {deviceId};
  @override
  MobileDeviceData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MobileDeviceData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MobileDeviceTable createAlias(String alias) {
    return $MobileDeviceTable(_db, alias);
  }
}

class BusinessRuleData extends DataClass
    implements Insertable<BusinessRuleData> {
  final String code;
  final String ruleName;
  final String value;
  final String description;
  final bool isGlobalRule;
  final String deviceRule;
  final String userRule;
  final String domain;
  final DateTime expiredDateTime;
  final int tenantId;
  final String syncError;
  final String dataType;
  final String dataValue;
  final String groups;
  BusinessRuleData(
      {@required this.code,
      this.ruleName,
      @required this.value,
      this.description,
      @required this.isGlobalRule,
      this.deviceRule,
      this.userRule,
      this.domain,
      this.expiredDateTime,
      this.tenantId,
      this.syncError,
      this.dataType,
      this.dataValue,
      this.groups});
  factory BusinessRuleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return BusinessRuleData(
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      ruleName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}rule_name']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      isGlobalRule: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_global_rule']),
      deviceRule: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_rule']),
      userRule: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_rule']),
      domain:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}domain']),
      expiredDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expired_date_time']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      dataType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_type']),
      dataValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_value']),
      groups:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groups']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || ruleName != null) {
      map['rule_name'] = Variable<String>(ruleName);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || isGlobalRule != null) {
      map['is_global_rule'] = Variable<bool>(isGlobalRule);
    }
    if (!nullToAbsent || deviceRule != null) {
      map['device_rule'] = Variable<String>(deviceRule);
    }
    if (!nullToAbsent || userRule != null) {
      map['user_rule'] = Variable<String>(userRule);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    if (!nullToAbsent || expiredDateTime != null) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || dataType != null) {
      map['data_type'] = Variable<String>(dataType);
    }
    if (!nullToAbsent || dataValue != null) {
      map['data_value'] = Variable<String>(dataValue);
    }
    if (!nullToAbsent || groups != null) {
      map['groups'] = Variable<String>(groups);
    }
    return map;
  }

  BusinessRuleCompanion toCompanion(bool nullToAbsent) {
    return BusinessRuleCompanion(
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      ruleName: ruleName == null && nullToAbsent
          ? const Value.absent()
          : Value(ruleName),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isGlobalRule: isGlobalRule == null && nullToAbsent
          ? const Value.absent()
          : Value(isGlobalRule),
      deviceRule: deviceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceRule),
      userRule: userRule == null && nullToAbsent
          ? const Value.absent()
          : Value(userRule),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      expiredDateTime: expiredDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expiredDateTime),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      dataType: dataType == null && nullToAbsent
          ? const Value.absent()
          : Value(dataType),
      dataValue: dataValue == null && nullToAbsent
          ? const Value.absent()
          : Value(dataValue),
      groups:
          groups == null && nullToAbsent ? const Value.absent() : Value(groups),
    );
  }

  factory BusinessRuleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BusinessRuleData(
      code: serializer.fromJson<String>(json['code']),
      ruleName: serializer.fromJson<String>(json['ruleName']),
      value: serializer.fromJson<String>(json['value']),
      description: serializer.fromJson<String>(json['description']),
      isGlobalRule: serializer.fromJson<bool>(json['isGlobalRule']),
      deviceRule: serializer.fromJson<String>(json['deviceRule']),
      userRule: serializer.fromJson<String>(json['userRule']),
      domain: serializer.fromJson<String>(json['domain']),
      expiredDateTime: serializer.fromJson<DateTime>(json['expiredDateTime']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      syncError: serializer.fromJson<String>(json['syncError']),
      dataType: serializer.fromJson<String>(json['dataType']),
      dataValue: serializer.fromJson<String>(json['dataValue']),
      groups: serializer.fromJson<String>(json['groups']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'ruleName': serializer.toJson<String>(ruleName),
      'value': serializer.toJson<String>(value),
      'description': serializer.toJson<String>(description),
      'isGlobalRule': serializer.toJson<bool>(isGlobalRule),
      'deviceRule': serializer.toJson<String>(deviceRule),
      'userRule': serializer.toJson<String>(userRule),
      'domain': serializer.toJson<String>(domain),
      'expiredDateTime': serializer.toJson<DateTime>(expiredDateTime),
      'tenantId': serializer.toJson<int>(tenantId),
      'syncError': serializer.toJson<String>(syncError),
      'dataType': serializer.toJson<String>(dataType),
      'dataValue': serializer.toJson<String>(dataValue),
      'groups': serializer.toJson<String>(groups),
    };
  }

  BusinessRuleData copyWith(
          {String code,
          String ruleName,
          String value,
          String description,
          bool isGlobalRule,
          String deviceRule,
          String userRule,
          String domain,
          DateTime expiredDateTime,
          int tenantId,
          String syncError,
          String dataType,
          String dataValue,
          String groups}) =>
      BusinessRuleData(
        code: code ?? this.code,
        ruleName: ruleName ?? this.ruleName,
        value: value ?? this.value,
        description: description ?? this.description,
        isGlobalRule: isGlobalRule ?? this.isGlobalRule,
        deviceRule: deviceRule ?? this.deviceRule,
        userRule: userRule ?? this.userRule,
        domain: domain ?? this.domain,
        expiredDateTime: expiredDateTime ?? this.expiredDateTime,
        tenantId: tenantId ?? this.tenantId,
        syncError: syncError ?? this.syncError,
        dataType: dataType ?? this.dataType,
        dataValue: dataValue ?? this.dataValue,
        groups: groups ?? this.groups,
      );
  @override
  String toString() {
    return (StringBuffer('BusinessRuleData(')
          ..write('code: $code, ')
          ..write('ruleName: $ruleName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('isGlobalRule: $isGlobalRule, ')
          ..write('deviceRule: $deviceRule, ')
          ..write('userRule: $userRule, ')
          ..write('domain: $domain, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('syncError: $syncError, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      code.hashCode,
      $mrjc(
          ruleName.hashCode,
          $mrjc(
              value.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      isGlobalRule.hashCode,
                      $mrjc(
                          deviceRule.hashCode,
                          $mrjc(
                              userRule.hashCode,
                              $mrjc(
                                  domain.hashCode,
                                  $mrjc(
                                      expiredDateTime.hashCode,
                                      $mrjc(
                                          tenantId.hashCode,
                                          $mrjc(
                                              syncError.hashCode,
                                              $mrjc(
                                                  dataType.hashCode,
                                                  $mrjc(
                                                      dataValue.hashCode,
                                                      groups
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BusinessRuleData &&
          other.code == this.code &&
          other.ruleName == this.ruleName &&
          other.value == this.value &&
          other.description == this.description &&
          other.isGlobalRule == this.isGlobalRule &&
          other.deviceRule == this.deviceRule &&
          other.userRule == this.userRule &&
          other.domain == this.domain &&
          other.expiredDateTime == this.expiredDateTime &&
          other.tenantId == this.tenantId &&
          other.syncError == this.syncError &&
          other.dataType == this.dataType &&
          other.dataValue == this.dataValue &&
          other.groups == this.groups);
}

class BusinessRuleCompanion extends UpdateCompanion<BusinessRuleData> {
  final Value<String> code;
  final Value<String> ruleName;
  final Value<String> value;
  final Value<String> description;
  final Value<bool> isGlobalRule;
  final Value<String> deviceRule;
  final Value<String> userRule;
  final Value<String> domain;
  final Value<DateTime> expiredDateTime;
  final Value<int> tenantId;
  final Value<String> syncError;
  final Value<String> dataType;
  final Value<String> dataValue;
  final Value<String> groups;
  const BusinessRuleCompanion({
    this.code = const Value.absent(),
    this.ruleName = const Value.absent(),
    this.value = const Value.absent(),
    this.description = const Value.absent(),
    this.isGlobalRule = const Value.absent(),
    this.deviceRule = const Value.absent(),
    this.userRule = const Value.absent(),
    this.domain = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.syncError = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
  });
  BusinessRuleCompanion.insert({
    @required String code,
    this.ruleName = const Value.absent(),
    @required String value,
    this.description = const Value.absent(),
    this.isGlobalRule = const Value.absent(),
    this.deviceRule = const Value.absent(),
    this.userRule = const Value.absent(),
    this.domain = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.syncError = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
  })  : code = Value(code),
        value = Value(value);
  static Insertable<BusinessRuleData> custom({
    Expression<String> code,
    Expression<String> ruleName,
    Expression<String> value,
    Expression<String> description,
    Expression<bool> isGlobalRule,
    Expression<String> deviceRule,
    Expression<String> userRule,
    Expression<String> domain,
    Expression<DateTime> expiredDateTime,
    Expression<int> tenantId,
    Expression<String> syncError,
    Expression<String> dataType,
    Expression<String> dataValue,
    Expression<String> groups,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (ruleName != null) 'rule_name': ruleName,
      if (value != null) 'value': value,
      if (description != null) 'description': description,
      if (isGlobalRule != null) 'is_global_rule': isGlobalRule,
      if (deviceRule != null) 'device_rule': deviceRule,
      if (userRule != null) 'user_rule': userRule,
      if (domain != null) 'domain': domain,
      if (expiredDateTime != null) 'expired_date_time': expiredDateTime,
      if (tenantId != null) 'tenant_id': tenantId,
      if (syncError != null) 'sync_error': syncError,
      if (dataType != null) 'data_type': dataType,
      if (dataValue != null) 'data_value': dataValue,
      if (groups != null) 'groups': groups,
    });
  }

  BusinessRuleCompanion copyWith(
      {Value<String> code,
      Value<String> ruleName,
      Value<String> value,
      Value<String> description,
      Value<bool> isGlobalRule,
      Value<String> deviceRule,
      Value<String> userRule,
      Value<String> domain,
      Value<DateTime> expiredDateTime,
      Value<int> tenantId,
      Value<String> syncError,
      Value<String> dataType,
      Value<String> dataValue,
      Value<String> groups}) {
    return BusinessRuleCompanion(
      code: code ?? this.code,
      ruleName: ruleName ?? this.ruleName,
      value: value ?? this.value,
      description: description ?? this.description,
      isGlobalRule: isGlobalRule ?? this.isGlobalRule,
      deviceRule: deviceRule ?? this.deviceRule,
      userRule: userRule ?? this.userRule,
      domain: domain ?? this.domain,
      expiredDateTime: expiredDateTime ?? this.expiredDateTime,
      tenantId: tenantId ?? this.tenantId,
      syncError: syncError ?? this.syncError,
      dataType: dataType ?? this.dataType,
      dataValue: dataValue ?? this.dataValue,
      groups: groups ?? this.groups,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (ruleName.present) {
      map['rule_name'] = Variable<String>(ruleName.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isGlobalRule.present) {
      map['is_global_rule'] = Variable<bool>(isGlobalRule.value);
    }
    if (deviceRule.present) {
      map['device_rule'] = Variable<String>(deviceRule.value);
    }
    if (userRule.present) {
      map['user_rule'] = Variable<String>(userRule.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (expiredDateTime.present) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (dataType.present) {
      map['data_type'] = Variable<String>(dataType.value);
    }
    if (dataValue.present) {
      map['data_value'] = Variable<String>(dataValue.value);
    }
    if (groups.present) {
      map['groups'] = Variable<String>(groups.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessRuleCompanion(')
          ..write('code: $code, ')
          ..write('ruleName: $ruleName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('isGlobalRule: $isGlobalRule, ')
          ..write('deviceRule: $deviceRule, ')
          ..write('userRule: $userRule, ')
          ..write('domain: $domain, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('tenantId: $tenantId, ')
          ..write('syncError: $syncError, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups')
          ..write(')'))
        .toString();
  }
}

class $BusinessRuleTable extends BusinessRule
    with TableInfo<$BusinessRuleTable, BusinessRuleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BusinessRuleTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ruleNameMeta = const VerificationMeta('ruleName');
  GeneratedTextColumn _ruleName;
  @override
  GeneratedTextColumn get ruleName => _ruleName ??= _constructRuleName();
  GeneratedTextColumn _constructRuleName() {
    return GeneratedTextColumn(
      'rule_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
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
      true,
    );
  }

  final VerificationMeta _isGlobalRuleMeta =
      const VerificationMeta('isGlobalRule');
  GeneratedBoolColumn _isGlobalRule;
  @override
  GeneratedBoolColumn get isGlobalRule =>
      _isGlobalRule ??= _constructIsGlobalRule();
  GeneratedBoolColumn _constructIsGlobalRule() {
    return GeneratedBoolColumn('is_global_rule', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _deviceRuleMeta = const VerificationMeta('deviceRule');
  GeneratedTextColumn _deviceRule;
  @override
  GeneratedTextColumn get deviceRule => _deviceRule ??= _constructDeviceRule();
  GeneratedTextColumn _constructDeviceRule() {
    return GeneratedTextColumn(
      'device_rule',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userRuleMeta = const VerificationMeta('userRule');
  GeneratedTextColumn _userRule;
  @override
  GeneratedTextColumn get userRule => _userRule ??= _constructUserRule();
  GeneratedTextColumn _constructUserRule() {
    return GeneratedTextColumn(
      'user_rule',
      $tableName,
      true,
    );
  }

  final VerificationMeta _domainMeta = const VerificationMeta('domain');
  GeneratedTextColumn _domain;
  @override
  GeneratedTextColumn get domain => _domain ??= _constructDomain();
  GeneratedTextColumn _constructDomain() {
    return GeneratedTextColumn(
      'domain',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiredDateTimeMeta =
      const VerificationMeta('expiredDateTime');
  GeneratedDateTimeColumn _expiredDateTime;
  @override
  GeneratedDateTimeColumn get expiredDateTime =>
      _expiredDateTime ??= _constructExpiredDateTime();
  GeneratedDateTimeColumn _constructExpiredDateTime() {
    return GeneratedDateTimeColumn(
      'expired_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataTypeMeta = const VerificationMeta('dataType');
  GeneratedTextColumn _dataType;
  @override
  GeneratedTextColumn get dataType => _dataType ??= _constructDataType();
  GeneratedTextColumn _constructDataType() {
    return GeneratedTextColumn(
      'data_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataValueMeta = const VerificationMeta('dataValue');
  GeneratedTextColumn _dataValue;
  @override
  GeneratedTextColumn get dataValue => _dataValue ??= _constructDataValue();
  GeneratedTextColumn _constructDataValue() {
    return GeneratedTextColumn(
      'data_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupsMeta = const VerificationMeta('groups');
  GeneratedTextColumn _groups;
  @override
  GeneratedTextColumn get groups => _groups ??= _constructGroups();
  GeneratedTextColumn _constructGroups() {
    return GeneratedTextColumn(
      'groups',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        code,
        ruleName,
        value,
        description,
        isGlobalRule,
        deviceRule,
        userRule,
        domain,
        expiredDateTime,
        tenantId,
        syncError,
        dataType,
        dataValue,
        groups
      ];
  @override
  $BusinessRuleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'business_rule';
  @override
  final String actualTableName = 'business_rule';
  @override
  VerificationContext validateIntegrity(Insertable<BusinessRuleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('rule_name')) {
      context.handle(_ruleNameMeta,
          ruleName.isAcceptableOrUnknown(data['rule_name'], _ruleNameMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('is_global_rule')) {
      context.handle(
          _isGlobalRuleMeta,
          isGlobalRule.isAcceptableOrUnknown(
              data['is_global_rule'], _isGlobalRuleMeta));
    }
    if (data.containsKey('device_rule')) {
      context.handle(
          _deviceRuleMeta,
          deviceRule.isAcceptableOrUnknown(
              data['device_rule'], _deviceRuleMeta));
    }
    if (data.containsKey('user_rule')) {
      context.handle(_userRuleMeta,
          userRule.isAcceptableOrUnknown(data['user_rule'], _userRuleMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain'], _domainMeta));
    }
    if (data.containsKey('expired_date_time')) {
      context.handle(
          _expiredDateTimeMeta,
          expiredDateTime.isAcceptableOrUnknown(
              data['expired_date_time'], _expiredDateTimeMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('data_type')) {
      context.handle(_dataTypeMeta,
          dataType.isAcceptableOrUnknown(data['data_type'], _dataTypeMeta));
    }
    if (data.containsKey('data_value')) {
      context.handle(_dataValueMeta,
          dataValue.isAcceptableOrUnknown(data['data_value'], _dataValueMeta));
    }
    if (data.containsKey('groups')) {
      context.handle(_groupsMeta,
          groups.isAcceptableOrUnknown(data['groups'], _groupsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  BusinessRuleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BusinessRuleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BusinessRuleTable createAlias(String alias) {
    return $BusinessRuleTable(_db, alias);
  }
}

class NonGlobalBusinessRuleData extends DataClass
    implements Insertable<NonGlobalBusinessRuleData> {
  final String code;
  final String parentCode;
  final String ruleName;
  final String value;
  final String description;
  final String deviceRule;
  final String userRule;
  final String domain;
  final String deviceId;
  final String userName;
  final String screen;
  final bool isApply;
  final String syncError;
  final DateTime expiredDateTime;
  final String dataType;
  final String dataValue;
  final String groups;
  final int tenantId;
  NonGlobalBusinessRuleData(
      {@required this.code,
      @required this.parentCode,
      this.ruleName,
      @required this.value,
      this.description,
      this.deviceRule,
      this.userRule,
      this.domain,
      this.deviceId,
      this.userName,
      this.screen,
      @required this.isApply,
      this.syncError,
      this.expiredDateTime,
      this.dataType,
      this.dataValue,
      this.groups,
      this.tenantId});
  factory NonGlobalBusinessRuleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return NonGlobalBusinessRuleData(
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      parentCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_code']),
      ruleName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}rule_name']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      deviceRule: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_rule']),
      userRule: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_rule']),
      domain:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}domain']),
      deviceId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      screen:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}screen']),
      isApply:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_apply']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      expiredDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expired_date_time']),
      dataType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_type']),
      dataValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_value']),
      groups:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groups']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || parentCode != null) {
      map['parent_code'] = Variable<String>(parentCode);
    }
    if (!nullToAbsent || ruleName != null) {
      map['rule_name'] = Variable<String>(ruleName);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || deviceRule != null) {
      map['device_rule'] = Variable<String>(deviceRule);
    }
    if (!nullToAbsent || userRule != null) {
      map['user_rule'] = Variable<String>(userRule);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || screen != null) {
      map['screen'] = Variable<String>(screen);
    }
    if (!nullToAbsent || isApply != null) {
      map['is_apply'] = Variable<bool>(isApply);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || expiredDateTime != null) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime);
    }
    if (!nullToAbsent || dataType != null) {
      map['data_type'] = Variable<String>(dataType);
    }
    if (!nullToAbsent || dataValue != null) {
      map['data_value'] = Variable<String>(dataValue);
    }
    if (!nullToAbsent || groups != null) {
      map['groups'] = Variable<String>(groups);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  NonGlobalBusinessRuleCompanion toCompanion(bool nullToAbsent) {
    return NonGlobalBusinessRuleCompanion(
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      parentCode: parentCode == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCode),
      ruleName: ruleName == null && nullToAbsent
          ? const Value.absent()
          : Value(ruleName),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      deviceRule: deviceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceRule),
      userRule: userRule == null && nullToAbsent
          ? const Value.absent()
          : Value(userRule),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      screen:
          screen == null && nullToAbsent ? const Value.absent() : Value(screen),
      isApply: isApply == null && nullToAbsent
          ? const Value.absent()
          : Value(isApply),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      expiredDateTime: expiredDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expiredDateTime),
      dataType: dataType == null && nullToAbsent
          ? const Value.absent()
          : Value(dataType),
      dataValue: dataValue == null && nullToAbsent
          ? const Value.absent()
          : Value(dataValue),
      groups:
          groups == null && nullToAbsent ? const Value.absent() : Value(groups),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory NonGlobalBusinessRuleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NonGlobalBusinessRuleData(
      code: serializer.fromJson<String>(json['code']),
      parentCode: serializer.fromJson<String>(json['parentCode']),
      ruleName: serializer.fromJson<String>(json['ruleName']),
      value: serializer.fromJson<String>(json['value']),
      description: serializer.fromJson<String>(json['description']),
      deviceRule: serializer.fromJson<String>(json['deviceRule']),
      userRule: serializer.fromJson<String>(json['userRule']),
      domain: serializer.fromJson<String>(json['domain']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      userName: serializer.fromJson<String>(json['userName']),
      screen: serializer.fromJson<String>(json['screen']),
      isApply: serializer.fromJson<bool>(json['isApply']),
      syncError: serializer.fromJson<String>(json['syncError']),
      expiredDateTime: serializer.fromJson<DateTime>(json['expiredDateTime']),
      dataType: serializer.fromJson<String>(json['dataType']),
      dataValue: serializer.fromJson<String>(json['dataValue']),
      groups: serializer.fromJson<String>(json['groups']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'parentCode': serializer.toJson<String>(parentCode),
      'ruleName': serializer.toJson<String>(ruleName),
      'value': serializer.toJson<String>(value),
      'description': serializer.toJson<String>(description),
      'deviceRule': serializer.toJson<String>(deviceRule),
      'userRule': serializer.toJson<String>(userRule),
      'domain': serializer.toJson<String>(domain),
      'deviceId': serializer.toJson<String>(deviceId),
      'userName': serializer.toJson<String>(userName),
      'screen': serializer.toJson<String>(screen),
      'isApply': serializer.toJson<bool>(isApply),
      'syncError': serializer.toJson<String>(syncError),
      'expiredDateTime': serializer.toJson<DateTime>(expiredDateTime),
      'dataType': serializer.toJson<String>(dataType),
      'dataValue': serializer.toJson<String>(dataValue),
      'groups': serializer.toJson<String>(groups),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  NonGlobalBusinessRuleData copyWith(
          {String code,
          String parentCode,
          String ruleName,
          String value,
          String description,
          String deviceRule,
          String userRule,
          String domain,
          String deviceId,
          String userName,
          String screen,
          bool isApply,
          String syncError,
          DateTime expiredDateTime,
          String dataType,
          String dataValue,
          String groups,
          int tenantId}) =>
      NonGlobalBusinessRuleData(
        code: code ?? this.code,
        parentCode: parentCode ?? this.parentCode,
        ruleName: ruleName ?? this.ruleName,
        value: value ?? this.value,
        description: description ?? this.description,
        deviceRule: deviceRule ?? this.deviceRule,
        userRule: userRule ?? this.userRule,
        domain: domain ?? this.domain,
        deviceId: deviceId ?? this.deviceId,
        userName: userName ?? this.userName,
        screen: screen ?? this.screen,
        isApply: isApply ?? this.isApply,
        syncError: syncError ?? this.syncError,
        expiredDateTime: expiredDateTime ?? this.expiredDateTime,
        dataType: dataType ?? this.dataType,
        dataValue: dataValue ?? this.dataValue,
        groups: groups ?? this.groups,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('NonGlobalBusinessRuleData(')
          ..write('code: $code, ')
          ..write('parentCode: $parentCode, ')
          ..write('ruleName: $ruleName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('deviceRule: $deviceRule, ')
          ..write('userRule: $userRule, ')
          ..write('domain: $domain, ')
          ..write('deviceId: $deviceId, ')
          ..write('userName: $userName, ')
          ..write('screen: $screen, ')
          ..write('isApply: $isApply, ')
          ..write('syncError: $syncError, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      code.hashCode,
      $mrjc(
          parentCode.hashCode,
          $mrjc(
              ruleName.hashCode,
              $mrjc(
                  value.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(
                          deviceRule.hashCode,
                          $mrjc(
                              userRule.hashCode,
                              $mrjc(
                                  domain.hashCode,
                                  $mrjc(
                                      deviceId.hashCode,
                                      $mrjc(
                                          userName.hashCode,
                                          $mrjc(
                                              screen.hashCode,
                                              $mrjc(
                                                  isApply.hashCode,
                                                  $mrjc(
                                                      syncError.hashCode,
                                                      $mrjc(
                                                          expiredDateTime
                                                              .hashCode,
                                                          $mrjc(
                                                              dataType.hashCode,
                                                              $mrjc(
                                                                  dataValue
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      groups
                                                                          .hashCode,
                                                                      tenantId
                                                                          .hashCode))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NonGlobalBusinessRuleData &&
          other.code == this.code &&
          other.parentCode == this.parentCode &&
          other.ruleName == this.ruleName &&
          other.value == this.value &&
          other.description == this.description &&
          other.deviceRule == this.deviceRule &&
          other.userRule == this.userRule &&
          other.domain == this.domain &&
          other.deviceId == this.deviceId &&
          other.userName == this.userName &&
          other.screen == this.screen &&
          other.isApply == this.isApply &&
          other.syncError == this.syncError &&
          other.expiredDateTime == this.expiredDateTime &&
          other.dataType == this.dataType &&
          other.dataValue == this.dataValue &&
          other.groups == this.groups &&
          other.tenantId == this.tenantId);
}

class NonGlobalBusinessRuleCompanion
    extends UpdateCompanion<NonGlobalBusinessRuleData> {
  final Value<String> code;
  final Value<String> parentCode;
  final Value<String> ruleName;
  final Value<String> value;
  final Value<String> description;
  final Value<String> deviceRule;
  final Value<String> userRule;
  final Value<String> domain;
  final Value<String> deviceId;
  final Value<String> userName;
  final Value<String> screen;
  final Value<bool> isApply;
  final Value<String> syncError;
  final Value<DateTime> expiredDateTime;
  final Value<String> dataType;
  final Value<String> dataValue;
  final Value<String> groups;
  final Value<int> tenantId;
  const NonGlobalBusinessRuleCompanion({
    this.code = const Value.absent(),
    this.parentCode = const Value.absent(),
    this.ruleName = const Value.absent(),
    this.value = const Value.absent(),
    this.description = const Value.absent(),
    this.deviceRule = const Value.absent(),
    this.userRule = const Value.absent(),
    this.domain = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.userName = const Value.absent(),
    this.screen = const Value.absent(),
    this.isApply = const Value.absent(),
    this.syncError = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  NonGlobalBusinessRuleCompanion.insert({
    @required String code,
    @required String parentCode,
    this.ruleName = const Value.absent(),
    @required String value,
    this.description = const Value.absent(),
    this.deviceRule = const Value.absent(),
    this.userRule = const Value.absent(),
    this.domain = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.userName = const Value.absent(),
    this.screen = const Value.absent(),
    this.isApply = const Value.absent(),
    this.syncError = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
    this.tenantId = const Value.absent(),
  })  : code = Value(code),
        parentCode = Value(parentCode),
        value = Value(value);
  static Insertable<NonGlobalBusinessRuleData> custom({
    Expression<String> code,
    Expression<String> parentCode,
    Expression<String> ruleName,
    Expression<String> value,
    Expression<String> description,
    Expression<String> deviceRule,
    Expression<String> userRule,
    Expression<String> domain,
    Expression<String> deviceId,
    Expression<String> userName,
    Expression<String> screen,
    Expression<bool> isApply,
    Expression<String> syncError,
    Expression<DateTime> expiredDateTime,
    Expression<String> dataType,
    Expression<String> dataValue,
    Expression<String> groups,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (parentCode != null) 'parent_code': parentCode,
      if (ruleName != null) 'rule_name': ruleName,
      if (value != null) 'value': value,
      if (description != null) 'description': description,
      if (deviceRule != null) 'device_rule': deviceRule,
      if (userRule != null) 'user_rule': userRule,
      if (domain != null) 'domain': domain,
      if (deviceId != null) 'device_id': deviceId,
      if (userName != null) 'user_name': userName,
      if (screen != null) 'screen': screen,
      if (isApply != null) 'is_apply': isApply,
      if (syncError != null) 'sync_error': syncError,
      if (expiredDateTime != null) 'expired_date_time': expiredDateTime,
      if (dataType != null) 'data_type': dataType,
      if (dataValue != null) 'data_value': dataValue,
      if (groups != null) 'groups': groups,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  NonGlobalBusinessRuleCompanion copyWith(
      {Value<String> code,
      Value<String> parentCode,
      Value<String> ruleName,
      Value<String> value,
      Value<String> description,
      Value<String> deviceRule,
      Value<String> userRule,
      Value<String> domain,
      Value<String> deviceId,
      Value<String> userName,
      Value<String> screen,
      Value<bool> isApply,
      Value<String> syncError,
      Value<DateTime> expiredDateTime,
      Value<String> dataType,
      Value<String> dataValue,
      Value<String> groups,
      Value<int> tenantId}) {
    return NonGlobalBusinessRuleCompanion(
      code: code ?? this.code,
      parentCode: parentCode ?? this.parentCode,
      ruleName: ruleName ?? this.ruleName,
      value: value ?? this.value,
      description: description ?? this.description,
      deviceRule: deviceRule ?? this.deviceRule,
      userRule: userRule ?? this.userRule,
      domain: domain ?? this.domain,
      deviceId: deviceId ?? this.deviceId,
      userName: userName ?? this.userName,
      screen: screen ?? this.screen,
      isApply: isApply ?? this.isApply,
      syncError: syncError ?? this.syncError,
      expiredDateTime: expiredDateTime ?? this.expiredDateTime,
      dataType: dataType ?? this.dataType,
      dataValue: dataValue ?? this.dataValue,
      groups: groups ?? this.groups,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (parentCode.present) {
      map['parent_code'] = Variable<String>(parentCode.value);
    }
    if (ruleName.present) {
      map['rule_name'] = Variable<String>(ruleName.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (deviceRule.present) {
      map['device_rule'] = Variable<String>(deviceRule.value);
    }
    if (userRule.present) {
      map['user_rule'] = Variable<String>(userRule.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (screen.present) {
      map['screen'] = Variable<String>(screen.value);
    }
    if (isApply.present) {
      map['is_apply'] = Variable<bool>(isApply.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (expiredDateTime.present) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime.value);
    }
    if (dataType.present) {
      map['data_type'] = Variable<String>(dataType.value);
    }
    if (dataValue.present) {
      map['data_value'] = Variable<String>(dataValue.value);
    }
    if (groups.present) {
      map['groups'] = Variable<String>(groups.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NonGlobalBusinessRuleCompanion(')
          ..write('code: $code, ')
          ..write('parentCode: $parentCode, ')
          ..write('ruleName: $ruleName, ')
          ..write('value: $value, ')
          ..write('description: $description, ')
          ..write('deviceRule: $deviceRule, ')
          ..write('userRule: $userRule, ')
          ..write('domain: $domain, ')
          ..write('deviceId: $deviceId, ')
          ..write('userName: $userName, ')
          ..write('screen: $screen, ')
          ..write('isApply: $isApply, ')
          ..write('syncError: $syncError, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $NonGlobalBusinessRuleTable extends NonGlobalBusinessRule
    with TableInfo<$NonGlobalBusinessRuleTable, NonGlobalBusinessRuleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NonGlobalBusinessRuleTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _parentCodeMeta = const VerificationMeta('parentCode');
  GeneratedTextColumn _parentCode;
  @override
  GeneratedTextColumn get parentCode => _parentCode ??= _constructParentCode();
  GeneratedTextColumn _constructParentCode() {
    return GeneratedTextColumn(
      'parent_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ruleNameMeta = const VerificationMeta('ruleName');
  GeneratedTextColumn _ruleName;
  @override
  GeneratedTextColumn get ruleName => _ruleName ??= _constructRuleName();
  GeneratedTextColumn _constructRuleName() {
    return GeneratedTextColumn(
      'rule_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
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
      true,
    );
  }

  final VerificationMeta _deviceRuleMeta = const VerificationMeta('deviceRule');
  GeneratedTextColumn _deviceRule;
  @override
  GeneratedTextColumn get deviceRule => _deviceRule ??= _constructDeviceRule();
  GeneratedTextColumn _constructDeviceRule() {
    return GeneratedTextColumn(
      'device_rule',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userRuleMeta = const VerificationMeta('userRule');
  GeneratedTextColumn _userRule;
  @override
  GeneratedTextColumn get userRule => _userRule ??= _constructUserRule();
  GeneratedTextColumn _constructUserRule() {
    return GeneratedTextColumn(
      'user_rule',
      $tableName,
      true,
    );
  }

  final VerificationMeta _domainMeta = const VerificationMeta('domain');
  GeneratedTextColumn _domain;
  @override
  GeneratedTextColumn get domain => _domain ??= _constructDomain();
  GeneratedTextColumn _constructDomain() {
    return GeneratedTextColumn(
      'domain',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  GeneratedTextColumn _deviceId;
  @override
  GeneratedTextColumn get deviceId => _deviceId ??= _constructDeviceId();
  GeneratedTextColumn _constructDeviceId() {
    return GeneratedTextColumn(
      'device_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _screenMeta = const VerificationMeta('screen');
  GeneratedTextColumn _screen;
  @override
  GeneratedTextColumn get screen => _screen ??= _constructScreen();
  GeneratedTextColumn _constructScreen() {
    return GeneratedTextColumn(
      'screen',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isApplyMeta = const VerificationMeta('isApply');
  GeneratedBoolColumn _isApply;
  @override
  GeneratedBoolColumn get isApply => _isApply ??= _constructIsApply();
  GeneratedBoolColumn _constructIsApply() {
    return GeneratedBoolColumn('is_apply', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiredDateTimeMeta =
      const VerificationMeta('expiredDateTime');
  GeneratedDateTimeColumn _expiredDateTime;
  @override
  GeneratedDateTimeColumn get expiredDateTime =>
      _expiredDateTime ??= _constructExpiredDateTime();
  GeneratedDateTimeColumn _constructExpiredDateTime() {
    return GeneratedDateTimeColumn(
      'expired_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataTypeMeta = const VerificationMeta('dataType');
  GeneratedTextColumn _dataType;
  @override
  GeneratedTextColumn get dataType => _dataType ??= _constructDataType();
  GeneratedTextColumn _constructDataType() {
    return GeneratedTextColumn(
      'data_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataValueMeta = const VerificationMeta('dataValue');
  GeneratedTextColumn _dataValue;
  @override
  GeneratedTextColumn get dataValue => _dataValue ??= _constructDataValue();
  GeneratedTextColumn _constructDataValue() {
    return GeneratedTextColumn(
      'data_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupsMeta = const VerificationMeta('groups');
  GeneratedTextColumn _groups;
  @override
  GeneratedTextColumn get groups => _groups ??= _constructGroups();
  GeneratedTextColumn _constructGroups() {
    return GeneratedTextColumn(
      'groups',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        code,
        parentCode,
        ruleName,
        value,
        description,
        deviceRule,
        userRule,
        domain,
        deviceId,
        userName,
        screen,
        isApply,
        syncError,
        expiredDateTime,
        dataType,
        dataValue,
        groups,
        tenantId
      ];
  @override
  $NonGlobalBusinessRuleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'non_global_business_rule';
  @override
  final String actualTableName = 'non_global_business_rule';
  @override
  VerificationContext validateIntegrity(
      Insertable<NonGlobalBusinessRuleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('parent_code')) {
      context.handle(
          _parentCodeMeta,
          parentCode.isAcceptableOrUnknown(
              data['parent_code'], _parentCodeMeta));
    } else if (isInserting) {
      context.missing(_parentCodeMeta);
    }
    if (data.containsKey('rule_name')) {
      context.handle(_ruleNameMeta,
          ruleName.isAcceptableOrUnknown(data['rule_name'], _ruleNameMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('device_rule')) {
      context.handle(
          _deviceRuleMeta,
          deviceRule.isAcceptableOrUnknown(
              data['device_rule'], _deviceRuleMeta));
    }
    if (data.containsKey('user_rule')) {
      context.handle(_userRuleMeta,
          userRule.isAcceptableOrUnknown(data['user_rule'], _userRuleMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain'], _domainMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id'], _deviceIdMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    }
    if (data.containsKey('screen')) {
      context.handle(_screenMeta,
          screen.isAcceptableOrUnknown(data['screen'], _screenMeta));
    }
    if (data.containsKey('is_apply')) {
      context.handle(_isApplyMeta,
          isApply.isAcceptableOrUnknown(data['is_apply'], _isApplyMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('expired_date_time')) {
      context.handle(
          _expiredDateTimeMeta,
          expiredDateTime.isAcceptableOrUnknown(
              data['expired_date_time'], _expiredDateTimeMeta));
    }
    if (data.containsKey('data_type')) {
      context.handle(_dataTypeMeta,
          dataType.isAcceptableOrUnknown(data['data_type'], _dataTypeMeta));
    }
    if (data.containsKey('data_value')) {
      context.handle(_dataValueMeta,
          dataValue.isAcceptableOrUnknown(data['data_value'], _dataValueMeta));
    }
    if (data.containsKey('groups')) {
      context.handle(_groupsMeta,
          groups.isAcceptableOrUnknown(data['groups'], _groupsMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  NonGlobalBusinessRuleData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NonGlobalBusinessRuleData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $NonGlobalBusinessRuleTable createAlias(String alias) {
    return $NonGlobalBusinessRuleTable(_db, alias);
  }
}

class ApplicationLoggerData extends DataClass
    implements Insertable<ApplicationLoggerData> {
  final int tenantId;
  final String uerName;
  final int userId;
  final int id;
  final String functionName;
  final DateTime logDateTime;
  final String syncFrequency;
  final String logDescription;
  final String documentNo;
  final String deviceId;
  final String logCode;
  final String logSeverity;
  final DateTime exportDateTime;
  final String exportStatus;
  final String syncError;
  ApplicationLoggerData(
      {this.tenantId,
      this.uerName,
      this.userId,
      @required this.id,
      @required this.functionName,
      @required this.logDateTime,
      @required this.syncFrequency,
      @required this.logDescription,
      @required this.documentNo,
      @required this.deviceId,
      @required this.logCode,
      @required this.logSeverity,
      this.exportDateTime,
      @required this.exportStatus,
      this.syncError});
  factory ApplicationLoggerData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ApplicationLoggerData(
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      uerName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}uer_name']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      functionName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}function_name']),
      logDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}log_date_time']),
      syncFrequency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_frequency']),
      logDescription: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}log_description']),
      documentNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}document_no']),
      deviceId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id']),
      logCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}log_code']),
      logSeverity: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}log_severity']),
      exportDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_date_time']),
      exportStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}export_status']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || uerName != null) {
      map['uer_name'] = Variable<String>(uerName);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || functionName != null) {
      map['function_name'] = Variable<String>(functionName);
    }
    if (!nullToAbsent || logDateTime != null) {
      map['log_date_time'] = Variable<DateTime>(logDateTime);
    }
    if (!nullToAbsent || syncFrequency != null) {
      map['sync_frequency'] = Variable<String>(syncFrequency);
    }
    if (!nullToAbsent || logDescription != null) {
      map['log_description'] = Variable<String>(logDescription);
    }
    if (!nullToAbsent || documentNo != null) {
      map['document_no'] = Variable<String>(documentNo);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || logCode != null) {
      map['log_code'] = Variable<String>(logCode);
    }
    if (!nullToAbsent || logSeverity != null) {
      map['log_severity'] = Variable<String>(logSeverity);
    }
    if (!nullToAbsent || exportDateTime != null) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime);
    }
    if (!nullToAbsent || exportStatus != null) {
      map['export_status'] = Variable<String>(exportStatus);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    return map;
  }

  ApplicationLoggerCompanion toCompanion(bool nullToAbsent) {
    return ApplicationLoggerCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      uerName: uerName == null && nullToAbsent
          ? const Value.absent()
          : Value(uerName),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      functionName: functionName == null && nullToAbsent
          ? const Value.absent()
          : Value(functionName),
      logDateTime: logDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(logDateTime),
      syncFrequency: syncFrequency == null && nullToAbsent
          ? const Value.absent()
          : Value(syncFrequency),
      logDescription: logDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(logDescription),
      documentNo: documentNo == null && nullToAbsent
          ? const Value.absent()
          : Value(documentNo),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      logCode: logCode == null && nullToAbsent
          ? const Value.absent()
          : Value(logCode),
      logSeverity: logSeverity == null && nullToAbsent
          ? const Value.absent()
          : Value(logSeverity),
      exportDateTime: exportDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exportDateTime),
      exportStatus: exportStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(exportStatus),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
    );
  }

  factory ApplicationLoggerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ApplicationLoggerData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      uerName: serializer.fromJson<String>(json['uerName']),
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      functionName: serializer.fromJson<String>(json['functionName']),
      logDateTime: serializer.fromJson<DateTime>(json['logDateTime']),
      syncFrequency: serializer.fromJson<String>(json['syncFrequency']),
      logDescription: serializer.fromJson<String>(json['logDescription']),
      documentNo: serializer.fromJson<String>(json['documentNo']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      logCode: serializer.fromJson<String>(json['logCode']),
      logSeverity: serializer.fromJson<String>(json['logSeverity']),
      exportDateTime: serializer.fromJson<DateTime>(json['exportDateTime']),
      exportStatus: serializer.fromJson<String>(json['exportStatus']),
      syncError: serializer.fromJson<String>(json['syncError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'uerName': serializer.toJson<String>(uerName),
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'functionName': serializer.toJson<String>(functionName),
      'logDateTime': serializer.toJson<DateTime>(logDateTime),
      'syncFrequency': serializer.toJson<String>(syncFrequency),
      'logDescription': serializer.toJson<String>(logDescription),
      'documentNo': serializer.toJson<String>(documentNo),
      'deviceId': serializer.toJson<String>(deviceId),
      'logCode': serializer.toJson<String>(logCode),
      'logSeverity': serializer.toJson<String>(logSeverity),
      'exportDateTime': serializer.toJson<DateTime>(exportDateTime),
      'exportStatus': serializer.toJson<String>(exportStatus),
      'syncError': serializer.toJson<String>(syncError),
    };
  }

  ApplicationLoggerData copyWith(
          {int tenantId,
          String uerName,
          int userId,
          int id,
          String functionName,
          DateTime logDateTime,
          String syncFrequency,
          String logDescription,
          String documentNo,
          String deviceId,
          String logCode,
          String logSeverity,
          DateTime exportDateTime,
          String exportStatus,
          String syncError}) =>
      ApplicationLoggerData(
        tenantId: tenantId ?? this.tenantId,
        uerName: uerName ?? this.uerName,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        functionName: functionName ?? this.functionName,
        logDateTime: logDateTime ?? this.logDateTime,
        syncFrequency: syncFrequency ?? this.syncFrequency,
        logDescription: logDescription ?? this.logDescription,
        documentNo: documentNo ?? this.documentNo,
        deviceId: deviceId ?? this.deviceId,
        logCode: logCode ?? this.logCode,
        logSeverity: logSeverity ?? this.logSeverity,
        exportDateTime: exportDateTime ?? this.exportDateTime,
        exportStatus: exportStatus ?? this.exportStatus,
        syncError: syncError ?? this.syncError,
      );
  @override
  String toString() {
    return (StringBuffer('ApplicationLoggerData(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('functionName: $functionName, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('logDescription: $logDescription, ')
          ..write('documentNo: $documentNo, ')
          ..write('deviceId: $deviceId, ')
          ..write('logCode: $logCode, ')
          ..write('logSeverity: $logSeverity, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('syncError: $syncError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tenantId.hashCode,
      $mrjc(
          uerName.hashCode,
          $mrjc(
              userId.hashCode,
              $mrjc(
                  id.hashCode,
                  $mrjc(
                      functionName.hashCode,
                      $mrjc(
                          logDateTime.hashCode,
                          $mrjc(
                              syncFrequency.hashCode,
                              $mrjc(
                                  logDescription.hashCode,
                                  $mrjc(
                                      documentNo.hashCode,
                                      $mrjc(
                                          deviceId.hashCode,
                                          $mrjc(
                                              logCode.hashCode,
                                              $mrjc(
                                                  logSeverity.hashCode,
                                                  $mrjc(
                                                      exportDateTime.hashCode,
                                                      $mrjc(
                                                          exportStatus.hashCode,
                                                          syncError
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ApplicationLoggerData &&
          other.tenantId == this.tenantId &&
          other.uerName == this.uerName &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.functionName == this.functionName &&
          other.logDateTime == this.logDateTime &&
          other.syncFrequency == this.syncFrequency &&
          other.logDescription == this.logDescription &&
          other.documentNo == this.documentNo &&
          other.deviceId == this.deviceId &&
          other.logCode == this.logCode &&
          other.logSeverity == this.logSeverity &&
          other.exportDateTime == this.exportDateTime &&
          other.exportStatus == this.exportStatus &&
          other.syncError == this.syncError);
}

class ApplicationLoggerCompanion
    extends UpdateCompanion<ApplicationLoggerData> {
  final Value<int> tenantId;
  final Value<String> uerName;
  final Value<int> userId;
  final Value<int> id;
  final Value<String> functionName;
  final Value<DateTime> logDateTime;
  final Value<String> syncFrequency;
  final Value<String> logDescription;
  final Value<String> documentNo;
  final Value<String> deviceId;
  final Value<String> logCode;
  final Value<String> logSeverity;
  final Value<DateTime> exportDateTime;
  final Value<String> exportStatus;
  final Value<String> syncError;
  const ApplicationLoggerCompanion({
    this.tenantId = const Value.absent(),
    this.uerName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.functionName = const Value.absent(),
    this.logDateTime = const Value.absent(),
    this.syncFrequency = const Value.absent(),
    this.logDescription = const Value.absent(),
    this.documentNo = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.logCode = const Value.absent(),
    this.logSeverity = const Value.absent(),
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.syncError = const Value.absent(),
  });
  ApplicationLoggerCompanion.insert({
    this.tenantId = const Value.absent(),
    this.uerName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    @required String functionName,
    @required DateTime logDateTime,
    @required String syncFrequency,
    @required String logDescription,
    @required String documentNo,
    @required String deviceId,
    @required String logCode,
    @required String logSeverity,
    this.exportDateTime = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.syncError = const Value.absent(),
  })  : functionName = Value(functionName),
        logDateTime = Value(logDateTime),
        syncFrequency = Value(syncFrequency),
        logDescription = Value(logDescription),
        documentNo = Value(documentNo),
        deviceId = Value(deviceId),
        logCode = Value(logCode),
        logSeverity = Value(logSeverity);
  static Insertable<ApplicationLoggerData> custom({
    Expression<int> tenantId,
    Expression<String> uerName,
    Expression<int> userId,
    Expression<int> id,
    Expression<String> functionName,
    Expression<DateTime> logDateTime,
    Expression<String> syncFrequency,
    Expression<String> logDescription,
    Expression<String> documentNo,
    Expression<String> deviceId,
    Expression<String> logCode,
    Expression<String> logSeverity,
    Expression<DateTime> exportDateTime,
    Expression<String> exportStatus,
    Expression<String> syncError,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (uerName != null) 'uer_name': uerName,
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (functionName != null) 'function_name': functionName,
      if (logDateTime != null) 'log_date_time': logDateTime,
      if (syncFrequency != null) 'sync_frequency': syncFrequency,
      if (logDescription != null) 'log_description': logDescription,
      if (documentNo != null) 'document_no': documentNo,
      if (deviceId != null) 'device_id': deviceId,
      if (logCode != null) 'log_code': logCode,
      if (logSeverity != null) 'log_severity': logSeverity,
      if (exportDateTime != null) 'export_date_time': exportDateTime,
      if (exportStatus != null) 'export_status': exportStatus,
      if (syncError != null) 'sync_error': syncError,
    });
  }

  ApplicationLoggerCompanion copyWith(
      {Value<int> tenantId,
      Value<String> uerName,
      Value<int> userId,
      Value<int> id,
      Value<String> functionName,
      Value<DateTime> logDateTime,
      Value<String> syncFrequency,
      Value<String> logDescription,
      Value<String> documentNo,
      Value<String> deviceId,
      Value<String> logCode,
      Value<String> logSeverity,
      Value<DateTime> exportDateTime,
      Value<String> exportStatus,
      Value<String> syncError}) {
    return ApplicationLoggerCompanion(
      tenantId: tenantId ?? this.tenantId,
      uerName: uerName ?? this.uerName,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      functionName: functionName ?? this.functionName,
      logDateTime: logDateTime ?? this.logDateTime,
      syncFrequency: syncFrequency ?? this.syncFrequency,
      logDescription: logDescription ?? this.logDescription,
      documentNo: documentNo ?? this.documentNo,
      deviceId: deviceId ?? this.deviceId,
      logCode: logCode ?? this.logCode,
      logSeverity: logSeverity ?? this.logSeverity,
      exportDateTime: exportDateTime ?? this.exportDateTime,
      exportStatus: exportStatus ?? this.exportStatus,
      syncError: syncError ?? this.syncError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (uerName.present) {
      map['uer_name'] = Variable<String>(uerName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (functionName.present) {
      map['function_name'] = Variable<String>(functionName.value);
    }
    if (logDateTime.present) {
      map['log_date_time'] = Variable<DateTime>(logDateTime.value);
    }
    if (syncFrequency.present) {
      map['sync_frequency'] = Variable<String>(syncFrequency.value);
    }
    if (logDescription.present) {
      map['log_description'] = Variable<String>(logDescription.value);
    }
    if (documentNo.present) {
      map['document_no'] = Variable<String>(documentNo.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (logCode.present) {
      map['log_code'] = Variable<String>(logCode.value);
    }
    if (logSeverity.present) {
      map['log_severity'] = Variable<String>(logSeverity.value);
    }
    if (exportDateTime.present) {
      map['export_date_time'] = Variable<DateTime>(exportDateTime.value);
    }
    if (exportStatus.present) {
      map['export_status'] = Variable<String>(exportStatus.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApplicationLoggerCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('functionName: $functionName, ')
          ..write('logDateTime: $logDateTime, ')
          ..write('syncFrequency: $syncFrequency, ')
          ..write('logDescription: $logDescription, ')
          ..write('documentNo: $documentNo, ')
          ..write('deviceId: $deviceId, ')
          ..write('logCode: $logCode, ')
          ..write('logSeverity: $logSeverity, ')
          ..write('exportDateTime: $exportDateTime, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('syncError: $syncError')
          ..write(')'))
        .toString();
  }
}

class $ApplicationLoggerTable extends ApplicationLogger
    with TableInfo<$ApplicationLoggerTable, ApplicationLoggerData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ApplicationLoggerTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _uerNameMeta = const VerificationMeta('uerName');
  GeneratedTextColumn _uerName;
  @override
  GeneratedTextColumn get uerName => _uerName ??= _constructUerName();
  GeneratedTextColumn _constructUerName() {
    return GeneratedTextColumn(
      'uer_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _functionNameMeta =
      const VerificationMeta('functionName');
  GeneratedTextColumn _functionName;
  @override
  GeneratedTextColumn get functionName =>
      _functionName ??= _constructFunctionName();
  GeneratedTextColumn _constructFunctionName() {
    return GeneratedTextColumn(
      'function_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _logDateTimeMeta =
      const VerificationMeta('logDateTime');
  GeneratedDateTimeColumn _logDateTime;
  @override
  GeneratedDateTimeColumn get logDateTime =>
      _logDateTime ??= _constructLogDateTime();
  GeneratedDateTimeColumn _constructLogDateTime() {
    return GeneratedDateTimeColumn(
      'log_date_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _syncFrequencyMeta =
      const VerificationMeta('syncFrequency');
  GeneratedTextColumn _syncFrequency;
  @override
  GeneratedTextColumn get syncFrequency =>
      _syncFrequency ??= _constructSyncFrequency();
  GeneratedTextColumn _constructSyncFrequency() {
    return GeneratedTextColumn(
      'sync_frequency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _logDescriptionMeta =
      const VerificationMeta('logDescription');
  GeneratedTextColumn _logDescription;
  @override
  GeneratedTextColumn get logDescription =>
      _logDescription ??= _constructLogDescription();
  GeneratedTextColumn _constructLogDescription() {
    return GeneratedTextColumn(
      'log_description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _documentNoMeta = const VerificationMeta('documentNo');
  GeneratedTextColumn _documentNo;
  @override
  GeneratedTextColumn get documentNo => _documentNo ??= _constructDocumentNo();
  GeneratedTextColumn _constructDocumentNo() {
    return GeneratedTextColumn(
      'document_no',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  GeneratedTextColumn _deviceId;
  @override
  GeneratedTextColumn get deviceId => _deviceId ??= _constructDeviceId();
  GeneratedTextColumn _constructDeviceId() {
    return GeneratedTextColumn(
      'device_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _logCodeMeta = const VerificationMeta('logCode');
  GeneratedTextColumn _logCode;
  @override
  GeneratedTextColumn get logCode => _logCode ??= _constructLogCode();
  GeneratedTextColumn _constructLogCode() {
    return GeneratedTextColumn(
      'log_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _logSeverityMeta =
      const VerificationMeta('logSeverity');
  GeneratedTextColumn _logSeverity;
  @override
  GeneratedTextColumn get logSeverity =>
      _logSeverity ??= _constructLogSeverity();
  GeneratedTextColumn _constructLogSeverity() {
    return GeneratedTextColumn(
      'log_severity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exportDateTimeMeta =
      const VerificationMeta('exportDateTime');
  GeneratedDateTimeColumn _exportDateTime;
  @override
  GeneratedDateTimeColumn get exportDateTime =>
      _exportDateTime ??= _constructExportDateTime();
  GeneratedDateTimeColumn _constructExportDateTime() {
    return GeneratedDateTimeColumn(
      'export_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _exportStatusMeta =
      const VerificationMeta('exportStatus');
  GeneratedTextColumn _exportStatus;
  @override
  GeneratedTextColumn get exportStatus =>
      _exportStatus ??= _constructExportStatus();
  GeneratedTextColumn _constructExportStatus() {
    return GeneratedTextColumn('export_status', $tableName, false,
        defaultValue: Constant('Pending'));
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        uerName,
        userId,
        id,
        functionName,
        logDateTime,
        syncFrequency,
        logDescription,
        documentNo,
        deviceId,
        logCode,
        logSeverity,
        exportDateTime,
        exportStatus,
        syncError
      ];
  @override
  $ApplicationLoggerTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'application_logger';
  @override
  final String actualTableName = 'application_logger';
  @override
  VerificationContext validateIntegrity(
      Insertable<ApplicationLoggerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('uer_name')) {
      context.handle(_uerNameMeta,
          uerName.isAcceptableOrUnknown(data['uer_name'], _uerNameMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('function_name')) {
      context.handle(
          _functionNameMeta,
          functionName.isAcceptableOrUnknown(
              data['function_name'], _functionNameMeta));
    } else if (isInserting) {
      context.missing(_functionNameMeta);
    }
    if (data.containsKey('log_date_time')) {
      context.handle(
          _logDateTimeMeta,
          logDateTime.isAcceptableOrUnknown(
              data['log_date_time'], _logDateTimeMeta));
    } else if (isInserting) {
      context.missing(_logDateTimeMeta);
    }
    if (data.containsKey('sync_frequency')) {
      context.handle(
          _syncFrequencyMeta,
          syncFrequency.isAcceptableOrUnknown(
              data['sync_frequency'], _syncFrequencyMeta));
    } else if (isInserting) {
      context.missing(_syncFrequencyMeta);
    }
    if (data.containsKey('log_description')) {
      context.handle(
          _logDescriptionMeta,
          logDescription.isAcceptableOrUnknown(
              data['log_description'], _logDescriptionMeta));
    } else if (isInserting) {
      context.missing(_logDescriptionMeta);
    }
    if (data.containsKey('document_no')) {
      context.handle(
          _documentNoMeta,
          documentNo.isAcceptableOrUnknown(
              data['document_no'], _documentNoMeta));
    } else if (isInserting) {
      context.missing(_documentNoMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id'], _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('log_code')) {
      context.handle(_logCodeMeta,
          logCode.isAcceptableOrUnknown(data['log_code'], _logCodeMeta));
    } else if (isInserting) {
      context.missing(_logCodeMeta);
    }
    if (data.containsKey('log_severity')) {
      context.handle(
          _logSeverityMeta,
          logSeverity.isAcceptableOrUnknown(
              data['log_severity'], _logSeverityMeta));
    } else if (isInserting) {
      context.missing(_logSeverityMeta);
    }
    if (data.containsKey('export_date_time')) {
      context.handle(
          _exportDateTimeMeta,
          exportDateTime.isAcceptableOrUnknown(
              data['export_date_time'], _exportDateTimeMeta));
    }
    if (data.containsKey('export_status')) {
      context.handle(
          _exportStatusMeta,
          exportStatus.isAcceptableOrUnknown(
              data['export_status'], _exportStatusMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ApplicationLoggerData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ApplicationLoggerData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ApplicationLoggerTable createAlias(String alias) {
    return $ApplicationLoggerTable(_db, alias);
  }
}

class TenantData extends DataClass implements Insertable<TenantData> {
  final int tenantId;
  final String tenantName;
  final int tenantState;
  final int userId;
  final String userName;
  TenantData(
      {@required this.tenantId,
      this.tenantName,
      this.tenantState,
      this.userId,
      this.userName});
  factory TenantData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TenantData(
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      tenantName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_name']),
      tenantState: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_state']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || tenantName != null) {
      map['tenant_name'] = Variable<String>(tenantName);
    }
    if (!nullToAbsent || tenantState != null) {
      map['tenant_state'] = Variable<int>(tenantState);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    return map;
  }

  TenantCompanion toCompanion(bool nullToAbsent) {
    return TenantCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      tenantName: tenantName == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantName),
      tenantState: tenantState == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantState),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
    );
  }

  factory TenantData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TenantData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      tenantState: serializer.fromJson<int>(json['tenantState']),
      userId: serializer.fromJson<int>(json['userId']),
      userName: serializer.fromJson<String>(json['userName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'tenantName': serializer.toJson<String>(tenantName),
      'tenantState': serializer.toJson<int>(tenantState),
      'userId': serializer.toJson<int>(userId),
      'userName': serializer.toJson<String>(userName),
    };
  }

  TenantData copyWith(
          {int tenantId,
          String tenantName,
          int tenantState,
          int userId,
          String userName}) =>
      TenantData(
        tenantId: tenantId ?? this.tenantId,
        tenantName: tenantName ?? this.tenantName,
        tenantState: tenantState ?? this.tenantState,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
      );
  @override
  String toString() {
    return (StringBuffer('TenantData(')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantState: $tenantState, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tenantId.hashCode,
      $mrjc(
          tenantName.hashCode,
          $mrjc(tenantState.hashCode,
              $mrjc(userId.hashCode, userName.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TenantData &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.tenantState == this.tenantState &&
          other.userId == this.userId &&
          other.userName == this.userName);
}

class TenantCompanion extends UpdateCompanion<TenantData> {
  final Value<int> tenantId;
  final Value<String> tenantName;
  final Value<int> tenantState;
  final Value<int> userId;
  final Value<String> userName;
  const TenantCompanion({
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.tenantState = const Value.absent(),
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
  });
  TenantCompanion.insert({
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.tenantState = const Value.absent(),
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
  });
  static Insertable<TenantData> custom({
    Expression<int> tenantId,
    Expression<String> tenantName,
    Expression<int> tenantState,
    Expression<int> userId,
    Expression<String> userName,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (tenantState != null) 'tenant_state': tenantState,
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
    });
  }

  TenantCompanion copyWith(
      {Value<int> tenantId,
      Value<String> tenantName,
      Value<int> tenantState,
      Value<int> userId,
      Value<String> userName}) {
    return TenantCompanion(
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      tenantState: tenantState ?? this.tenantState,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (tenantState.present) {
      map['tenant_state'] = Variable<int>(tenantState.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantState: $tenantState, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName')
          ..write(')'))
        .toString();
  }
}

class $TenantTable extends Tenant with TableInfo<$TenantTable, TenantData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TenantTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn('tenant_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tenantNameMeta = const VerificationMeta('tenantName');
  GeneratedTextColumn _tenantName;
  @override
  GeneratedTextColumn get tenantName => _tenantName ??= _constructTenantName();
  GeneratedTextColumn _constructTenantName() {
    return GeneratedTextColumn(
      'tenant_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantStateMeta =
      const VerificationMeta('tenantState');
  GeneratedIntColumn _tenantState;
  @override
  GeneratedIntColumn get tenantState =>
      _tenantState ??= _constructTenantState();
  GeneratedIntColumn _constructTenantState() {
    return GeneratedIntColumn(
      'tenant_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [tenantId, tenantName, tenantState, userId, userName];
  @override
  $TenantTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tenant';
  @override
  final String actualTableName = 'tenant';
  @override
  VerificationContext validateIntegrity(Insertable<TenantData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
          _tenantNameMeta,
          tenantName.isAcceptableOrUnknown(
              data['tenant_name'], _tenantNameMeta));
    }
    if (data.containsKey('tenant_state')) {
      context.handle(
          _tenantStateMeta,
          tenantState.isAcceptableOrUnknown(
              data['tenant_state'], _tenantStateMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tenantId};
  @override
  TenantData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TenantData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TenantTable createAlias(String alias) {
    return $TenantTable(_db, alias);
  }
}

class NonGlobalPreferenceData extends DataClass
    implements Insertable<NonGlobalPreferenceData> {
  final int id;
  final String parentCode;
  final String code;
  final String value;
  final String settingType;
  final String deviceId;
  final String userName;
  final String screen;
  final bool isApply;
  final DateTime expiredDateTime;
  final String syncError;
  final String dataType;
  final String dataValue;
  final String groups;
  final int tenantId;
  NonGlobalPreferenceData(
      {@required this.id,
      @required this.parentCode,
      @required this.code,
      @required this.value,
      this.settingType,
      this.deviceId,
      this.userName,
      this.screen,
      @required this.isApply,
      this.expiredDateTime,
      this.syncError,
      this.dataType,
      this.dataValue,
      this.groups,
      this.tenantId});
  factory NonGlobalPreferenceData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return NonGlobalPreferenceData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      parentCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_code']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      settingType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}setting_type']),
      deviceId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      screen:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}screen']),
      isApply:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_apply']),
      expiredDateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expired_date_time']),
      syncError: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_error']),
      dataType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_type']),
      dataValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_value']),
      groups:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groups']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || parentCode != null) {
      map['parent_code'] = Variable<String>(parentCode);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || settingType != null) {
      map['setting_type'] = Variable<String>(settingType);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || screen != null) {
      map['screen'] = Variable<String>(screen);
    }
    if (!nullToAbsent || isApply != null) {
      map['is_apply'] = Variable<bool>(isApply);
    }
    if (!nullToAbsent || expiredDateTime != null) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime);
    }
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    if (!nullToAbsent || dataType != null) {
      map['data_type'] = Variable<String>(dataType);
    }
    if (!nullToAbsent || dataValue != null) {
      map['data_value'] = Variable<String>(dataValue);
    }
    if (!nullToAbsent || groups != null) {
      map['groups'] = Variable<String>(groups);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  NonGlobalPreferenceCompanion toCompanion(bool nullToAbsent) {
    return NonGlobalPreferenceCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      parentCode: parentCode == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCode),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      settingType: settingType == null && nullToAbsent
          ? const Value.absent()
          : Value(settingType),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      screen:
          screen == null && nullToAbsent ? const Value.absent() : Value(screen),
      isApply: isApply == null && nullToAbsent
          ? const Value.absent()
          : Value(isApply),
      expiredDateTime: expiredDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expiredDateTime),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      dataType: dataType == null && nullToAbsent
          ? const Value.absent()
          : Value(dataType),
      dataValue: dataValue == null && nullToAbsent
          ? const Value.absent()
          : Value(dataValue),
      groups:
          groups == null && nullToAbsent ? const Value.absent() : Value(groups),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory NonGlobalPreferenceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NonGlobalPreferenceData(
      id: serializer.fromJson<int>(json['id']),
      parentCode: serializer.fromJson<String>(json['parentCode']),
      code: serializer.fromJson<String>(json['code']),
      value: serializer.fromJson<String>(json['value']),
      settingType: serializer.fromJson<String>(json['settingType']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      userName: serializer.fromJson<String>(json['userName']),
      screen: serializer.fromJson<String>(json['screen']),
      isApply: serializer.fromJson<bool>(json['isApply']),
      expiredDateTime: serializer.fromJson<DateTime>(json['expiredDateTime']),
      syncError: serializer.fromJson<String>(json['syncError']),
      dataType: serializer.fromJson<String>(json['dataType']),
      dataValue: serializer.fromJson<String>(json['dataValue']),
      groups: serializer.fromJson<String>(json['groups']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentCode': serializer.toJson<String>(parentCode),
      'code': serializer.toJson<String>(code),
      'value': serializer.toJson<String>(value),
      'settingType': serializer.toJson<String>(settingType),
      'deviceId': serializer.toJson<String>(deviceId),
      'userName': serializer.toJson<String>(userName),
      'screen': serializer.toJson<String>(screen),
      'isApply': serializer.toJson<bool>(isApply),
      'expiredDateTime': serializer.toJson<DateTime>(expiredDateTime),
      'syncError': serializer.toJson<String>(syncError),
      'dataType': serializer.toJson<String>(dataType),
      'dataValue': serializer.toJson<String>(dataValue),
      'groups': serializer.toJson<String>(groups),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  NonGlobalPreferenceData copyWith(
          {int id,
          String parentCode,
          String code,
          String value,
          String settingType,
          String deviceId,
          String userName,
          String screen,
          bool isApply,
          DateTime expiredDateTime,
          String syncError,
          String dataType,
          String dataValue,
          String groups,
          int tenantId}) =>
      NonGlobalPreferenceData(
        id: id ?? this.id,
        parentCode: parentCode ?? this.parentCode,
        code: code ?? this.code,
        value: value ?? this.value,
        settingType: settingType ?? this.settingType,
        deviceId: deviceId ?? this.deviceId,
        userName: userName ?? this.userName,
        screen: screen ?? this.screen,
        isApply: isApply ?? this.isApply,
        expiredDateTime: expiredDateTime ?? this.expiredDateTime,
        syncError: syncError ?? this.syncError,
        dataType: dataType ?? this.dataType,
        dataValue: dataValue ?? this.dataValue,
        groups: groups ?? this.groups,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('NonGlobalPreferenceData(')
          ..write('id: $id, ')
          ..write('parentCode: $parentCode, ')
          ..write('code: $code, ')
          ..write('value: $value, ')
          ..write('settingType: $settingType, ')
          ..write('deviceId: $deviceId, ')
          ..write('userName: $userName, ')
          ..write('screen: $screen, ')
          ..write('isApply: $isApply, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('syncError: $syncError, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          parentCode.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(
                  value.hashCode,
                  $mrjc(
                      settingType.hashCode,
                      $mrjc(
                          deviceId.hashCode,
                          $mrjc(
                              userName.hashCode,
                              $mrjc(
                                  screen.hashCode,
                                  $mrjc(
                                      isApply.hashCode,
                                      $mrjc(
                                          expiredDateTime.hashCode,
                                          $mrjc(
                                              syncError.hashCode,
                                              $mrjc(
                                                  dataType.hashCode,
                                                  $mrjc(
                                                      dataValue.hashCode,
                                                      $mrjc(
                                                          groups.hashCode,
                                                          tenantId
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NonGlobalPreferenceData &&
          other.id == this.id &&
          other.parentCode == this.parentCode &&
          other.code == this.code &&
          other.value == this.value &&
          other.settingType == this.settingType &&
          other.deviceId == this.deviceId &&
          other.userName == this.userName &&
          other.screen == this.screen &&
          other.isApply == this.isApply &&
          other.expiredDateTime == this.expiredDateTime &&
          other.syncError == this.syncError &&
          other.dataType == this.dataType &&
          other.dataValue == this.dataValue &&
          other.groups == this.groups &&
          other.tenantId == this.tenantId);
}

class NonGlobalPreferenceCompanion
    extends UpdateCompanion<NonGlobalPreferenceData> {
  final Value<int> id;
  final Value<String> parentCode;
  final Value<String> code;
  final Value<String> value;
  final Value<String> settingType;
  final Value<String> deviceId;
  final Value<String> userName;
  final Value<String> screen;
  final Value<bool> isApply;
  final Value<DateTime> expiredDateTime;
  final Value<String> syncError;
  final Value<String> dataType;
  final Value<String> dataValue;
  final Value<String> groups;
  final Value<int> tenantId;
  const NonGlobalPreferenceCompanion({
    this.id = const Value.absent(),
    this.parentCode = const Value.absent(),
    this.code = const Value.absent(),
    this.value = const Value.absent(),
    this.settingType = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.userName = const Value.absent(),
    this.screen = const Value.absent(),
    this.isApply = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.syncError = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  NonGlobalPreferenceCompanion.insert({
    @required int id,
    @required String parentCode,
    @required String code,
    @required String value,
    this.settingType = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.userName = const Value.absent(),
    this.screen = const Value.absent(),
    this.isApply = const Value.absent(),
    this.expiredDateTime = const Value.absent(),
    this.syncError = const Value.absent(),
    this.dataType = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.groups = const Value.absent(),
    this.tenantId = const Value.absent(),
  })  : id = Value(id),
        parentCode = Value(parentCode),
        code = Value(code),
        value = Value(value);
  static Insertable<NonGlobalPreferenceData> custom({
    Expression<int> id,
    Expression<String> parentCode,
    Expression<String> code,
    Expression<String> value,
    Expression<String> settingType,
    Expression<String> deviceId,
    Expression<String> userName,
    Expression<String> screen,
    Expression<bool> isApply,
    Expression<DateTime> expiredDateTime,
    Expression<String> syncError,
    Expression<String> dataType,
    Expression<String> dataValue,
    Expression<String> groups,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentCode != null) 'parent_code': parentCode,
      if (code != null) 'code': code,
      if (value != null) 'value': value,
      if (settingType != null) 'setting_type': settingType,
      if (deviceId != null) 'device_id': deviceId,
      if (userName != null) 'user_name': userName,
      if (screen != null) 'screen': screen,
      if (isApply != null) 'is_apply': isApply,
      if (expiredDateTime != null) 'expired_date_time': expiredDateTime,
      if (syncError != null) 'sync_error': syncError,
      if (dataType != null) 'data_type': dataType,
      if (dataValue != null) 'data_value': dataValue,
      if (groups != null) 'groups': groups,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  NonGlobalPreferenceCompanion copyWith(
      {Value<int> id,
      Value<String> parentCode,
      Value<String> code,
      Value<String> value,
      Value<String> settingType,
      Value<String> deviceId,
      Value<String> userName,
      Value<String> screen,
      Value<bool> isApply,
      Value<DateTime> expiredDateTime,
      Value<String> syncError,
      Value<String> dataType,
      Value<String> dataValue,
      Value<String> groups,
      Value<int> tenantId}) {
    return NonGlobalPreferenceCompanion(
      id: id ?? this.id,
      parentCode: parentCode ?? this.parentCode,
      code: code ?? this.code,
      value: value ?? this.value,
      settingType: settingType ?? this.settingType,
      deviceId: deviceId ?? this.deviceId,
      userName: userName ?? this.userName,
      screen: screen ?? this.screen,
      isApply: isApply ?? this.isApply,
      expiredDateTime: expiredDateTime ?? this.expiredDateTime,
      syncError: syncError ?? this.syncError,
      dataType: dataType ?? this.dataType,
      dataValue: dataValue ?? this.dataValue,
      groups: groups ?? this.groups,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentCode.present) {
      map['parent_code'] = Variable<String>(parentCode.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (settingType.present) {
      map['setting_type'] = Variable<String>(settingType.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (screen.present) {
      map['screen'] = Variable<String>(screen.value);
    }
    if (isApply.present) {
      map['is_apply'] = Variable<bool>(isApply.value);
    }
    if (expiredDateTime.present) {
      map['expired_date_time'] = Variable<DateTime>(expiredDateTime.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (dataType.present) {
      map['data_type'] = Variable<String>(dataType.value);
    }
    if (dataValue.present) {
      map['data_value'] = Variable<String>(dataValue.value);
    }
    if (groups.present) {
      map['groups'] = Variable<String>(groups.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NonGlobalPreferenceCompanion(')
          ..write('id: $id, ')
          ..write('parentCode: $parentCode, ')
          ..write('code: $code, ')
          ..write('value: $value, ')
          ..write('settingType: $settingType, ')
          ..write('deviceId: $deviceId, ')
          ..write('userName: $userName, ')
          ..write('screen: $screen, ')
          ..write('isApply: $isApply, ')
          ..write('expiredDateTime: $expiredDateTime, ')
          ..write('syncError: $syncError, ')
          ..write('dataType: $dataType, ')
          ..write('dataValue: $dataValue, ')
          ..write('groups: $groups, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $NonGlobalPreferenceTable extends NonGlobalPreference
    with TableInfo<$NonGlobalPreferenceTable, NonGlobalPreferenceData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NonGlobalPreferenceTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _parentCodeMeta = const VerificationMeta('parentCode');
  GeneratedTextColumn _parentCode;
  @override
  GeneratedTextColumn get parentCode => _parentCode ??= _constructParentCode();
  GeneratedTextColumn _constructParentCode() {
    return GeneratedTextColumn(
      'parent_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
      $tableName,
      false,
    );
  }

  final VerificationMeta _settingTypeMeta =
      const VerificationMeta('settingType');
  GeneratedTextColumn _settingType;
  @override
  GeneratedTextColumn get settingType =>
      _settingType ??= _constructSettingType();
  GeneratedTextColumn _constructSettingType() {
    return GeneratedTextColumn(
      'setting_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  GeneratedTextColumn _deviceId;
  @override
  GeneratedTextColumn get deviceId => _deviceId ??= _constructDeviceId();
  GeneratedTextColumn _constructDeviceId() {
    return GeneratedTextColumn(
      'device_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _screenMeta = const VerificationMeta('screen');
  GeneratedTextColumn _screen;
  @override
  GeneratedTextColumn get screen => _screen ??= _constructScreen();
  GeneratedTextColumn _constructScreen() {
    return GeneratedTextColumn(
      'screen',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isApplyMeta = const VerificationMeta('isApply');
  GeneratedBoolColumn _isApply;
  @override
  GeneratedBoolColumn get isApply => _isApply ??= _constructIsApply();
  GeneratedBoolColumn _constructIsApply() {
    return GeneratedBoolColumn('is_apply', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _expiredDateTimeMeta =
      const VerificationMeta('expiredDateTime');
  GeneratedDateTimeColumn _expiredDateTime;
  @override
  GeneratedDateTimeColumn get expiredDateTime =>
      _expiredDateTime ??= _constructExpiredDateTime();
  GeneratedDateTimeColumn _constructExpiredDateTime() {
    return GeneratedDateTimeColumn(
      'expired_date_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _syncErrorMeta = const VerificationMeta('syncError');
  GeneratedTextColumn _syncError;
  @override
  GeneratedTextColumn get syncError => _syncError ??= _constructSyncError();
  GeneratedTextColumn _constructSyncError() {
    return GeneratedTextColumn(
      'sync_error',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataTypeMeta = const VerificationMeta('dataType');
  GeneratedTextColumn _dataType;
  @override
  GeneratedTextColumn get dataType => _dataType ??= _constructDataType();
  GeneratedTextColumn _constructDataType() {
    return GeneratedTextColumn(
      'data_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataValueMeta = const VerificationMeta('dataValue');
  GeneratedTextColumn _dataValue;
  @override
  GeneratedTextColumn get dataValue => _dataValue ??= _constructDataValue();
  GeneratedTextColumn _constructDataValue() {
    return GeneratedTextColumn(
      'data_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupsMeta = const VerificationMeta('groups');
  GeneratedTextColumn _groups;
  @override
  GeneratedTextColumn get groups => _groups ??= _constructGroups();
  GeneratedTextColumn _constructGroups() {
    return GeneratedTextColumn(
      'groups',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentCode,
        code,
        value,
        settingType,
        deviceId,
        userName,
        screen,
        isApply,
        expiredDateTime,
        syncError,
        dataType,
        dataValue,
        groups,
        tenantId
      ];
  @override
  $NonGlobalPreferenceTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'non_global_preference';
  @override
  final String actualTableName = 'non_global_preference';
  @override
  VerificationContext validateIntegrity(
      Insertable<NonGlobalPreferenceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parent_code')) {
      context.handle(
          _parentCodeMeta,
          parentCode.isAcceptableOrUnknown(
              data['parent_code'], _parentCodeMeta));
    } else if (isInserting) {
      context.missing(_parentCodeMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('setting_type')) {
      context.handle(
          _settingTypeMeta,
          settingType.isAcceptableOrUnknown(
              data['setting_type'], _settingTypeMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id'], _deviceIdMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    }
    if (data.containsKey('screen')) {
      context.handle(_screenMeta,
          screen.isAcceptableOrUnknown(data['screen'], _screenMeta));
    }
    if (data.containsKey('is_apply')) {
      context.handle(_isApplyMeta,
          isApply.isAcceptableOrUnknown(data['is_apply'], _isApplyMeta));
    }
    if (data.containsKey('expired_date_time')) {
      context.handle(
          _expiredDateTimeMeta,
          expiredDateTime.isAcceptableOrUnknown(
              data['expired_date_time'], _expiredDateTimeMeta));
    }
    if (data.containsKey('sync_error')) {
      context.handle(_syncErrorMeta,
          syncError.isAcceptableOrUnknown(data['sync_error'], _syncErrorMeta));
    }
    if (data.containsKey('data_type')) {
      context.handle(_dataTypeMeta,
          dataType.isAcceptableOrUnknown(data['data_type'], _dataTypeMeta));
    }
    if (data.containsKey('data_value')) {
      context.handle(_dataValueMeta,
          dataValue.isAcceptableOrUnknown(data['data_value'], _dataValueMeta));
    }
    if (data.containsKey('groups')) {
      context.handle(_groupsMeta,
          groups.isAcceptableOrUnknown(data['groups'], _groupsMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  NonGlobalPreferenceData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NonGlobalPreferenceData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NonGlobalPreferenceTable createAlias(String alias) {
    return $NonGlobalPreferenceTable(_db, alias);
  }
}

class DesktopData extends DataClass implements Insertable<DesktopData> {
  final int id;
  final String iconName;
  final String iconCode;
  final String iconColour;
  final String iconFamily;
  final String navigationRoute;
  final String iconGroup;
  final bool isFavorit;
  final String userPermission;
  final int tenantId;
  DesktopData(
      {@required this.id,
      @required this.iconName,
      @required this.iconCode,
      @required this.iconColour,
      @required this.iconFamily,
      @required this.navigationRoute,
      @required this.iconGroup,
      @required this.isFavorit,
      @required this.userPermission,
      this.tenantId});
  factory DesktopData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DesktopData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      iconName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_name']),
      iconCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_code']),
      iconColour: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_colour']),
      iconFamily: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_family']),
      navigationRoute: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}navigation_route']),
      iconGroup: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_group']),
      isFavorit: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorit']),
      userPermission: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_permission']),
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    if (!nullToAbsent || iconCode != null) {
      map['icon_code'] = Variable<String>(iconCode);
    }
    if (!nullToAbsent || iconColour != null) {
      map['icon_colour'] = Variable<String>(iconColour);
    }
    if (!nullToAbsent || iconFamily != null) {
      map['icon_family'] = Variable<String>(iconFamily);
    }
    if (!nullToAbsent || navigationRoute != null) {
      map['navigation_route'] = Variable<String>(navigationRoute);
    }
    if (!nullToAbsent || iconGroup != null) {
      map['icon_group'] = Variable<String>(iconGroup);
    }
    if (!nullToAbsent || isFavorit != null) {
      map['is_favorit'] = Variable<bool>(isFavorit);
    }
    if (!nullToAbsent || userPermission != null) {
      map['user_permission'] = Variable<String>(userPermission);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    return map;
  }

  DesktopCompanion toCompanion(bool nullToAbsent) {
    return DesktopCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      iconCode: iconCode == null && nullToAbsent
          ? const Value.absent()
          : Value(iconCode),
      iconColour: iconColour == null && nullToAbsent
          ? const Value.absent()
          : Value(iconColour),
      iconFamily: iconFamily == null && nullToAbsent
          ? const Value.absent()
          : Value(iconFamily),
      navigationRoute: navigationRoute == null && nullToAbsent
          ? const Value.absent()
          : Value(navigationRoute),
      iconGroup: iconGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(iconGroup),
      isFavorit: isFavorit == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorit),
      userPermission: userPermission == null && nullToAbsent
          ? const Value.absent()
          : Value(userPermission),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
    );
  }

  factory DesktopData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DesktopData(
      id: serializer.fromJson<int>(json['id']),
      iconName: serializer.fromJson<String>(json['iconName']),
      iconCode: serializer.fromJson<String>(json['iconCode']),
      iconColour: serializer.fromJson<String>(json['iconColour']),
      iconFamily: serializer.fromJson<String>(json['iconFamily']),
      navigationRoute: serializer.fromJson<String>(json['navigationRoute']),
      iconGroup: serializer.fromJson<String>(json['iconGroup']),
      isFavorit: serializer.fromJson<bool>(json['isFavorit']),
      userPermission: serializer.fromJson<String>(json['userPermission']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'iconName': serializer.toJson<String>(iconName),
      'iconCode': serializer.toJson<String>(iconCode),
      'iconColour': serializer.toJson<String>(iconColour),
      'iconFamily': serializer.toJson<String>(iconFamily),
      'navigationRoute': serializer.toJson<String>(navigationRoute),
      'iconGroup': serializer.toJson<String>(iconGroup),
      'isFavorit': serializer.toJson<bool>(isFavorit),
      'userPermission': serializer.toJson<String>(userPermission),
      'tenantId': serializer.toJson<int>(tenantId),
    };
  }

  DesktopData copyWith(
          {int id,
          String iconName,
          String iconCode,
          String iconColour,
          String iconFamily,
          String navigationRoute,
          String iconGroup,
          bool isFavorit,
          String userPermission,
          int tenantId}) =>
      DesktopData(
        id: id ?? this.id,
        iconName: iconName ?? this.iconName,
        iconCode: iconCode ?? this.iconCode,
        iconColour: iconColour ?? this.iconColour,
        iconFamily: iconFamily ?? this.iconFamily,
        navigationRoute: navigationRoute ?? this.navigationRoute,
        iconGroup: iconGroup ?? this.iconGroup,
        isFavorit: isFavorit ?? this.isFavorit,
        userPermission: userPermission ?? this.userPermission,
        tenantId: tenantId ?? this.tenantId,
      );
  @override
  String toString() {
    return (StringBuffer('DesktopData(')
          ..write('id: $id, ')
          ..write('iconName: $iconName, ')
          ..write('iconCode: $iconCode, ')
          ..write('iconColour: $iconColour, ')
          ..write('iconFamily: $iconFamily, ')
          ..write('navigationRoute: $navigationRoute, ')
          ..write('iconGroup: $iconGroup, ')
          ..write('isFavorit: $isFavorit, ')
          ..write('userPermission: $userPermission, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          iconName.hashCode,
          $mrjc(
              iconCode.hashCode,
              $mrjc(
                  iconColour.hashCode,
                  $mrjc(
                      iconFamily.hashCode,
                      $mrjc(
                          navigationRoute.hashCode,
                          $mrjc(
                              iconGroup.hashCode,
                              $mrjc(
                                  isFavorit.hashCode,
                                  $mrjc(userPermission.hashCode,
                                      tenantId.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DesktopData &&
          other.id == this.id &&
          other.iconName == this.iconName &&
          other.iconCode == this.iconCode &&
          other.iconColour == this.iconColour &&
          other.iconFamily == this.iconFamily &&
          other.navigationRoute == this.navigationRoute &&
          other.iconGroup == this.iconGroup &&
          other.isFavorit == this.isFavorit &&
          other.userPermission == this.userPermission &&
          other.tenantId == this.tenantId);
}

class DesktopCompanion extends UpdateCompanion<DesktopData> {
  final Value<int> id;
  final Value<String> iconName;
  final Value<String> iconCode;
  final Value<String> iconColour;
  final Value<String> iconFamily;
  final Value<String> navigationRoute;
  final Value<String> iconGroup;
  final Value<bool> isFavorit;
  final Value<String> userPermission;
  final Value<int> tenantId;
  const DesktopCompanion({
    this.id = const Value.absent(),
    this.iconName = const Value.absent(),
    this.iconCode = const Value.absent(),
    this.iconColour = const Value.absent(),
    this.iconFamily = const Value.absent(),
    this.navigationRoute = const Value.absent(),
    this.iconGroup = const Value.absent(),
    this.isFavorit = const Value.absent(),
    this.userPermission = const Value.absent(),
    this.tenantId = const Value.absent(),
  });
  DesktopCompanion.insert({
    this.id = const Value.absent(),
    @required String iconName,
    @required String iconCode,
    @required String iconColour,
    @required String iconFamily,
    @required String navigationRoute,
    @required String iconGroup,
    this.isFavorit = const Value.absent(),
    @required String userPermission,
    this.tenantId = const Value.absent(),
  })  : iconName = Value(iconName),
        iconCode = Value(iconCode),
        iconColour = Value(iconColour),
        iconFamily = Value(iconFamily),
        navigationRoute = Value(navigationRoute),
        iconGroup = Value(iconGroup),
        userPermission = Value(userPermission);
  static Insertable<DesktopData> custom({
    Expression<int> id,
    Expression<String> iconName,
    Expression<String> iconCode,
    Expression<String> iconColour,
    Expression<String> iconFamily,
    Expression<String> navigationRoute,
    Expression<String> iconGroup,
    Expression<bool> isFavorit,
    Expression<String> userPermission,
    Expression<int> tenantId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (iconName != null) 'icon_name': iconName,
      if (iconCode != null) 'icon_code': iconCode,
      if (iconColour != null) 'icon_colour': iconColour,
      if (iconFamily != null) 'icon_family': iconFamily,
      if (navigationRoute != null) 'navigation_route': navigationRoute,
      if (iconGroup != null) 'icon_group': iconGroup,
      if (isFavorit != null) 'is_favorit': isFavorit,
      if (userPermission != null) 'user_permission': userPermission,
      if (tenantId != null) 'tenant_id': tenantId,
    });
  }

  DesktopCompanion copyWith(
      {Value<int> id,
      Value<String> iconName,
      Value<String> iconCode,
      Value<String> iconColour,
      Value<String> iconFamily,
      Value<String> navigationRoute,
      Value<String> iconGroup,
      Value<bool> isFavorit,
      Value<String> userPermission,
      Value<int> tenantId}) {
    return DesktopCompanion(
      id: id ?? this.id,
      iconName: iconName ?? this.iconName,
      iconCode: iconCode ?? this.iconCode,
      iconColour: iconColour ?? this.iconColour,
      iconFamily: iconFamily ?? this.iconFamily,
      navigationRoute: navigationRoute ?? this.navigationRoute,
      iconGroup: iconGroup ?? this.iconGroup,
      isFavorit: isFavorit ?? this.isFavorit,
      userPermission: userPermission ?? this.userPermission,
      tenantId: tenantId ?? this.tenantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (iconCode.present) {
      map['icon_code'] = Variable<String>(iconCode.value);
    }
    if (iconColour.present) {
      map['icon_colour'] = Variable<String>(iconColour.value);
    }
    if (iconFamily.present) {
      map['icon_family'] = Variable<String>(iconFamily.value);
    }
    if (navigationRoute.present) {
      map['navigation_route'] = Variable<String>(navigationRoute.value);
    }
    if (iconGroup.present) {
      map['icon_group'] = Variable<String>(iconGroup.value);
    }
    if (isFavorit.present) {
      map['is_favorit'] = Variable<bool>(isFavorit.value);
    }
    if (userPermission.present) {
      map['user_permission'] = Variable<String>(userPermission.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DesktopCompanion(')
          ..write('id: $id, ')
          ..write('iconName: $iconName, ')
          ..write('iconCode: $iconCode, ')
          ..write('iconColour: $iconColour, ')
          ..write('iconFamily: $iconFamily, ')
          ..write('navigationRoute: $navigationRoute, ')
          ..write('iconGroup: $iconGroup, ')
          ..write('isFavorit: $isFavorit, ')
          ..write('userPermission: $userPermission, ')
          ..write('tenantId: $tenantId')
          ..write(')'))
        .toString();
  }
}

class $DesktopTable extends Desktop with TableInfo<$DesktopTable, DesktopData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DesktopTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _iconNameMeta = const VerificationMeta('iconName');
  GeneratedTextColumn _iconName;
  @override
  GeneratedTextColumn get iconName => _iconName ??= _constructIconName();
  GeneratedTextColumn _constructIconName() {
    return GeneratedTextColumn(
      'icon_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconCodeMeta = const VerificationMeta('iconCode');
  GeneratedTextColumn _iconCode;
  @override
  GeneratedTextColumn get iconCode => _iconCode ??= _constructIconCode();
  GeneratedTextColumn _constructIconCode() {
    return GeneratedTextColumn(
      'icon_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconColourMeta = const VerificationMeta('iconColour');
  GeneratedTextColumn _iconColour;
  @override
  GeneratedTextColumn get iconColour => _iconColour ??= _constructIconColour();
  GeneratedTextColumn _constructIconColour() {
    return GeneratedTextColumn(
      'icon_colour',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconFamilyMeta = const VerificationMeta('iconFamily');
  GeneratedTextColumn _iconFamily;
  @override
  GeneratedTextColumn get iconFamily => _iconFamily ??= _constructIconFamily();
  GeneratedTextColumn _constructIconFamily() {
    return GeneratedTextColumn(
      'icon_family',
      $tableName,
      false,
    );
  }

  final VerificationMeta _navigationRouteMeta =
      const VerificationMeta('navigationRoute');
  GeneratedTextColumn _navigationRoute;
  @override
  GeneratedTextColumn get navigationRoute =>
      _navigationRoute ??= _constructNavigationRoute();
  GeneratedTextColumn _constructNavigationRoute() {
    return GeneratedTextColumn(
      'navigation_route',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconGroupMeta = const VerificationMeta('iconGroup');
  GeneratedTextColumn _iconGroup;
  @override
  GeneratedTextColumn get iconGroup => _iconGroup ??= _constructIconGroup();
  GeneratedTextColumn _constructIconGroup() {
    return GeneratedTextColumn(
      'icon_group',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFavoritMeta = const VerificationMeta('isFavorit');
  GeneratedBoolColumn _isFavorit;
  @override
  GeneratedBoolColumn get isFavorit => _isFavorit ??= _constructIsFavorit();
  GeneratedBoolColumn _constructIsFavorit() {
    return GeneratedBoolColumn('is_favorit', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _userPermissionMeta =
      const VerificationMeta('userPermission');
  GeneratedTextColumn _userPermission;
  @override
  GeneratedTextColumn get userPermission =>
      _userPermission ??= _constructUserPermission();
  GeneratedTextColumn _constructUserPermission() {
    return GeneratedTextColumn(
      'user_permission',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        iconName,
        iconCode,
        iconColour,
        iconFamily,
        navigationRoute,
        iconGroup,
        isFavorit,
        userPermission,
        tenantId
      ];
  @override
  $DesktopTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'desktop';
  @override
  final String actualTableName = 'desktop';
  @override
  VerificationContext validateIntegrity(Insertable<DesktopData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name'], _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('icon_code')) {
      context.handle(_iconCodeMeta,
          iconCode.isAcceptableOrUnknown(data['icon_code'], _iconCodeMeta));
    } else if (isInserting) {
      context.missing(_iconCodeMeta);
    }
    if (data.containsKey('icon_colour')) {
      context.handle(
          _iconColourMeta,
          iconColour.isAcceptableOrUnknown(
              data['icon_colour'], _iconColourMeta));
    } else if (isInserting) {
      context.missing(_iconColourMeta);
    }
    if (data.containsKey('icon_family')) {
      context.handle(
          _iconFamilyMeta,
          iconFamily.isAcceptableOrUnknown(
              data['icon_family'], _iconFamilyMeta));
    } else if (isInserting) {
      context.missing(_iconFamilyMeta);
    }
    if (data.containsKey('navigation_route')) {
      context.handle(
          _navigationRouteMeta,
          navigationRoute.isAcceptableOrUnknown(
              data['navigation_route'], _navigationRouteMeta));
    } else if (isInserting) {
      context.missing(_navigationRouteMeta);
    }
    if (data.containsKey('icon_group')) {
      context.handle(_iconGroupMeta,
          iconGroup.isAcceptableOrUnknown(data['icon_group'], _iconGroupMeta));
    } else if (isInserting) {
      context.missing(_iconGroupMeta);
    }
    if (data.containsKey('is_favorit')) {
      context.handle(_isFavoritMeta,
          isFavorit.isAcceptableOrUnknown(data['is_favorit'], _isFavoritMeta));
    }
    if (data.containsKey('user_permission')) {
      context.handle(
          _userPermissionMeta,
          userPermission.isAcceptableOrUnknown(
              data['user_permission'], _userPermissionMeta));
    } else if (isInserting) {
      context.missing(_userPermissionMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DesktopData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DesktopData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DesktopTable createAlias(String alias) {
    return $DesktopTable(_db, alias);
  }
}

class SalesOrderHeaderData extends DataClass
    implements Insertable<SalesOrderHeaderData> {
  final int tenantId;
  final String uerName;
  final int userId;
  final int id;
  final String orderNumber;
  final String inventoryCycleNumber;
  final String daySessionNumber;
  final int customerId;
  final String soldTo;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final String orderType;
  final String orderStatus;
  final String purchaseOrderNo;
  final String currency;
  final double exchangeRate;
  final int cuponCode;
  final String billingAddressName;
  final String shippingAddressName;
  final String yourInital;
  final double subTotal;
  final double taxTotal;
  final double depositTotal;
  final double discountTotal;
  final double shippingTotal;
  final int itemCount;
  final double grandtotalTotal;
  final String discountType;
  final double discountPercentage;
  final double discountAmount;
  SalesOrderHeaderData(
      {this.tenantId,
      @required this.uerName,
      @required this.userId,
      @required this.id,
      @required this.orderNumber,
      @required this.inventoryCycleNumber,
      @required this.daySessionNumber,
      @required this.customerId,
      this.soldTo,
      @required this.orderDate,
      @required this.deliveryDate,
      @required this.orderType,
      @required this.orderStatus,
      this.purchaseOrderNo,
      @required this.currency,
      @required this.exchangeRate,
      this.cuponCode,
      this.billingAddressName,
      this.shippingAddressName,
      this.yourInital,
      @required this.subTotal,
      @required this.taxTotal,
      @required this.depositTotal,
      @required this.discountTotal,
      @required this.shippingTotal,
      @required this.itemCount,
      @required this.grandtotalTotal,
      @required this.discountType,
      @required this.discountPercentage,
      @required this.discountAmount});
  factory SalesOrderHeaderData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SalesOrderHeaderData(
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      uerName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}uer_name']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_number']),
      inventoryCycleNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}inventory_cycle_number']),
      daySessionNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}day_session_number']),
      customerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id']),
      soldTo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}sold_to']),
      orderDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_date']),
      deliveryDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_date']),
      orderType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_type']),
      orderStatus: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_status']),
      purchaseOrderNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}purchase_order_no']),
      currency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      exchangeRate: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}exchange_rate']),
      cuponCode:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}cupon_code']),
      billingAddressName: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}billing_address_name']),
      shippingAddressName: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}shipping_address_name']),
      yourInital: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}your_inital']),
      subTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_total']),
      taxTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_total']),
      depositTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_total']),
      discountTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_total']),
      shippingTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}shipping_total']),
      itemCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}item_count']),
      grandtotalTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}grandtotal_total']),
      discountType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_type']),
      discountPercentage: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}discount_percentage']),
      discountAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_amount']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || uerName != null) {
      map['uer_name'] = Variable<String>(uerName);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || orderNumber != null) {
      map['order_number'] = Variable<String>(orderNumber);
    }
    if (!nullToAbsent || inventoryCycleNumber != null) {
      map['inventory_cycle_number'] = Variable<String>(inventoryCycleNumber);
    }
    if (!nullToAbsent || daySessionNumber != null) {
      map['day_session_number'] = Variable<String>(daySessionNumber);
    }
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    if (!nullToAbsent || soldTo != null) {
      map['sold_to'] = Variable<String>(soldTo);
    }
    if (!nullToAbsent || orderDate != null) {
      map['order_date'] = Variable<DateTime>(orderDate);
    }
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    if (!nullToAbsent || orderType != null) {
      map['order_type'] = Variable<String>(orderType);
    }
    if (!nullToAbsent || orderStatus != null) {
      map['order_status'] = Variable<String>(orderStatus);
    }
    if (!nullToAbsent || purchaseOrderNo != null) {
      map['purchase_order_no'] = Variable<String>(purchaseOrderNo);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || exchangeRate != null) {
      map['exchange_rate'] = Variable<double>(exchangeRate);
    }
    if (!nullToAbsent || cuponCode != null) {
      map['cupon_code'] = Variable<int>(cuponCode);
    }
    if (!nullToAbsent || billingAddressName != null) {
      map['billing_address_name'] = Variable<String>(billingAddressName);
    }
    if (!nullToAbsent || shippingAddressName != null) {
      map['shipping_address_name'] = Variable<String>(shippingAddressName);
    }
    if (!nullToAbsent || yourInital != null) {
      map['your_inital'] = Variable<String>(yourInital);
    }
    if (!nullToAbsent || subTotal != null) {
      map['sub_total'] = Variable<double>(subTotal);
    }
    if (!nullToAbsent || taxTotal != null) {
      map['tax_total'] = Variable<double>(taxTotal);
    }
    if (!nullToAbsent || depositTotal != null) {
      map['deposit_total'] = Variable<double>(depositTotal);
    }
    if (!nullToAbsent || discountTotal != null) {
      map['discount_total'] = Variable<double>(discountTotal);
    }
    if (!nullToAbsent || shippingTotal != null) {
      map['shipping_total'] = Variable<double>(shippingTotal);
    }
    if (!nullToAbsent || itemCount != null) {
      map['item_count'] = Variable<int>(itemCount);
    }
    if (!nullToAbsent || grandtotalTotal != null) {
      map['grandtotal_total'] = Variable<double>(grandtotalTotal);
    }
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || discountPercentage != null) {
      map['discount_percentage'] = Variable<double>(discountPercentage);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    return map;
  }

  SalesOrderHeaderCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderHeaderCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      uerName: uerName == null && nullToAbsent
          ? const Value.absent()
          : Value(uerName),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderNumber: orderNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNumber),
      inventoryCycleNumber: inventoryCycleNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryCycleNumber),
      daySessionNumber: daySessionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(daySessionNumber),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      soldTo:
          soldTo == null && nullToAbsent ? const Value.absent() : Value(soldTo),
      orderDate: orderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(orderDate),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      orderType: orderType == null && nullToAbsent
          ? const Value.absent()
          : Value(orderType),
      orderStatus: orderStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(orderStatus),
      purchaseOrderNo: purchaseOrderNo == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseOrderNo),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      exchangeRate: exchangeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(exchangeRate),
      cuponCode: cuponCode == null && nullToAbsent
          ? const Value.absent()
          : Value(cuponCode),
      billingAddressName: billingAddressName == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddressName),
      shippingAddressName: shippingAddressName == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingAddressName),
      yourInital: yourInital == null && nullToAbsent
          ? const Value.absent()
          : Value(yourInital),
      subTotal: subTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(subTotal),
      taxTotal: taxTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(taxTotal),
      depositTotal: depositTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(depositTotal),
      discountTotal: discountTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(discountTotal),
      shippingTotal: shippingTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingTotal),
      itemCount: itemCount == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCount),
      grandtotalTotal: grandtotalTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(grandtotalTotal),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      discountPercentage: discountPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercentage),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
    );
  }

  factory SalesOrderHeaderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SalesOrderHeaderData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      uerName: serializer.fromJson<String>(json['uerName']),
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      inventoryCycleNumber:
          serializer.fromJson<String>(json['inventoryCycleNumber']),
      daySessionNumber: serializer.fromJson<String>(json['daySessionNumber']),
      customerId: serializer.fromJson<int>(json['customerId']),
      soldTo: serializer.fromJson<String>(json['soldTo']),
      orderDate: serializer.fromJson<DateTime>(json['orderDate']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      orderType: serializer.fromJson<String>(json['orderType']),
      orderStatus: serializer.fromJson<String>(json['orderStatus']),
      purchaseOrderNo: serializer.fromJson<String>(json['purchaseOrderNo']),
      currency: serializer.fromJson<String>(json['currency']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      cuponCode: serializer.fromJson<int>(json['cuponCode']),
      billingAddressName:
          serializer.fromJson<String>(json['billingAddressName']),
      shippingAddressName:
          serializer.fromJson<String>(json['shippingAddressName']),
      yourInital: serializer.fromJson<String>(json['yourInital']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      depositTotal: serializer.fromJson<double>(json['depositTotal']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      shippingTotal: serializer.fromJson<double>(json['shippingTotal']),
      itemCount: serializer.fromJson<int>(json['itemCount']),
      grandtotalTotal: serializer.fromJson<double>(json['grandtotalTotal']),
      discountType: serializer.fromJson<String>(json['discountType']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      discountAmount: serializer.fromJson<double>(json['discountAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'uerName': serializer.toJson<String>(uerName),
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'inventoryCycleNumber': serializer.toJson<String>(inventoryCycleNumber),
      'daySessionNumber': serializer.toJson<String>(daySessionNumber),
      'customerId': serializer.toJson<int>(customerId),
      'soldTo': serializer.toJson<String>(soldTo),
      'orderDate': serializer.toJson<DateTime>(orderDate),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'orderType': serializer.toJson<String>(orderType),
      'orderStatus': serializer.toJson<String>(orderStatus),
      'purchaseOrderNo': serializer.toJson<String>(purchaseOrderNo),
      'currency': serializer.toJson<String>(currency),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'cuponCode': serializer.toJson<int>(cuponCode),
      'billingAddressName': serializer.toJson<String>(billingAddressName),
      'shippingAddressName': serializer.toJson<String>(shippingAddressName),
      'yourInital': serializer.toJson<String>(yourInital),
      'subTotal': serializer.toJson<double>(subTotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'depositTotal': serializer.toJson<double>(depositTotal),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'shippingTotal': serializer.toJson<double>(shippingTotal),
      'itemCount': serializer.toJson<int>(itemCount),
      'grandtotalTotal': serializer.toJson<double>(grandtotalTotal),
      'discountType': serializer.toJson<String>(discountType),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'discountAmount': serializer.toJson<double>(discountAmount),
    };
  }

  SalesOrderHeaderData copyWith(
          {int tenantId,
          String uerName,
          int userId,
          int id,
          String orderNumber,
          String inventoryCycleNumber,
          String daySessionNumber,
          int customerId,
          String soldTo,
          DateTime orderDate,
          DateTime deliveryDate,
          String orderType,
          String orderStatus,
          String purchaseOrderNo,
          String currency,
          double exchangeRate,
          int cuponCode,
          String billingAddressName,
          String shippingAddressName,
          String yourInital,
          double subTotal,
          double taxTotal,
          double depositTotal,
          double discountTotal,
          double shippingTotal,
          int itemCount,
          double grandtotalTotal,
          String discountType,
          double discountPercentage,
          double discountAmount}) =>
      SalesOrderHeaderData(
        tenantId: tenantId ?? this.tenantId,
        uerName: uerName ?? this.uerName,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
        daySessionNumber: daySessionNumber ?? this.daySessionNumber,
        customerId: customerId ?? this.customerId,
        soldTo: soldTo ?? this.soldTo,
        orderDate: orderDate ?? this.orderDate,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        orderType: orderType ?? this.orderType,
        orderStatus: orderStatus ?? this.orderStatus,
        purchaseOrderNo: purchaseOrderNo ?? this.purchaseOrderNo,
        currency: currency ?? this.currency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        cuponCode: cuponCode ?? this.cuponCode,
        billingAddressName: billingAddressName ?? this.billingAddressName,
        shippingAddressName: shippingAddressName ?? this.shippingAddressName,
        yourInital: yourInital ?? this.yourInital,
        subTotal: subTotal ?? this.subTotal,
        taxTotal: taxTotal ?? this.taxTotal,
        depositTotal: depositTotal ?? this.depositTotal,
        discountTotal: discountTotal ?? this.discountTotal,
        shippingTotal: shippingTotal ?? this.shippingTotal,
        itemCount: itemCount ?? this.itemCount,
        grandtotalTotal: grandtotalTotal ?? this.grandtotalTotal,
        discountType: discountType ?? this.discountType,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountAmount: discountAmount ?? this.discountAmount,
      );
  @override
  String toString() {
    return (StringBuffer('SalesOrderHeaderData(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('soldTo: $soldTo, ')
          ..write('orderDate: $orderDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('purchaseOrderNo: $purchaseOrderNo, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('cuponCode: $cuponCode, ')
          ..write('billingAddressName: $billingAddressName, ')
          ..write('shippingAddressName: $shippingAddressName, ')
          ..write('yourInital: $yourInital, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('grandtotalTotal: $grandtotalTotal, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tenantId.hashCode,
      $mrjc(
          uerName.hashCode,
          $mrjc(
              userId.hashCode,
              $mrjc(
                  id.hashCode,
                  $mrjc(
                      orderNumber.hashCode,
                      $mrjc(
                          inventoryCycleNumber.hashCode,
                          $mrjc(
                              daySessionNumber.hashCode,
                              $mrjc(
                                  customerId.hashCode,
                                  $mrjc(
                                      soldTo.hashCode,
                                      $mrjc(
                                          orderDate.hashCode,
                                          $mrjc(
                                              deliveryDate.hashCode,
                                              $mrjc(
                                                  orderType.hashCode,
                                                  $mrjc(
                                                      orderStatus.hashCode,
                                                      $mrjc(
                                                          purchaseOrderNo
                                                              .hashCode,
                                                          $mrjc(
                                                              currency.hashCode,
                                                              $mrjc(
                                                                  exchangeRate
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      cuponCode
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          billingAddressName
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              shippingAddressName.hashCode,
                                                                              $mrjc(yourInital.hashCode, $mrjc(subTotal.hashCode, $mrjc(taxTotal.hashCode, $mrjc(depositTotal.hashCode, $mrjc(discountTotal.hashCode, $mrjc(shippingTotal.hashCode, $mrjc(itemCount.hashCode, $mrjc(grandtotalTotal.hashCode, $mrjc(discountType.hashCode, $mrjc(discountPercentage.hashCode, discountAmount.hashCode))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SalesOrderHeaderData &&
          other.tenantId == this.tenantId &&
          other.uerName == this.uerName &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.orderNumber == this.orderNumber &&
          other.inventoryCycleNumber == this.inventoryCycleNumber &&
          other.daySessionNumber == this.daySessionNumber &&
          other.customerId == this.customerId &&
          other.soldTo == this.soldTo &&
          other.orderDate == this.orderDate &&
          other.deliveryDate == this.deliveryDate &&
          other.orderType == this.orderType &&
          other.orderStatus == this.orderStatus &&
          other.purchaseOrderNo == this.purchaseOrderNo &&
          other.currency == this.currency &&
          other.exchangeRate == this.exchangeRate &&
          other.cuponCode == this.cuponCode &&
          other.billingAddressName == this.billingAddressName &&
          other.shippingAddressName == this.shippingAddressName &&
          other.yourInital == this.yourInital &&
          other.subTotal == this.subTotal &&
          other.taxTotal == this.taxTotal &&
          other.depositTotal == this.depositTotal &&
          other.discountTotal == this.discountTotal &&
          other.shippingTotal == this.shippingTotal &&
          other.itemCount == this.itemCount &&
          other.grandtotalTotal == this.grandtotalTotal &&
          other.discountType == this.discountType &&
          other.discountPercentage == this.discountPercentage &&
          other.discountAmount == this.discountAmount);
}

class SalesOrderHeaderCompanion extends UpdateCompanion<SalesOrderHeaderData> {
  final Value<int> tenantId;
  final Value<String> uerName;
  final Value<int> userId;
  final Value<int> id;
  final Value<String> orderNumber;
  final Value<String> inventoryCycleNumber;
  final Value<String> daySessionNumber;
  final Value<int> customerId;
  final Value<String> soldTo;
  final Value<DateTime> orderDate;
  final Value<DateTime> deliveryDate;
  final Value<String> orderType;
  final Value<String> orderStatus;
  final Value<String> purchaseOrderNo;
  final Value<String> currency;
  final Value<double> exchangeRate;
  final Value<int> cuponCode;
  final Value<String> billingAddressName;
  final Value<String> shippingAddressName;
  final Value<String> yourInital;
  final Value<double> subTotal;
  final Value<double> taxTotal;
  final Value<double> depositTotal;
  final Value<double> discountTotal;
  final Value<double> shippingTotal;
  final Value<int> itemCount;
  final Value<double> grandtotalTotal;
  final Value<String> discountType;
  final Value<double> discountPercentage;
  final Value<double> discountAmount;
  const SalesOrderHeaderCompanion({
    this.tenantId = const Value.absent(),
    this.uerName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.inventoryCycleNumber = const Value.absent(),
    this.daySessionNumber = const Value.absent(),
    this.customerId = const Value.absent(),
    this.soldTo = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.orderType = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.purchaseOrderNo = const Value.absent(),
    this.currency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.cuponCode = const Value.absent(),
    this.billingAddressName = const Value.absent(),
    this.shippingAddressName = const Value.absent(),
    this.yourInital = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.depositTotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.shippingTotal = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.grandtotalTotal = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.discountAmount = const Value.absent(),
  });
  SalesOrderHeaderCompanion.insert({
    this.tenantId = const Value.absent(),
    @required String uerName,
    @required int userId,
    this.id = const Value.absent(),
    @required String orderNumber,
    @required String inventoryCycleNumber,
    @required String daySessionNumber,
    @required int customerId,
    this.soldTo = const Value.absent(),
    @required DateTime orderDate,
    @required DateTime deliveryDate,
    @required String orderType,
    @required String orderStatus,
    this.purchaseOrderNo = const Value.absent(),
    @required String currency,
    @required double exchangeRate,
    this.cuponCode = const Value.absent(),
    this.billingAddressName = const Value.absent(),
    this.shippingAddressName = const Value.absent(),
    this.yourInital = const Value.absent(),
    @required double subTotal,
    @required double taxTotal,
    @required double depositTotal,
    @required double discountTotal,
    @required double shippingTotal,
    @required int itemCount,
    @required double grandtotalTotal,
    @required String discountType,
    @required double discountPercentage,
    @required double discountAmount,
  })  : uerName = Value(uerName),
        userId = Value(userId),
        orderNumber = Value(orderNumber),
        inventoryCycleNumber = Value(inventoryCycleNumber),
        daySessionNumber = Value(daySessionNumber),
        customerId = Value(customerId),
        orderDate = Value(orderDate),
        deliveryDate = Value(deliveryDate),
        orderType = Value(orderType),
        orderStatus = Value(orderStatus),
        currency = Value(currency),
        exchangeRate = Value(exchangeRate),
        subTotal = Value(subTotal),
        taxTotal = Value(taxTotal),
        depositTotal = Value(depositTotal),
        discountTotal = Value(discountTotal),
        shippingTotal = Value(shippingTotal),
        itemCount = Value(itemCount),
        grandtotalTotal = Value(grandtotalTotal),
        discountType = Value(discountType),
        discountPercentage = Value(discountPercentage),
        discountAmount = Value(discountAmount);
  static Insertable<SalesOrderHeaderData> custom({
    Expression<int> tenantId,
    Expression<String> uerName,
    Expression<int> userId,
    Expression<int> id,
    Expression<String> orderNumber,
    Expression<String> inventoryCycleNumber,
    Expression<String> daySessionNumber,
    Expression<int> customerId,
    Expression<String> soldTo,
    Expression<DateTime> orderDate,
    Expression<DateTime> deliveryDate,
    Expression<String> orderType,
    Expression<String> orderStatus,
    Expression<String> purchaseOrderNo,
    Expression<String> currency,
    Expression<double> exchangeRate,
    Expression<int> cuponCode,
    Expression<String> billingAddressName,
    Expression<String> shippingAddressName,
    Expression<String> yourInital,
    Expression<double> subTotal,
    Expression<double> taxTotal,
    Expression<double> depositTotal,
    Expression<double> discountTotal,
    Expression<double> shippingTotal,
    Expression<int> itemCount,
    Expression<double> grandtotalTotal,
    Expression<String> discountType,
    Expression<double> discountPercentage,
    Expression<double> discountAmount,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (uerName != null) 'uer_name': uerName,
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (orderNumber != null) 'order_number': orderNumber,
      if (inventoryCycleNumber != null)
        'inventory_cycle_number': inventoryCycleNumber,
      if (daySessionNumber != null) 'day_session_number': daySessionNumber,
      if (customerId != null) 'customer_id': customerId,
      if (soldTo != null) 'sold_to': soldTo,
      if (orderDate != null) 'order_date': orderDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (orderType != null) 'order_type': orderType,
      if (orderStatus != null) 'order_status': orderStatus,
      if (purchaseOrderNo != null) 'purchase_order_no': purchaseOrderNo,
      if (currency != null) 'currency': currency,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (cuponCode != null) 'cupon_code': cuponCode,
      if (billingAddressName != null)
        'billing_address_name': billingAddressName,
      if (shippingAddressName != null)
        'shipping_address_name': shippingAddressName,
      if (yourInital != null) 'your_inital': yourInital,
      if (subTotal != null) 'sub_total': subTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (depositTotal != null) 'deposit_total': depositTotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (shippingTotal != null) 'shipping_total': shippingTotal,
      if (itemCount != null) 'item_count': itemCount,
      if (grandtotalTotal != null) 'grandtotal_total': grandtotalTotal,
      if (discountType != null) 'discount_type': discountType,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (discountAmount != null) 'discount_amount': discountAmount,
    });
  }

  SalesOrderHeaderCompanion copyWith(
      {Value<int> tenantId,
      Value<String> uerName,
      Value<int> userId,
      Value<int> id,
      Value<String> orderNumber,
      Value<String> inventoryCycleNumber,
      Value<String> daySessionNumber,
      Value<int> customerId,
      Value<String> soldTo,
      Value<DateTime> orderDate,
      Value<DateTime> deliveryDate,
      Value<String> orderType,
      Value<String> orderStatus,
      Value<String> purchaseOrderNo,
      Value<String> currency,
      Value<double> exchangeRate,
      Value<int> cuponCode,
      Value<String> billingAddressName,
      Value<String> shippingAddressName,
      Value<String> yourInital,
      Value<double> subTotal,
      Value<double> taxTotal,
      Value<double> depositTotal,
      Value<double> discountTotal,
      Value<double> shippingTotal,
      Value<int> itemCount,
      Value<double> grandtotalTotal,
      Value<String> discountType,
      Value<double> discountPercentage,
      Value<double> discountAmount}) {
    return SalesOrderHeaderCompanion(
      tenantId: tenantId ?? this.tenantId,
      uerName: uerName ?? this.uerName,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
      daySessionNumber: daySessionNumber ?? this.daySessionNumber,
      customerId: customerId ?? this.customerId,
      soldTo: soldTo ?? this.soldTo,
      orderDate: orderDate ?? this.orderDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      orderType: orderType ?? this.orderType,
      orderStatus: orderStatus ?? this.orderStatus,
      purchaseOrderNo: purchaseOrderNo ?? this.purchaseOrderNo,
      currency: currency ?? this.currency,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      cuponCode: cuponCode ?? this.cuponCode,
      billingAddressName: billingAddressName ?? this.billingAddressName,
      shippingAddressName: shippingAddressName ?? this.shippingAddressName,
      yourInital: yourInital ?? this.yourInital,
      subTotal: subTotal ?? this.subTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      depositTotal: depositTotal ?? this.depositTotal,
      discountTotal: discountTotal ?? this.discountTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      itemCount: itemCount ?? this.itemCount,
      grandtotalTotal: grandtotalTotal ?? this.grandtotalTotal,
      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountAmount: discountAmount ?? this.discountAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (uerName.present) {
      map['uer_name'] = Variable<String>(uerName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (inventoryCycleNumber.present) {
      map['inventory_cycle_number'] =
          Variable<String>(inventoryCycleNumber.value);
    }
    if (daySessionNumber.present) {
      map['day_session_number'] = Variable<String>(daySessionNumber.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (soldTo.present) {
      map['sold_to'] = Variable<String>(soldTo.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<String>(orderStatus.value);
    }
    if (purchaseOrderNo.present) {
      map['purchase_order_no'] = Variable<String>(purchaseOrderNo.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (cuponCode.present) {
      map['cupon_code'] = Variable<int>(cuponCode.value);
    }
    if (billingAddressName.present) {
      map['billing_address_name'] = Variable<String>(billingAddressName.value);
    }
    if (shippingAddressName.present) {
      map['shipping_address_name'] =
          Variable<String>(shippingAddressName.value);
    }
    if (yourInital.present) {
      map['your_inital'] = Variable<String>(yourInital.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (depositTotal.present) {
      map['deposit_total'] = Variable<double>(depositTotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<double>(discountTotal.value);
    }
    if (shippingTotal.present) {
      map['shipping_total'] = Variable<double>(shippingTotal.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    if (grandtotalTotal.present) {
      map['grandtotal_total'] = Variable<double>(grandtotalTotal.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderHeaderCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('soldTo: $soldTo, ')
          ..write('orderDate: $orderDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('purchaseOrderNo: $purchaseOrderNo, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('cuponCode: $cuponCode, ')
          ..write('billingAddressName: $billingAddressName, ')
          ..write('shippingAddressName: $shippingAddressName, ')
          ..write('yourInital: $yourInital, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('grandtotalTotal: $grandtotalTotal, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderHeaderTable extends SalesOrderHeader
    with TableInfo<$SalesOrderHeaderTable, SalesOrderHeaderData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SalesOrderHeaderTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _uerNameMeta = const VerificationMeta('uerName');
  GeneratedTextColumn _uerName;
  @override
  GeneratedTextColumn get uerName => _uerName ??= _constructUerName();
  GeneratedTextColumn _constructUerName() {
    return GeneratedTextColumn(
      'uer_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  GeneratedTextColumn _orderNumber;
  @override
  GeneratedTextColumn get orderNumber =>
      _orderNumber ??= _constructOrderNumber();
  GeneratedTextColumn _constructOrderNumber() {
    return GeneratedTextColumn(
      'order_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inventoryCycleNumberMeta =
      const VerificationMeta('inventoryCycleNumber');
  GeneratedTextColumn _inventoryCycleNumber;
  @override
  GeneratedTextColumn get inventoryCycleNumber =>
      _inventoryCycleNumber ??= _constructInventoryCycleNumber();
  GeneratedTextColumn _constructInventoryCycleNumber() {
    return GeneratedTextColumn(
      'inventory_cycle_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _daySessionNumberMeta =
      const VerificationMeta('daySessionNumber');
  GeneratedTextColumn _daySessionNumber;
  @override
  GeneratedTextColumn get daySessionNumber =>
      _daySessionNumber ??= _constructDaySessionNumber();
  GeneratedTextColumn _constructDaySessionNumber() {
    return GeneratedTextColumn(
      'day_session_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  GeneratedIntColumn _customerId;
  @override
  GeneratedIntColumn get customerId => _customerId ??= _constructCustomerId();
  GeneratedIntColumn _constructCustomerId() {
    return GeneratedIntColumn(
      'customer_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _soldToMeta = const VerificationMeta('soldTo');
  GeneratedTextColumn _soldTo;
  @override
  GeneratedTextColumn get soldTo => _soldTo ??= _constructSoldTo();
  GeneratedTextColumn _constructSoldTo() {
    return GeneratedTextColumn(
      'sold_to',
      $tableName,
      true,
    );
  }

  final VerificationMeta _orderDateMeta = const VerificationMeta('orderDate');
  GeneratedDateTimeColumn _orderDate;
  @override
  GeneratedDateTimeColumn get orderDate => _orderDate ??= _constructOrderDate();
  GeneratedDateTimeColumn _constructOrderDate() {
    return GeneratedDateTimeColumn(
      'order_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  GeneratedDateTimeColumn _deliveryDate;
  @override
  GeneratedDateTimeColumn get deliveryDate =>
      _deliveryDate ??= _constructDeliveryDate();
  GeneratedDateTimeColumn _constructDeliveryDate() {
    return GeneratedDateTimeColumn(
      'delivery_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderTypeMeta = const VerificationMeta('orderType');
  GeneratedTextColumn _orderType;
  @override
  GeneratedTextColumn get orderType => _orderType ??= _constructOrderType();
  GeneratedTextColumn _constructOrderType() {
    return GeneratedTextColumn(
      'order_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderStatusMeta =
      const VerificationMeta('orderStatus');
  GeneratedTextColumn _orderStatus;
  @override
  GeneratedTextColumn get orderStatus =>
      _orderStatus ??= _constructOrderStatus();
  GeneratedTextColumn _constructOrderStatus() {
    return GeneratedTextColumn(
      'order_status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _purchaseOrderNoMeta =
      const VerificationMeta('purchaseOrderNo');
  GeneratedTextColumn _purchaseOrderNo;
  @override
  GeneratedTextColumn get purchaseOrderNo =>
      _purchaseOrderNo ??= _constructPurchaseOrderNo();
  GeneratedTextColumn _constructPurchaseOrderNo() {
    return GeneratedTextColumn(
      'purchase_order_no',
      $tableName,
      true,
    );
  }

  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedTextColumn _currency;
  @override
  GeneratedTextColumn get currency => _currency ??= _constructCurrency();
  GeneratedTextColumn _constructCurrency() {
    return GeneratedTextColumn(
      'currency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  GeneratedRealColumn _exchangeRate;
  @override
  GeneratedRealColumn get exchangeRate =>
      _exchangeRate ??= _constructExchangeRate();
  GeneratedRealColumn _constructExchangeRate() {
    return GeneratedRealColumn(
      'exchange_rate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cuponCodeMeta = const VerificationMeta('cuponCode');
  GeneratedIntColumn _cuponCode;
  @override
  GeneratedIntColumn get cuponCode => _cuponCode ??= _constructCuponCode();
  GeneratedIntColumn _constructCuponCode() {
    return GeneratedIntColumn(
      'cupon_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _billingAddressNameMeta =
      const VerificationMeta('billingAddressName');
  GeneratedTextColumn _billingAddressName;
  @override
  GeneratedTextColumn get billingAddressName =>
      _billingAddressName ??= _constructBillingAddressName();
  GeneratedTextColumn _constructBillingAddressName() {
    return GeneratedTextColumn(
      'billing_address_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shippingAddressNameMeta =
      const VerificationMeta('shippingAddressName');
  GeneratedTextColumn _shippingAddressName;
  @override
  GeneratedTextColumn get shippingAddressName =>
      _shippingAddressName ??= _constructShippingAddressName();
  GeneratedTextColumn _constructShippingAddressName() {
    return GeneratedTextColumn(
      'shipping_address_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _yourInitalMeta = const VerificationMeta('yourInital');
  GeneratedTextColumn _yourInital;
  @override
  GeneratedTextColumn get yourInital => _yourInital ??= _constructYourInital();
  GeneratedTextColumn _constructYourInital() {
    return GeneratedTextColumn(
      'your_inital',
      $tableName,
      true,
    );
  }

  final VerificationMeta _subTotalMeta = const VerificationMeta('subTotal');
  GeneratedRealColumn _subTotal;
  @override
  GeneratedRealColumn get subTotal => _subTotal ??= _constructSubTotal();
  GeneratedRealColumn _constructSubTotal() {
    return GeneratedRealColumn(
      'sub_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taxTotalMeta = const VerificationMeta('taxTotal');
  GeneratedRealColumn _taxTotal;
  @override
  GeneratedRealColumn get taxTotal => _taxTotal ??= _constructTaxTotal();
  GeneratedRealColumn _constructTaxTotal() {
    return GeneratedRealColumn(
      'tax_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositTotalMeta =
      const VerificationMeta('depositTotal');
  GeneratedRealColumn _depositTotal;
  @override
  GeneratedRealColumn get depositTotal =>
      _depositTotal ??= _constructDepositTotal();
  GeneratedRealColumn _constructDepositTotal() {
    return GeneratedRealColumn(
      'deposit_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountTotalMeta =
      const VerificationMeta('discountTotal');
  GeneratedRealColumn _discountTotal;
  @override
  GeneratedRealColumn get discountTotal =>
      _discountTotal ??= _constructDiscountTotal();
  GeneratedRealColumn _constructDiscountTotal() {
    return GeneratedRealColumn(
      'discount_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _shippingTotalMeta =
      const VerificationMeta('shippingTotal');
  GeneratedRealColumn _shippingTotal;
  @override
  GeneratedRealColumn get shippingTotal =>
      _shippingTotal ??= _constructShippingTotal();
  GeneratedRealColumn _constructShippingTotal() {
    return GeneratedRealColumn(
      'shipping_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _itemCountMeta = const VerificationMeta('itemCount');
  GeneratedIntColumn _itemCount;
  @override
  GeneratedIntColumn get itemCount => _itemCount ??= _constructItemCount();
  GeneratedIntColumn _constructItemCount() {
    return GeneratedIntColumn(
      'item_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _grandtotalTotalMeta =
      const VerificationMeta('grandtotalTotal');
  GeneratedRealColumn _grandtotalTotal;
  @override
  GeneratedRealColumn get grandtotalTotal =>
      _grandtotalTotal ??= _constructGrandtotalTotal();
  GeneratedRealColumn _constructGrandtotalTotal() {
    return GeneratedRealColumn(
      'grandtotal_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  GeneratedTextColumn _discountType;
  @override
  GeneratedTextColumn get discountType =>
      _discountType ??= _constructDiscountType();
  GeneratedTextColumn _constructDiscountType() {
    return GeneratedTextColumn(
      'discount_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  GeneratedRealColumn _discountPercentage;
  @override
  GeneratedRealColumn get discountPercentage =>
      _discountPercentage ??= _constructDiscountPercentage();
  GeneratedRealColumn _constructDiscountPercentage() {
    return GeneratedRealColumn(
      'discount_percentage',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  GeneratedRealColumn _discountAmount;
  @override
  GeneratedRealColumn get discountAmount =>
      _discountAmount ??= _constructDiscountAmount();
  GeneratedRealColumn _constructDiscountAmount() {
    return GeneratedRealColumn(
      'discount_amount',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        uerName,
        userId,
        id,
        orderNumber,
        inventoryCycleNumber,
        daySessionNumber,
        customerId,
        soldTo,
        orderDate,
        deliveryDate,
        orderType,
        orderStatus,
        purchaseOrderNo,
        currency,
        exchangeRate,
        cuponCode,
        billingAddressName,
        shippingAddressName,
        yourInital,
        subTotal,
        taxTotal,
        depositTotal,
        discountTotal,
        shippingTotal,
        itemCount,
        grandtotalTotal,
        discountType,
        discountPercentage,
        discountAmount
      ];
  @override
  $SalesOrderHeaderTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sales_order_header';
  @override
  final String actualTableName = 'sales_order_header';
  @override
  VerificationContext validateIntegrity(
      Insertable<SalesOrderHeaderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('uer_name')) {
      context.handle(_uerNameMeta,
          uerName.isAcceptableOrUnknown(data['uer_name'], _uerNameMeta));
    } else if (isInserting) {
      context.missing(_uerNameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number'], _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('inventory_cycle_number')) {
      context.handle(
          _inventoryCycleNumberMeta,
          inventoryCycleNumber.isAcceptableOrUnknown(
              data['inventory_cycle_number'], _inventoryCycleNumberMeta));
    } else if (isInserting) {
      context.missing(_inventoryCycleNumberMeta);
    }
    if (data.containsKey('day_session_number')) {
      context.handle(
          _daySessionNumberMeta,
          daySessionNumber.isAcceptableOrUnknown(
              data['day_session_number'], _daySessionNumberMeta));
    } else if (isInserting) {
      context.missing(_daySessionNumberMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id'], _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('sold_to')) {
      context.handle(_soldToMeta,
          soldTo.isAcceptableOrUnknown(data['sold_to'], _soldToMeta));
    }
    if (data.containsKey('order_date')) {
      context.handle(_orderDateMeta,
          orderDate.isAcceptableOrUnknown(data['order_date'], _orderDateMeta));
    } else if (isInserting) {
      context.missing(_orderDateMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date'], _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('order_type')) {
      context.handle(_orderTypeMeta,
          orderType.isAcceptableOrUnknown(data['order_type'], _orderTypeMeta));
    } else if (isInserting) {
      context.missing(_orderTypeMeta);
    }
    if (data.containsKey('order_status')) {
      context.handle(
          _orderStatusMeta,
          orderStatus.isAcceptableOrUnknown(
              data['order_status'], _orderStatusMeta));
    } else if (isInserting) {
      context.missing(_orderStatusMeta);
    }
    if (data.containsKey('purchase_order_no')) {
      context.handle(
          _purchaseOrderNoMeta,
          purchaseOrderNo.isAcceptableOrUnknown(
              data['purchase_order_no'], _purchaseOrderNoMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate'], _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('cupon_code')) {
      context.handle(_cuponCodeMeta,
          cuponCode.isAcceptableOrUnknown(data['cupon_code'], _cuponCodeMeta));
    }
    if (data.containsKey('billing_address_name')) {
      context.handle(
          _billingAddressNameMeta,
          billingAddressName.isAcceptableOrUnknown(
              data['billing_address_name'], _billingAddressNameMeta));
    }
    if (data.containsKey('shipping_address_name')) {
      context.handle(
          _shippingAddressNameMeta,
          shippingAddressName.isAcceptableOrUnknown(
              data['shipping_address_name'], _shippingAddressNameMeta));
    }
    if (data.containsKey('your_inital')) {
      context.handle(
          _yourInitalMeta,
          yourInital.isAcceptableOrUnknown(
              data['your_inital'], _yourInitalMeta));
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total'], _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('tax_total')) {
      context.handle(_taxTotalMeta,
          taxTotal.isAcceptableOrUnknown(data['tax_total'], _taxTotalMeta));
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('deposit_total')) {
      context.handle(
          _depositTotalMeta,
          depositTotal.isAcceptableOrUnknown(
              data['deposit_total'], _depositTotalMeta));
    } else if (isInserting) {
      context.missing(_depositTotalMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
          _discountTotalMeta,
          discountTotal.isAcceptableOrUnknown(
              data['discount_total'], _discountTotalMeta));
    } else if (isInserting) {
      context.missing(_discountTotalMeta);
    }
    if (data.containsKey('shipping_total')) {
      context.handle(
          _shippingTotalMeta,
          shippingTotal.isAcceptableOrUnknown(
              data['shipping_total'], _shippingTotalMeta));
    } else if (isInserting) {
      context.missing(_shippingTotalMeta);
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count'], _itemCountMeta));
    } else if (isInserting) {
      context.missing(_itemCountMeta);
    }
    if (data.containsKey('grandtotal_total')) {
      context.handle(
          _grandtotalTotalMeta,
          grandtotalTotal.isAcceptableOrUnknown(
              data['grandtotal_total'], _grandtotalTotalMeta));
    } else if (isInserting) {
      context.missing(_grandtotalTotalMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type'], _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage'], _discountPercentageMeta));
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount'], _discountAmountMeta));
    } else if (isInserting) {
      context.missing(_discountAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderHeaderData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SalesOrderHeaderData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SalesOrderHeaderTable createAlias(String alias) {
    return $SalesOrderHeaderTable(_db, alias);
  }
}

class SalesOrderDetailData extends DataClass
    implements Insertable<SalesOrderDetailData> {
  final int tenantId;
  final String uerName;
  final int userId;
  final int id;
  final String orderNumber;
  final String inventoryCycleNumber;
  final String daySessionNumber;
  final DateTime deliveryDate;
  final String currency;
  final double exchangeRate;
  final int itemId;
  final String itemCode;
  final String upcCode;
  final String description;
  final String itemGroup;
  final String category;
  final String salesUOM;
  final String stockUOM;
  final String taxGroup;
  final String warehouse;
  final String discountType;
  final double discountPercentage;
  final double discountAmount;
  final double lineDiscountTotal;
  final double unitPrice;
  final double costPrice;
  final double listPrice;
  final double quantity;
  final double subTotal;
  final double taxTotal;
  final double shippingTotal;
  final double conversionFactor;
  SalesOrderDetailData(
      {this.tenantId,
      @required this.uerName,
      @required this.userId,
      @required this.id,
      @required this.orderNumber,
      @required this.inventoryCycleNumber,
      @required this.daySessionNumber,
      @required this.deliveryDate,
      @required this.currency,
      @required this.exchangeRate,
      @required this.itemId,
      @required this.itemCode,
      @required this.upcCode,
      @required this.description,
      @required this.itemGroup,
      @required this.category,
      @required this.salesUOM,
      @required this.stockUOM,
      @required this.taxGroup,
      @required this.warehouse,
      @required this.discountType,
      @required this.discountPercentage,
      @required this.discountAmount,
      @required this.lineDiscountTotal,
      @required this.unitPrice,
      @required this.costPrice,
      @required this.listPrice,
      @required this.quantity,
      @required this.subTotal,
      @required this.taxTotal,
      @required this.shippingTotal,
      @required this.conversionFactor});
  factory SalesOrderDetailData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SalesOrderDetailData(
      tenantId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      uerName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}uer_name']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_number']),
      inventoryCycleNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}inventory_cycle_number']),
      daySessionNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}day_session_number']),
      deliveryDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_date']),
      currency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      exchangeRate: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}exchange_rate']),
      itemId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}item_id']),
      itemCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_code']),
      upcCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}upc_code']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      itemGroup: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_group']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      salesUOM: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sales_u_o_m']),
      stockUOM: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}stock_u_o_m']),
      taxGroup: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_group']),
      warehouse: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}warehouse']),
      discountType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_type']),
      discountPercentage: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}discount_percentage']),
      discountAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_amount']),
      lineDiscountTotal: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}line_discount_total']),
      unitPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_price']),
      costPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}cost_price']),
      listPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}list_price']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      subTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_total']),
      taxTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_total']),
      shippingTotal: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}shipping_total']),
      conversionFactor: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}conversion_factor']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || uerName != null) {
      map['uer_name'] = Variable<String>(uerName);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || orderNumber != null) {
      map['order_number'] = Variable<String>(orderNumber);
    }
    if (!nullToAbsent || inventoryCycleNumber != null) {
      map['inventory_cycle_number'] = Variable<String>(inventoryCycleNumber);
    }
    if (!nullToAbsent || daySessionNumber != null) {
      map['day_session_number'] = Variable<String>(daySessionNumber);
    }
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || exchangeRate != null) {
      map['exchange_rate'] = Variable<double>(exchangeRate);
    }
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<int>(itemId);
    }
    if (!nullToAbsent || itemCode != null) {
      map['item_code'] = Variable<String>(itemCode);
    }
    if (!nullToAbsent || upcCode != null) {
      map['upc_code'] = Variable<String>(upcCode);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || itemGroup != null) {
      map['item_group'] = Variable<String>(itemGroup);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || salesUOM != null) {
      map['sales_u_o_m'] = Variable<String>(salesUOM);
    }
    if (!nullToAbsent || stockUOM != null) {
      map['stock_u_o_m'] = Variable<String>(stockUOM);
    }
    if (!nullToAbsent || taxGroup != null) {
      map['tax_group'] = Variable<String>(taxGroup);
    }
    if (!nullToAbsent || warehouse != null) {
      map['warehouse'] = Variable<String>(warehouse);
    }
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || discountPercentage != null) {
      map['discount_percentage'] = Variable<double>(discountPercentage);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    if (!nullToAbsent || lineDiscountTotal != null) {
      map['line_discount_total'] = Variable<double>(lineDiscountTotal);
    }
    if (!nullToAbsent || unitPrice != null) {
      map['unit_price'] = Variable<double>(unitPrice);
    }
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    if (!nullToAbsent || listPrice != null) {
      map['list_price'] = Variable<double>(listPrice);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || subTotal != null) {
      map['sub_total'] = Variable<double>(subTotal);
    }
    if (!nullToAbsent || taxTotal != null) {
      map['tax_total'] = Variable<double>(taxTotal);
    }
    if (!nullToAbsent || shippingTotal != null) {
      map['shipping_total'] = Variable<double>(shippingTotal);
    }
    if (!nullToAbsent || conversionFactor != null) {
      map['conversion_factor'] = Variable<double>(conversionFactor);
    }
    return map;
  }

  SalesOrderDetailCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderDetailCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      uerName: uerName == null && nullToAbsent
          ? const Value.absent()
          : Value(uerName),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderNumber: orderNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNumber),
      inventoryCycleNumber: inventoryCycleNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryCycleNumber),
      daySessionNumber: daySessionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(daySessionNumber),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      exchangeRate: exchangeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(exchangeRate),
      itemId:
          itemId == null && nullToAbsent ? const Value.absent() : Value(itemId),
      itemCode: itemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCode),
      upcCode: upcCode == null && nullToAbsent
          ? const Value.absent()
          : Value(upcCode),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      itemGroup: itemGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(itemGroup),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      salesUOM: salesUOM == null && nullToAbsent
          ? const Value.absent()
          : Value(salesUOM),
      stockUOM: stockUOM == null && nullToAbsent
          ? const Value.absent()
          : Value(stockUOM),
      taxGroup: taxGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(taxGroup),
      warehouse: warehouse == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouse),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      discountPercentage: discountPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercentage),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      lineDiscountTotal: lineDiscountTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(lineDiscountTotal),
      unitPrice: unitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPrice),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      listPrice: listPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(listPrice),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      subTotal: subTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(subTotal),
      taxTotal: taxTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(taxTotal),
      shippingTotal: shippingTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingTotal),
      conversionFactor: conversionFactor == null && nullToAbsent
          ? const Value.absent()
          : Value(conversionFactor),
    );
  }

  factory SalesOrderDetailData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SalesOrderDetailData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      uerName: serializer.fromJson<String>(json['uerName']),
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      inventoryCycleNumber:
          serializer.fromJson<String>(json['inventoryCycleNumber']),
      daySessionNumber: serializer.fromJson<String>(json['daySessionNumber']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      currency: serializer.fromJson<String>(json['currency']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      itemId: serializer.fromJson<int>(json['itemId']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      upcCode: serializer.fromJson<String>(json['upcCode']),
      description: serializer.fromJson<String>(json['description']),
      itemGroup: serializer.fromJson<String>(json['itemGroup']),
      category: serializer.fromJson<String>(json['category']),
      salesUOM: serializer.fromJson<String>(json['salesUOM']),
      stockUOM: serializer.fromJson<String>(json['stockUOM']),
      taxGroup: serializer.fromJson<String>(json['taxGroup']),
      warehouse: serializer.fromJson<String>(json['warehouse']),
      discountType: serializer.fromJson<String>(json['discountType']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      discountAmount: serializer.fromJson<double>(json['discountAmount']),
      lineDiscountTotal: serializer.fromJson<double>(json['lineDiscountTotal']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      listPrice: serializer.fromJson<double>(json['listPrice']),
      quantity: serializer.fromJson<double>(json['quantity']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      shippingTotal: serializer.fromJson<double>(json['shippingTotal']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'uerName': serializer.toJson<String>(uerName),
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'inventoryCycleNumber': serializer.toJson<String>(inventoryCycleNumber),
      'daySessionNumber': serializer.toJson<String>(daySessionNumber),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'currency': serializer.toJson<String>(currency),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'itemId': serializer.toJson<int>(itemId),
      'itemCode': serializer.toJson<String>(itemCode),
      'upcCode': serializer.toJson<String>(upcCode),
      'description': serializer.toJson<String>(description),
      'itemGroup': serializer.toJson<String>(itemGroup),
      'category': serializer.toJson<String>(category),
      'salesUOM': serializer.toJson<String>(salesUOM),
      'stockUOM': serializer.toJson<String>(stockUOM),
      'taxGroup': serializer.toJson<String>(taxGroup),
      'warehouse': serializer.toJson<String>(warehouse),
      'discountType': serializer.toJson<String>(discountType),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'discountAmount': serializer.toJson<double>(discountAmount),
      'lineDiscountTotal': serializer.toJson<double>(lineDiscountTotal),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'costPrice': serializer.toJson<double>(costPrice),
      'listPrice': serializer.toJson<double>(listPrice),
      'quantity': serializer.toJson<double>(quantity),
      'subTotal': serializer.toJson<double>(subTotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'shippingTotal': serializer.toJson<double>(shippingTotal),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
    };
  }

  SalesOrderDetailData copyWith(
          {int tenantId,
          String uerName,
          int userId,
          int id,
          String orderNumber,
          String inventoryCycleNumber,
          String daySessionNumber,
          DateTime deliveryDate,
          String currency,
          double exchangeRate,
          int itemId,
          String itemCode,
          String upcCode,
          String description,
          String itemGroup,
          String category,
          String salesUOM,
          String stockUOM,
          String taxGroup,
          String warehouse,
          String discountType,
          double discountPercentage,
          double discountAmount,
          double lineDiscountTotal,
          double unitPrice,
          double costPrice,
          double listPrice,
          double quantity,
          double subTotal,
          double taxTotal,
          double shippingTotal,
          double conversionFactor}) =>
      SalesOrderDetailData(
        tenantId: tenantId ?? this.tenantId,
        uerName: uerName ?? this.uerName,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
        daySessionNumber: daySessionNumber ?? this.daySessionNumber,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        currency: currency ?? this.currency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        itemId: itemId ?? this.itemId,
        itemCode: itemCode ?? this.itemCode,
        upcCode: upcCode ?? this.upcCode,
        description: description ?? this.description,
        itemGroup: itemGroup ?? this.itemGroup,
        category: category ?? this.category,
        salesUOM: salesUOM ?? this.salesUOM,
        stockUOM: stockUOM ?? this.stockUOM,
        taxGroup: taxGroup ?? this.taxGroup,
        warehouse: warehouse ?? this.warehouse,
        discountType: discountType ?? this.discountType,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountAmount: discountAmount ?? this.discountAmount,
        lineDiscountTotal: lineDiscountTotal ?? this.lineDiscountTotal,
        unitPrice: unitPrice ?? this.unitPrice,
        costPrice: costPrice ?? this.costPrice,
        listPrice: listPrice ?? this.listPrice,
        quantity: quantity ?? this.quantity,
        subTotal: subTotal ?? this.subTotal,
        taxTotal: taxTotal ?? this.taxTotal,
        shippingTotal: shippingTotal ?? this.shippingTotal,
        conversionFactor: conversionFactor ?? this.conversionFactor,
      );
  @override
  String toString() {
    return (StringBuffer('SalesOrderDetailData(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('itemId: $itemId, ')
          ..write('itemCode: $itemCode, ')
          ..write('upcCode: $upcCode, ')
          ..write('description: $description, ')
          ..write('itemGroup: $itemGroup, ')
          ..write('category: $category, ')
          ..write('salesUOM: $salesUOM, ')
          ..write('stockUOM: $stockUOM, ')
          ..write('taxGroup: $taxGroup, ')
          ..write('warehouse: $warehouse, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('lineDiscountTotal: $lineDiscountTotal, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('listPrice: $listPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('conversionFactor: $conversionFactor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      tenantId.hashCode,
      $mrjc(
          uerName.hashCode,
          $mrjc(
              userId.hashCode,
              $mrjc(
                  id.hashCode,
                  $mrjc(
                      orderNumber.hashCode,
                      $mrjc(
                          inventoryCycleNumber.hashCode,
                          $mrjc(
                              daySessionNumber.hashCode,
                              $mrjc(
                                  deliveryDate.hashCode,
                                  $mrjc(
                                      currency.hashCode,
                                      $mrjc(
                                          exchangeRate.hashCode,
                                          $mrjc(
                                              itemId.hashCode,
                                              $mrjc(
                                                  itemCode.hashCode,
                                                  $mrjc(
                                                      upcCode.hashCode,
                                                      $mrjc(
                                                          description.hashCode,
                                                          $mrjc(
                                                              itemGroup
                                                                  .hashCode,
                                                              $mrjc(
                                                                  category
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      salesUOM
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          stockUOM
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              taxGroup.hashCode,
                                                                              $mrjc(warehouse.hashCode, $mrjc(discountType.hashCode, $mrjc(discountPercentage.hashCode, $mrjc(discountAmount.hashCode, $mrjc(lineDiscountTotal.hashCode, $mrjc(unitPrice.hashCode, $mrjc(costPrice.hashCode, $mrjc(listPrice.hashCode, $mrjc(quantity.hashCode, $mrjc(subTotal.hashCode, $mrjc(taxTotal.hashCode, $mrjc(shippingTotal.hashCode, conversionFactor.hashCode))))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SalesOrderDetailData &&
          other.tenantId == this.tenantId &&
          other.uerName == this.uerName &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.orderNumber == this.orderNumber &&
          other.inventoryCycleNumber == this.inventoryCycleNumber &&
          other.daySessionNumber == this.daySessionNumber &&
          other.deliveryDate == this.deliveryDate &&
          other.currency == this.currency &&
          other.exchangeRate == this.exchangeRate &&
          other.itemId == this.itemId &&
          other.itemCode == this.itemCode &&
          other.upcCode == this.upcCode &&
          other.description == this.description &&
          other.itemGroup == this.itemGroup &&
          other.category == this.category &&
          other.salesUOM == this.salesUOM &&
          other.stockUOM == this.stockUOM &&
          other.taxGroup == this.taxGroup &&
          other.warehouse == this.warehouse &&
          other.discountType == this.discountType &&
          other.discountPercentage == this.discountPercentage &&
          other.discountAmount == this.discountAmount &&
          other.lineDiscountTotal == this.lineDiscountTotal &&
          other.unitPrice == this.unitPrice &&
          other.costPrice == this.costPrice &&
          other.listPrice == this.listPrice &&
          other.quantity == this.quantity &&
          other.subTotal == this.subTotal &&
          other.taxTotal == this.taxTotal &&
          other.shippingTotal == this.shippingTotal &&
          other.conversionFactor == this.conversionFactor);
}

class SalesOrderDetailCompanion extends UpdateCompanion<SalesOrderDetailData> {
  final Value<int> tenantId;
  final Value<String> uerName;
  final Value<int> userId;
  final Value<int> id;
  final Value<String> orderNumber;
  final Value<String> inventoryCycleNumber;
  final Value<String> daySessionNumber;
  final Value<DateTime> deliveryDate;
  final Value<String> currency;
  final Value<double> exchangeRate;
  final Value<int> itemId;
  final Value<String> itemCode;
  final Value<String> upcCode;
  final Value<String> description;
  final Value<String> itemGroup;
  final Value<String> category;
  final Value<String> salesUOM;
  final Value<String> stockUOM;
  final Value<String> taxGroup;
  final Value<String> warehouse;
  final Value<String> discountType;
  final Value<double> discountPercentage;
  final Value<double> discountAmount;
  final Value<double> lineDiscountTotal;
  final Value<double> unitPrice;
  final Value<double> costPrice;
  final Value<double> listPrice;
  final Value<double> quantity;
  final Value<double> subTotal;
  final Value<double> taxTotal;
  final Value<double> shippingTotal;
  final Value<double> conversionFactor;
  const SalesOrderDetailCompanion({
    this.tenantId = const Value.absent(),
    this.uerName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.inventoryCycleNumber = const Value.absent(),
    this.daySessionNumber = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.currency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.upcCode = const Value.absent(),
    this.description = const Value.absent(),
    this.itemGroup = const Value.absent(),
    this.category = const Value.absent(),
    this.salesUOM = const Value.absent(),
    this.stockUOM = const Value.absent(),
    this.taxGroup = const Value.absent(),
    this.warehouse = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.lineDiscountTotal = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.listPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.shippingTotal = const Value.absent(),
    this.conversionFactor = const Value.absent(),
  });
  SalesOrderDetailCompanion.insert({
    this.tenantId = const Value.absent(),
    @required String uerName,
    @required int userId,
    this.id = const Value.absent(),
    @required String orderNumber,
    @required String inventoryCycleNumber,
    @required String daySessionNumber,
    @required DateTime deliveryDate,
    @required String currency,
    @required double exchangeRate,
    @required int itemId,
    @required String itemCode,
    @required String upcCode,
    @required String description,
    @required String itemGroup,
    @required String category,
    @required String salesUOM,
    @required String stockUOM,
    @required String taxGroup,
    @required String warehouse,
    @required String discountType,
    @required double discountPercentage,
    @required double discountAmount,
    @required double lineDiscountTotal,
    @required double unitPrice,
    @required double costPrice,
    @required double listPrice,
    @required double quantity,
    @required double subTotal,
    @required double taxTotal,
    @required double shippingTotal,
    @required double conversionFactor,
  })  : uerName = Value(uerName),
        userId = Value(userId),
        orderNumber = Value(orderNumber),
        inventoryCycleNumber = Value(inventoryCycleNumber),
        daySessionNumber = Value(daySessionNumber),
        deliveryDate = Value(deliveryDate),
        currency = Value(currency),
        exchangeRate = Value(exchangeRate),
        itemId = Value(itemId),
        itemCode = Value(itemCode),
        upcCode = Value(upcCode),
        description = Value(description),
        itemGroup = Value(itemGroup),
        category = Value(category),
        salesUOM = Value(salesUOM),
        stockUOM = Value(stockUOM),
        taxGroup = Value(taxGroup),
        warehouse = Value(warehouse),
        discountType = Value(discountType),
        discountPercentage = Value(discountPercentage),
        discountAmount = Value(discountAmount),
        lineDiscountTotal = Value(lineDiscountTotal),
        unitPrice = Value(unitPrice),
        costPrice = Value(costPrice),
        listPrice = Value(listPrice),
        quantity = Value(quantity),
        subTotal = Value(subTotal),
        taxTotal = Value(taxTotal),
        shippingTotal = Value(shippingTotal),
        conversionFactor = Value(conversionFactor);
  static Insertable<SalesOrderDetailData> custom({
    Expression<int> tenantId,
    Expression<String> uerName,
    Expression<int> userId,
    Expression<int> id,
    Expression<String> orderNumber,
    Expression<String> inventoryCycleNumber,
    Expression<String> daySessionNumber,
    Expression<DateTime> deliveryDate,
    Expression<String> currency,
    Expression<double> exchangeRate,
    Expression<int> itemId,
    Expression<String> itemCode,
    Expression<String> upcCode,
    Expression<String> description,
    Expression<String> itemGroup,
    Expression<String> category,
    Expression<String> salesUOM,
    Expression<String> stockUOM,
    Expression<String> taxGroup,
    Expression<String> warehouse,
    Expression<String> discountType,
    Expression<double> discountPercentage,
    Expression<double> discountAmount,
    Expression<double> lineDiscountTotal,
    Expression<double> unitPrice,
    Expression<double> costPrice,
    Expression<double> listPrice,
    Expression<double> quantity,
    Expression<double> subTotal,
    Expression<double> taxTotal,
    Expression<double> shippingTotal,
    Expression<double> conversionFactor,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (uerName != null) 'uer_name': uerName,
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (orderNumber != null) 'order_number': orderNumber,
      if (inventoryCycleNumber != null)
        'inventory_cycle_number': inventoryCycleNumber,
      if (daySessionNumber != null) 'day_session_number': daySessionNumber,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (currency != null) 'currency': currency,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (itemId != null) 'item_id': itemId,
      if (itemCode != null) 'item_code': itemCode,
      if (upcCode != null) 'upc_code': upcCode,
      if (description != null) 'description': description,
      if (itemGroup != null) 'item_group': itemGroup,
      if (category != null) 'category': category,
      if (salesUOM != null) 'sales_u_o_m': salesUOM,
      if (stockUOM != null) 'stock_u_o_m': stockUOM,
      if (taxGroup != null) 'tax_group': taxGroup,
      if (warehouse != null) 'warehouse': warehouse,
      if (discountType != null) 'discount_type': discountType,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (lineDiscountTotal != null) 'line_discount_total': lineDiscountTotal,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (costPrice != null) 'cost_price': costPrice,
      if (listPrice != null) 'list_price': listPrice,
      if (quantity != null) 'quantity': quantity,
      if (subTotal != null) 'sub_total': subTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (shippingTotal != null) 'shipping_total': shippingTotal,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
    });
  }

  SalesOrderDetailCompanion copyWith(
      {Value<int> tenantId,
      Value<String> uerName,
      Value<int> userId,
      Value<int> id,
      Value<String> orderNumber,
      Value<String> inventoryCycleNumber,
      Value<String> daySessionNumber,
      Value<DateTime> deliveryDate,
      Value<String> currency,
      Value<double> exchangeRate,
      Value<int> itemId,
      Value<String> itemCode,
      Value<String> upcCode,
      Value<String> description,
      Value<String> itemGroup,
      Value<String> category,
      Value<String> salesUOM,
      Value<String> stockUOM,
      Value<String> taxGroup,
      Value<String> warehouse,
      Value<String> discountType,
      Value<double> discountPercentage,
      Value<double> discountAmount,
      Value<double> lineDiscountTotal,
      Value<double> unitPrice,
      Value<double> costPrice,
      Value<double> listPrice,
      Value<double> quantity,
      Value<double> subTotal,
      Value<double> taxTotal,
      Value<double> shippingTotal,
      Value<double> conversionFactor}) {
    return SalesOrderDetailCompanion(
      tenantId: tenantId ?? this.tenantId,
      uerName: uerName ?? this.uerName,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
      daySessionNumber: daySessionNumber ?? this.daySessionNumber,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      currency: currency ?? this.currency,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      itemId: itemId ?? this.itemId,
      itemCode: itemCode ?? this.itemCode,
      upcCode: upcCode ?? this.upcCode,
      description: description ?? this.description,
      itemGroup: itemGroup ?? this.itemGroup,
      category: category ?? this.category,
      salesUOM: salesUOM ?? this.salesUOM,
      stockUOM: stockUOM ?? this.stockUOM,
      taxGroup: taxGroup ?? this.taxGroup,
      warehouse: warehouse ?? this.warehouse,
      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountAmount: discountAmount ?? this.discountAmount,
      lineDiscountTotal: lineDiscountTotal ?? this.lineDiscountTotal,
      unitPrice: unitPrice ?? this.unitPrice,
      costPrice: costPrice ?? this.costPrice,
      listPrice: listPrice ?? this.listPrice,
      quantity: quantity ?? this.quantity,
      subTotal: subTotal ?? this.subTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      conversionFactor: conversionFactor ?? this.conversionFactor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (uerName.present) {
      map['uer_name'] = Variable<String>(uerName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (inventoryCycleNumber.present) {
      map['inventory_cycle_number'] =
          Variable<String>(inventoryCycleNumber.value);
    }
    if (daySessionNumber.present) {
      map['day_session_number'] = Variable<String>(daySessionNumber.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (upcCode.present) {
      map['upc_code'] = Variable<String>(upcCode.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (itemGroup.present) {
      map['item_group'] = Variable<String>(itemGroup.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (salesUOM.present) {
      map['sales_u_o_m'] = Variable<String>(salesUOM.value);
    }
    if (stockUOM.present) {
      map['stock_u_o_m'] = Variable<String>(stockUOM.value);
    }
    if (taxGroup.present) {
      map['tax_group'] = Variable<String>(taxGroup.value);
    }
    if (warehouse.present) {
      map['warehouse'] = Variable<String>(warehouse.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (lineDiscountTotal.present) {
      map['line_discount_total'] = Variable<double>(lineDiscountTotal.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (listPrice.present) {
      map['list_price'] = Variable<double>(listPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (shippingTotal.present) {
      map['shipping_total'] = Variable<double>(shippingTotal.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderDetailCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('uerName: $uerName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('itemId: $itemId, ')
          ..write('itemCode: $itemCode, ')
          ..write('upcCode: $upcCode, ')
          ..write('description: $description, ')
          ..write('itemGroup: $itemGroup, ')
          ..write('category: $category, ')
          ..write('salesUOM: $salesUOM, ')
          ..write('stockUOM: $stockUOM, ')
          ..write('taxGroup: $taxGroup, ')
          ..write('warehouse: $warehouse, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('lineDiscountTotal: $lineDiscountTotal, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('listPrice: $listPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('conversionFactor: $conversionFactor')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderDetailTable extends SalesOrderDetail
    with TableInfo<$SalesOrderDetailTable, SalesOrderDetailData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SalesOrderDetailTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedIntColumn _tenantId;
  @override
  GeneratedIntColumn get tenantId => _tenantId ??= _constructTenantId();
  GeneratedIntColumn _constructTenantId() {
    return GeneratedIntColumn(
      'tenant_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _uerNameMeta = const VerificationMeta('uerName');
  GeneratedTextColumn _uerName;
  @override
  GeneratedTextColumn get uerName => _uerName ??= _constructUerName();
  GeneratedTextColumn _constructUerName() {
    return GeneratedTextColumn(
      'uer_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  GeneratedTextColumn _orderNumber;
  @override
  GeneratedTextColumn get orderNumber =>
      _orderNumber ??= _constructOrderNumber();
  GeneratedTextColumn _constructOrderNumber() {
    return GeneratedTextColumn(
      'order_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inventoryCycleNumberMeta =
      const VerificationMeta('inventoryCycleNumber');
  GeneratedTextColumn _inventoryCycleNumber;
  @override
  GeneratedTextColumn get inventoryCycleNumber =>
      _inventoryCycleNumber ??= _constructInventoryCycleNumber();
  GeneratedTextColumn _constructInventoryCycleNumber() {
    return GeneratedTextColumn(
      'inventory_cycle_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _daySessionNumberMeta =
      const VerificationMeta('daySessionNumber');
  GeneratedTextColumn _daySessionNumber;
  @override
  GeneratedTextColumn get daySessionNumber =>
      _daySessionNumber ??= _constructDaySessionNumber();
  GeneratedTextColumn _constructDaySessionNumber() {
    return GeneratedTextColumn(
      'day_session_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  GeneratedDateTimeColumn _deliveryDate;
  @override
  GeneratedDateTimeColumn get deliveryDate =>
      _deliveryDate ??= _constructDeliveryDate();
  GeneratedDateTimeColumn _constructDeliveryDate() {
    return GeneratedDateTimeColumn(
      'delivery_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedTextColumn _currency;
  @override
  GeneratedTextColumn get currency => _currency ??= _constructCurrency();
  GeneratedTextColumn _constructCurrency() {
    return GeneratedTextColumn(
      'currency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  GeneratedRealColumn _exchangeRate;
  @override
  GeneratedRealColumn get exchangeRate =>
      _exchangeRate ??= _constructExchangeRate();
  GeneratedRealColumn _constructExchangeRate() {
    return GeneratedRealColumn(
      'exchange_rate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  GeneratedIntColumn _itemId;
  @override
  GeneratedIntColumn get itemId => _itemId ??= _constructItemId();
  GeneratedIntColumn _constructItemId() {
    return GeneratedIntColumn(
      'item_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _itemCodeMeta = const VerificationMeta('itemCode');
  GeneratedTextColumn _itemCode;
  @override
  GeneratedTextColumn get itemCode => _itemCode ??= _constructItemCode();
  GeneratedTextColumn _constructItemCode() {
    return GeneratedTextColumn(
      'item_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _upcCodeMeta = const VerificationMeta('upcCode');
  GeneratedTextColumn _upcCode;
  @override
  GeneratedTextColumn get upcCode => _upcCode ??= _constructUpcCode();
  GeneratedTextColumn _constructUpcCode() {
    return GeneratedTextColumn(
      'upc_code',
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

  final VerificationMeta _itemGroupMeta = const VerificationMeta('itemGroup');
  GeneratedTextColumn _itemGroup;
  @override
  GeneratedTextColumn get itemGroup => _itemGroup ??= _constructItemGroup();
  GeneratedTextColumn _constructItemGroup() {
    return GeneratedTextColumn(
      'item_group',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _salesUOMMeta = const VerificationMeta('salesUOM');
  GeneratedTextColumn _salesUOM;
  @override
  GeneratedTextColumn get salesUOM => _salesUOM ??= _constructSalesUOM();
  GeneratedTextColumn _constructSalesUOM() {
    return GeneratedTextColumn(
      'sales_u_o_m',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stockUOMMeta = const VerificationMeta('stockUOM');
  GeneratedTextColumn _stockUOM;
  @override
  GeneratedTextColumn get stockUOM => _stockUOM ??= _constructStockUOM();
  GeneratedTextColumn _constructStockUOM() {
    return GeneratedTextColumn(
      'stock_u_o_m',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taxGroupMeta = const VerificationMeta('taxGroup');
  GeneratedTextColumn _taxGroup;
  @override
  GeneratedTextColumn get taxGroup => _taxGroup ??= _constructTaxGroup();
  GeneratedTextColumn _constructTaxGroup() {
    return GeneratedTextColumn(
      'tax_group',
      $tableName,
      false,
    );
  }

  final VerificationMeta _warehouseMeta = const VerificationMeta('warehouse');
  GeneratedTextColumn _warehouse;
  @override
  GeneratedTextColumn get warehouse => _warehouse ??= _constructWarehouse();
  GeneratedTextColumn _constructWarehouse() {
    return GeneratedTextColumn(
      'warehouse',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  GeneratedTextColumn _discountType;
  @override
  GeneratedTextColumn get discountType =>
      _discountType ??= _constructDiscountType();
  GeneratedTextColumn _constructDiscountType() {
    return GeneratedTextColumn(
      'discount_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  GeneratedRealColumn _discountPercentage;
  @override
  GeneratedRealColumn get discountPercentage =>
      _discountPercentage ??= _constructDiscountPercentage();
  GeneratedRealColumn _constructDiscountPercentage() {
    return GeneratedRealColumn(
      'discount_percentage',
      $tableName,
      false,
    );
  }

  final VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  GeneratedRealColumn _discountAmount;
  @override
  GeneratedRealColumn get discountAmount =>
      _discountAmount ??= _constructDiscountAmount();
  GeneratedRealColumn _constructDiscountAmount() {
    return GeneratedRealColumn(
      'discount_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lineDiscountTotalMeta =
      const VerificationMeta('lineDiscountTotal');
  GeneratedRealColumn _lineDiscountTotal;
  @override
  GeneratedRealColumn get lineDiscountTotal =>
      _lineDiscountTotal ??= _constructLineDiscountTotal();
  GeneratedRealColumn _constructLineDiscountTotal() {
    return GeneratedRealColumn(
      'line_discount_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitPriceMeta = const VerificationMeta('unitPrice');
  GeneratedRealColumn _unitPrice;
  @override
  GeneratedRealColumn get unitPrice => _unitPrice ??= _constructUnitPrice();
  GeneratedRealColumn _constructUnitPrice() {
    return GeneratedRealColumn(
      'unit_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _costPriceMeta = const VerificationMeta('costPrice');
  GeneratedRealColumn _costPrice;
  @override
  GeneratedRealColumn get costPrice => _costPrice ??= _constructCostPrice();
  GeneratedRealColumn _constructCostPrice() {
    return GeneratedRealColumn(
      'cost_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _listPriceMeta = const VerificationMeta('listPrice');
  GeneratedRealColumn _listPrice;
  @override
  GeneratedRealColumn get listPrice => _listPrice ??= _constructListPrice();
  GeneratedRealColumn _constructListPrice() {
    return GeneratedRealColumn(
      'list_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subTotalMeta = const VerificationMeta('subTotal');
  GeneratedRealColumn _subTotal;
  @override
  GeneratedRealColumn get subTotal => _subTotal ??= _constructSubTotal();
  GeneratedRealColumn _constructSubTotal() {
    return GeneratedRealColumn(
      'sub_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taxTotalMeta = const VerificationMeta('taxTotal');
  GeneratedRealColumn _taxTotal;
  @override
  GeneratedRealColumn get taxTotal => _taxTotal ??= _constructTaxTotal();
  GeneratedRealColumn _constructTaxTotal() {
    return GeneratedRealColumn(
      'tax_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _shippingTotalMeta =
      const VerificationMeta('shippingTotal');
  GeneratedRealColumn _shippingTotal;
  @override
  GeneratedRealColumn get shippingTotal =>
      _shippingTotal ??= _constructShippingTotal();
  GeneratedRealColumn _constructShippingTotal() {
    return GeneratedRealColumn(
      'shipping_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _conversionFactorMeta =
      const VerificationMeta('conversionFactor');
  GeneratedRealColumn _conversionFactor;
  @override
  GeneratedRealColumn get conversionFactor =>
      _conversionFactor ??= _constructConversionFactor();
  GeneratedRealColumn _constructConversionFactor() {
    return GeneratedRealColumn(
      'conversion_factor',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        uerName,
        userId,
        id,
        orderNumber,
        inventoryCycleNumber,
        daySessionNumber,
        deliveryDate,
        currency,
        exchangeRate,
        itemId,
        itemCode,
        upcCode,
        description,
        itemGroup,
        category,
        salesUOM,
        stockUOM,
        taxGroup,
        warehouse,
        discountType,
        discountPercentage,
        discountAmount,
        lineDiscountTotal,
        unitPrice,
        costPrice,
        listPrice,
        quantity,
        subTotal,
        taxTotal,
        shippingTotal,
        conversionFactor
      ];
  @override
  $SalesOrderDetailTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sales_order_detail';
  @override
  final String actualTableName = 'sales_order_detail';
  @override
  VerificationContext validateIntegrity(
      Insertable<SalesOrderDetailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('uer_name')) {
      context.handle(_uerNameMeta,
          uerName.isAcceptableOrUnknown(data['uer_name'], _uerNameMeta));
    } else if (isInserting) {
      context.missing(_uerNameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number'], _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('inventory_cycle_number')) {
      context.handle(
          _inventoryCycleNumberMeta,
          inventoryCycleNumber.isAcceptableOrUnknown(
              data['inventory_cycle_number'], _inventoryCycleNumberMeta));
    } else if (isInserting) {
      context.missing(_inventoryCycleNumberMeta);
    }
    if (data.containsKey('day_session_number')) {
      context.handle(
          _daySessionNumberMeta,
          daySessionNumber.isAcceptableOrUnknown(
              data['day_session_number'], _daySessionNumberMeta));
    } else if (isInserting) {
      context.missing(_daySessionNumberMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date'], _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate'], _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id'], _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code'], _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('upc_code')) {
      context.handle(_upcCodeMeta,
          upcCode.isAcceptableOrUnknown(data['upc_code'], _upcCodeMeta));
    } else if (isInserting) {
      context.missing(_upcCodeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('item_group')) {
      context.handle(_itemGroupMeta,
          itemGroup.isAcceptableOrUnknown(data['item_group'], _itemGroupMeta));
    } else if (isInserting) {
      context.missing(_itemGroupMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sales_u_o_m')) {
      context.handle(_salesUOMMeta,
          salesUOM.isAcceptableOrUnknown(data['sales_u_o_m'], _salesUOMMeta));
    } else if (isInserting) {
      context.missing(_salesUOMMeta);
    }
    if (data.containsKey('stock_u_o_m')) {
      context.handle(_stockUOMMeta,
          stockUOM.isAcceptableOrUnknown(data['stock_u_o_m'], _stockUOMMeta));
    } else if (isInserting) {
      context.missing(_stockUOMMeta);
    }
    if (data.containsKey('tax_group')) {
      context.handle(_taxGroupMeta,
          taxGroup.isAcceptableOrUnknown(data['tax_group'], _taxGroupMeta));
    } else if (isInserting) {
      context.missing(_taxGroupMeta);
    }
    if (data.containsKey('warehouse')) {
      context.handle(_warehouseMeta,
          warehouse.isAcceptableOrUnknown(data['warehouse'], _warehouseMeta));
    } else if (isInserting) {
      context.missing(_warehouseMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type'], _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage'], _discountPercentageMeta));
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount'], _discountAmountMeta));
    } else if (isInserting) {
      context.missing(_discountAmountMeta);
    }
    if (data.containsKey('line_discount_total')) {
      context.handle(
          _lineDiscountTotalMeta,
          lineDiscountTotal.isAcceptableOrUnknown(
              data['line_discount_total'], _lineDiscountTotalMeta));
    } else if (isInserting) {
      context.missing(_lineDiscountTotalMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price'], _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price'], _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    if (data.containsKey('list_price')) {
      context.handle(_listPriceMeta,
          listPrice.isAcceptableOrUnknown(data['list_price'], _listPriceMeta));
    } else if (isInserting) {
      context.missing(_listPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total'], _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('tax_total')) {
      context.handle(_taxTotalMeta,
          taxTotal.isAcceptableOrUnknown(data['tax_total'], _taxTotalMeta));
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('shipping_total')) {
      context.handle(
          _shippingTotalMeta,
          shippingTotal.isAcceptableOrUnknown(
              data['shipping_total'], _shippingTotalMeta));
    } else if (isInserting) {
      context.missing(_shippingTotalMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
          _conversionFactorMeta,
          conversionFactor.isAcceptableOrUnknown(
              data['conversion_factor'], _conversionFactorMeta));
    } else if (isInserting) {
      context.missing(_conversionFactorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderDetailData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SalesOrderDetailData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SalesOrderDetailTable createAlias(String alias) {
    return $SalesOrderDetailTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $CommunicationTable _communication;
  $CommunicationTable get communication =>
      _communication ??= $CommunicationTable(this);
  $BackgroundJobScheduleTable _backgroundJobSchedule;
  $BackgroundJobScheduleTable get backgroundJobSchedule =>
      _backgroundJobSchedule ??= $BackgroundJobScheduleTable(this);
  $BackgroundJobLogsTable _backgroundJobLogs;
  $BackgroundJobLogsTable get backgroundJobLogs =>
      _backgroundJobLogs ??= $BackgroundJobLogsTable(this);
  $PreferenceTable _preference;
  $PreferenceTable get preference => _preference ??= $PreferenceTable(this);
  $MobileDeviceTable _mobileDevice;
  $MobileDeviceTable get mobileDevice =>
      _mobileDevice ??= $MobileDeviceTable(this);
  $BusinessRuleTable _businessRule;
  $BusinessRuleTable get businessRule =>
      _businessRule ??= $BusinessRuleTable(this);
  $NonGlobalBusinessRuleTable _nonGlobalBusinessRule;
  $NonGlobalBusinessRuleTable get nonGlobalBusinessRule =>
      _nonGlobalBusinessRule ??= $NonGlobalBusinessRuleTable(this);
  $ApplicationLoggerTable _applicationLogger;
  $ApplicationLoggerTable get applicationLogger =>
      _applicationLogger ??= $ApplicationLoggerTable(this);
  $TenantTable _tenant;
  $TenantTable get tenant => _tenant ??= $TenantTable(this);
  $NonGlobalPreferenceTable _nonGlobalPreference;
  $NonGlobalPreferenceTable get nonGlobalPreference =>
      _nonGlobalPreference ??= $NonGlobalPreferenceTable(this);
  $DesktopTable _desktop;
  $DesktopTable get desktop => _desktop ??= $DesktopTable(this);
  $SalesOrderHeaderTable _salesOrderHeader;
  $SalesOrderHeaderTable get salesOrderHeader =>
      _salesOrderHeader ??= $SalesOrderHeaderTable(this);
  $SalesOrderDetailTable _salesOrderDetail;
  $SalesOrderDetailTable get salesOrderDetail =>
      _salesOrderDetail ??= $SalesOrderDetailTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        communication,
        backgroundJobSchedule,
        backgroundJobLogs,
        preference,
        mobileDevice,
        businessRule,
        nonGlobalBusinessRule,
        applicationLogger,
        tenant,
        nonGlobalPreference,
        desktop,
        salesOrderHeader,
        salesOrderDetail
      ];
}
