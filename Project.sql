CREATE TABLE PLATFORM
(
	Platform_ID		VARCHAR(7)		NOT NULL PRIMARY KEY,
	Name			VARCHAR(20)		NOT NULL 		,
	Manufacturer	VARCHAR(15)
);

	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('pc','PC', NULL);
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('snes','Super Nintendo', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps', 'PlayStation', 'Sony');

CREATE TABLE ESRB
(
	ESRB_Rtng		VARCHAR(3)		NOT NULL PRIMARY KEY,
	Title			VARCHAR(20)		NOT NULL UNIQUE		,
	Description		VARCHAR(500) 	NOT NULL
);

	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('EC', 'Early Childhood', 'Content is intended for young children.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('E', 'Everyone', 'Content is generally suitable for all ages. May contain minimal cartoon, fantasy, or mild violence and/or infrequent use of mild language.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('E10', 'Everyone 10+', 'Content is generally suitable for ages 10 and up. May contain more cartoon, fantasy, or mild violence, mild language, and/or minimal suggestive themes.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('T', 'Teen', 'Content is generally suitable for ages 13 and up. May contain violence, suggestive themes, crude humor, minimal blood, simulated gambling, and/or infrequent use of strong language.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('M', 'Mature', 'Content is generally suitable for ages 17 and up. May contain intense violence, blood and gore, sexual content, and/or strong language.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('AO', 'Adults Only', 'Content suitable only for adults age 18 and up. May include prolonged scenes of intense violence, graphic sexual content, and/or gambling with real currency.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('RP', 'Rating Pending', 'Not yet assigned a final ESRB rating. Appears only in advertising, marketing, and promotional materials related to a video game that is expected to carry an ESRB rating, and should be replaced by a game\'s rating once it has been assigned.');
	INSERT INTO ESRB (ESRB_Rtng, Title, Description) VALUES ('NR', 'Not Rated', 'Content does not have an ESRB rating.');

CREATE TABLE COMPANY
(
	Company_ID		VARCHAR(10)		NOT NULL PRIMARY KEY,
	Name			VARCHAR(20)		NOT NULL UNIQUE
);

	INSERT INTO COMPANY (Company_ID, Name) VALUES ('se','Square Enix');

CREATE TABLE EMULATOR
(
	Emulator_ID		VARCHAR(7)		NOT NULL PRIMARY KEY,
	Name			VARCHAR(10) 	NOT NULL UNIQUE		,
	Platform_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID)
);

	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('snes1', 'SNES9x', 'snes');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('ps1', 'ePSXe', 'ps');

CREATE TABLE GAME
(
	Game_ID			VARCHAR(10) 	NOT NULL PRIMARY KEY,
	Title			VARCHAR(30)		NOT NULL UNIQUE		,
	ESRB_Rtng		VARCHAR(3)		NOT NULL			,
	Company_ID		VARCHAR(10)							,
	Description		VARCHAR(1000)						,
	FOREIGN KEY(ESRB_Rtng) REFERENCES ESRB(ESRB_Rtng)	,
	FOREIGN KEY(Company_ID) REFERENCES COMPANY(Company_ID)
);

	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) 
	VALUES ('ffvii', 'Final Fantasy VII', 'T', 'se', 'Mako: the discovery of this natural resource drawn directly from the planet\'s life force marked the dawn of a new era, and now the energy sustains the lives of people across the world. However, the Shinra Company has monopolized mako production, and in doing so established a powerful hegemony, its influence reaching the far corners of the globe. Cloud, a former member of Shinra\'s military organization, SOLDIER, joins the anti-Shinra resistance group AVALANCHE, despite caring little for their motives. During one of the groups attempts to stop the company, they learn of the return of Sephiroth, Clouds nemesis, and that with his reemergence, the planet is in greater danger than anyone had expected. With the fate of the world riding on their success, Cloud and his allies set out to quell this deadly threat.');

CREATE TABLE ROM
(
	Rom_ID			VARCHAR(7)		NOT NULL PRIMARY KEY,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Emulator_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)		,
	FOREIGN KEY(Emulator_ID) REFERENCES EMULATOR(Emulator_ID)
);

	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffvii1', 'ffvii', 'ps1');

CREATE TABLE GAMEVERSION
(
	Platform_ID		VARCHAR(7)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Platform_ID, Game_ID)					,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'ffvii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffvii');

