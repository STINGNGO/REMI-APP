// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companydetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'],
      state: json['state'] as String?,
      country: json['country'] as String?,
      logoId: json['logoId'],
      parentId: json['parentId'],
      isActive: json['isActive'] as bool?,
      dateRegistered: json['dateRegistered'] == null
          ? null
          : DateTime.parse(json['dateRegistered'] as String),
      businessType: json['businessType'],
      rcNumber: json['rcNumber'],
      contactPhone: json['contactPhone'],
      baseCurrency: json['baseCurrency'],
      bvnId: json['bvnId'],
      bvn: json['bvn'],
      isSubAccount: json['isSubAccount'] as bool?,
      logoUrl: json['logoUrl'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'logoId': instance.logoId,
      'parentId': instance.parentId,
      'isActive': instance.isActive,
      'dateRegistered': instance.dateRegistered?.toIso8601String(),
      'businessType': instance.businessType,
      'rcNumber': instance.rcNumber,
      'contactPhone': instance.contactPhone,
      'baseCurrency': instance.baseCurrency,
      'bvnId': instance.bvnId,
      'bvn': instance.bvn,
      'isSubAccount': instance.isSubAccount,
      'logoUrl': instance.logoUrl,
      'id': instance.id,
    };

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      ownerId: json['ownerId'] as String?,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      dateModified: json['dateModified'] == null
          ? null
          : DateTime.parse(json['dateModified'] as String),
      balance: json['balance'] as double?,
      creditLimit: json['creditLimit'] as double?,
      walletType: json['walletType'] as String?,
      walletUnit: json['walletUnit'] as String?,
      deleted: json['deleted'] as bool?,
      dateDeleted: json['dateDeleted'],
      parentId: json['parentId'],
      friendlyName: json['friendlyName'] as String?,
      target: json['target'] as String?,
      walletTransactions: json['walletTransactions'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'dateModified': instance.dateModified?.toIso8601String(),
      'balance': instance.balance,
      'creditLimit': instance.creditLimit,
      'walletType': instance.walletType,
      'walletUnit': instance.walletUnit,
      'deleted': instance.deleted,
      'dateDeleted': instance.dateDeleted,
      'parentId': instance.parentId,
      'friendlyName': instance.friendlyName,
      'target': instance.target,
      'walletTransactions': instance.walletTransactions,
      'id': instance.id,
    };
