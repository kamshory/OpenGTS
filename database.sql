DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`accountType` SMALLINT UNSIGNED COMMENT 'Account Type',
	`notifyEmail` VARCHAR(128) COMMENT 'Notification EMail Address',
	`speedUnits` TINYINT UNSIGNED COMMENT 'Speed Units',
	`distanceUnits` TINYINT UNSIGNED COMMENT 'Distance Units',
	`volumeUnits` TINYINT UNSIGNED COMMENT 'Volume Units',
	`pressureUnits` TINYINT UNSIGNED COMMENT 'Pressure Units',
	`economyUnits` TINYINT UNSIGNED COMMENT 'Economy Units',
	`temperatureUnits` TINYINT UNSIGNED COMMENT 'Temperature Units',
	`latLonFormat` TINYINT UNSIGNED COMMENT 'Latitude/Longitude Format',
	`geocoderMode` TINYINT UNSIGNED COMMENT 'Geocoder Mode',
	`privateLabelName` VARCHAR(32) COMMENT 'PrivateLabel Name',
	`isBorderCrossing` TINYINT COMMENT 'Is BorderCrossing Enabled',
	`retainedEventAge` INT UNSIGNED COMMENT 'Retained Event Age (sec)',
	`maximumDevices` INT COMMENT 'Maximum number of devices',
	`totalPingCount` SMALLINT UNSIGNED COMMENT 'Total \'Ping\' Count',
	`maxPingCount` SMALLINT UNSIGNED COMMENT 'Maximum \'Ping\' Count',
	`autoAddDevices` TINYINT COMMENT 'AutoAdd Devices',
	`dcsPropertiesID` VARCHAR(32) COMMENT 'DCS Properties ID',
	`expirationTime` INT UNSIGNED COMMENT 'Expiration Time',
	`defaultUser` VARCHAR(32) COMMENT 'Default User ID',
	`password` VARCHAR(32) COMMENT 'Password',
	`contactName` VARCHAR(64)  COMMENT 'Contact Name',
	`contactPhone` VARCHAR(32) COMMENT 'Contact Phone',
	`contactEmail` VARCHAR(128) COMMENT 'Contact EMail Address',
	`timeZone` VARCHAR(32) COMMENT 'Time Zone',
	`passwdQueryTime` INT UNSIGNED COMMENT 'Last Password Query Time',
	`lastLoginTime` INT UNSIGNED COMMENT 'Last Login Time',
	`isActive` TINYINT COMMENT 'Is Active',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`),
	KEY `email` (`contactEmail`)
);

DROP TABLE IF EXISTS `AccountString`;

CREATE TABLE `AccountString`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`stringID` VARCHAR(32) COMMENT 'String ID',
	`singularTitle` VARCHAR(64) COMMENT 'Singular Title',
	`pluralTitle` VARCHAR(64) COMMENT 'Plural Title',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `stringID`)
);

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`userID` VARCHAR(32) COMMENT 'User ID',
	`userType` SMALLINT UNSIGNED COMMENT 'User Type',
	`roleID` VARCHAR(32) COMMENT 'User Role',
	`password` VARCHAR(32) COMMENT 'Password',
	`gender` TINYINT UNSIGNED COMMENT 'Gender',
	`notifyEmail` VARCHAR(128) COMMENT 'Notification EMail Address',
	`contactName` VARCHAR(64)  COMMENT 'Contact Name',
	`contactPhone` VARCHAR(32) COMMENT 'Contact Phone',
	`contactEmail` VARCHAR(64) COMMENT 'Contact EMail Address',
	`timeZone` VARCHAR(32) COMMENT 'Time Zone',
	`firstLoginPageID` VARCHAR(24) COMMENT 'First Login Page ID',
	`preferredDeviceID` VARCHAR(32) COMMENT 'Preferred Device ID',
	`maxAccessLevel` SMALLINT UNSIGNED COMMENT 'Maximum Access Level',
	`passwdQueryTime` INT UNSIGNED COMMENT 'Last Password Query Time',
	`lastLoginTime` INT UNSIGNED COMMENT 'Last Login Time',
	`isActive` TINYINT COMMENT 'Is Active',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `userID`),
	KEY `role` (`roleID`),
	KEY `email` (`contactEmail`)
);

DROP TABLE IF EXISTS `UserAcl`;

CREATE TABLE `UserAcl`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`userID` VARCHAR(32) COMMENT 'User ID',
	`aclID` VARCHAR(64) COMMENT 'ACL ID',
	`accessLevel` SMALLINT UNSIGNED COMMENT 'Access Level',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `userID`, `aclID`)
);

DROP TABLE IF EXISTS `GroupList`;

CREATE TABLE `GroupList`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`userID` VARCHAR(32) COMMENT 'User ID',
	`groupID` VARCHAR(32) COMMENT 'Device Group ID',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `userID`, `groupID`)
);

DROP TABLE IF EXISTS `Device`;

CREATE TABLE `Device`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`groupID` VARCHAR(32) COMMENT 'Group ID',
	`equipmentType` VARCHAR(40) COMMENT 'Equipment Type',
	`vehicleID` VARCHAR(24) COMMENT 'VIN',
	`licensePlate` VARCHAR(24) COMMENT 'License Plate',
	`driverID` VARCHAR(32) COMMENT 'Driver ID',
	`fuelCapacity` DOUBLE COMMENT 'Fuel Capacity',
	`fuelEconomy` DOUBLE COMMENT 'Approx. Fuel Economy',
	`speedLimitKPH` DOUBLE COMMENT 'Max Speed km/h',
	`expirationTime` INT UNSIGNED COMMENT 'Expiration Time',
	`uniqueID` VARCHAR(40) COMMENT 'Unique ID',
	`deviceCode` VARCHAR(24) COMMENT 'Server ID',
	`deviceType` VARCHAR(24) COMMENT 'Device Type',
	`dcsPropertiesID` VARCHAR(32) COMMENT 'DCS Properties ID',
	`pushpinID` VARCHAR(32) COMMENT 'Pushpin ID',
	`displayColor` VARCHAR(16) COMMENT 'Display Color',
	`serialNumber` VARCHAR(24) COMMENT 'Serial Number',
	`simPhoneNumber` VARCHAR(24) COMMENT 'SIM Phone Number',
	`smsEmail` VARCHAR(64) COMMENT 'SMS EMail Address',
	`imeiNumber` VARCHAR(24) COMMENT 'IMEI Number',
	`dataKey` TEXT COMMENT 'Data Key',
	`ignitionIndex` SMALLINT COMMENT 'Ignition I/O Index',
	`codeVersion` VARCHAR(32) COMMENT 'Code Version',
	`featureSet` VARCHAR(64) COMMENT 'Feature Set',
	`ipAddressValid` VARCHAR(128) COMMENT 'Valid IP Addresses',
	`lastTotalConnectTime` INT UNSIGNED COMMENT 'Last Total Connect Time',
	`lastDuplexConnectTime` INT UNSIGNED COMMENT 'Last Duplex Connect Time',
	`pendingPingCommand` TEXT COMMENT 'Pending Ping Command',
	`lastPingTime` INT UNSIGNED COMMENT 'Last \'Ping\' Time',
	`totalPingCount` SMALLINT UNSIGNED COMMENT 'Total \'Ping\' Count',
	`maxPingCount` SMALLINT UNSIGNED COMMENT 'Maximum \'Ping\' Count',
	`expectAck` TINYINT COMMENT 'Expecting an ACK',
	`lastAckCommand` TEXT COMMENT 'Last Command Expecting ACK',
	`lastAckTime` INT UNSIGNED COMMENT 'Last Received \'ACK\' Time',
	`dcsConfigMask` INT UNSIGNED COMMENT 'DCS Configuration Mask',
	`supportsDMTP` TINYINT COMMENT 'Supports DMTP',
	`supportedEncodings` TINYINT UNSIGNED COMMENT 'Supported Encodings',
	`unitLimitInterval` SMALLINT UNSIGNED COMMENT 'Accounting Time Interval Min',
	`maxAllowedEvents` SMALLINT UNSIGNED COMMENT 'Max Events per Interval',
	`totalProfileMask` BLOB COMMENT 'Total Profile Mask',
	`totalMaxConn` SMALLINT UNSIGNED COMMENT 'Max Total Conn per Interval',
	`totalMaxConnPerMin` SMALLINT UNSIGNED COMMENT 'Max Total Conn per Minute',
	`duplexProfileMask` BLOB COMMENT 'Duplex Profile Mask',
	`duplexMaxConn` SMALLINT UNSIGNED COMMENT 'Max Duplex Conn per Interval',
	`duplexMaxConnPerMin` SMALLINT UNSIGNED COMMENT 'Max Duplex Conn per Minute',
	`ipAddressCurrent` VARCHAR(32) COMMENT 'Current IP Address',
	`remotePortCurrent` SMALLINT UNSIGNED COMMENT 'Current Remote Port',
	`listenPortCurrent` SMALLINT UNSIGNED COMMENT 'Current Listen Port',
	`lastInputState` INT UNSIGNED COMMENT 'Last Input State',
	`lastBatteryLevel` DOUBLE COMMENT 'Last Battery Level',
	`lastFuelLevel` DOUBLE COMMENT 'Last Fuel Level',
	`lastFuelTotal` DOUBLE COMMENT 'Last Fuel Total Liters',
	`lastOilLevel` DOUBLE COMMENT 'Last Oil Level',
	`lastValidLatitude` DOUBLE COMMENT 'Last Valid Latitude',
	`lastValidLongitude` DOUBLE COMMENT 'Last Valid Longitude',
	`lastValidHeading` DOUBLE COMMENT 'Last Valid Heading',
	`lastGPSTimestamp` INT UNSIGNED COMMENT 'Last Valid GPS Timestamp',
	`lastCellServingInfo` VARCHAR(100) COMMENT 'Last Serving Cell Info',
	`lastOdometerKM` DOUBLE COMMENT 'Last Odometer km',
	`odometerOffsetKM` DOUBLE COMMENT 'Odometer Offset km',
	`lastEngineHours` DOUBLE COMMENT 'Last Engine Hours',
	`isActive` TINYINT COMMENT 'Is Active',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `deviceID`),
	KEY `altIndex` (`uniqueID`)
);

DROP TABLE IF EXISTS `Transport`;

CREATE TABLE `Transport`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`transportID` VARCHAR(32) COMMENT 'Transport ID',
	`assocAccountID` VARCHAR(32) COMMENT 'Associated Account ID',
	`assocDeviceID` VARCHAR(32) COMMENT 'Associated Device ID',
	`uniqueID` VARCHAR(40) COMMENT 'Unique ID',
	`deviceCode` VARCHAR(24) COMMENT 'Device Code',
	`deviceType` VARCHAR(24) COMMENT 'Device Type',
	`serialNumber` VARCHAR(24) COMMENT 'Serial Number',
	`simPhoneNumber` VARCHAR(24) COMMENT 'SIM Phone Number',
	`smsEmail` VARCHAR(64) COMMENT 'SMS EMail Address',
	`imeiNumber` VARCHAR(24) COMMENT 'IMEI Number',
	`lastInputState` INT UNSIGNED COMMENT 'Last Input State',
	`ignitionIndex` SMALLINT UNSIGNED COMMENT 'Ignition I/O Index',
	`codeVersion` VARCHAR(32) COMMENT 'Code Version',
	`featureSet` VARCHAR(64) COMMENT 'Feature Set',
	`ipAddressValid` VARCHAR(128) COMMENT 'Valid IP Addresses',
	`ipAddressCurrent` VARCHAR(32) COMMENT 'Current IP Address',
	`remotePortCurrent` SMALLINT UNSIGNED COMMENT 'Current Remote Port',
	`listenPortCurrent` SMALLINT UNSIGNED COMMENT 'Current Listen Port',
	`pendingPingCommand` TEXT COMMENT 'Pending Ping Command',
	`lastPingTime` INT UNSIGNED COMMENT 'Last \'Ping\' Time',
	`totalPingCount` SMALLINT UNSIGNED COMMENT 'Total \'Ping\' Count',
	`maxPingCount` SMALLINT UNSIGNED COMMENT 'Maximum \'Ping\' Count',
	`expectAck` TINYINT COMMENT 'Expecting an ACK',
	`lastAckCommand` TEXT COMMENT 'Last Command Expecting an ACK',
	`lastAckTime` INT UNSIGNED COMMENT 'Last Received \'ACK\' Time',
	`supportsDMTP` TINYINT COMMENT 'Supports DMTP',
	`supportedEncodings` TINYINT UNSIGNED COMMENT 'Supported Encodings',
	`unitLimitInterval` SMALLINT UNSIGNED COMMENT 'Accounting Time Interval Min',
	`maxAllowedEvents` SMALLINT UNSIGNED COMMENT 'Max Events per Interval',
	`totalProfileMask` BLOB COMMENT 'Total Profile Mask',
	`totalMaxConn` SMALLINT UNSIGNED COMMENT 'Max Total Conn per Interval',
	`totalMaxConnPerMin` SMALLINT UNSIGNED COMMENT 'Max Total Conn per Minute',
	`duplexProfileMask` BLOB COMMENT 'Duplex Profile Mask',
	`duplexMaxConn` SMALLINT UNSIGNED COMMENT 'Max Duplex Conn per Interval',
	`duplexMaxConnPerMin` SMALLINT UNSIGNED COMMENT 'Max Duplex Conn per Minute',
	`lastTotalConnectTime` INT UNSIGNED COMMENT 'Last Total Connect Time',
	`lastDuplexConnectTime` INT UNSIGNED COMMENT 'Last Duplex Connect Time',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `transportID`),
	KEY `device` (`assocAccountID`, `assocDeviceID`),
	KEY `altIndex` (`uniqueID`)
);

DROP TABLE IF EXISTS `UniqueXID`;

CREATE TABLE `UniqueXID`
(
	`uniqueID` VARCHAR(40) COMMENT 'Unique ID',
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`transportID` VARCHAR(32) COMMENT 'Transport ID',
	PRIMARY KEY (`uniqueID`)
);

DROP TABLE IF EXISTS `DeviceGroup`;

CREATE TABLE `DeviceGroup`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`groupID` VARCHAR(32) COMMENT 'Device Group ID',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `groupID`)
);

DROP TABLE IF EXISTS `DeviceList`;

CREATE TABLE `DeviceList`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`groupID` VARCHAR(32) COMMENT 'Device Group ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `groupID`, `deviceID`)
);

DROP TABLE IF EXISTS `Driver`;

CREATE TABLE `Driver`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`driverID` VARCHAR(32) COMMENT 'Driver ID',
	`contactPhone` VARCHAR(32) COMMENT 'Contact Phone',
	`contactEmail` VARCHAR(128) COMMENT 'Contact EMail',
	`licenseType` VARCHAR(24) COMMENT 'License Type',
	`licenseNumber` VARCHAR(32) COMMENT 'License Number',
	`licenseExpire` INT UNSIGNED COMMENT 'License Expiration Day',
	`badgeID` VARCHAR(32) COMMENT 'Badge ID',
	`address` VARCHAR(90)  COMMENT 'Full Address',
	`birthdate` INT UNSIGNED COMMENT 'Driver Birthdate',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `driverID`)
);

DROP TABLE IF EXISTS `EventData`;

CREATE TABLE `EventData`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`timestamp` INT UNSIGNED COMMENT 'Timestamp',
	`statusCode` INT UNSIGNED COMMENT 'Status Code',
	`latitude` DOUBLE COMMENT 'Latitude',
	`longitude` DOUBLE COMMENT 'Longitude',
	`gpsAge` INT UNSIGNED COMMENT 'GPS Fix Age',
	`speedKPH` DOUBLE COMMENT 'Speed',
	`heading` DOUBLE COMMENT 'Heading',
	`altitude` DOUBLE COMMENT 'Altitude',
	`transportID` VARCHAR(32) COMMENT 'Transport ID',
	`inputMask` INT UNSIGNED COMMENT 'Input Mask',
	`address` VARCHAR(90)  COMMENT 'Full Address',
	`dataSource` VARCHAR(32) COMMENT 'Data Source',
	`rawData` TEXT COMMENT 'Raw Data',
	`distanceKM` DOUBLE COMMENT 'Distance KM',
	`odometerKM` DOUBLE COMMENT 'Odometer KM',
	`geozoneIndex` INT UNSIGNED COMMENT 'Geozone Index',
	`geozoneID` VARCHAR(32) COMMENT 'Geozone ID',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `deviceID`, `timestamp`, `statusCode`)
);

DROP TABLE IF EXISTS `Geozone`;

CREATE TABLE `Geozone`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`geozoneID` VARCHAR(32) COMMENT 'Geozone ID',
	`sortID` INT UNSIGNED COMMENT 'Sort ID',
	`minLatitude` DOUBLE COMMENT 'Min Latitude',
	`maxLatitude` DOUBLE COMMENT 'Max Latitude',
	`minLongitude` DOUBLE COMMENT 'Min Longitude',
	`maxLongitude` DOUBLE COMMENT 'Max Longitude',
	`reverseGeocode` TINYINT COMMENT 'Reverse geocode',
	`arrivalZone` TINYINT COMMENT 'Arrival Zone',
	`departureZone` TINYINT COMMENT 'Departure Zone',
	`autoNotify` TINYINT COMMENT 'Auto Notify',
	`zoomRegion` TINYINT COMMENT 'Zoom Region',
	`shapeColor` VARCHAR(12) COMMENT 'Shape Color',
	`zoneType` TINYINT UNSIGNED COMMENT 'Zone Type',
	`radius` INT UNSIGNED COMMENT 'Radius Meters',
	`latitude1` DOUBLE COMMENT 'Latitude 1',
	`longitude1` DOUBLE COMMENT 'Longitude 1',
	`latitude2` DOUBLE COMMENT 'Latitude 2',
	`longitude2` DOUBLE COMMENT 'Longitude 2',
	`latitude3` DOUBLE COMMENT 'Latitude 3',
	`longitude3` DOUBLE COMMENT 'Longitude 3',
	`latitude4` DOUBLE COMMENT 'Latitude 4',
	`longitude4` DOUBLE COMMENT 'Longitude 4',
	`latitude5` DOUBLE COMMENT 'Latitude 5',
	`longitude5` DOUBLE COMMENT 'Longitude 5',
	`latitude6` DOUBLE COMMENT 'Latitude 6',
	`longitude6` DOUBLE COMMENT 'Longitude 6',
	`latitude7` DOUBLE COMMENT 'Latitude 7',
	`longitude7` DOUBLE COMMENT 'Longitude 7',
	`latitude8` DOUBLE COMMENT 'Latitude 8',
	`longitude8` DOUBLE COMMENT 'Longitude 8',
	`clientUpload` TINYINT COMMENT 'Client Upload',
	`clientID` INT UNSIGNED COMMENT 'Client ID',
	`streetAddress` VARCHAR(90)  COMMENT 'Street Address',
	`city` VARCHAR(40)  COMMENT 'City',
	`stateProvince` VARCHAR(40)  COMMENT 'State/Province',
	`postalCode` VARCHAR(16)  COMMENT 'Postal Code',
	`country` VARCHAR(40)  COMMENT 'Country',
	`subdivision` VARCHAR(32)  COMMENT 'Subdivision',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `geozoneID`, `sortID`),
	KEY `bounds` (`minLatitude`, `maxLatitude`, `minLongitude`, `maxLongitude`),
	KEY `altIndex` (`clientID`)
);

DROP TABLE IF EXISTS `Resource`;

CREATE TABLE `Resource`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`resourceID` VARCHAR(64) COMMENT 'Resource ID',
	`type` VARCHAR(16) COMMENT 'Type',
	`title` VARCHAR(70)  COMMENT 'Title',
	`properties` TEXT COMMENT 'Properties',
	`value` BLOB COMMENT 'Value',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `resourceID`)
);

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`roleID` VARCHAR(32) COMMENT 'Role ID',
	`displayName` VARCHAR(40)  COMMENT 'Display Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`notes` TEXT  COMMENT 'Notes',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `roleID`)
);

DROP TABLE IF EXISTS `RoleAcl`;

CREATE TABLE `RoleAcl`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`roleID` VARCHAR(32) COMMENT 'Role ID',
	`aclID` VARCHAR(64) COMMENT 'ACL ID',
	`accessLevel` SMALLINT UNSIGNED COMMENT 'Access Level',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `roleID`, `aclID`)
);

DROP TABLE IF EXISTS `StatusCode`;

CREATE TABLE `StatusCode`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`statusCode` INT UNSIGNED COMMENT 'Status Code',
	`statusName` VARCHAR(18) COMMENT 'Status Name',
	`foregroundColor` VARCHAR(10) COMMENT 'Foreground Color',
	`backgroundColor` VARCHAR(10) COMMENT 'Background Color',
	`iconSelector` VARCHAR(128) COMMENT 'Icon Selector',
	`iconName` VARCHAR(24) COMMENT 'Icon Name',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`accountID`, `deviceID`, `statusCode`)
);

DROP TABLE IF EXISTS `SystemProps`;

CREATE TABLE `SystemProps`
(
	`propertyID` VARCHAR(32) COMMENT 'Property ID',
	`value` TEXT  COMMENT 'Value',
	`description` VARCHAR(128)  COMMENT 'Description',
	`lastUpdateTime` INT UNSIGNED COMMENT 'Last Update Time',
	`creationTime` INT UNSIGNED COMMENT 'Creation Time',
	PRIMARY KEY (`propertyID`)
);

DROP TABLE IF EXISTS `EventTemplate`;

CREATE TABLE `EventTemplate`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`customType` TINYINT UNSIGNED COMMENT 'Custom Type',
	`repeatLast` TINYINT COMMENT 'Repeat Last',
	`template` TEXT COMMENT 'Template',
	PRIMARY KEY (`accountID`, `deviceID`, `customType`)
);

DROP TABLE IF EXISTS `PendingPacket`;

CREATE TABLE `PendingPacket`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`queueTime` INT UNSIGNED COMMENT 'Packet Queue Time',
	`sequence` SMALLINT UNSIGNED COMMENT 'Sequence',
	`packetBytes` MEDIUMBLOB COMMENT 'Packet Bytes',
	`autoDelete` TINYINT COMMENT 'Delete after sending',
	PRIMARY KEY (`accountID`, `deviceID`, `queueTime`, `sequence`)
);

DROP TABLE IF EXISTS `Property`;

CREATE TABLE `Property`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`propKey` INT UNSIGNED COMMENT 'Property Key',
	`timestamp` INT UNSIGNED COMMENT 'Timestamp',
	`binaryValue` BLOB COMMENT 'Binary Value',
	PRIMARY KEY (`accountID`, `deviceID`, `propKey`)
);

DROP TABLE IF EXISTS `Diagnostic`;

CREATE TABLE `Diagnostic`
(
	`accountID` VARCHAR(32) COMMENT 'Account ID',
	`deviceID` VARCHAR(32) COMMENT 'Device/Asset ID',
	`isError` TINYINT COMMENT 'Is Error',
	`codeKey` INT UNSIGNED COMMENT 'Code Key',
	`timestamp` INT UNSIGNED COMMENT 'Timestamp',
	`binaryValue` BLOB COMMENT 'Binary Value',
	PRIMARY KEY (`accountID`, `deviceID`, `isError`, `codeKey`, `timestamp`)
);

DROP TABLE IF EXISTS `EventData`;

CREATE TABLE `EventData` (
  `accountID` varchar(32) NOT NULL,
  `deviceID` varchar(32) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  `statusCode` int(10) unsigned NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `gpsAge` int(10) unsigned DEFAULT NULL,
  `speedKPH` double DEFAULT NULL,
  `heading` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `transportID` varchar(32) DEFAULT NULL,
  `inputMask` int(10) unsigned DEFAULT NULL,
  `address` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `dataSource` varchar(32) DEFAULT NULL,
  `rawData` text,
  `distanceKM` double DEFAULT NULL,
  `odometerKM` double DEFAULT NULL,
  `geozoneIndex` int(10) unsigned DEFAULT NULL,
  `geozoneID` varchar(32) DEFAULT NULL,
  `creationTime` int(10) unsigned DEFAULT NULL,
  `streetAddress` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `stateProvince` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `postalCode` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `subdivision` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `speedLimitKPH` double DEFAULT NULL,
  `isTollRoad` tinyint(4) DEFAULT NULL,
  `gpsFixType` smallint(5) unsigned DEFAULT NULL,
  `horzAccuracy` double DEFAULT NULL,
  `vertAccuracy` double DEFAULT NULL,
  `HDOP` double DEFAULT NULL,
  `satelliteCount` smallint(5) unsigned DEFAULT NULL,
  `batteryLevel` double DEFAULT NULL,
  `signalStrength` double DEFAULT NULL,
  `entityID` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `driverID` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `driverMessage` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `sensorLow` int(10) unsigned DEFAULT NULL,
  `sensorHigh` int(10) unsigned DEFAULT NULL,
  `dataPush` tinyint(4) DEFAULT NULL,
  `costCenter` int(10) unsigned DEFAULT NULL,
  `jobNumber` varchar(32) DEFAULT NULL,
  `rfidTag` varchar(32) DEFAULT NULL,
  `fuelUsage` double DEFAULT NULL,
  `fuelLevel` double DEFAULT NULL,
  `fuelEconomy` double DEFAULT NULL,
  `fuelTotal` double DEFAULT NULL,
  `fuelIdle` double DEFAULT NULL,
  `fuelPTO` double DEFAULT NULL,
  `engineRpm` int(10) unsigned DEFAULT NULL,
  `engineHours` double DEFAULT NULL,
  `engineLoad` double DEFAULT NULL,
  `idleHours` double DEFAULT NULL,
  `transOilTemp` double DEFAULT NULL,
  `coolantLevel` double DEFAULT NULL,
  `coolantTemp` double DEFAULT NULL,
  `intakeTemp` double DEFAULT NULL,
  `brakeGForce` double DEFAULT NULL,
  `acceleration` double DEFAULT NULL,
  `brakePressure` double DEFAULT NULL,
  `oilPressure` double DEFAULT NULL,
  `oilLevel` double DEFAULT NULL,
  `oilTemp` double DEFAULT NULL,
  `airPressure` double DEFAULT NULL,
  `ptoEngaged` tinyint(4) DEFAULT NULL,
  `ptoHours` double DEFAULT NULL,
  `throttlePos` double DEFAULT NULL,
  `brakePos` double DEFAULT NULL,
  `vBatteryVolts` double DEFAULT NULL,
  `j1708Fault` bigint(20) unsigned DEFAULT NULL,
  `barometer` double DEFAULT NULL,
  `ambientTemp` double DEFAULT NULL,
  `thermoAverage0` double DEFAULT NULL,
  `thermoAverage1` double DEFAULT NULL,
  `thermoAverage2` double DEFAULT NULL,
  `thermoAverage3` double DEFAULT NULL,
  `dayEngineStarts` smallint(5) unsigned DEFAULT NULL,
  `dayIdleHours` double DEFAULT NULL,
  `dayFuelIdle` double DEFAULT NULL,
  `dayWorkHours` double DEFAULT NULL,
  `dayFuelWork` double DEFAULT NULL,
  `dayFuelPTO` double DEFAULT NULL,
  `dayDistanceKM` double DEFAULT NULL,
  `dayFuelTotal` double DEFAULT NULL,
  `mobileCountryCode` int(11) DEFAULT NULL,
  `mobileNetworkCode` int(11) DEFAULT NULL,
  `cellTimingAdvance` int(11) DEFAULT NULL,
  `cellLatitude` double DEFAULT NULL,
  `cellLongitude` double DEFAULT NULL,
  `cellServingInfo` varchar(80) DEFAULT NULL,
  `cellNeighborInfo0` varchar(80) DEFAULT NULL,
  `cellNeighborInfo1` varchar(80) DEFAULT NULL,
  `cellNeighborInfo2` varchar(80) DEFAULT NULL,
  `cellNeighborInfo3` varchar(80) DEFAULT NULL,
  `cellNeighborInfo4` varchar(80) DEFAULT NULL,
  `cellNeighborInfo5` varchar(80) DEFAULT NULL,
  `sampleIndex` int(11) DEFAULT NULL,
  `sampleID` varchar(32) DEFAULT NULL,
  `creationMillis` bigint(20) DEFAULT NULL,
  `driverStatus` int(10) unsigned DEFAULT NULL,
  `etaTimestamp` int(10) unsigned DEFAULT NULL,
  `etaUniqueID` int(10) unsigned DEFAULT NULL,
  `etaDistanceKM` double DEFAULT NULL,
  `etaLatitude` double DEFAULT NULL,
  `etaLongitude` double DEFAULT NULL,
  `stopID` int(10) unsigned DEFAULT NULL,
  `stopStatus` smallint(5) unsigned DEFAULT NULL,
  `stopIndex` smallint(6) DEFAULT NULL,
  `fuelTemp` double DEFAULT NULL,
  `engineTorque` double DEFAULT NULL,
  `airFilterPressure` double DEFAULT NULL,
  `cabinTemp` double DEFAULT NULL,
  `fuelPressure` double DEFAULT NULL,
  `locationAreaCode` int(11) DEFAULT NULL,
  `cellTowerID` int(11) DEFAULT NULL,
  `cellAccuracy` double DEFAULT NULL,
  `batteryVolts` double DEFAULT NULL,
  `faultCode` varchar(96) DEFAULT NULL,
  `attachType` varchar(64) DEFAULT NULL,
  `attachData` blob,
  `tirePressure` varchar(140) DEFAULT NULL,
  `tireTemp` varchar(140) DEFAULT NULL,
  `workHours` double DEFAULT NULL,
  `turboPressure` double DEFAULT NULL,
  `malfunctionLamp` tinyint(4) DEFAULT NULL,
  `analog0` double DEFAULT NULL,
  `analog1` double DEFAULT NULL,
  `analog2` double DEFAULT NULL,
  `analog3` double DEFAULT NULL,
  `thermoAverage4` double DEFAULT NULL,
  `thermoAverage5` double DEFAULT NULL,
  `thermoAverage6` double DEFAULT NULL,
  `thermoAverage7` double DEFAULT NULL,
  `pulseCount` double DEFAULT NULL,
  `outputMask` int(10) unsigned DEFAULT NULL,
  `fuelEngineOn` double DEFAULT NULL,
  `engineOnHours` double DEFAULT NULL,
  `massAirFlowRate` double DEFAULT NULL,
  `fuelTrip` double DEFAULT NULL,
  `fuelLevel2` double DEFAULT NULL,
  `tankLevel` double DEFAULT NULL,
  `odometerOffsetKM` double DEFAULT NULL,
  `gpsFixStatus` int(10) unsigned DEFAULT NULL,
  `entityType` smallint(5) unsigned DEFAULT NULL,
  `priority` smallint(5) unsigned DEFAULT NULL,
  `accelerometerXYZ` varchar(32) DEFAULT NULL,
  `seatbeltMask` int(10) unsigned DEFAULT NULL,
  `fuelRemain` double DEFAULT NULL,
  `tripStartTime` int(10) unsigned DEFAULT NULL,
  `tripStopTime` int(10) unsigned DEFAULT NULL,
  `tripDistanceKM` double DEFAULT NULL,
  `tripIdleHours` double DEFAULT NULL,
  `tripMaxSpeedKPH` double DEFAULT NULL,
  `tripMaxRpm` int(10) unsigned DEFAULT NULL,
  `tripStartLatitude` double DEFAULT NULL,
  `tripStartLongitude` double DEFAULT NULL,
  `tripElapsedSeconds` int(11) DEFAULT NULL,
  `batteryTemp` double DEFAULT NULL,
  `tripPtoHours` double DEFAULT NULL,
  `tripBrakeCount` int(11) DEFAULT NULL,
  `tripClutchCount` int(11) DEFAULT NULL,
  `workDistanceKM` double DEFAULT NULL,
  `ptoDistanceKM` double DEFAULT NULL,
  `messageTimestamp` int(10) unsigned DEFAULT NULL,
  `messageID` bigint(20) DEFAULT NULL,
  `messageStatus` smallint(5) unsigned DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `oilCoolerInTemp` double DEFAULT NULL,
  `oilCoolerOutTemp` double DEFAULT NULL,
  `engineTemp` double DEFAULT NULL,
  PRIMARY KEY (`accountID`,`deviceID`,`timestamp`,`statusCode`),
  KEY `adtkey` (`accountID`,`deviceID`,`timestamp`),
  KEY `pushkey` (`creationMillis`,`dataPush`)
);
