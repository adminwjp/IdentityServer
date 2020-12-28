drop table APIRESOURCECLAIMS;
drop table APIRESOURCEPROPERTIES;
drop table APIRESOURCESCOPES;
drop table APIRESOURCESECRETS;
drop table ApiResources;
drop table ApiScopeClaims;
drop table ApiScopeProperties;
drop table ApiScopes;
drop table AspNeUserTokens ;
drop table AspNetRoleClaims  ;
drop table AspNetRoles;
drop table AspNetUserClaims  ;
drop table AspNetUserLogins ;
drop table AspNetUserRoles;
drop table AspNetUsers;
drop table ClientClaims  ;
drop table ClientCorsOrigins  ;
drop table ClientGrantTypes  ;
drop table ClientIdPRestrictions  ;
drop table ClientPostLogoutRedirectUris  ;
drop table ClientProperties  ;
drop table ClientRedirectUris  ;
drop table ClientScopes  ;
drop table ClientSecrets  ;
drop table Clients  ;
drop table DeviceCodes  ;
drop table IdentityResourceClaims  ;
drop table IdentityResourceProperties  ;
drop table IdentityResources  ;
drop table PersistedGrants  ;




-- ----------------------------
-- Table structure for ApiResourceClaims
-- ----------------------------
CREATE TABLE ApiResourceClaims  (
  Id Number(11) NOT NULL ,
  "Type" varchar(200)  NOT NULL,
  ApiResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX IX_ApiResourceClaims_ApiResourceId(ApiResourceId) ,
  --CONSTRAINT FK_ApiResourceClaims_ApiResources_ApiResourceId FOREIGN KEY (ApiResourceId) REFERENCES apiresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiResourceProperties
-- ----------------------------
CREATE  TABLE ApiResourceProperties  (
  Id Number(11) NOT NULL ,
  Key varchar(250)  NOT NULL,
  Value varchar(2000)  NOT NULL,
  ApiResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX IX_ApiResourceProperties_ApiResourceId(ApiResourceId) ,
  --CONSTRAINT FK_ApiResourceProperties_ApiResources_ApiResourceId FOREIGN KEY (ApiResourceId) REFERENCES apiresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiResourceScopes
-- ----------------------------
CREATE  TABLE ApiResourceScopes  (
  Id Number(11) NOT NULL ,
  Scope varchar(200)  NOT NULL,
  ApiResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ApiResourceScopes_ApiResources_ApiResourceId(ApiResourceId) ,
  --CONSTRAINT FK_ApiResourceScopes_ApiResources_ApiResourceId FOREIGN KEY (ApiResourceId) REFERENCES apiresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiResourceSecrets
-- ----------------------------
CREATE  TABLE ApiResourceSecrets  (
  Id Number(11) NOT NULL ,
  Description varchar(1000)   DEFAULT NULL,
  Value VARCHAR(4000)  NOT NULL,
  Expiration date  DEFAULT NULL,
  "Type" varchar(250)  NOT NULL,
  Created date NOT NULL,
  ApiResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ApiResourceSecrets_ApiResources_ApiResourceId(ApiResourceId) ,
  --CONSTRAINT FK_ApiResourceSecrets_ApiResources_ApiResourceId FOREIGN KEY (ApiResourceId) REFERENCES apiresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiResources
-- ----------------------------
CREATE  TABLE ApiResources  (
  Id Number(11) NOT NULL ,
  Enabled int NOT NULL,
  Name varchar(200)  NOT NULL,
  DisplayName varchar(200)   DEFAULT NULL,
  Description varchar(1000)   DEFAULT NULL,
	-- 列不能过长
  -- AllowedAccessTokenSigningAlgorithms varchar(100)   DEFAULT NULL,
	AATSA varchar(100)   DEFAULT NULL,
	
  ShowInDiscoveryDocument int NOT NULL,
  Created date NOT NULL,
  Updated date  DEFAULT NULL,
  LastAccessed date  DEFAULT NULL,
  NonEditable int NOT NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for ApiScopeClaims
-- ----------------------------
CREATE  TABLE ApiScopeClaims  (
  Id Number(11) NOT NULL ,
  "Type" varchar(200)  NOT NULL,
  ScopeId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ApiScopeClaims_ApiScopes_ScopeId(ScopeId) ,
  --CONSTRAINT FK_ApiScopeClaims_ApiScopes_ScopeId FOREIGN KEY (ScopeId) REFERENCES apiscopes (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiScopeProperties
-- ----------------------------
CREATE  TABLE ApiScopeProperties  (
  Id Number(11) NOT NULL ,
  Key varchar(250)  NOT NULL,
  Value varchar(2000)  NOT NULL,
  ScopeId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ApiScopeProperties_ApiScopes_ScopeId(ScopeId) ,
  --CONSTRAINT FK_ApiScopeProperties_ApiScopes_ScopeId FOREIGN KEY (ScopeId) REFERENCES apiscopes (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ApiScopes
-- ----------------------------
CREATE  TABLE ApiScopes  (
  Id Number(11) NOT NULL ,
  Enabled int NOT NULL,
  Name varchar(200)  NOT NULL,
  DisplayName varchar(200)   DEFAULT NULL,
  Description varchar(1000)   DEFAULT NULL,
  Required int NOT NULL,
  Emphasize int NOT NULL,
  ShowInDiscoveryDocument int NOT NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for AspNeUserTokens
-- ----------------------------
CREATE  TABLE AspNeUserTokens  (
  UserId varchar(36)  NOT NULL,
  LoginProvider varchar(36)  NOT NULL,
  Name varchar(36)  NOT NULL,
  Value VARCHAR(4000)  NULL,
  PRIMARY KEY (UserId, LoginProvider, Name) 
  --CONSTRAINT FK_AspNeUserTokens_AspNetUsers_UserId FOREIGN KEY (UserId) REFERENCES aspnetusers (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
CREATE   TABLE AspNetRoleClaims  (
  Id Number(11) NOT NULL ,
  RoleId varchar(36)  NOT NULL,
  ClaimType VARCHAR(4000)  NULL,
  ClaimValue VARCHAR(4000)  NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_AspNetRoleClaims_AspNetRoles_RoleId(RoleId) ,
  --CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId FOREIGN KEY (RoleId) REFERENCES aspnetroles (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
CREATE   TABLE AspNetRoles  (
  Id varchar(36)  NOT NULL,
  Name varchar(256)   DEFAULT NULL,
  NormalizedName varchar(256)   DEFAULT NULL,
  ConcurrencyStamp VARCHAR(4000)  NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
CREATE   TABLE AspNetUserClaims  (
  Id Number(11) NOT NULL ,
  UserId varchar(36)  NOT NULL,
  ClaimType VARCHAR(4000)  NULL,
  ClaimValue VARCHAR(4000)  NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_AspNetUserClaims_AspNetUsers_UserId(UserId) ,
  --CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId FOREIGN KEY (UserId) REFERENCES aspnetusers (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
CREATE   TABLE AspNetUserLogins  (
  LoginProvider varchar(36)  NOT NULL,
  ProviderKey varchar(36)  NOT NULL,
  ProviderDisplayName VARCHAR(4000)  NULL,
  UserId varchar(36)  NOT NULL,
  PRIMARY KEY (LoginProvider, ProviderKey) 
  --INDEX FK_AspNetUserLogins_AspNetUsers_UserId(UserId) ,
  --CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId FOREIGN KEY (UserId) REFERENCES aspnetusers (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
CREATE   TABLE AspNetUserRoles  (
  UserId varchar(36)  NOT NULL,
  RoleId varchar(36)  NOT NULL,
  PRIMARY KEY (UserId, RoleId) 
  --INDEX FK_AspNetUserRoles_AspNetRoles_RoleId(RoleId) ,
  --CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId FOREIGN KEY (RoleId) REFERENCES aspnetroles (Id) ON DELETE CASCADE ON UPDATE RESTRICT,
  --CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId FOREIGN KEY (UserId) REFERENCES aspnetusers (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for AspNetUsers
-- ----------------------------
CREATE   TABLE AspNetUsers  (
  Id varchar(36)  NOT NULL,
  UserName varchar(256)   DEFAULT NULL,
  NormalizedUserName varchar(256)   DEFAULT NULL,
  Email varchar(256)   DEFAULT NULL,
  NormalizedEmail varchar(256)   DEFAULT NULL,
  EmailConfirmed int NOT NULL,
  PasswordHash VARCHAR(4000)  NULL,
  SecurityStamp VARCHAR(4000)  NULL,
  ConcurrencyStamp VARCHAR(4000)  NULL,
  PhoneNumber VARCHAR(4000)  NULL,
  PhoneNumberConfirmed int NOT NULL,
  TwoFactorEnabled int NOT NULL,
  LockoutEnd date  DEFAULT NULL,
  LockoutEnabled int NOT NULL,
  AccessFailedCount Number(11) NOT NULL,
  CardNumber VARCHAR(4000)   NULL,
  SecurityNumber VARCHAR(4000)   NULL,
  Expiration VARCHAR(4000)   NULL,
  CardHolderName VARCHAR(4000)   NULL,
  CardType Number(11)  NULL,
  Street VARCHAR(4000)   NULL,
  City VARCHAR(4000)   NULL,
  State VARCHAR(4000)   NULL,
  Country VARCHAR(4000)   NULL,
  ZipCode VARCHAR(4000)   NULL,
  Name VARCHAR(4000)   NULL,
  LastName VARCHAR(4000)   NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for ClientClaims
-- ----------------------------
CREATE   TABLE ClientClaims  (
  Id Number(11) NOT NULL ,
  "Type" varchar(250)  NOT NULL,
  Value varchar(250)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientClaims_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientClaims_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientCorsOrigins
-- ----------------------------
CREATE   TABLE ClientCorsOrigins  (
  Id Number(11) NOT NULL ,
  Origin varchar(150)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientCorsOrigins_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientCorsOrigins_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientGrantTypes
-- ----------------------------
CREATE   TABLE ClientGrantTypes  (
  Id Number(11) NOT NULL ,
  GrantType varchar(250)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientGrantTypes_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientGrantTypes_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientIdPRestrictions
-- ----------------------------
CREATE   TABLE ClientIdPRestrictions  (
  Id Number(11) NOT NULL ,
  Provider varchar(200)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientIdPRestrictions_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientIdPRestrictions_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientPostLogoutRedirectUris
-- ----------------------------
CREATE   TABLE ClientPostLogoutRedirectUris  (
  Id Number(11) NOT NULL ,
  PostLogoutRedirectUri varchar(2000)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientPostLogoutRedirectUris_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientPostLogoutRedirectUris_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientProperties
-- ----------------------------
CREATE   TABLE ClientProperties  (
  Id Number(11) NOT NULL ,
  Key varchar(250)  NOT NULL,
  Value varchar(2000)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientProperties_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientProperties_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientRedirectUris
-- ----------------------------
CREATE   TABLE ClientRedirectUris  (
  Id Number(11) NOT NULL ,
  RedirectUri varchar(2000)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientRedirectUris_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientRedirectUris_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientScopes
-- ----------------------------
CREATE   TABLE ClientScopes  (
  Id Number(11) NOT NULL ,
  Scope varchar(200)  NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientScopes_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientScopes_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for ClientSecrets
-- ----------------------------
CREATE   TABLE ClientSecrets  (
  Id Number(11) NOT NULL ,
  Description varchar(2000)   DEFAULT NULL,
  Value VARCHAR(4000)  NOT NULL,
  Expiration date  DEFAULT NULL,
  "Type" varchar(250)  NOT NULL,
  Created date NOT NULL,
  ClientId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_ClientSecrets_Clients_ClientId(ClientId) ,
  --CONSTRAINT FK_ClientSecrets_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES clients (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for Clients
-- ----------------------------
CREATE   TABLE Clients  (
  Id Number(11) NOT NULL, 
  Enabled int NOT NULL,
  ClientId varchar(200)  NOT NULL,
  ProtocolType varchar(200)  NOT NULL,
  RequireClientSecret int NOT NULL,
  ClientName varchar(200)   DEFAULT NULL,
  Description varchar(1000)   DEFAULT NULL,
  ClientUri varchar(2000)   DEFAULT NULL,
  LogoUri varchar(2000)   DEFAULT NULL,
  RequireConsent int NOT NULL,
  AllowRememberConsent int NOT NULL,
  --AlwaysIncludeUserClaimsInIdToken int NOT NULL,
	AIUCIIT int NOT NULL,
  RequirePkce int NOT NULL,
  AllowPlaNumberextPkce int NOT NULL,
  RequireRequestObject int NOT NULL,
  AllowAccessTokensViaBrowser int NOT NULL,
  FrontChannelLogoutUri varchar(2000)   DEFAULT NULL,
  --FrontChannelLogoutSessionRequired int NOT NULL,
	FCLSR int NOT NULL,
  BackChannelLogoutUri varchar(2000)   DEFAULT NULL,
  --BackChannelLogoutSessionRequired int NOT NULL,
	BCLSR int NOT NULL,
  AllowOfflineAccess int NOT NULL,
  IdentityTokenLifetime Number(11) NOT NULL,
  --AllowedIdentityTokenSigningAlgorithms varchar(100)   DEFAULT NULL,
	AITSA varchar(100)   DEFAULT NULL,
  AccessTokenLifetime Number(11) NOT NULL,
  AuthorizationCodeLifetime Number(11) NOT NULL,
  ConsentLifetime Number(11)  DEFAULT NULL,
  AbsoluteRefreshTokenLifetime Number(11) NOT NULL,
  SlidingRefreshTokenLifetime Number(11) NOT NULL,
  RefreshTokenUsage Number(11) NOT NULL,
  --UpdateAccessTokenClaimsOnRefresh int NOT NULL,
	UATCOR int NOT NULL,
  RefreshTokenExpiration Number(11) NOT NULL,
  AccessTokenType Number(11) NOT NULL,
  EnableLocalLogin int NOT NULL,
  IncludeJwtId int NOT NULL,
  AlwaysSendClientClaims int NOT NULL,
  ClientClaimsPrefix varchar(200)   DEFAULT NULL,
  PairWiseSubjectSalt varchar(200)   DEFAULT NULL,
  Created date NOT NULL,
  Updated date  DEFAULT NULL,
  LastAccessed date  DEFAULT NULL,
  UserSsoLifetime Number(11)  DEFAULT NULL,
  UserCodeType varchar(100)   DEFAULT NULL,
  DeviceCodeLifetime Number(11) NOT NULL,
  NonEditable int NOT NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for DeviceCodes
-- ----------------------------
CREATE   TABLE DeviceCodes  (
  UserCode varchar(36)  NOT NULL,
  DeviceCode varchar(200)  NOT NULL,
  SubjectId varchar(200)   DEFAULT NULL,
  SessionId varchar(100)   DEFAULT NULL,
  ClientId varchar(200)  NOT NULL,
  Description varchar(200)   DEFAULT NULL,
  CreationTime date  NULL,
  Expiration date  NULL,
  Data VARCHAR(4000)  NOT NULL,
  PRIMARY KEY (UserCode) 
) ;

-- ----------------------------
-- Table structure for IdentityResourceClaims
-- ----------------------------
CREATE   TABLE IdentityResourceClaims  (
  Id Number(11) NOT NULL ,
  "Type" varchar(200)  NOT NULL,
  IdentityResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_IdentityResourceClaims_IdentityResources_IdentityResourceId(IdentityResourceId) ,
  --CONSTRAINT FK_IdentityResourceClaims_IdentityResources_IdentityResourceId FOREIGN KEY (IdentityResourceId) REFERENCES identityresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for IdentityResourceProperties
-- ----------------------------
CREATE   TABLE IdentityResourceProperties  (
  Id Number(11) NOT NULL ,
  Key varchar(250)  NOT NULL,
  Value varchar(2000)  NOT NULL,
  IdentityResourceId Number(11) NOT NULL,
  PRIMARY KEY (Id) 
  --INDEX FK_IdentityResourceProperties_IdentityResources_IdentityResourc~(IdentityResourceId) ,
  --CONSTRAINT FK_IdentityResourceProperties_IdentityResources_IdentityResourc~ FOREIGN KEY (IdentityResourceId) REFERENCES identityresources (Id) ON DELETE CASCADE ON UPDATE RESTRICT
) ;

-- ----------------------------
-- Table structure for IdentityResources
-- ----------------------------
CREATE   TABLE IdentityResources  (
  Id Number(11) NOT NULL ,
  Enabled int NOT NULL,
  Name varchar(200)  NOT NULL,
  DisplayName varchar(200)   DEFAULT NULL,
  Description varchar(1000)   DEFAULT NULL,
  Required int NOT NULL,
  Emphasize int NOT NULL,
  ShowInDiscoveryDocument int NOT NULL,
  Created date NOT NULL,
  Updated date  DEFAULT NULL,
  NonEditable int NOT NULL,
  PRIMARY KEY (Id) 
) ;

-- ----------------------------
-- Table structure for PersistedGrants
-- ----------------------------
CREATE   TABLE PersistedGrants  (
  Key varchar(36)  NOT NULL,
  "Type" varchar(50)  NOT NULL,
  SubjectId varchar(200)   DEFAULT NULL,
  SessionId varchar(100)   DEFAULT NULL,
  ClientId varchar(200)  NOT NULL,
  Description varchar(200)   DEFAULT NULL,
  CreationTime date  NULL,
  Expiration date  NULL,
  ConsumedTime date  NULL,
  Data VARCHAR(4000)  NOT NULL,
  PRIMARY KEY (Key) 
) ;



