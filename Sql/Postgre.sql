/*
 Navicat Premium Data Transfer

 Source Server         : postgre
 Source Server Type    : PostgreSQL
 Source Server Version : 110004
 Source Host           : localhost:5432
 Source Catalog        : IdentityServer
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110004
 File Encoding         : 65001

 Date: 07/11/2020 02:07:44
*/


-- ----------------------------
-- Sequence structure for ApiResourceClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiResourceClaims_Id_seq";
CREATE SEQUENCE "public"."ApiResourceClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiResourceProperties_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiResourceProperties_Id_seq";
CREATE SEQUENCE "public"."ApiResourceProperties_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiResourceScopes_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiResourceScopes_Id_seq";
CREATE SEQUENCE "public"."ApiResourceScopes_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiResourceSecrets_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiResourceSecrets_Id_seq";
CREATE SEQUENCE "public"."ApiResourceSecrets_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiResources_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiResources_Id_seq";
CREATE SEQUENCE "public"."ApiResources_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiScopeClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiScopeClaims_Id_seq";
CREATE SEQUENCE "public"."ApiScopeClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiScopeProperties_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiScopeProperties_Id_seq";
CREATE SEQUENCE "public"."ApiScopeProperties_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ApiScopes_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ApiScopes_Id_seq";
CREATE SEQUENCE "public"."ApiScopes_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for AspNetRoleClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."AspNetRoleClaims_Id_seq";
CREATE SEQUENCE "public"."AspNetRoleClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for AspNetUserClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."AspNetUserClaims_Id_seq";
CREATE SEQUENCE "public"."AspNetUserClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientClaims_Id_seq";
CREATE SEQUENCE "public"."ClientClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientCorsOrigins_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientCorsOrigins_Id_seq";
CREATE SEQUENCE "public"."ClientCorsOrigins_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientGrantTypes_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientGrantTypes_Id_seq";
CREATE SEQUENCE "public"."ClientGrantTypes_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientIdPRestrictions_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientIdPRestrictions_Id_seq";
CREATE SEQUENCE "public"."ClientIdPRestrictions_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientPostLogoutRedirectUris_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientPostLogoutRedirectUris_Id_seq";
CREATE SEQUENCE "public"."ClientPostLogoutRedirectUris_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientProperties_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientProperties_Id_seq";
CREATE SEQUENCE "public"."ClientProperties_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientRedirectUris_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientRedirectUris_Id_seq";
CREATE SEQUENCE "public"."ClientRedirectUris_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientScopes_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientScopes_Id_seq";
CREATE SEQUENCE "public"."ClientScopes_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientSecrets_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ClientSecrets_Id_seq";
CREATE SEQUENCE "public"."ClientSecrets_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Clients_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Clients_Id_seq";
CREATE SEQUENCE "public"."Clients_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for IdentityResourceClaims_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."IdentityResourceClaims_Id_seq";
CREATE SEQUENCE "public"."IdentityResourceClaims_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for IdentityResourceProperties_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."IdentityResourceProperties_Id_seq";
CREATE SEQUENCE "public"."IdentityResourceProperties_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for IdentityResources_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."IdentityResources_Id_seq";
CREATE SEQUENCE "public"."IdentityResources_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for ApiResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiResourceClaims";
CREATE TABLE "public"."ApiResourceClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Type" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ApiResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiResourceProperties";
CREATE TABLE "public"."ApiResourceProperties" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Key" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "ApiResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiResourceScopes
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiResourceScopes";
CREATE TABLE "public"."ApiResourceScopes" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Scope" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ApiResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiResourceSecrets
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiResourceSecrets";
CREATE TABLE "public"."ApiResourceSecrets" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "Value" varchar(4000) COLLATE "pg_catalog"."default" NOT NULL,
  "Expiration" timestamp(6),
  "Type" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Created" timestamp(6) NOT NULL,
  "ApiResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiResources
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiResources";
CREATE TABLE "public"."ApiResources" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Enabled" bool NOT NULL,
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "DisplayName" varchar(200) COLLATE "pg_catalog"."default",
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "AllowedAccessTokenSigningAlgorithms" varchar(100) COLLATE "pg_catalog"."default",
  "ShowInDiscoveryDocument" bool NOT NULL,
  "Created" timestamp(6) NOT NULL,
  "Updated" timestamp(6),
  "LastAccessed" timestamp(6),
  "NonEditable" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiScopeClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiScopeClaims";
