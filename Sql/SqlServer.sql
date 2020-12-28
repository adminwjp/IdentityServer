/*
 Navicat Premium Data Transfer

 Source Server         : dockerSqlServer
 Source Server Type    : SQL Server
 Source Server Version : 14003281
 Source Host           : 192.168.99.101:1433
 Source Catalog        : IdentityServer
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14003281
 File Encoding         : 65001

 Date: 07/11/2020 01:01:35
*/


-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__EFMigrationsHistory]
GO

CREATE TABLE [dbo].[__EFMigrationsHistory] (
  [MigrationId] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[__EFMigrationsHistory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiResourceClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiResourceClaims]
GO

CREATE TABLE [dbo].[ApiResourceClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Type] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ApiResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiResourceClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiResourceProperties
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceProperties]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiResourceProperties]
GO

CREATE TABLE [dbo].[ApiResourceProperties] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Key] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ApiResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiResourceProperties] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiResources
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResources]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiResources]
GO

CREATE TABLE [dbo].[ApiResources] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Enabled] bit  NOT NULL,
  [Name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [DisplayName] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Description] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [AllowedAccessTokenSigningAlgorithms] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ShowInDiscoveryDocument] bit  NOT NULL,
  [Created] datetime  NOT NULL,
  [Updated] datetime  NULL,
  [LastAccessed] datetime  NULL,
  [NonEditable] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiResources] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiResourceScopes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceScopes]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiResourceScopes]
GO

CREATE TABLE [dbo].[ApiResourceScopes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Scope] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ApiResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiResourceScopes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiResourceSecrets
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiResourceSecrets]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiResourceSecrets]
GO

CREATE TABLE [dbo].[ApiResourceSecrets] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Description] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Value] nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Expiration] datetime  NULL,
  [Type] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Created] datetime  NOT NULL,
  [ApiResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiResourceSecrets] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiScopeClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopeClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiScopeClaims]
GO

CREATE TABLE [dbo].[ApiScopeClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Type] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ScopeId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiScopeClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiScopeProperties
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopeProperties]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiScopeProperties]
GO

CREATE TABLE [dbo].[ApiScopeProperties] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Key] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ScopeId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ApiScopeProperties] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ApiScopes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiScopes]') AND type IN ('U'))
	DROP TABLE [dbo].[ApiScopes]
GO

CREATE TABLE [dbo].[ApiScopes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Enabled] bit  NULL,
  [Name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DisplayName] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Description] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Required] bit  NULL,
  [Emphasize] bit  NULL,
  [ShowInDiscoveryDocument] bit  NULL
)
GO

ALTER TABLE [dbo].[ApiScopes] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'11',
'SCHEMA', N'dbo',
'TABLE', N'ApiScopes',
'COLUMN', N'Id'
GO


-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetRoleClaims]
GO

CREATE TABLE [dbo].[AspNetRoleClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [RoleId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[AspNetRoleClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetRoles]
GO

CREATE TABLE [dbo].[AspNetRoles] (
  [Id] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[AspNetRoles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserClaims]
GO

CREATE TABLE [dbo].[AspNetUserClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [UserId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[AspNetUserClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserLogins]
GO

CREATE TABLE [dbo].[AspNetUserLogins] (
  [LoginProvider] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderKey] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderDisplayName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [UserId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[AspNetUserLogins] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUserRoles]
GO

CREATE TABLE [dbo].[AspNetUserRoles] (
  [UserId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [RoleId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[AspNetUserRoles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNetUsers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNetUsers]
GO

CREATE TABLE [dbo].[AspNetUsers] (
  [Id] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [UserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedUserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Email] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedEmail] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EmailConfirmed] bit  NOT NULL,
  [PasswordHash] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SecurityStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumber] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumberConfirmed] bit  NOT NULL,
  [TwoFactorEnabled] bit  NOT NULL,
  [LockoutEnd] datetimeoffset(7)  NULL,
  [LockoutEnabled] bit  NOT NULL,
  [AccessFailedCount] int  NOT NULL,
  [CardNumber] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [SecurityNumber] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [Expiration] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [CardHolderName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [CardType] int  NOT NULL,
  [Street] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [City] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [State] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [Country] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [ZipCode] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [Name] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL,
  [LastName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS   NULL
)
GO

ALTER TABLE [dbo].[AspNetUsers] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for AspNeUserTokens
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNeUserTokens]') AND type IN ('U'))
	DROP TABLE [dbo].[AspNeUserTokens]
GO

CREATE TABLE [dbo].[AspNeUserTokens] (
  [UserId] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [LoginProvider] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[AspNeUserTokens] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientClaims]
GO

CREATE TABLE [dbo].[ClientClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Type] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientCorsOrigins
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientCorsOrigins]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientCorsOrigins]
GO

CREATE TABLE [dbo].[ClientCorsOrigins] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Origin] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientCorsOrigins] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientGrantTypes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientGrantTypes]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientGrantTypes]
GO