CREATE TABLE GAMEPLAY
(
	Gameplay_ID		VARCHAR(5)		NOT NULL PRIMARY KEY,
	Name			VARCHAR(25)		NOT NULL UNIQUE
);

	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('sp', 'Single Player');

CREATE TABLE GAMEPLAYTAG
(
	Gameplay_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Gameplay_ID, Game_ID)					,
	FOREIGN KEY(Gameplay_ID) REFERENCES GAMEPLAY(Gameplay_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffvii');

CREATE TABLE EXPANSION
(
	Expansion_ID	VARCHAR(7) 		NOT NULL PRIMARY KEY,
	Name			VARCHAR(20) 	NOT NULL UNIQUE		,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('temp', 'Not A Real Thing', 'ffvii');

CREATE TABLE GENRE
(
	Genre_ID		VARCHAR(5)		NOT NULL PRIMARY KEY,
	Name			VARCHAR(30)		NOT NULL UNIQUE
);

	INSERT INTO GENRE (Genre_ID, Name) VALUES ('jrp', 'JRPG');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('rp', 'RPG');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('cl', 'Classic');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('sh', 'Shooter');

CREATE TABLE GENRETAG
(
	Genre_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Genre_ID, Game_ID)						,
	FOREIGN KEY(Genre_ID) REFERENCES GENRE(Genre_ID)	,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'ffvii');

CREATE TABLE SERIES
(
	Series_ID		VARCHAR(10)		NOT NULL PRIMARY KEY,
	Title			VARCHAR(30)		NOT NULL UNIQUE
);

	INSERT INTO SERIES (Series_ID, Title) VALUES ('fnlf', 'Final Fantasy');

CREATE TABLE GAMEINSERIES
(
	Series_ID		VARCHAR(10)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Rls_Order		SMALLINT 		NOT NULL			,
	Chrn_Order		SMALLINT							,
	PRIMARY KEY(Series_ID, Game_ID)						,
	FOREIGN KEY(Series_ID) REFERENCES SERIES(Series_ID)	,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffvii', 7, NULL);

CREATE TABLE PERSON	
(
	Person_ID		VARCHAR(10)		NOT NULL PRIMARY KEY,
	First_Name		VARCHAR(15)		NOT NULL			,
	Last_Name		VARCHAR(15)		NOT NULL
);

	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('sqec', 'Yosuke', 'Matsuda');

CREATE TABLE POSITION
(
	Position_ID		VARCHAR(10)		NOT NULL PRIMARY KEY,
	Person_ID		VARCHAR(10)		NOT NULL			,
	Company_ID		VARCHAR(10)		NOT NULL			,
	Title			VARCHAR(20) 	NOT NULL			,
	Description		VARCHAR(500)						,
	FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)	,
	FOREIGN KEY(Company_ID) REFERENCES COMPANY(Company_ID)
);

	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title, Description) VALUES ('sqceo', 'sqec', 'se', 'CEO', NULL);

CREATE TABLE REVIEWER	
(
	Reviewer_ID		VARCHAR(10)		NOT NULL PRIMARY KEY,
	Usr_Name		VARCHAR(20)		NOT NULL			,
	Credibility		VARCHAR(15)		NOT NULL
);

	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r1', 'SpringCherry', 'Trustworthy');

CREATE TABLE REVIEWS
(
	Reviewer_ID		VARCHAR(10)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Rating			CHAR	 		NOT NULL			,
	Text			VARCHAR(500)						,
	PRIMARY KEY(Reviewer_ID, Game_ID)					,
	FOREIGN KEY(Reviewer_ID) REFERENCES REVIEWER(Reviewer_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r1', 'ffvii', '5', 'It was good. I mean... I liked it, anyway.');
