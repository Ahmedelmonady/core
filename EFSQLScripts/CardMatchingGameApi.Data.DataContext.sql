CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    PRIMARY KEY (`MigrationId`)
);

START TRANSACTION;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515044714_InitialMigration')
BEGIN
    CREATE TABLE `Categories` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `CategoryName` varchar(100) NOT NULL,
        PRIMARY KEY (`Id`)
    );
END;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515044714_InitialMigration')
BEGIN
    CREATE TABLE `Cards` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Url` text NOT NULL,
        `CardName` text NOT NULL,
        `CategoryId` int NOT NULL,
        PRIMARY KEY (`Id`),
        CONSTRAINT `FK_Cards_Categories_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`Id`) ON DELETE CASCADE
    );
END;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515044714_InitialMigration')
BEGIN
    CREATE INDEX `IX_Cards_CategoryId` ON `Cards` (`CategoryId`);
END;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515044714_InitialMigration')
BEGIN
    CREATE UNIQUE INDEX `IX_Categories_CategoryName` ON `Categories` (`CategoryName`);
END;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515044714_InitialMigration')
BEGIN
    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20210515044714_InitialMigration', '5.0.6');
END;

COMMIT;

START TRANSACTION;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515232450_AddedCategoryImageUrl')
BEGIN
    ALTER TABLE `Categories` ADD `ImageUrl` text NOT NULL;
END;

IF NOT EXISTS(SELECT * FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210515232450_AddedCategoryImageUrl')
BEGIN
    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20210515232450_AddedCategoryImageUrl', '5.0.6');
END;

COMMIT;

