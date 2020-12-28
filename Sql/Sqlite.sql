/*
 Navicat Premium Data Transfer

 Source Server         : IdentityServer
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 07/11/2020 00:59:51
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for ApiResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS "ApiResourceClaims";
CREATE TABLE "ApiResourceClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Type" TEXT NOT NULL,
  "ApiResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiResourceClaims_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS "ApiResourceProperties";
CREATE TABLE "ApiResourceProperties" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Key" TEXT NOT NULL,
  "Value" TEXT NOT NULL,
  "ApiResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiResourceProperties_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiResourceScopes
-- ----------------------------
DROP TABLE IF EXISTS "ApiResourceScopes";
CREATE TABLE "ApiResourceScopes" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Scope" TEXT NOT NULL,
  "ApiResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiResourceScopes_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiResourceSecrets
-- ----------------------------
DROP TABLE IF EXISTS "ApiResourceSecrets";
CREATE TABLE "ApiResourceSecrets" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Description" TEXT,
  "Value" TEXT NOT NULL,
  "Expiration" TEXT,
  "Type" TEXT NOT NULL,
  "Created" TEXT NOT NULL,
  "ApiResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiResourceSecrets_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiResources
-- ----------------------------
DROP TABLE IF EXISTS "ApiResources";
CREATE TABLE "ApiResources" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Enabled" INTEGER NOT NULL,
  "Name" TEXT NOT NULL,
  "DisplayName" TEXT,
  "Description" TEXT,
  "AllowedAccessTokenSigningAlgorithms" TEXT,
  "ShowInDiscoveryDocument" INTEGER NOT NULL,
  "Created" TEXT NOT NULL,
  "Updated" TEXT,
  "LastAccessed" TEXT,
  "NonEditable" INTEGER NOT NULL
);

-- ----------------------------
-- Table structure for ApiScopeClaims
-- ----------------------------
DROP TABLE IF EXISTS "ApiScopeClaims";
CREATE TABLE "ApiScopeClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Type" TEXT NOT NULL,
  "ScopeId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiScopeClaims_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "ApiScopes" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiScopeProperties
-- ----------------------------
DROP TABLE IF EXISTS "ApiScopeProperties";
CREATE TABLE "ApiScopeProperties" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Key" TEXT NOT NULL,
  "Value" TEXT NOT NULL,
  "ScopeId" INTEGER NOT NULL,
  CONSTRAINT "FK_ApiScopeProperties_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "ApiScopes" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ApiScopes
-- ----------------------------
DROP TABLE IF EXISTS "ApiScopes";
CREATE TABLE "ApiScopes" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Enabled" INTEGER NOT NULL,
  "Name" TEXT NOT NULL,
  "DisplayName" TEXT,
  "Description" TEXT,
  "Required" INTEGER NOT NULL,
  "Emphasize" INTEGER NOT NULL,
  "ShowInDiscoveryDocument" INTEGER NOT NULL
);

-- ----------------------------
-- Table structure for AspNeUserTokens
-- ----------------------------
DROP TABLE IF EXISTS "AspNeUserTokens";
CREATE TABLE "AspNeUserTokens" (
  "UserId" TEXT NOT NULL,
  "LoginProvider" TEXT NOT NULL,
  "Name" TEXT NOT NULL,
  "Value" TEXT,
  CONSTRAINT "PK_AspNeUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name"),
  CONSTRAINT "FK_AspNeUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
DROP TABLE IF EXISTS "AspNetRoleClaims";
CREATE TABLE "AspNetRoleClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "RoleId" TEXT NOT NULL,
  "ClaimType" TEXT,
  "ClaimValue" TEXT,
  CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
DROP TABLE IF EXISTS "AspNetRoles";
CREATE TABLE "AspNetRoles" (
  "Id" TEXT NOT NULL,
  "Name" TEXT,
  "NormalizedName" TEXT,
  "ConcurrencyStamp" TEXT,
  CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id")
);

-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
DROP TABLE IF EXISTS "AspNetUserClaims";
CREATE TABLE "AspNetUserClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "UserId" TEXT NOT NULL,
  "ClaimType" TEXT,
  "ClaimValue" TEXT,
  CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
DROP TABLE IF EXISTS "AspNetUserLogins";
CREATE TABLE "AspNetUserLogins" (
  "LoginProvider" TEXT NOT NULL,
  "ProviderKey" TEXT NOT NULL,
  "ProviderDisplayName" TEXT,
  "UserId" TEXT NOT NULL,
  CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey"),
  CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
DROP TABLE IF EXISTS "AspNetUserRoles";
CREATE TABLE "AspNetUserRoles" (
  "UserId" TEXT NOT NULL,
  "RoleId" TEXT NOT NULL,
  CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId"),
  CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for AspNetUsers
-- ----------------------------
DROP TABLE IF EXISTS "AspNetUsers";
CREATE TABLE "AspNetUsers" (
  "Id" TEXT NOT NULL,
  "UserName" TEXT,
  "NormalizedUserName" TEXT,
  "Email" TEXT,
  "NormalizedEmail" TEXT,
  "EmailConfirmed" INTEGER NOT NULL,
  "PasswordHash" TEXT,
  "SecurityStamp" TEXT,
  "ConcurrencyStamp" TEXT,
  "PhoneNumber" TEXT,
  "PhoneNumberConfirmed" INTEGER NOT NULL,
  "TwoFactorEnabled" INTEGER NOT NULL,
  "LockoutEnd" datetime,
  "LockoutEnabled" INTEGER NOT NULL,
  "AccessFailedCount" INTEGER NOT NULL,
  "CardNumber" TEXT  NULL,
  "SecurityNumber" TEXT  NULL,
  "Expiration" TEXT  NULL,
  "CardHolderName" TEXT  NULL,
  "CardType" INTEGER  NULL,
  "Street" TEXT  NULL,
  "City" TEXT  NULL,
  "State" TEXT  NULL,
  "Country" TEXT  NULL,
  "ZipCode" TEXT  NULL,
  "Name" TEXT  NULL,
  "LastName" TEXT  NULL,
  CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id")
);

-- ----------------------------
-- Table structure for ClientClaims
-- ----------------------------
DROP TABLE IF EXISTS "ClientClaims";
CREATE TABLE "ClientClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Type" TEXT NOT NULL,
  "Value" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientClaims_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientCorsOrigins
-- ----------------------------
DROP TABLE IF EXISTS "ClientCorsOrigins";
CREATE TABLE "ClientCorsOrigins" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Origin" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientCorsOrigins_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientGrantTypes
-- ----------------------------
DROP TABLE IF EXISTS "ClientGrantTypes";
CREATE TABLE "ClientGrantTypes" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "GrantType" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientGrantTypes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientIdPRestrictions
-- ----------------------------
DROP TABLE IF EXISTS "ClientIdPRestrictions";
CREATE TABLE "ClientIdPRestrictions" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Provider" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientIdPRestrictions_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientPostLogoutRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS "ClientPostLogoutRedirectUris";
CREATE TABLE "ClientPostLogoutRedirectUris" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "PostLogoutRedirectUri" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientPostLogoutRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientProperties
-- ----------------------------
DROP TABLE IF EXISTS "ClientProperties";
CREATE TABLE "ClientProperties" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Key" TEXT NOT NULL,
  "Value" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientProperties_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS "ClientRedirectUris";
CREATE TABLE "ClientRedirectUris" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "RedirectUri" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientScopes
-- ----------------------------
DROP TABLE IF EXISTS "ClientScopes";
CREATE TABLE "ClientScopes" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Scope" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientScopes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for ClientSecrets
-- ----------------------------
DROP TABLE IF EXISTS "ClientSecrets";
CREATE TABLE "ClientSecrets" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Description" TEXT,
  "Value" TEXT NOT NULL,
  "Expiration" TEXT,
  "Type" TEXT NOT NULL,
  "Created" TEXT NOT NULL,
  "ClientId" INTEGER NOT NULL,
  CONSTRAINT "FK_ClientSecrets_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for Clients
-- ----------------------------
DROP TABLE IF EXISTS "Clients";
CREATE TABLE "Clients" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Enabled" INTEGER NOT NULL,
  "ClientId" TEXT NOT NULL,
  "ProtocolType" TEXT NOT NULL,
  "RequireClientSecret" INTEGER NOT NULL,
  "ClientName" TEXT,
  "Description" TEXT,
  "ClientUri" TEXT,
  "LogoUri" TEXT,
  "RequireConsent" INTEGER NOT NULL,
  "AllowRememberConsent" INTEGER NOT NULL,
  "AlwaysIncludeUserClaimsInIdToken" INTEGER NOT NULL,
  "RequirePkce" INTEGER NOT NULL,
  "AllowPlainTextPkce" INTEGER NOT NULL,
  "RequireRequestObject" INTEGER NOT NULL,
  "AllowAccessTokensViaBrowser" INTEGER NOT NULL,
  "FrontChannelLogoutUri" TEXT,
  "FrontChannelLogoutSessionRequired" INTEGER NOT NULL,
  "BackChannelLogoutUri" TEXT,
  "BackChannelLogoutSessionRequired" INTEGER NOT NULL,
  "AllowOfflineAccess" INTEGER NOT NULL,
  "IdentityTokenLifetime" INTEGER NOT NULL,
  "AllowedIdentityTokenSigningAlgorithms" TEXT,
  "AccessTokenLifetime" INTEGER NOT NULL,
  "AuthorizationCodeLifetime" INTEGER NOT NULL,
  "ConsentLifetime" INTEGER,
  "AbsoluteRefreshTokenLifetime" INTEGER NOT NULL,
  "SlidingRefreshTokenLifetime" INTEGER NOT NULL,
  "RefreshTokenUsage" INTEGER NOT NULL,
  "UpdateAccessTokenClaimsOnRefresh" INTEGER NOT NULL,
  "RefreshTokenExpiration" INTEGER NOT NULL,
  "AccessTokenType" INTEGER NOT NULL,
  "EnableLocalLogin" INTEGER NOT NULL,
  "IncludeJwtId" INTEGER NOT NULL,
  "AlwaysSendClientClaims" INTEGER NOT NULL,
  "ClientClaimsPrefix" TEXT,
  "PairWiseSubjectSalt" TEXT,
  "Created" TEXT NOT NULL,
  "Updated" TEXT,
  "LastAccessed" TEXT,
  "UserSsoLifetime" INTEGER,
  "UserCodeType" TEXT,
  "DeviceCodeLifetime" INTEGER NOT NULL,
  "NonEditable" INTEGER NOT NULL
);

-- ----------------------------
-- Table structure for DeviceCodes
-- ----------------------------
DROP TABLE IF EXISTS "DeviceCodes";
CREATE TABLE "DeviceCodes" (
  "UserCode" TEXT NOT NULL,
  "DeviceCode" TEXT NOT NULL,
  "SubjectId" TEXT,
  "SessionId" TEXT,
  "ClientId" TEXT NOT NULL,
  "Description" TEXT,
  "CreationTime" TEXT  NULL,
  "Expiration" TEXT  NULL,
  "Data" TEXT NOT NULL,
  CONSTRAINT "PK_DeviceCodes" PRIMARY KEY ("UserCode")
);

-- ----------------------------
-- Table structure for IdentityResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS "IdentityResourceClaims";
CREATE TABLE "IdentityResourceClaims" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Type" TEXT NOT NULL,
  "IdentityResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_IdentityResourceClaims_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES "IdentityResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for IdentityResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS "IdentityResourceProperties";
CREATE TABLE "IdentityResourceProperties" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Key" TEXT NOT NULL,
  "Value" TEXT NOT NULL,
  "IdentityResourceId" INTEGER NOT NULL,
  CONSTRAINT "FK_IdentityResourceProperties_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES "IdentityResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for IdentityResources
-- ----------------------------
DROP TABLE IF EXISTS "IdentityResources";
CREATE TABLE "IdentityResources" (
  "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Enabled" INTEGER NOT NULL,
  "Name" TEXT NOT NULL,
  "DisplayName" TEXT,
  "Description" TEXT,
  "Required" INTEGER NOT NULL,
  "Emphasize" INTEGER NOT NULL,
  "ShowInDiscoveryDocument" INTEGER NOT NULL,
  "Created" TEXT NOT NULL,
  "Updated" TEXT,
  "NonEditable" INTEGER NOT NULL
);

-- ----------------------------
-- Table structure for PersistedGrants
-- ----------------------------
DROP TABLE IF EXISTS "PersistedGrants";
CREATE TABLE "PersistedGrants" (
  "Key" TEXT NOT NULL,
  "Type" TEXT NOT NULL,
  "SubjectId" TEXT,
  "SessionId" TEXT,
  "ClientId" TEXT NOT NULL,
  "Description" TEXT,
  "CreationTime" TEXT  NULL,
  "Expiration" TEXT,
  "ConsumedTime" TEXT,
  "Data" TEXT NOT NULL,
  CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key")
);

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS "__EFMigrationsHistory";
CREATE TABLE "__EFMigrationsHistory" (
  "MigrationId" TEXT NOT NULL,
  "ProductVersion" TEXT NOT NULL,
  CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Indexes structure for table ApiResourceClaims
-- ----------------------------
CREATE INDEX "IX_ApiResourceClaims_ApiResourceId"
ON "ApiResourceClaims" (
  "ApiResourceId" ASC
);

-- ----------------------------
-- Indexes structure for table ApiResourceProperties
-- ----------------------------
CREATE INDEX "IX_ApiResourceProperties_ApiResourceId"
ON "ApiResourceProperties" (
  "ApiResourceId" ASC
);

-- ----------------------------
-- Indexes structure for table ApiResourceScopes
-- ----------------------------
CREATE INDEX "IX_ApiResourceScopes_ApiResourceId"
ON "ApiResourceScopes" (
  "ApiResourceId" ASC
);

-- ----------------------------
-- Indexes structure for table ApiResourceSecrets
-- ----------------------------
CREATE INDEX "IX_ApiResourceSecrets_ApiResourceId"
ON "ApiResourceSecrets" (
  "ApiResourceId" ASC
);

-- ----------------------------
-- Indexes structure for table ApiResources
-- ----------------------------
CREATE UNIQUE INDEX "IX_ApiResources_Name"
ON "ApiResources" (
  "Name" ASC
);

-- ----------------------------
-- Indexes structure for table ApiScopeClaims
-- ----------------------------
CREATE INDEX "IX_ApiScopeClaims_ScopeId"
ON "ApiScopeClaims" (
  "ScopeId" ASC
);

-- ----------------------------
-- Indexes structure for table ApiScopeProperties
-- ----------------------------
CREATE INDEX "IX_ApiScopeProperties_ScopeId"
ON "ApiScopeProperties" (
  "ScopeId" ASC
);

-- ----------------------------
-- Auto increment value for ApiScopes
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'ApiScopes';

-- ----------------------------
-- Indexes structure for table ApiScopes
-- ----------------------------
CREATE UNIQUE INDEX "IX_ApiScopes_Name"
ON "ApiScopes" (
  "Name" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetRoleClaims
-- ----------------------------
CREATE INDEX "IX_AspNetRoleClaims_RoleId"
ON "AspNetRoleClaims" (
  "RoleId" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetRoles
-- ----------------------------
CREATE UNIQUE INDEX "RoleNameIndex"
ON "AspNetRoles" (
  "NormalizedName" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetUserClaims
-- ----------------------------
CREATE INDEX "IX_AspNetUserClaims_UserId"
ON "AspNetUserClaims" (
  "UserId" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetUserLogins
-- ----------------------------
CREATE INDEX "IX_AspNetUserLogins_UserId"
ON "AspNetUserLogins" (
  "UserId" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetUserRoles
-- ----------------------------
CREATE INDEX "IX_AspNetUserRoles_RoleId"
ON "AspNetUserRoles" (
  "RoleId" ASC
);

-- ----------------------------
-- Indexes structure for table AspNetUsers
-- ----------------------------
CREATE INDEX "EmailIndex"
ON "AspNetUsers" (
  "NormalizedEmail" ASC
);
CREATE UNIQUE INDEX "UserNameIndex"
ON "AspNetUsers" (
  "NormalizedUserName" ASC
);

-- ----------------------------
-- Indexes structure for table ClientClaims
-- ----------------------------
CREATE INDEX "IX_ClientClaims_ClientId"
ON "ClientClaims" (
  "ClientId" ASC
);

-- ----------------------------
-- Indexes structure for table ClientCorsOrigins
-- ----------------------------
CREATE INDEX "IX_ClientCorsOrigins_ClientId"
ON "ClientCorsOrigins" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for ClientGrantTypes
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'ClientGrantTypes';

-- ----------------------------
-- Indexes structure for table ClientGrantTypes
-- ----------------------------
CREATE INDEX "IX_ClientGrantTypes_ClientId"
ON "ClientGrantTypes" (
  "ClientId" ASC
);

-- ----------------------------
-- Indexes structure for table ClientIdPRestrictions
-- ----------------------------
CREATE INDEX "IX_ClientIdPRestrictions_ClientId"
ON "ClientIdPRestrictions" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for ClientPostLogoutRedirectUris
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'ClientPostLogoutRedirectUris';

-- ----------------------------
-- Indexes structure for table ClientPostLogoutRedirectUris
-- ----------------------------
CREATE INDEX "IX_ClientPostLogoutRedirectUris_ClientId"
ON "ClientPostLogoutRedirectUris" (
  "ClientId" ASC
);

-- ----------------------------
-- Indexes structure for table ClientProperties
-- ----------------------------
CREATE INDEX "IX_ClientProperties_ClientId"
ON "ClientProperties" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for ClientRedirectUris
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'ClientRedirectUris';

-- ----------------------------
-- Indexes structure for table ClientRedirectUris
-- ----------------------------
CREATE INDEX "IX_ClientRedirectUris_ClientId"
ON "ClientRedirectUris" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for ClientScopes
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 4 WHERE name = 'ClientScopes';

-- ----------------------------
-- Indexes structure for table ClientScopes
-- ----------------------------
CREATE INDEX "IX_ClientScopes_ClientId"
ON "ClientScopes" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for ClientSecrets
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'ClientSecrets';

-- ----------------------------
-- Indexes structure for table ClientSecrets
-- ----------------------------
CREATE INDEX "IX_ClientSecrets_ClientId"
ON "ClientSecrets" (
  "ClientId" ASC
);

-- ----------------------------
-- Auto increment value for Clients
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'Clients';

-- ----------------------------
-- Indexes structure for table Clients
-- ----------------------------
CREATE UNIQUE INDEX "IX_Clients_ClientId"
ON "Clients" (
  "ClientId" ASC
);

-- ----------------------------
-- Indexes structure for table DeviceCodes
-- ----------------------------
CREATE UNIQUE INDEX "IX_DeviceCodes_DeviceCode"
ON "DeviceCodes" (
  "DeviceCode" ASC
);
CREATE INDEX "IX_DeviceCodes_Expiration"
ON "DeviceCodes" (
  "Expiration" ASC
);

-- ----------------------------
-- Auto increment value for IdentityResourceClaims
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 15 WHERE name = 'IdentityResourceClaims';

-- ----------------------------
-- Indexes structure for table IdentityResourceClaims
-- ----------------------------
CREATE INDEX "IX_IdentityResourceClaims_IdentityResourceId"
ON "IdentityResourceClaims" (
  "IdentityResourceId" ASC
);

-- ----------------------------
-- Indexes structure for table IdentityResourceProperties
-- ----------------------------
CREATE INDEX "IX_IdentityResourceProperties_IdentityResourceId"
ON "IdentityResourceProperties" (
  "IdentityResourceId" ASC
);

-- ----------------------------
-- Auto increment value for IdentityResources
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'IdentityResources';

-- ----------------------------
-- Indexes structure for table IdentityResources
-- ----------------------------
CREATE UNIQUE INDEX "IX_IdentityResources_Name"
ON "IdentityResources" (
  "Name" ASC
);

-- ----------------------------
-- Indexes structure for table PersistedGrants
-- ----------------------------
CREATE INDEX "IX_PersistedGrants_Expiration"
ON "PersistedGrants" (
  "Expiration" ASC
);
CREATE INDEX "IX_PersistedGrants_SubjectId_ClientId_Type"
ON "PersistedGrants" (
  "SubjectId" ASC,
  "ClientId" ASC,
  "Type" ASC
);
CREATE INDEX "IX_PersistedGrants_SubjectId_SessionId_Type"
ON "PersistedGrants" (
  "SubjectId" ASC,
  "SessionId" ASC,
  "Type" ASC
);

PRAGMA foreign_keys = true;