CREATE TABLE "public"."ApiScopeClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Type" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ScopeId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiScopeProperties
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiScopeProperties";
CREATE TABLE "public"."ApiScopeProperties" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Key" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "ScopeId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ApiScopes
-- ----------------------------
DROP TABLE IF EXISTS "public"."ApiScopes";
CREATE TABLE "public"."ApiScopes" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Enabled" bool NOT NULL,
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "DisplayName" varchar(200) COLLATE "pg_catalog"."default",
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "Required" bool NOT NULL,
  "Emphasize" bool NOT NULL,
  "ShowInDiscoveryDocument" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for AspNeUserTokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNeUserTokens";
CREATE TABLE "public"."AspNeUserTokens" (
  "UserId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "LoginProvider" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetRoleClaims";
CREATE TABLE "public"."AspNetRoleClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "RoleId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ClaimType" text COLLATE "pg_catalog"."default",
  "ClaimValue" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetRoles";
CREATE TABLE "public"."AspNetRoles" (
  "Id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(256) COLLATE "pg_catalog"."default",
  "NormalizedName" varchar(256) COLLATE "pg_catalog"."default",
  "ConcurrencyStamp" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetUserClaims";
CREATE TABLE "public"."AspNetUserClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "UserId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ClaimType" text COLLATE "pg_catalog"."default",
  "ClaimValue" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetUserLogins";
CREATE TABLE "public"."AspNetUserLogins" (
  "LoginProvider" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ProviderKey" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ProviderDisplayName" text COLLATE "pg_catalog"."default",
  "UserId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetUserRoles";
CREATE TABLE "public"."AspNetUserRoles" (
  "UserId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "RoleId" varchar(36) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for AspNetUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."AspNetUsers";
CREATE TABLE "public"."AspNetUsers" (
  "Id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "UserName" varchar(256) COLLATE "pg_catalog"."default",
  "NormalizedUserName" varchar(256) COLLATE "pg_catalog"."default",
  "Email" varchar(256) COLLATE "pg_catalog"."default",
  "NormalizedEmail" varchar(256) COLLATE "pg_catalog"."default",
  "EmailConfirmed" bool NOT NULL,
  "PasswordHash" text COLLATE "pg_catalog"."default",
  "SecurityStamp" text COLLATE "pg_catalog"."default",
  "ConcurrencyStamp" text COLLATE "pg_catalog"."default",
  "PhoneNumber" text COLLATE "pg_catalog"."default",
  "PhoneNumberConfirmed" bool NOT NULL,
  "TwoFactorEnabled" bool NOT NULL,
  "LockoutEnd" timestamptz(6),
  "LockoutEnabled" bool NOT NULL,
  "AccessFailedCount" int4 NOT NULL,
  "CardNumber" text COLLATE "pg_catalog"."default"  NULL,
  "SecurityNumber" text COLLATE "pg_catalog"."default"  NULL,
  "Expiration" text COLLATE "pg_catalog"."default"  NULL,
  "CardHolderName" text COLLATE "pg_catalog"."default"  NULL,
  "CardType" int4  NULL,
  "Street" text COLLATE "pg_catalog"."default"  NULL,
  "City" text COLLATE "pg_catalog"."default"  NULL,
  "State" text COLLATE "pg_catalog"."default"  NULL,
  "Country" text COLLATE "pg_catalog"."default"  NULL,
  "ZipCode" text COLLATE "pg_catalog"."default"  NULL,
  "Name" text COLLATE "pg_catalog"."default"  NULL,
  "LastName" text COLLATE "pg_catalog"."default"  NULL
)
;

-- ----------------------------
-- Table structure for ClientClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientClaims";
CREATE TABLE "public"."ClientClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Type" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientCorsOrigins
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientCorsOrigins";
CREATE TABLE "public"."ClientCorsOrigins" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Origin" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientGrantTypes
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientGrantTypes";
CREATE TABLE "public"."ClientGrantTypes" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "GrantType" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientIdPRestrictions
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientIdPRestrictions";
CREATE TABLE "public"."ClientIdPRestrictions" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Provider" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientPostLogoutRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientPostLogoutRedirectUris";
CREATE TABLE "public"."ClientPostLogoutRedirectUris" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "PostLogoutRedirectUri" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientProperties
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientProperties";
CREATE TABLE "public"."ClientProperties" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Key" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientRedirectUris";
CREATE TABLE "public"."ClientRedirectUris" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "RedirectUri" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientScopes
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientScopes";
CREATE TABLE "public"."ClientScopes" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Scope" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ClientSecrets
-- ----------------------------
DROP TABLE IF EXISTS "public"."ClientSecrets";
CREATE TABLE "public"."ClientSecrets" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Description" varchar(2000) COLLATE "pg_catalog"."default",
  "Value" varchar(4000) COLLATE "pg_catalog"."default" NOT NULL,
  "Expiration" timestamp(6),
  "Type" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Created" timestamp(6) NOT NULL,
  "ClientId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for Clients
-- ----------------------------
DROP TABLE IF EXISTS "public"."Clients";
CREATE TABLE "public"."Clients" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Enabled" bool NOT NULL,
  "ClientId" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "ProtocolType" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "RequireClientSecret" bool NOT NULL,
  "ClientName" varchar(200) COLLATE "pg_catalog"."default",
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "ClientUri" varchar(2000) COLLATE "pg_catalog"."default",
  "LogoUri" varchar(2000) COLLATE "pg_catalog"."default",
  "RequireConsent" bool NOT NULL,
  "AllowRememberConsent" bool NOT NULL,
  "AlwaysIncludeUserClaimsInIdToken" bool NOT NULL,
  "RequirePkce" bool NOT NULL,
  "AllowPlainTextPkce" bool NOT NULL,
  "RequireRequestObject" bool NOT NULL,
  "AllowAccessTokensViaBrowser" bool NOT NULL,
  "FrontChannelLogoutUri" varchar(2000) COLLATE "pg_catalog"."default",
  "FrontChannelLogoutSessionRequired" bool NOT NULL,
  "BackChannelLogoutUri" varchar(2000) COLLATE "pg_catalog"."default",
  "BackChannelLogoutSessionRequired" bool NOT NULL,
  "AllowOfflineAccess" bool NOT NULL,
  "IdentityTokenLifetime" int4 NOT NULL,
  "AllowedIdentityTokenSigningAlgorithms" varchar(100) COLLATE "pg_catalog"."default",
  "AccessTokenLifetime" int4 NOT NULL,
  "AuthorizationCodeLifetime" int4 NOT NULL,
  "ConsentLifetime" int4,
  "AbsoluteRefreshTokenLifetime" int4 NOT NULL,
  "SlidingRefreshTokenLifetime" int4 NOT NULL,
  "RefreshTokenUsage" int4 NOT NULL,
  "UpdateAccessTokenClaimsOnRefresh" bool NOT NULL,
  "RefreshTokenExpiration" int4 NOT NULL,
  "AccessTokenType" int4 NOT NULL,
  "EnableLocalLogin" bool NOT NULL,
  "IncludeJwtId" bool NOT NULL,
  "AlwaysSendClientClaims" bool NOT NULL,
  "ClientClaimsPrefix" varchar(200) COLLATE "pg_catalog"."default",
  "PairWiseSubjectSalt" varchar(200) COLLATE "pg_catalog"."default",
  "Created" timestamp(6) NOT NULL,
  "Updated" timestamp(6),
  "LastAccessed" timestamp(6),
  "UserSsoLifetime" int4,
  "UserCodeType" varchar(100) COLLATE "pg_catalog"."default",
  "DeviceCodeLifetime" int4 NOT NULL,
  "NonEditable" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for DeviceCodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."DeviceCodes";
CREATE TABLE "public"."DeviceCodes" (
  "UserCode" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "DeviceCode" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "SubjectId" varchar(200) COLLATE "pg_catalog"."default",
  "SessionId" varchar(100) COLLATE "pg_catalog"."default",
  "ClientId" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "Description" varchar(200) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6)  NULL,
  "Expiration" timestamp(6),
  "Data" varchar(50000) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for IdentityResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS "public"."IdentityResourceClaims";
CREATE TABLE "public"."IdentityResourceClaims" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Type" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "IdentityResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for IdentityResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS "public"."IdentityResourceProperties";
CREATE TABLE "public"."IdentityResourceProperties" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Key" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "Value" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "IdentityResourceId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for IdentityResources
-- ----------------------------
DROP TABLE IF EXISTS "public"."IdentityResources";
CREATE TABLE "public"."IdentityResources" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Enabled" bool NOT NULL,
  "Name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "DisplayName" varchar(200) COLLATE "pg_catalog"."default",
  "Description" varchar(1000) COLLATE "pg_catalog"."default",
  "Required" bool NOT NULL,
  "Emphasize" bool NOT NULL,
  "ShowInDiscoveryDocument" bool NOT NULL,
  "Created" timestamp(6) NOT NULL,
  "Updated" timestamp(6),
  "NonEditable" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for PersistedGrants
-- ----------------------------
DROP TABLE IF EXISTS "public"."PersistedGrants";
CREATE TABLE "public"."PersistedGrants" (
  "Key" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "Type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "SubjectId" varchar(200) COLLATE "pg_catalog"."default",
  "SessionId" varchar(100) COLLATE "pg_catalog"."default",
  "ClientId" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "Description" varchar(200) COLLATE "pg_catalog"."default",
  "CreationTime" timestamp(6)  NULL,
  "Expiration" timestamp(6),
  "ConsumedTime" timestamp(6),
  "Data" varchar(50000) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ApiResourceClaims_Id_seq"
OWNED BY "public"."ApiResourceClaims"."Id";
SELECT setval('"public"."ApiResourceClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiResourceProperties_Id_seq"
OWNED BY "public"."ApiResourceProperties"."Id";
SELECT setval('"public"."ApiResourceProperties_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiResourceScopes_Id_seq"
OWNED BY "public"."ApiResourceScopes"."Id";
SELECT setval('"public"."ApiResourceScopes_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiResourceSecrets_Id_seq"
OWNED BY "public"."ApiResourceSecrets"."Id";
SELECT setval('"public"."ApiResourceSecrets_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiResources_Id_seq"
OWNED BY "public"."ApiResources"."Id";
SELECT setval('"public"."ApiResources_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiScopeClaims_Id_seq"
OWNED BY "public"."ApiScopeClaims"."Id";
SELECT setval('"public"."ApiScopeClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiScopeProperties_Id_seq"
OWNED BY "public"."ApiScopeProperties"."Id";
SELECT setval('"public"."ApiScopeProperties_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ApiScopes_Id_seq"
OWNED BY "public"."ApiScopes"."Id";
SELECT setval('"public"."ApiScopes_Id_seq"', 2, false);
ALTER SEQUENCE "public"."AspNetRoleClaims_Id_seq"
OWNED BY "public"."AspNetRoleClaims"."Id";
SELECT setval('"public"."AspNetRoleClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."AspNetUserClaims_Id_seq"
OWNED BY "public"."AspNetUserClaims"."Id";
SELECT setval('"public"."AspNetUserClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientClaims_Id_seq"
OWNED BY "public"."ClientClaims"."Id";
SELECT setval('"public"."ClientClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientCorsOrigins_Id_seq"
OWNED BY "public"."ClientCorsOrigins"."Id";
SELECT setval('"public"."ClientCorsOrigins_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientGrantTypes_Id_seq"
OWNED BY "public"."ClientGrantTypes"."Id";
SELECT setval('"public"."ClientGrantTypes_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientIdPRestrictions_Id_seq"
OWNED BY "public"."ClientIdPRestrictions"."Id";
SELECT setval('"public"."ClientIdPRestrictions_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientPostLogoutRedirectUris_Id_seq"
OWNED BY "public"."ClientPostLogoutRedirectUris"."Id";
SELECT setval('"public"."ClientPostLogoutRedirectUris_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientProperties_Id_seq"
OWNED BY "public"."ClientProperties"."Id";
SELECT setval('"public"."ClientProperties_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientRedirectUris_Id_seq"
OWNED BY "public"."ClientRedirectUris"."Id";
SELECT setval('"public"."ClientRedirectUris_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientScopes_Id_seq"
OWNED BY "public"."ClientScopes"."Id";
SELECT setval('"public"."ClientScopes_Id_seq"', 2, false);
ALTER SEQUENCE "public"."ClientSecrets_Id_seq"
OWNED BY "public"."ClientSecrets"."Id";
SELECT setval('"public"."ClientSecrets_Id_seq"', 2, false);
ALTER SEQUENCE "public"."Clients_Id_seq"
OWNED BY "public"."Clients"."Id";
SELECT setval('"public"."Clients_Id_seq"', 2, false);
ALTER SEQUENCE "public"."IdentityResourceClaims_Id_seq"
OWNED BY "public"."IdentityResourceClaims"."Id";
SELECT setval('"public"."IdentityResourceClaims_Id_seq"', 2, false);
ALTER SEQUENCE "public"."IdentityResourceProperties_Id_seq"
OWNED BY "public"."IdentityResourceProperties"."Id";
SELECT setval('"public"."IdentityResourceProperties_Id_seq"', 2, false);
ALTER SEQUENCE "public"."IdentityResources_Id_seq"
OWNED BY "public"."IdentityResources"."Id";
SELECT setval('"public"."IdentityResources_Id_seq"', 2, false);

-- ----------------------------
-- Indexes structure for table ApiResourceClaims
-- ----------------------------
CREATE INDEX "IX_ApiResourceClaims_ApiResourceId" ON "public"."ApiResourceClaims" USING btree (
  "ApiResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiResourceClaims
-- ----------------------------
ALTER TABLE "public"."ApiResourceClaims" ADD CONSTRAINT "PK_ApiResourceClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiResourceProperties
-- ----------------------------
CREATE INDEX "IX_ApiResourceProperties_ApiResourceId" ON "public"."ApiResourceProperties" USING btree (
  "ApiResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiResourceProperties
-- ----------------------------
ALTER TABLE "public"."ApiResourceProperties" ADD CONSTRAINT "PK_ApiResourceProperties" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiResourceScopes
-- ----------------------------
CREATE INDEX "IX_ApiResourceScopes_ApiResourceId" ON "public"."ApiResourceScopes" USING btree (
  "ApiResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiResourceScopes
-- ----------------------------
ALTER TABLE "public"."ApiResourceScopes" ADD CONSTRAINT "PK_ApiResourceScopes" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiResourceSecrets
-- ----------------------------
CREATE INDEX "IX_ApiResourceSecrets_ApiResourceId" ON "public"."ApiResourceSecrets" USING btree (
  "ApiResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiResourceSecrets
-- ----------------------------
ALTER TABLE "public"."ApiResourceSecrets" ADD CONSTRAINT "PK_ApiResourceSecrets" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiResources
-- ----------------------------
CREATE UNIQUE INDEX "IX_ApiResources_Name" ON "public"."ApiResources" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiResources
-- ----------------------------
ALTER TABLE "public"."ApiResources" ADD CONSTRAINT "PK_ApiResources" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiScopeClaims
-- ----------------------------
CREATE INDEX "IX_ApiScopeClaims_ScopeId" ON "public"."ApiScopeClaims" USING btree (
  "ScopeId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiScopeClaims
-- ----------------------------
ALTER TABLE "public"."ApiScopeClaims" ADD CONSTRAINT "PK_ApiScopeClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiScopeProperties
-- ----------------------------
CREATE INDEX "IX_ApiScopeProperties_ScopeId" ON "public"."ApiScopeProperties" USING btree (
  "ScopeId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiScopeProperties
-- ----------------------------
ALTER TABLE "public"."ApiScopeProperties" ADD CONSTRAINT "PK_ApiScopeProperties" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ApiScopes
-- ----------------------------
CREATE UNIQUE INDEX "IX_ApiScopes_Name" ON "public"."ApiScopes" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ApiScopes
-- ----------------------------
ALTER TABLE "public"."ApiScopes" ADD CONSTRAINT "PK_ApiScopes" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table AspNeUserTokens
-- ----------------------------
ALTER TABLE "public"."AspNeUserTokens" ADD CONSTRAINT "PK_AspNeUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");

-- ----------------------------
-- Indexes structure for table AspNetRoleClaims
-- ----------------------------
CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "public"."AspNetRoleClaims" USING btree (
  "RoleId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE "public"."AspNetRoleClaims" ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table AspNetRoles
-- ----------------------------
CREATE UNIQUE INDEX "RoleNameIndex" ON "public"."AspNetRoles" USING btree (
  "NormalizedName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetRoles
-- ----------------------------
ALTER TABLE "public"."AspNetRoles" ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table AspNetUserClaims
-- ----------------------------
CREATE INDEX "IX_AspNetUserClaims_UserId" ON "public"."AspNetUserClaims" USING btree (
  "UserId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE "public"."AspNetUserClaims" ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table AspNetUserLogins
-- ----------------------------
CREATE INDEX "IX_AspNetUserLogins_UserId" ON "public"."AspNetUserLogins" USING btree (
  "UserId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE "public"."AspNetUserLogins" ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");

-- ----------------------------
-- Indexes structure for table AspNetUserRoles
-- ----------------------------
CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "public"."AspNetUserRoles" USING btree (
  "RoleId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE "public"."AspNetUserRoles" ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");

-- ----------------------------
-- Indexes structure for table AspNetUsers
-- ----------------------------
CREATE INDEX "EmailIndex" ON "public"."AspNetUsers" USING btree (
  "NormalizedEmail" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "UserNameIndex" ON "public"."AspNetUsers" USING btree (
  "NormalizedUserName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table AspNetUsers
-- ----------------------------
ALTER TABLE "public"."AspNetUsers" ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientClaims
-- ----------------------------
CREATE INDEX "IX_ClientClaims_ClientId" ON "public"."ClientClaims" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientClaims
-- ----------------------------
ALTER TABLE "public"."ClientClaims" ADD CONSTRAINT "PK_ClientClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientCorsOrigins
-- ----------------------------
CREATE INDEX "IX_ClientCorsOrigins_ClientId" ON "public"."ClientCorsOrigins" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientCorsOrigins
-- ----------------------------
ALTER TABLE "public"."ClientCorsOrigins" ADD CONSTRAINT "PK_ClientCorsOrigins" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientGrantTypes
-- ----------------------------
CREATE INDEX "IX_ClientGrantTypes_ClientId" ON "public"."ClientGrantTypes" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientGrantTypes
-- ----------------------------
ALTER TABLE "public"."ClientGrantTypes" ADD CONSTRAINT "PK_ClientGrantTypes" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientIdPRestrictions
-- ----------------------------
CREATE INDEX "IX_ClientIdPRestrictions_ClientId" ON "public"."ClientIdPRestrictions" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientIdPRestrictions
-- ----------------------------
ALTER TABLE "public"."ClientIdPRestrictions" ADD CONSTRAINT "PK_ClientIdPRestrictions" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientPostLogoutRedirectUris
-- ----------------------------
CREATE INDEX "IX_ClientPostLogoutRedirectUris_ClientId" ON "public"."ClientPostLogoutRedirectUris" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientPostLogoutRedirectUris
-- ----------------------------
ALTER TABLE "public"."ClientPostLogoutRedirectUris" ADD CONSTRAINT "PK_ClientPostLogoutRedirectUris" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientProperties
-- ----------------------------
CREATE INDEX "IX_ClientProperties_ClientId" ON "public"."ClientProperties" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientProperties
-- ----------------------------
ALTER TABLE "public"."ClientProperties" ADD CONSTRAINT "PK_ClientProperties" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientRedirectUris
-- ----------------------------
CREATE INDEX "IX_ClientRedirectUris_ClientId" ON "public"."ClientRedirectUris" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientRedirectUris
-- ----------------------------
ALTER TABLE "public"."ClientRedirectUris" ADD CONSTRAINT "PK_ClientRedirectUris" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientScopes
-- ----------------------------
CREATE INDEX "IX_ClientScopes_ClientId" ON "public"."ClientScopes" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientScopes
-- ----------------------------
ALTER TABLE "public"."ClientScopes" ADD CONSTRAINT "PK_ClientScopes" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ClientSecrets
-- ----------------------------
CREATE INDEX "IX_ClientSecrets_ClientId" ON "public"."ClientSecrets" USING btree (
  "ClientId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ClientSecrets
-- ----------------------------
ALTER TABLE "public"."ClientSecrets" ADD CONSTRAINT "PK_ClientSecrets" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Clients
-- ----------------------------
CREATE UNIQUE INDEX "IX_Clients_ClientId" ON "public"."Clients" USING btree (
  "ClientId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Clients
-- ----------------------------
ALTER TABLE "public"."Clients" ADD CONSTRAINT "PK_Clients" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table DeviceCodes
-- ----------------------------
CREATE UNIQUE INDEX "IX_DeviceCodes_DeviceCode" ON "public"."DeviceCodes" USING btree (
  "DeviceCode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IX_DeviceCodes_Expiration" ON "public"."DeviceCodes" USING btree (
  "Expiration" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table DeviceCodes
-- ----------------------------
ALTER TABLE "public"."DeviceCodes" ADD CONSTRAINT "PK_DeviceCodes" PRIMARY KEY ("UserCode");

-- ----------------------------
-- Indexes structure for table IdentityResourceClaims
-- ----------------------------
CREATE INDEX "IX_IdentityResourceClaims_IdentityResourceId" ON "public"."IdentityResourceClaims" USING btree (
  "IdentityResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table IdentityResourceClaims
-- ----------------------------
ALTER TABLE "public"."IdentityResourceClaims" ADD CONSTRAINT "PK_IdentityResourceClaims" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table IdentityResourceProperties
-- ----------------------------
CREATE INDEX "IX_IdentityResourceProperties_IdentityResourceId" ON "public"."IdentityResourceProperties" USING btree (
  "IdentityResourceId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table IdentityResourceProperties
-- ----------------------------
ALTER TABLE "public"."IdentityResourceProperties" ADD CONSTRAINT "PK_IdentityResourceProperties" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table IdentityResources
-- ----------------------------
CREATE UNIQUE INDEX "IX_IdentityResources_Name" ON "public"."IdentityResources" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table IdentityResources
-- ----------------------------
ALTER TABLE "public"."IdentityResources" ADD CONSTRAINT "PK_IdentityResources" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table PersistedGrants
-- ----------------------------
CREATE INDEX "IX_PersistedGrants_Expiration" ON "public"."PersistedGrants" USING btree (
  "Expiration" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "IX_PersistedGrants_SubjectId_ClientId_Type" ON "public"."PersistedGrants" USING btree (
  "SubjectId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClientId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IX_PersistedGrants_SubjectId_SessionId_Type" ON "public"."PersistedGrants" USING btree (
  "SubjectId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "SessionId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table PersistedGrants
-- ----------------------------
ALTER TABLE "public"."PersistedGrants" ADD CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key");

-- ----------------------------
-- Foreign Keys structure for table ApiResourceClaims
-- ----------------------------
ALTER TABLE "public"."ApiResourceClaims" ADD CONSTRAINT "FK_ApiResourceClaims_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "public"."ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ApiResourceProperties
-- ----------------------------
ALTER TABLE "public"."ApiResourceProperties" ADD CONSTRAINT "FK_ApiResourceProperties_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "public"."ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ApiResourceScopes
-- ----------------------------
ALTER TABLE "public"."ApiResourceScopes" ADD CONSTRAINT "FK_ApiResourceScopes_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "public"."ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ApiResourceSecrets
-- ----------------------------
ALTER TABLE "public"."ApiResourceSecrets" ADD CONSTRAINT "FK_ApiResourceSecrets_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "public"."ApiResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ApiScopeClaims
-- ----------------------------
ALTER TABLE "public"."ApiScopeClaims" ADD CONSTRAINT "FK_ApiScopeClaims_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "public"."ApiScopes" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ApiScopeProperties
-- ----------------------------
ALTER TABLE "public"."ApiScopeProperties" ADD CONSTRAINT "FK_ApiScopeProperties_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "public"."ApiScopes" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table AspNeUserTokens
-- ----------------------------
ALTER TABLE "public"."AspNeUserTokens" ADD CONSTRAINT "FK_AspNeUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "public"."AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table AspNetRoleClaims
-- ----------------------------
ALTER TABLE "public"."AspNetRoleClaims" ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "public"."AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table AspNetUserClaims
-- ----------------------------
ALTER TABLE "public"."AspNetUserClaims" ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "public"."AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table AspNetUserLogins
-- ----------------------------
ALTER TABLE "public"."AspNetUserLogins" ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "public"."AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table AspNetUserRoles
-- ----------------------------
ALTER TABLE "public"."AspNetUserRoles" ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "public"."AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."AspNetUserRoles" ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "public"."AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientClaims
-- ----------------------------
ALTER TABLE "public"."ClientClaims" ADD CONSTRAINT "FK_ClientClaims_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientCorsOrigins
-- ----------------------------
ALTER TABLE "public"."ClientCorsOrigins" ADD CONSTRAINT "FK_ClientCorsOrigins_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientGrantTypes
-- ----------------------------
ALTER TABLE "public"."ClientGrantTypes" ADD CONSTRAINT "FK_ClientGrantTypes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientIdPRestrictions
-- ----------------------------
ALTER TABLE "public"."ClientIdPRestrictions" ADD CONSTRAINT "FK_ClientIdPRestrictions_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientPostLogoutRedirectUris
-- ----------------------------
ALTER TABLE "public"."ClientPostLogoutRedirectUris" ADD CONSTRAINT "FK_ClientPostLogoutRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientProperties
-- ----------------------------
ALTER TABLE "public"."ClientProperties" ADD CONSTRAINT "FK_ClientProperties_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientRedirectUris
-- ----------------------------
ALTER TABLE "public"."ClientRedirectUris" ADD CONSTRAINT "FK_ClientRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientScopes
-- ----------------------------
ALTER TABLE "public"."ClientScopes" ADD CONSTRAINT "FK_ClientScopes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ClientSecrets
-- ----------------------------
ALTER TABLE "public"."ClientSecrets" ADD CONSTRAINT "FK_ClientSecrets_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "public"."Clients" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table IdentityResourceClaims
-- ----------------------------
ALTER TABLE "public"."IdentityResourceClaims" ADD CONSTRAINT "FK_IdentityResourceClaims_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES "public"."IdentityResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table IdentityResourceProperties
-- ----------------------------
ALTER TABLE "public"."IdentityResourceProperties" ADD CONSTRAINT "FK_IdentityResourceProperties_IdentityResources_IdentityResour~" FOREIGN KEY ("IdentityResourceId") REFERENCES "public"."IdentityResources" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
