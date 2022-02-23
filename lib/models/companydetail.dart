import 'package:json_annotation/json_annotation.dart';
part 'companydetail.g.dart';

@JsonSerializable()
class Company {
  String? name;
  String? userId;
  String? email;
  String? address;
  dynamic city;
  String? state;
  String? country;
  dynamic logoId;
  dynamic parentId;
  bool? isActive;
  DateTime? dateRegistered;
  dynamic businessType;
  dynamic rcNumber;
  dynamic contactPhone;
  dynamic baseCurrency;
  dynamic bvnId;
  dynamic bvn;
  bool? isSubAccount;
  dynamic logoUrl;
  String? id;

  Company({
    this.name,
    this.userId,
    this.email,
    this.address,
    this.city,
    this.state,
    this.country,
    this.logoId,
    this.parentId,
    this.isActive,
    this.dateRegistered,
    this.businessType,
    this.rcNumber,
    this.contactPhone,
    this.baseCurrency,
    this.bvnId,
    this.bvn,
    this.isSubAccount,
    this.logoUrl,
    this.id,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Wallet {
  String? ownerId;
  DateTime? dateCreated;
  DateTime? dateModified;
  double? balance;
  double? creditLimit;
  String? walletType;
  String? walletUnit;
  bool? deleted;
  dynamic dateDeleted;
  dynamic parentId;
  String? friendlyName;
  String? target;
  dynamic walletTransactions;
  String? id;

  Wallet({
    this.ownerId,
    this.dateCreated,
    this.dateModified,
    this.balance,
    this.creditLimit,
    this.walletType,
    this.walletUnit,
    this.deleted,
    this.dateDeleted,
    this.parentId,
    this.friendlyName,
    this.target,
    this.walletTransactions,
    this.id,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
