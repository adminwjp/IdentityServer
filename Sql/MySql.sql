/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : IdentityServer

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 07/11/2020 00:58:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ApiResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS `ApiResourceClaims`;
CREATE TABLE `ApiResourceClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApiResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_ApiResourceClaims_ApiResourceId`(`ApiResourceId`) USING BTREE,
  CONSTRAINT `FK_ApiResourceClaims_ApiResources_ApiResourceId` FOREIGN KEY (`ApiResourceId`) REFERENCES `apiresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS `ApiResourceProperties`;
CREATE TABLE `ApiResourceProperties`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApiResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_ApiResourceProperties_ApiResourceId`(`ApiResourceId`) USING BTREE,
  CONSTRAINT `FK_ApiResourceProperties_ApiResources_ApiResourceId` FOREIGN KEY (`ApiResourceId`) REFERENCES `apiresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiResourceScopes
-- ----------------------------
DROP TABLE IF EXISTS `ApiResourceScopes`;
CREATE TABLE `ApiResourceScopes`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Scope` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApiResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ApiResourceScopes_ApiResources_ApiResourceId`(`ApiResourceId`) USING BTREE,
  CONSTRAINT `FK_ApiResourceScopes_ApiResources_ApiResourceId` FOREIGN KEY (`ApiResourceId`) REFERENCES `apiresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiResourceSecrets
-- ----------------------------
DROP TABLE IF EXISTS `ApiResourceSecrets`;
CREATE TABLE `ApiResourceSecrets`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Expiration` datetime NULL DEFAULT NULL,
  `Type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Created` datetime NOT NULL,
  `ApiResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ApiResourceSecrets_ApiResources_ApiResourceId`(`ApiResourceId`) USING BTREE,
  CONSTRAINT `FK_ApiResourceSecrets_ApiResources_ApiResourceId` FOREIGN KEY (`ApiResourceId`) REFERENCES `apiresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiResources
-- ----------------------------
DROP TABLE IF EXISTS `ApiResources`;
CREATE TABLE `ApiResources`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Enabled` tinyint(1) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AllowedAccessTokenSigningAlgorithms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ShowInDiscoveryDocument` tinyint(1) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NULL DEFAULT NULL,
  `LastAccessed` datetime NULL DEFAULT NULL,
  `NonEditable` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiScopeClaims
-- ----------------------------
DROP TABLE IF EXISTS `ApiScopeClaims`;
CREATE TABLE `ApiScopeClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ScopeId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ApiScopeClaims_ApiScopes_ScopeId`(`ScopeId`) USING BTREE,
  CONSTRAINT `FK_ApiScopeClaims_ApiScopes_ScopeId` FOREIGN KEY (`ScopeId`) REFERENCES `apiscopes` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiScopeProperties
