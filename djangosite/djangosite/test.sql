-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: mydb9.surf-town.net
-- Generation Time: Feb 24, 2017 at 04:18 PM
-- Server version: 5.6.35-log
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hansjac_SP`
--
--CREATE DATABASE IF NOT EXISTS `hansjac_SP` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
--USE `hansjac_SP`;

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
CREATE TABLE IF NOT EXISTS `availability` (
  `persID` int(11) NOT NULL,
  `training` tinyint(4) NOT NULL,
  `subTraining` tinyint(4) NOT NULL,
  `events` tinyint(4) NOT NULL,
  `subEvents` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`commentID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `replyToID` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `body` text,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1166 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
`contentID` int(11) NOT NULL,
  `teamID` int(11) DEFAULT NULL,
  `contentCat` int(11) DEFAULT NULL,
  `public` tinyint(4) NOT NULL DEFAULT '1',
  `menuNo` int(11) DEFAULT NULL,
  `menuTitle` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `image` blob,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
CREATE TABLE IF NOT EXISTS `diary` (
`diaryID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `eventID` int(11) NOT NULL DEFAULT '0',
  `persID` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `image` blob,
  `galleryLink` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equalisations`
--

DROP TABLE IF EXISTS `equalisations`;
CREATE TABLE IF NOT EXISTS `equalisations` (
`equalID` int(11) NOT NULL,
  `persID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `payedToPersID` int(11) DEFAULT NULL,
  `equalAmount` float DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
`eventID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `recurrenceID` int(11) DEFAULT '-1',
  `eventName` varchar(150) NOT NULL DEFAULT '',
  `city` varchar(150) DEFAULT '',
  `dateStart` datetime DEFAULT NULL,
  `dateEnd` datetime DEFAULT NULL,
  `description` text,
  `eventUrl` varchar(128) DEFAULT '',
  `noPers` int(8) DEFAULT NULL,
  `maxWeight` float DEFAULT NULL,
  `invitationStatus` int(4) NOT NULL DEFAULT '0',
  `reminderMail` tinyint(4) NOT NULL DEFAULT '1',
  `reminderSMS` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1784 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expences`
--

DROP TABLE IF EXISTS `expences`;
CREATE TABLE IF NOT EXISTS `expences` (
`ecoID` int(11) NOT NULL,
  `persID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `post` varchar(50) DEFAULT NULL,
  `expence` float DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=729 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expenceToPers`
--

DROP TABLE IF EXISTS `expenceToPers`;
CREATE TABLE IF NOT EXISTS `expenceToPers` (
  `ecoID` int(11) DEFAULT NULL,
  `persID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
`faqID` int(11) NOT NULL,
  `question` varchar(128) DEFAULT NULL,
  `answer` text,
  `views` int(11) DEFAULT '0',
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
`galleryID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `persID` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `description` text,
  `private` tinyint(4) DEFAULT '0',
  `open` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpTable`
--

DROP TABLE IF EXISTS `helpTable`;
CREATE TABLE IF NOT EXISTS `helpTable` (
  `helpName` varchar(64) NOT NULL,
  `helpText` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
`linkID` int(11) NOT NULL,
  `teamID` int(11) DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mainTeam`
--

DROP TABLE IF EXISTS `mainTeam`;
CREATE TABLE IF NOT EXISTS `mainTeam` (
`teamID` int(11) NOT NULL,
  `teamURLName` varchar(64) NOT NULL DEFAULT '',
  `teamName` varchar(128) NOT NULL DEFAULT '',
  `sport` varchar(128) DEFAULT 'Sejlads',
  `noPers` int(11) NOT NULL DEFAULT '5',
  `maxWeight` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `templateID` int(11) DEFAULT NULL,
  `color1` varchar(7) DEFAULT '#ffffff',
  `color2` varchar(7) DEFAULT '#000000',
  `color3` varchar(7) DEFAULT '#4682B4',
  `color4` varchar(7) DEFAULT '#808080',
  `color5` varchar(7) DEFAULT '#ffffff',
  `color6` varchar(7) DEFAULT '#00ff00',
  `color7` varchar(7) NOT NULL DEFAULT '#ffffff',
  `color8` varchar(7) NOT NULL DEFAULT '#e4e4e4',
  `topImg` longblob,
  `smsReminder` tinyint(4) NOT NULL DEFAULT '1',
  `mailReminder` tinyint(4) NOT NULL DEFAULT '1',
  `stateReminder` tinyint(4) NOT NULL DEFAULT '1',
  `sendSMSOK` tinyint(4) NOT NULL DEFAULT '0',
  `maxImageSize` int(11) NOT NULL DEFAULT '100'
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `noSMS`
--

DROP TABLE IF EXISTS `noSMS`;
CREATE TABLE IF NOT EXISTS `noSMS` (
  `teamID` int(11) NOT NULL,
  `noSMS` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persCategory`
--

DROP TABLE IF EXISTS `persCategory`;
CREATE TABLE IF NOT EXISTS `persCategory` (
  `teamID` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `catName` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pics`
--

DROP TABLE IF EXISTS `pics`;
CREATE TABLE IF NOT EXISTS `pics` (
`picID` int(11) NOT NULL,
  `galleryID` int(11) DEFAULT NULL,
  `teamID` int(11) NOT NULL DEFAULT '0',
  `persID` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `description` text,
  `fileType` varchar(16) NOT NULL DEFAULT 'jpg',
  `youtubeLink` varchar(512) NOT NULL,
  `imgdata` longblob,
  `thumbdata` longblob,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1278 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `persID` int(11) NOT NULL,
  `skipper` tinyint(4) NOT NULL DEFAULT '0',
  `tactic` tinyint(4) NOT NULL DEFAULT '0',
  `main` tinyint(4) NOT NULL DEFAULT '0',
  `genoa` tinyint(4) NOT NULL DEFAULT '0',
  `tailor` tinyint(4) NOT NULL DEFAULT '0',
  `grinder` tinyint(4) NOT NULL DEFAULT '0',
  `pit` tinyint(4) NOT NULL DEFAULT '0',
  `deck` tinyint(4) NOT NULL DEFAULT '0',
  `mast` tinyint(4) NOT NULL DEFAULT '0',
  `other` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posNeg`
--

DROP TABLE IF EXISTS `posNeg`;
CREATE TABLE IF NOT EXISTS `posNeg` (
  `eventID` int(11) NOT NULL DEFAULT '0',
  `persID` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `raceDiary`
--

DROP TABLE IF EXISTS `raceDiary`;
CREATE TABLE IF NOT EXISTS `raceDiary` (
`raceDiaryID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `persID` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `conditions` text,
  `positiveBoatHandling` text,
  `positiveTactics` text,
  `positiveOther` text,
  `negativeBoatHandling` text,
  `negativeTactics` text,
  `negativeOther` text,
  `learned` text,
  `trainingFocus` text,
  `other` text,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reminderLog`
--

DROP TABLE IF EXISTS `reminderLog`;
CREATE TABLE IF NOT EXISTS `reminderLog` (
  `persID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `stateReminder` tinyint(4) DEFAULT '0',
  `stateSendDate` datetime NOT NULL,
  `mailReminder` tinyint(4) DEFAULT '0',
  `mailSendDate` datetime NOT NULL,
  `smsReminder` tinyint(4) DEFAULT '0',
  `smsSendDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
CREATE TABLE IF NOT EXISTS `sponsor` (
`sponsorID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `image` blob,
  `URL` varchar(256) DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stat`
--

DROP TABLE IF EXISTS `stat`;
CREATE TABLE IF NOT EXISTS `stat` (
`statID` int(11) NOT NULL,
  `teamID` int(11) DEFAULT NULL,
  `visitTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `firstVisit` tinyint(4) NOT NULL DEFAULT '0',
  `userAgent` varchar(128) DEFAULT NULL,
  `referer` varchar(64) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=382502 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
`persID` int(11) NOT NULL,
  `admin` tinyint(4) DEFAULT '0',
  `adminEditOK` tinyint(4) DEFAULT '1',
  `category` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `passwd` varchar(150) DEFAULT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `mobile` int(11) DEFAULT NULL,
  `tele` int(11) DEFAULT NULL,
  `workTele` int(11) DEFAULT NULL,
  `street` varchar(150) DEFAULT '',
  `postCode` int(11) DEFAULT NULL,
  `City` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `publicInfo` tinyint(4) NOT NULL DEFAULT '1',
  `comment` text,
  `imgdata` blob,
  `thumbdata` blob,
  `position` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `birthday` int(11) NOT NULL,
  `club` varchar(128) NOT NULL,
  `proffesion` varchar(128) NOT NULL,
  `history` text NOT NULL,
  `account` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `sex` varchar(8) NOT NULL,
  `level` int(11) NOT NULL,
  `weight` float NOT NULL,
  `lastLogin` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teamToMember`
--

DROP TABLE IF EXISTS `teamToMember`;
CREATE TABLE IF NOT EXISTS `teamToMember` (
  `teamID` int(11) NOT NULL DEFAULT '0',
  `persID` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
 ADD PRIMARY KEY (`persID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
 ADD PRIMARY KEY (`contentID`);

--
-- Indexes for table `diary`
--
ALTER TABLE `diary`
 ADD PRIMARY KEY (`diaryID`);

--
-- Indexes for table `equalisations`
--
ALTER TABLE `equalisations`
 ADD PRIMARY KEY (`equalID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `expences`
--
ALTER TABLE `expences`
 ADD PRIMARY KEY (`ecoID`);

--
-- Indexes for table `expenceToPers`
--
ALTER TABLE `expenceToPers`
 ADD UNIQUE KEY `ecoID` (`ecoID`,`persID`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
 ADD PRIMARY KEY (`faqID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`galleryID`);

--
-- Indexes for table `helpTable`
--
ALTER TABLE `helpTable`
 ADD PRIMARY KEY (`helpName`), ADD UNIQUE KEY `helpName` (`helpName`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
 ADD PRIMARY KEY (`linkID`);

--
-- Indexes for table `mainTeam`
--
ALTER TABLE `mainTeam`
 ADD PRIMARY KEY (`teamID`), ADD UNIQUE KEY `teamURLName` (`teamURLName`);

--
-- Indexes for table `persCategory`
--
ALTER TABLE `persCategory`
 ADD UNIQUE KEY `teamID` (`teamID`,`category`);

--
-- Indexes for table `pics`
--
ALTER TABLE `pics`
 ADD PRIMARY KEY (`picID`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
 ADD PRIMARY KEY (`persID`);

--
-- Indexes for table `posNeg`
--
ALTER TABLE `posNeg`
 ADD UNIQUE KEY `uni` (`eventID`,`persID`);

--
-- Indexes for table `raceDiary`
--
ALTER TABLE `raceDiary`
 ADD PRIMARY KEY (`raceDiaryID`);

--
-- Indexes for table `reminderLog`
--
ALTER TABLE `reminderLog`
 ADD UNIQUE KEY `persID` (`persID`,`eventID`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
 ADD PRIMARY KEY (`sponsorID`);

--
-- Indexes for table `stat`
--
ALTER TABLE `stat`
 ADD PRIMARY KEY (`statID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
 ADD PRIMARY KEY (`persID`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `teamToMember`
--
ALTER TABLE `teamToMember`
 ADD UNIQUE KEY `teamID` (`teamID`,`persID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1166;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
MODIFY `contentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=372;
--
-- AUTO_INCREMENT for table `diary`
--
ALTER TABLE `diary`
MODIFY `diaryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT for table `equalisations`
--
ALTER TABLE `equalisations`
MODIFY `equalID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=356;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1784;
--
-- AUTO_INCREMENT for table `expences`
--
ALTER TABLE `expences`
MODIFY `ecoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=729;
--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
MODIFY `faqID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `galleryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
MODIFY `linkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `mainTeam`
--
ALTER TABLE `mainTeam`
MODIFY `teamID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `pics`
--
ALTER TABLE `pics`
MODIFY `picID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1278;
--
-- AUTO_INCREMENT for table `raceDiary`
--
ALTER TABLE `raceDiary`
MODIFY `raceDiaryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
MODIFY `sponsorID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stat`
--
ALTER TABLE `stat`
MODIFY `statID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=382502;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
MODIFY `persID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=299;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
