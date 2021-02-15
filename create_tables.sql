DROP DATABASE IF EXISTS inventory_db;
CREATE DATABASE inventory_db;
USE inventory_db;

SET NAMES utf8;
SET character_set_client = utf8mb4 ;

CREATE TABLE deliveries (
	DeliveryId int NOT NULL AUTO_INCREMENT,
	DeliveryDate date NOT NULL,
	UserName varchar(40) NOT NULL,
    PRIMARY KEY (DeliveryId)) ;

CREATE TABLE materials (
	MaterialId int NOT NULL AUTO_INCREMENT,
    MaterialName varchar(40) NOT NULL,
    Health tinyint NOT NULL,
    Flammability tinyint NOT NULL,
    Reactivity tinyint NOT NULL,
    PPR char(1) NOT NULL,
    ShelfLife smallint NOT NULL,
    PRIMARY KEY (MaterialId)) ;
    
CREATE TABLE primaryLocations (
	PrimaryLocationId int NOT NULL auto_increment,
    PrimaryLocationName varchar(40) NOT NULL,
    primary key (PrimaryLocationId)) ;
    
CREATE TABLE locations (
	LocationId int NOT NULL AUTO_INCREMENT,
    LocationName varchar(40) NOT NULL,
    PrimaryLocationId int NOT NULL,
    LocationDescription varchar(60),
    PRIMARY KEY (LocationId),
    CONSTRAINT FK_PrimaryLocationId FOREIGN KEY (PrimaryLocationId)
    REFERENCES primarylocations(PrimaryLocationId) ) ;
    
CREATE TABLE items (
	ItemId int NOT NULL AUTO_INCREMENT,
	ItemStatus varchar(40) NOT NULL,
    Container varchar(40) NOT NULL,
    Quantity int NOT NULL,
    Units varchar(12) NOT NULL,
    Supplier varchar(40),
    Lot varchar(40),
    ExpirationDate date NOT NULL,
    DeliveryId int NOT NULL,
    MaterialId int NOT NULL,
    LocationId int NOT NULL,
    PRIMARY KEY (ItemId),
    CONSTRAINT FK_DeliveryId foreign key (DeliveryId) REFERENCES deliveries(DeliveryId),
    CONSTRAINT FK_MaterialId FOREIGN KEY (MaterialId) REFERENCES materials(MaterialId),
    CONSTRAINT FK_LocationId FOREIGN KEY (LocationId) REFERENCES locations(LocationId) ) ;
