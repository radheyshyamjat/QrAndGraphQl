enum Perm {
  UserList,
  UserCreate,
  UserRead,
  UserUpdate,
  UserArchive,
  UserUnarchive,

  OrganisationList,
  OrganisationCreate,
  OrganisationRead,
  OrganisationUpdate,
  OrganisationArchive,
  OrganisationUnarchive,

  RoleList,
  RoleCreate,
  RoleRead,
  RoleUpdate,
  RoleArchive,
  RoleUnarchive,

  SKUList,
  SKUCreate,
  SKURead,
  SKUUpdate,
  SKUArchive,
  SKUUnarchive,

  ContainerList,
  ContainerCreate,
  ContainerRead,
  ContainerUpdate,
  ContainerArchive,
  ContainerUnarchive,

  PalletList,
  PalletCreate,
  PalletRead,
  PalletUpdate,
  PalletArchive,
  PalletUnarchive,

  CartonList,
  CartonCreate,
  CartonRead,
  CartonUpdate,
  CartonArchive,
  CartonUnarchive,

  ProductList,
  ProductCreate,
  ProductRead,
  ProductUpdate,
  ProductArchive,
  ProductUnarchive,

  OrderList,
  OrderCreate,
  OrderRead,
  OrderUpdate,
  OrderArchive,
  OrderUnarchive,

  TrackActionList,
  TrackActionRead,
  TrackActionCreate,
  TrackActionUpdate,
  TrackActionArchive,
  TrackActionUnarchive,

  ContractList,
  ContractRead,
  ContractCreate,
  ContractUpdate,
  ContractArchive,
  ContractUnarchive,

  DistributorList,
  DistributorRead,
  DistributorCreate,
  DistributorUpdate,
  DistributorArchive,
  DistributorUnarchive,

  ActivityListBlockchainActivity,
  ActivityListUserActivity,
  UseAdvancedMode
}

enum BatchAction {
  Archive,
  Unarchive,

  SetSKU,
  SetOrder,
  SetDistributor,
  SetContract,
  SetCarton,
  SetPallet,
  SetContainer,

  DetachFromSKU,
  DetachFromOrder,
  DetachFromDistributor,
  DetachFromContract,
  DetachFromCarton,
  DetachFromPallet,
  DetachFromContainer,

  SetBonusLoyaltyPoints,
  InheritCartonHistory,
}