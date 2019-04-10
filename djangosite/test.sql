-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: mydb9.surf-town.net
-- Generation Time: Feb 24, 2017 at 04:18 PM
-- Server version: 5.6.35-log
-- PHP Version: 5.6.30-0+deb8u1

/*SET SQL_MODE = NO_AUTO_VALUE_ON_ZERO*/;
/*SET time_zone = +00:00*/;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: hansjac_SP
--
--CREATE DATABASE IF NOT EXISTS hansjac_SP DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
--USE hansjac_SP;

-- --------------------------------------------------------

--
-- Table structure for table availability
--

DROP TABLE IF EXISTS availability;
CREATE TABLE IF NOT EXISTS availability (
  persID integer[11] NOT NULL,
  training smallint[4] NOT NULL,
  subTraining smallint[4] NOT NULL,
  events smallint[4] NOT NULL,
  subEvents smallint[4] NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table comments
--

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
commentID integer[11] NOT NULL,
  teamID integer[11] NOT NULL,
  type varchar[16] DEFAULT NULL,
  ID integer[11] NOT NULL,
  replyToID integer[11] DEFAULT NULL,
  name varchar[64] DEFAULT NULL,
  subject varchar[256] DEFAULT NULL,
  body text,
  date timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table contents
--

DROP TABLE IF EXISTS contents;
CREATE TABLE IF NOT EXISTS contents (
contentID integer[11] NOT NULL,
  teamID integer[11] DEFAULT NULL,
  contentCat integer[11] DEFAULT NULL,
  public integer NOT NULL DEFAULT 1,
  menuNo integer[11] DEFAULT NULL,
  menuTitle varchar[128] DEFAULT NULL,
  title varchar[128] DEFAULT NULL,
  content text,
  image BYTEA,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table diary
--

DROP TABLE IF EXISTS diary;
CREATE TABLE IF NOT EXISTS diary (
diaryID integer[11] NOT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  eventID integer[11] NOT NULL DEFAULT 0,
  persID integer[11] NOT NULL DEFAULT 0,
  title varchar[128] DEFAULT NULL,
  content text,
  image BYTEA,
  galleryLink integer[11] DEFAULT NULL,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table equalisations
--

DROP TABLE IF EXISTS equalisations;
CREATE TABLE IF NOT EXISTS equalisations (
equalID integer[11] NOT NULL,
  persID integer[11] DEFAULT NULL,
  eventID integer[11] DEFAULT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  payedToPersID integer[11] DEFAULT NULL,
  equalAmount float DEFAULT NULL,
  date timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table events
--

DROP TABLE IF EXISTS events;
CREATE TABLE IF NOT EXISTS events (
eventID integer[11] NOT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  recurrenceID integer[11] DEFAULT -1,
  eventName varchar[150] NOT NULL DEFAULT " ",
  city varchar[150] DEFAULT " " ,
  dateStart timestamp DEFAULT NULL,
  dateEnd timestamp DEFAULT NULL,
  description text,
  eventUrl varchar[128] DEFAULT " ",
  noPers integer[8] DEFAULT NULL,
  maxWeight float DEFAULT NULL,
  invitationStatus integer[4] NOT NULL DEFAULT 0,
  reminderMail smallint[4] NOT NULL DEFAULT 1,
  reminderSMS smallint[4] NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table expences
--

DROP TABLE IF EXISTS expences;
CREATE TABLE IF NOT EXISTS expences (
ecoID integer[11] NOT NULL,
  persID integer[11] DEFAULT NULL,
  eventID integer[11] DEFAULT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  post varchar(50) DEFAULT NULL,
  expence float DEFAULT NULL,
  date timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table expenceToPers
--

DROP TABLE IF EXISTS expenceToPers;
CREATE TABLE IF NOT EXISTS expenceToPers (
  ecoID integer[11] DEFAULT NULL,
  persID integer[11] DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table faqs
--

DROP TABLE IF EXISTS faqs;
CREATE TABLE IF NOT EXISTS faqs (
faqID integer[11] NOT NULL,
  question varchar[128] DEFAULT NULL,
  answer text,
  views integer[11] DEFAULT 0,
  date timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table gallery
--

DROP TABLE IF EXISTS gallery;
CREATE TABLE IF NOT EXISTS gallery (
galleryID integer[11] NOT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  persID integer[11] NOT NULL DEFAULT 0,
  title varchar[128] DEFAULT NULL,
  description text,
  private smallint[4] DEFAULT 0,
  open smallint[4] NOT NULL DEFAULT 0,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table helpTable
--

DROP TABLE IF EXISTS helpTable;
CREATE TABLE IF NOT EXISTS helpTable (
  helpName varchar[64] NOT NULL,
  helpText text NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table links
--

DROP TABLE IF EXISTS links;
CREATE TABLE IF NOT EXISTS links (
linkID integer[11] NOT NULL,
  teamID integer[11] DEFAULT NULL,
  category varchar[64] DEFAULT NULL,
  title varchar[64] DEFAULT NULL,
  url varchar[128] DEFAULT NULL,
  comment varchar[128] DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table mainTeam
--

DROP TABLE IF EXISTS mainTeam;
CREATE TABLE IF NOT EXISTS mainTeam (
teamID integer[11] NOT NULL,
  teamURLName varchar[64] NOT NULL DEFAULT " ",
  teamName varchar[128] NOT NULL DEFAULT " ",
  sport varchar[128] DEFAULT Sejlads,
  noPers integer[11] NOT NULL DEFAULT 5,
  maxWeight float DEFAULT NULL,
  created timestamp DEFAULT NULL,
  hits integer[11] DEFAULT NULL,
  templateID integer[11] DEFAULT NULL,
  color1 varchar[7] DEFAULT "#ffffff",
  color2 varchar[7] DEFAULT "#000000",
  color3 varchar[7] DEFAULT "#4682B4",
  color4 varchar[7] DEFAULT "#808080",
  color5 varchar[7] DEFAULT "#ffffff",
  color6 varchar[7] DEFAULT "#00ff00",
  color7 varchar[7] NOT NULL DEFAULT "#ffffff",
  color8 varchar[7] NOT NULL DEFAULT "#e4e4e4",
  topImg longblob,
  smsReminder smallint[4] NOT NULL DEFAULT 1,
  mailReminder smallint[4] NOT NULL DEFAULT 1,
  stateReminder smallint[4] NOT NULL DEFAULT 1,
  sendSMSOK smallint[4] NOT NULL DEFAULT 0,
  maxImageSize integer[11] NOT NULL DEFAULT 100
);

-- --------------------------------------------------------

--
-- Table structure for table noSMS
--

DROP TABLE IF EXISTS noSMS;
CREATE TABLE IF NOT EXISTS noSMS (
  teamID integer[11] NOT NULL,
  noSMS integer[11] DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table persCategory
--

DROP TABLE IF EXISTS persCategory;
CREATE TABLE IF NOT EXISTS persCategory (
  teamID integer[11] DEFAULT NULL,
  category integer[11] DEFAULT NULL,
  catName varchar[32] DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table pics
--

DROP TABLE IF EXISTS pics;
CREATE TABLE IF NOT EXISTS pics (
picID integer[11] NOT NULL,
  galleryID integer[11] DEFAULT NULL,
  teamID integer[11] NOT NULL DEFAULT 0,
  persID integer[11] NOT NULL DEFAULT 0,
  title varchar[128] DEFAULT NULL,
  description text,
  fileType varchar[16] NOT NULL DEFAULT jpg,
  youtubeLink varchar(512) NOT NULL,
  imgdata longblob,
  thumbdata longblob,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table positions
--

DROP TABLE IF EXISTS positions;
CREATE TABLE IF NOT EXISTS positions (
  persID integer[11] NOT NULL,
  skipper smallint[4] NOT NULL DEFAULT 0,
  tactic smallint[4] NOT NULL DEFAULT 0,
  main smallint[4] NOT NULL DEFAULT 0,
  genoa smallint[4] NOT NULL DEFAULT 0,
  tailor smallint[4] NOT NULL DEFAULT 0,
  grinder smallint[4] NOT NULL DEFAULT 0,
  pit smallint[4] NOT NULL DEFAULT 0,
  deck smallint[4] NOT NULL DEFAULT 0,
  mast smallint[4] NOT NULL DEFAULT 0,
  other smallint[4] NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table posNeg
--

DROP TABLE IF EXISTS posNeg;
CREATE TABLE IF NOT EXISTS posNeg (
  eventID integer[11] NOT NULL DEFAULT 0,
  persID integer[11] NOT NULL DEFAULT 0,
  state smallint[4] DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table raceDiary
--

DROP TABLE IF EXISTS raceDiary;
CREATE TABLE IF NOT EXISTS raceDiary (
raceDiaryID integer[11] NOT NULL,
  teamID integer[11] NOT NULL,
  eventID integer[11] NOT NULL,
  persID integer[11] NOT NULL,
  title varchar[256] DEFAULT NULL,
  conditions text,
  positiveBoatHandling text,
  positiveTactics text,
  positiveOther text,
  negativeBoatHandling text,
  negativeTactics text,
  negativeOther text,
  learned text,
  trainingFocus text,
  other text,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table reminderLog
--

DROP TABLE IF EXISTS reminderLog;
CREATE TABLE IF NOT EXISTS reminderLog (
  persID integer[11] DEFAULT NULL,
  eventID integer[11] DEFAULT NULL,
  stateReminder smallint[4] DEFAULT 0,
  stateSendDate timestamp NOT NULL,
  mailReminder smallint[4] DEFAULT 0,
  mailSendDate timestamp NOT NULL,
  smsReminder smallint[4] DEFAULT 0,
  smsSendDate timestamp NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table sponsor
--

DROP TABLE IF EXISTS sponsor;
CREATE TABLE IF NOT EXISTS sponsor (
sponsorID integer[11] NOT NULL,
  teamID integer[11] NOT NULL,
  title varchar[128] DEFAULT NULL,
  content text,
  image BYTEA,
  URL varchar[256] DEFAULT NULL,
  orderNo integer[11] DEFAULT NULL,
  created timestamp DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table stat
--

DROP TABLE IF EXISTS stat;
CREATE TABLE IF NOT EXISTS stat (
statID integer[11] NOT NULL,
  teamID integer[11] DEFAULT NULL,
  visitTime timestamp NOT NULL DEFAULT "0000-00-00 00:00:00",
  firstVisit smallint[4] NOT NULL DEFAULT 0,
  userAgent varchar[128] DEFAULT NULL,
  referer varchar[64] DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table team
--

DROP TABLE IF EXISTS team;
CREATE TABLE IF NOT EXISTS team (
persID integer[11] NOT NULL,
  admin smallint[4] DEFAULT 0,
  adminEditOK smallint[4] DEFAULT 1,
  category integer[11] DEFAULT NULL,
  active smallint[4] DEFAULT 1,
  passwd varchar[150] DEFAULT NULL,
  name varchar[150] NOT NULL DEFAULT " ",
  mobile integer[11] DEFAULT NULL,
  tele integer[11] DEFAULT NULL,
  workTele integer[11] DEFAULT NULL,
  street varchar[150] DEFAULT " ",
  postCode integer[11] DEFAULT NULL,
  City varchar[150] DEFAULT NULL,
  email varchar[150] DEFAULT NULL,
  publicInfo smallint[4] NOT NULL DEFAULT 1,
  comment text,
  imgdata BYTEA,
  thumbdata BYTEA,
  position varchar[128] NOT NULL,
  description text NOT NULL,
  birthday integer[11] NOT NULL,
  club varchar[128] NOT NULL,
  proffesion varchar[128] NOT NULL,
  history text NOT NULL,
  account varchar[32] NOT NULL,
  created timestamp NOT NULL,
  sex varchar[4] NOT NULL,
  level integer[11] NOT NULL,
  weight float NOT NULL,
  lastLogin timestamp NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table teamToMember
--

DROP TABLE IF EXISTS teamToMember;
CREATE TABLE IF NOT EXISTS teamToMember (
  teamID integer[11] NOT NULL DEFAULT 0,
  persID integer[11] NOT NULL DEFAULT 0,
  category integer[11] NOT NULL,
  active smallint[4] NOT NULL DEFAULT 1,
  admin smallint[4] NOT NULL DEFAULT 0
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table availability
--
ALTER TABLE availability
 ADD PRIMARY KEY (persID);

--
-- Indexes for table comments
--
ALTER TABLE comments
 ADD PRIMARY KEY (commentID);

--
-- Indexes for table contents
--
ALTER TABLE contents
 ADD PRIMARY KEY (contentID);

--
-- Indexes for table diary
--
ALTER TABLE diary
 ADD PRIMARY KEY (diaryID);

--
-- Indexes for table equalisations
--
ALTER TABLE equalisations
 ADD PRIMARY KEY (equalID);

--
-- Indexes for table events
--
ALTER TABLE events
 ADD PRIMARY KEY (eventID);

--
-- Indexes for table expences
--
ALTER TABLE expences
 ADD PRIMARY KEY (ecoID);

--
-- Indexes for table faqs
--
ALTER TABLE faqs
 ADD PRIMARY KEY (faqID);

--
-- Indexes for table gallery
--
ALTER TABLE gallery
 ADD PRIMARY KEY (galleryID);

--
-- Indexes for table helpTable
--
ALTER TABLE helpTable
 ADD PRIMARY KEY (helpName);

--
-- Indexes for table links
--
ALTER TABLE links
 ADD PRIMARY KEY (linkID);

--
-- Indexes for table mainTeam
--
ALTER TABLE mainTeam
 ADD PRIMARY KEY (teamID);


--
-- Indexes for table pics
--
ALTER TABLE pics
 ADD PRIMARY KEY (picID);

--
-- Indexes for table positions
--
ALTER TABLE positions
 ADD PRIMARY KEY (persID);


--
-- Indexes for table raceDiary
--
ALTER TABLE raceDiary
 ADD PRIMARY KEY (raceDiaryID);


--
-- Indexes for table sponsor
--
ALTER TABLE sponsor
 ADD PRIMARY KEY (sponsorID);

--
-- Indexes for table stat
--
ALTER TABLE stat
 ADD PRIMARY KEY (statID);

--
-- Indexes for table team
--
ALTER TABLE team
 ADD PRIMARY KEY (persID);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