CREATE TABLE [dbo].[ClientGrantTypes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [GrantType] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientGrantTypes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientIdPRestrictions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientIdPRestrictions]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientIdPRestrictions]
GO

CREATE TABLE [dbo].[ClientIdPRestrictions] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Provider] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientIdPRestrictions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientPostLogoutRedirectUris
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientPostLogoutRedirectUris]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientPostLogoutRedirectUris]
GO

CREATE TABLE [dbo].[ClientPostLogoutRedirectUris] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [PostLogoutRedirectUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientProperties
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientProperties]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientProperties]
GO

CREATE TABLE [dbo].[ClientProperties] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Key] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientProperties] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientRedirectUris
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientRedirectUris]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientRedirectUris]
GO

CREATE TABLE [dbo].[ClientRedirectUris] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [RedirectUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientRedirectUris] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Clients
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type IN ('U'))
	DROP TABLE [dbo].[Clients]
GO

CREATE TABLE [dbo].[Clients] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Enabled] bit  NOT NULL,
  [ClientId] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProtocolType] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [RequireClientSecret] bit  NOT NULL,
  [ClientName] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Description] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClientUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [LogoUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [RequireConsent] bit  NOT NULL,
  [AllowRememberConsent] bit  NOT NULL,
  [AlwaysIncludeUserClaimsInIdToken] bit  NOT NULL,
  [RequirePkce] bit  NOT NULL,
  [AllowPlainTextPkce] bit  NOT NULL,
  [RequireRequestObject] bit  NOT NULL,
  [AllowAccessTokensViaBrowser] bit  NOT NULL,
  [FrontChannelLogoutUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [FrontChannelLogoutSessionRequired] bit  NOT NULL,
  [BackChannelLogoutUri] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [BackChannelLogoutSessionRequired] bit  NOT NULL,
  [AllowOfflineAccess] bit  NOT NULL,
  [IdentityTokenLifetime] int  NOT NULL,
  [AllowedIdentityTokenSigningAlgorithms] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [AccessTokenLifetime] int  NOT NULL,
  [AuthorizationCodeLifetime] int  NOT NULL,
  [ConsentLifetime] int  NULL,
  [AbsoluteRefreshTokenLifetime] int  NOT NULL,
  [SlidingRefreshTokenLifetime] int  NOT NULL,
  [RefreshTokenUsage] int  NOT NULL,
  [UpdateAccessTokenClaimsOnRefresh] bit  NOT NULL,
  [RefreshTokenExpiration] int  NOT NULL,
  [AccessTokenType] int  NOT NULL,
  [EnableLocalLogin] bit  NOT NULL,
  [IncludeJwtId] bit  NOT NULL,
  [AlwaysSendClientClaims] bit  NOT NULL,
  [ClientClaimsPrefix] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PairWiseSubjectSalt] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Created] datetime  NOT NULL,
  [Updated] datetime  NULL,
  [LastAccessed] datetime  NULL,
  [UserSsoLifetime] int  NULL,
  [UserCodeType] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DeviceCodeLifetime] int  NOT NULL,
  [NonEditable] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[Clients] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientScopes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientScopes]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientScopes]
GO

CREATE TABLE [dbo].[ClientScopes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Scope] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientScopes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ClientSecrets
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientSecrets]') AND type IN ('U'))
	DROP TABLE [dbo].[ClientSecrets]
GO

CREATE TABLE [dbo].[ClientSecrets] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Description] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Value] nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Expiration] datetime  NULL,
  [Type] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Created] datetime  NOT NULL,
  [ClientId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ClientSecrets] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for DeviceCodes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceCodes]') AND type IN ('U'))
	DROP TABLE [dbo].[DeviceCodes]
GO

CREATE TABLE [dbo].[DeviceCodes] (
  [UserCode] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [DeviceCode] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [SubjectId] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SessionId] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClientId] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Description] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CreationTime] datetime   NULL,
  [Expiration] datetime   NULL,
  [Data] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[DeviceCodes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for IdentityResourceClaims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResourceClaims]') AND type IN ('U'))
	DROP TABLE [dbo].[IdentityResourceClaims]
GO

CREATE TABLE [dbo].[IdentityResourceClaims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Type] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [IdentityResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[IdentityResourceClaims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for IdentityResourceProperties
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResourceProperties]') AND type IN ('U'))
	DROP TABLE [dbo].[IdentityResourceProperties]
GO

CREATE TABLE [dbo].[IdentityResourceProperties] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Key] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [IdentityResourceId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[IdentityResourceProperties] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for IdentityResources
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityResources]') AND type IN ('U'))
	DROP TABLE [dbo].[IdentityResources]