-- ----------------------------
DROP TABLE IF EXISTS `ApiScopeProperties`;
CREATE TABLE `ApiScopeProperties`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ScopeId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ApiScopeProperties_ApiScopes_ScopeId`(`ScopeId`) USING BTREE,
  CONSTRAINT `FK_ApiScopeProperties_ApiScopes_ScopeId` FOREIGN KEY (`ScopeId`) REFERENCES `apiscopes` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ApiScopes
-- ----------------------------
DROP TABLE IF EXISTS `ApiScopes`;
CREATE TABLE `ApiScopes`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Enabled` tinyint(1) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Required` tinyint(1) NOT NULL,
  `Emphasize` tinyint(1) NOT NULL,
  `ShowInDiscoveryDocument` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNeUserTokens
-- ----------------------------
DROP TABLE IF EXISTS `AspNeUserTokens`;
CREATE TABLE `AspNeUserTokens`  (
  `UserId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LoginProvider` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`, `Name`) USING BTREE,
  CONSTRAINT `FK_AspNeUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetRoleClaims
-- ----------------------------
DROP TABLE IF EXISTS `AspNetRoleClaims`;
CREATE TABLE `AspNetRoleClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_AspNetRoleClaims_AspNetRoles_RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetRoles
-- ----------------------------
DROP TABLE IF EXISTS `AspNetRoles`;
CREATE TABLE `AspNetRoles`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetUserClaims
-- ----------------------------
DROP TABLE IF EXISTS `AspNetUserClaims`;
CREATE TABLE `AspNetUserClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_AspNetUserClaims_AspNetUsers_UserId`(`UserId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetUserLogins
-- ----------------------------
DROP TABLE IF EXISTS `AspNetUserLogins`;
CREATE TABLE `AspNetUserLogins`  (
  `LoginProvider` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProviderKey` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `UserId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`, `ProviderKey`) USING BTREE,
  INDEX `FK_AspNetUserLogins_AspNetUsers_UserId`(`UserId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetUserRoles
-- ----------------------------
DROP TABLE IF EXISTS `AspNetUserRoles`;
CREATE TABLE `AspNetUserRoles`  (
  `UserId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RoleId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UserId`, `RoleId`) USING BTREE,
  INDEX `FK_AspNetUserRoles_AspNetRoles_RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for AspNetUsers
-- ----------------------------
DROP TABLE IF EXISTS `AspNetUsers`;
CREATE TABLE `AspNetUsers`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `CardNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `SecurityNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `Expiration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `CardHolderName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `CardType` int(11)  NULL,
  `Street` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `City` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `State` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `Country` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `ZipCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  `LastName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientClaims
-- ----------------------------
DROP TABLE IF EXISTS `ClientClaims`;
CREATE TABLE `ClientClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientClaims_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientClaims_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientCorsOrigins
-- ----------------------------
DROP TABLE IF EXISTS `ClientCorsOrigins`;
CREATE TABLE `ClientCorsOrigins`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Origin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientCorsOrigins_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientCorsOrigins_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientGrantTypes
-- ----------------------------
DROP TABLE IF EXISTS `ClientGrantTypes`;
CREATE TABLE `ClientGrantTypes`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `GrantType` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientGrantTypes_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientGrantTypes_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientIdPRestrictions
-- ----------------------------
DROP TABLE IF EXISTS `ClientIdPRestrictions`;
CREATE TABLE `ClientIdPRestrictions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Provider` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientIdPRestrictions_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientIdPRestrictions_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientPostLogoutRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS `ClientPostLogoutRedirectUris`;
CREATE TABLE `ClientPostLogoutRedirectUris`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PostLogoutRedirectUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientPostLogoutRedirectUris_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientPostLogoutRedirectUris_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientProperties
-- ----------------------------
DROP TABLE IF EXISTS `ClientProperties`;
CREATE TABLE `ClientProperties`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientProperties_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientProperties_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientRedirectUris
-- ----------------------------
DROP TABLE IF EXISTS `ClientRedirectUris`;
CREATE TABLE `ClientRedirectUris`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientRedirectUris_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientRedirectUris_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientScopes
-- ----------------------------
DROP TABLE IF EXISTS `ClientScopes`;
CREATE TABLE `ClientScopes`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Scope` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientScopes_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientScopes_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ClientSecrets
-- ----------------------------
DROP TABLE IF EXISTS `ClientSecrets`;
CREATE TABLE `ClientSecrets`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Expiration` datetime NULL DEFAULT NULL,
  `Type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Created` datetime NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_ClientSecrets_Clients_ClientId`(`ClientId`) USING BTREE,
  CONSTRAINT `FK_ClientSecrets_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Clients
-- ----------------------------
DROP TABLE IF EXISTS `Clients`;
CREATE TABLE `Clients`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Enabled` tinyint(1) NOT NULL,
  `ClientId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProtocolType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RequireClientSecret` tinyint(1) NOT NULL,
  `ClientName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClientUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LogoUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RequireConsent` tinyint(1) NOT NULL,
  `AllowRememberConsent` tinyint(1) NOT NULL,
  `AlwaysIncludeUserClaimsInIdToken` tinyint(1) NOT NULL,
  `RequirePkce` tinyint(1) NOT NULL,
  `AllowPlainTextPkce` tinyint(1) NOT NULL,
  `RequireRequestObject` tinyint(1) NOT NULL,
  `AllowAccessTokensViaBrowser` tinyint(1) NOT NULL,
  `FrontChannelLogoutUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FrontChannelLogoutSessionRequired` tinyint(1) NOT NULL,
  `BackChannelLogoutUri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BackChannelLogoutSessionRequired` tinyint(1) NOT NULL,
  `AllowOfflineAccess` tinyint(1) NOT NULL,
  `IdentityTokenLifetime` int(11) NOT NULL,
  `AllowedIdentityTokenSigningAlgorithms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AccessTokenLifetime` int(11) NOT NULL,
  `AuthorizationCodeLifetime` int(11) NOT NULL,
  `ConsentLifetime` int(11) NULL DEFAULT NULL,
  `AbsoluteRefreshTokenLifetime` int(11) NOT NULL,
  `SlidingRefreshTokenLifetime` int(11) NOT NULL,
  `RefreshTokenUsage` int(11) NOT NULL,
  `UpdateAccessTokenClaimsOnRefresh` tinyint(1) NOT NULL,
  `RefreshTokenExpiration` int(11) NOT NULL,
  `AccessTokenType` int(11) NOT NULL,
  `EnableLocalLogin` tinyint(1) NOT NULL,
  `IncludeJwtId` tinyint(1) NOT NULL,
  `AlwaysSendClientClaims` tinyint(1) NOT NULL,
  `ClientClaimsPrefix` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PairWiseSubjectSalt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NULL DEFAULT NULL,
  `LastAccessed` datetime NULL DEFAULT NULL,
  `UserSsoLifetime` int(11) NULL DEFAULT NULL,
  `UserCodeType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeviceCodeLifetime` int(11) NOT NULL,
  `NonEditable` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for DeviceCodes
-- ----------------------------
DROP TABLE IF EXISTS `DeviceCodes`;
CREATE TABLE `DeviceCodes`  (
  `UserCode` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DeviceCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SubjectId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SessionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClientId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  `Expiration` datetime NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UserCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for IdentityResourceClaims
-- ----------------------------
DROP TABLE IF EXISTS `IdentityResourceClaims`;
CREATE TABLE `IdentityResourceClaims`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdentityResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_IdentityResourceClaims_IdentityResources_IdentityResourceId`(`IdentityResourceId`) USING BTREE,
  CONSTRAINT `FK_IdentityResourceClaims_IdentityResources_IdentityResourceId` FOREIGN KEY (`IdentityResourceId`) REFERENCES `identityresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for IdentityResourceProperties
-- ----------------------------
DROP TABLE IF EXISTS `IdentityResourceProperties`;
CREATE TABLE `IdentityResourceProperties`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdentityResourceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_IdentityResourceProperties_IdentityResources_IdentityResourc~`(`IdentityResourceId`) USING BTREE,
  CONSTRAINT `FK_IdentityResourceProperties_IdentityResources_IdentityResourc~` FOREIGN KEY (`IdentityResourceId`) REFERENCES `identityresources` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for IdentityResources
-- ----------------------------
DROP TABLE IF EXISTS `IdentityResources`;
CREATE TABLE `IdentityResources`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Enabled` tinyint(1) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Required` tinyint(1) NOT NULL,
  `Emphasize` tinyint(1) NOT NULL,
  `ShowInDiscoveryDocument` tinyint(1) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NULL DEFAULT NULL,
  `NonEditable` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for PersistedGrants
-- ----------------------------
DROP TABLE IF EXISTS `PersistedGrants`;
CREATE TABLE `PersistedGrants`  (
  `Key` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SubjectId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SessionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClientId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  `Expiration` datetime NOT NULL,
  `ConsumedTime` datetime NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory`  (
  `MigrationId` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