GO

CREATE TABLE [dbo].[IdentityResources] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Enabled] bit  NOT NULL,
  [Name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [DisplayName] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Description] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Required] bit  NOT NULL,
  [Emphasize] bit  NOT NULL,
  [ShowInDiscoveryDocument] bit  NOT NULL,
  [Created] datetime  NOT NULL,
  [Updated] datetime  NULL,
  [NonEditable] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[IdentityResources] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for PersistedGrants
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PersistedGrants]') AND type IN ('U'))
	DROP TABLE [dbo].[PersistedGrants]
GO

CREATE TABLE [dbo].[PersistedGrants] (
  [Key] nvarchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Type] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [SubjectId] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SessionId] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClientId] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Description] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CreationTime] datetime   NULL,
  [Expiration] datetime   NULL,
  [ConsumedTime] datetime   NULL,
  [Data] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[PersistedGrants] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE [dbo].[__EFMigrationsHistory] ADD CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiResourceClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiResourceClaims_ApiResourceId]
ON [dbo].[ApiResourceClaims] (
  [ApiResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiResourceClaims
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceClaims] ADD CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiResourceProperties
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiResourceProperties_ApiResourceId]
ON [dbo].[ApiResourceProperties] (
  [ApiResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiResourceProperties
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceProperties] ADD CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiResources
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name]
ON [dbo].[ApiResources] (
  [Name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiResources
-- ----------------------------
ALTER TABLE [dbo].[ApiResources] ADD CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiResourceScopes
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiResourceScopes_ApiResourceId]
ON [dbo].[ApiResourceScopes] (
  [ApiResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiResourceScopes
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceScopes] ADD CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiResourceSecrets
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiResourceSecrets_ApiResourceId]
ON [dbo].[ApiResourceSecrets] (
  [ApiResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiResourceSecrets
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceSecrets] ADD CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiScopeClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ScopeId]
ON [dbo].[ApiScopeClaims] (
  [ScopeId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiScopeClaims
-- ----------------------------
ALTER TABLE [dbo].[ApiScopeClaims] ADD CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiScopeProperties
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ApiScopeProperties_ScopeId]
ON [dbo].[ApiScopeProperties] (
  [ScopeId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiScopeProperties
-- ----------------------------
ALTER TABLE [dbo].[ApiScopeProperties] ADD CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ApiScopes
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name]
ON [dbo].[ApiScopes] (
  [Name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ApiScopes
-- ----------------------------
ALTER TABLE [dbo].[ApiScopes] ADD CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetRoleClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId]
ON [dbo].[AspNetRoleClaims] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetRoles
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
ON [dbo].[AspNetRoles] (
  [NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table AspNetRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetUserClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId]
ON [dbo].[AspNetUserClaims] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetUserLogins
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId]
ON [dbo].[AspNetUserLogins] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetUserRoles
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
ON [dbo].[AspNetUserRoles] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId], [RoleId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table AspNetUsers
-- ----------------------------
CREATE NONCLUSTERED INDEX [EmailIndex]
ON [dbo].[AspNetUsers] (
  [NormalizedEmail] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
ON [dbo].[AspNetUsers] (
  [NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table AspNetUsers
-- ----------------------------
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AspNeUserTokens
-- ----------------------------
ALTER TABLE [dbo].[AspNeUserTokens] ADD CONSTRAINT [PK_AspNeUserTokens] PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId]
ON [dbo].[ClientClaims] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientClaims
-- ----------------------------
ALTER TABLE [dbo].[ClientClaims] ADD CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientCorsOrigins
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId]
ON [dbo].[ClientCorsOrigins] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientCorsOrigins
-- ----------------------------
ALTER TABLE [dbo].[ClientCorsOrigins] ADD CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientGrantTypes
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId]
ON [dbo].[ClientGrantTypes] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientGrantTypes
-- ----------------------------
ALTER TABLE [dbo].[ClientGrantTypes] ADD CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientIdPRestrictions
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId]
ON [dbo].[ClientIdPRestrictions] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientIdPRestrictions
-- ----------------------------
ALTER TABLE [dbo].[ClientIdPRestrictions] ADD CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientPostLogoutRedirectUris
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId]
ON [dbo].[ClientPostLogoutRedirectUris] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientPostLogoutRedirectUris
-- ----------------------------
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] ADD CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientProperties
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId]
ON [dbo].[ClientProperties] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientProperties
-- ----------------------------
ALTER TABLE [dbo].[ClientProperties] ADD CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientRedirectUris
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId]
ON [dbo].[ClientRedirectUris] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientRedirectUris
-- ----------------------------
ALTER TABLE [dbo].[ClientRedirectUris] ADD CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Clients
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId]
ON [dbo].[Clients] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Clients
-- ----------------------------
ALTER TABLE [dbo].[Clients] ADD CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientScopes
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId]
ON [dbo].[ClientScopes] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientScopes
-- ----------------------------
ALTER TABLE [dbo].[ClientScopes] ADD CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ClientSecrets
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId]
ON [dbo].[ClientSecrets] (
  [ClientId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ClientSecrets
-- ----------------------------
ALTER TABLE [dbo].[ClientSecrets] ADD CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table DeviceCodes
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceCodes_DeviceCode]
ON [dbo].[DeviceCodes] (
  [DeviceCode] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_DeviceCodes_Expiration]
ON [dbo].[DeviceCodes] (
  [Expiration] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table DeviceCodes
-- ----------------------------
ALTER TABLE [dbo].[DeviceCodes] ADD CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED ([UserCode])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table IdentityResourceClaims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_IdentityResourceClaims_IdentityResourceId]
ON [dbo].[IdentityResourceClaims] (
  [IdentityResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table IdentityResourceClaims
-- ----------------------------
ALTER TABLE [dbo].[IdentityResourceClaims] ADD CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table IdentityResourceProperties
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_IdentityResourceProperties_IdentityResourceId]
ON [dbo].[IdentityResourceProperties] (
  [IdentityResourceId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table IdentityResourceProperties
-- ----------------------------
ALTER TABLE [dbo].[IdentityResourceProperties] ADD CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table IdentityResources
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name]
ON [dbo].[IdentityResources] (
  [Name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table IdentityResources
-- ----------------------------
ALTER TABLE [dbo].[IdentityResources] ADD CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table PersistedGrants
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_Expiration]
ON [dbo].[PersistedGrants] (
  [Expiration] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type]
ON [dbo].[PersistedGrants] (
  [SubjectId] ASC,
  [ClientId] ASC,
  [Type] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_SessionId_Type]
ON [dbo].[PersistedGrants] (
  [SubjectId] ASC,
  [SessionId] ASC,
  [Type] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table PersistedGrants
-- ----------------------------
ALTER TABLE [dbo].[PersistedGrants] ADD CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED ([Key])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table ApiResourceClaims
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceClaims] ADD CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [dbo].[ApiResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ApiResourceProperties
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceProperties] ADD CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [dbo].[ApiResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ApiResourceScopes
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceScopes] ADD CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [dbo].[ApiResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ApiResourceSecrets
-- ----------------------------
ALTER TABLE [dbo].[ApiResourceSecrets] ADD CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [dbo].[ApiResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ApiScopeClaims
-- ----------------------------
ALTER TABLE [dbo].[ApiScopeClaims] ADD CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY ([ScopeId]) REFERENCES [dbo].[ApiScopes] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ApiScopeProperties
-- ----------------------------
ALTER TABLE [dbo].[ApiScopeProperties] ADD CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY ([ScopeId]) REFERENCES [dbo].[ApiScopes] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table AspNeUserTokens
-- ----------------------------
ALTER TABLE [dbo].[AspNeUserTokens] ADD CONSTRAINT [FK_AspNeUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientClaims
-- ----------------------------
ALTER TABLE [dbo].[ClientClaims] ADD CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientCorsOrigins
-- ----------------------------
ALTER TABLE [dbo].[ClientCorsOrigins] ADD CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientGrantTypes
-- ----------------------------
ALTER TABLE [dbo].[ClientGrantTypes] ADD CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientIdPRestrictions
-- ----------------------------
ALTER TABLE [dbo].[ClientIdPRestrictions] ADD CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientPostLogoutRedirectUris
-- ----------------------------
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] ADD CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientProperties
-- ----------------------------
ALTER TABLE [dbo].[ClientProperties] ADD CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientRedirectUris
-- ----------------------------
ALTER TABLE [dbo].[ClientRedirectUris] ADD CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientScopes
-- ----------------------------
ALTER TABLE [dbo].[ClientScopes] ADD CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ClientSecrets
-- ----------------------------
ALTER TABLE [dbo].[ClientSecrets] ADD CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table IdentityResourceClaims
-- ----------------------------
ALTER TABLE [dbo].[IdentityResourceClaims] ADD CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY ([IdentityResourceId]) REFERENCES [dbo].[IdentityResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table IdentityResourceProperties
-- ----------------------------
ALTER TABLE [dbo].[IdentityResourceProperties] ADD CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY ([IdentityResourceId]) REFERENCES [dbo].[IdentityResources] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

