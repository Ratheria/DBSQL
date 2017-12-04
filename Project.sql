CREATE TABLE PLATFORM
(
	Platform_ID		VARCHAR(7)				 PRIMARY KEY,
	Name			VARCHAR(20)		NOT NULL 			,
	Manufacturer	VARCHAR(15)
);

	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('pc','PC', NULL);
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('nes','Nintendo', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('snes','Super Nintendo', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps', 'PlayStation', 'Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('nds','Nintendo DS','Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('n2ds','Nintendo 2DS','Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('n3ds','Nintendo 3DS','Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('gb','Game Boy','Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('gba','Game Boy Advance','Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps3','PlayStation 3','Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps4','PlayStation 4','Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('psp','PlayStation Portable','Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('xb1','Xbox One','Microsoft');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('xb360','Xbox360','Microsoft');

CREATE TABLE ESRB
(
	ESRB_Rtng		VARCHAR(3)				 PRIMARY KEY,
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
	Company_ID		VARCHAR(10)				 PRIMARY KEY,
	Name			VARCHAR(20)		NOT NULL UNIQUE
);

	INSERT INTO COMPANY (Company_ID, Name) VALUES ('se','Square Enix');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('act','Activision');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('bl','Blizzard');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('gf','Game Freak');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('nin', 'Nintendo');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('cap', 'Capcom');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('chn', 'Chunsoft');

CREATE TABLE EMULATOR
(
	Emulator_ID		VARCHAR(7)				 PRIMARY KEY,
	Name			VARCHAR(10) 	NOT NULL UNIQUE		,
	Platform_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID)
);

	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('nes1', 'nestopia', 'nes');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('snes1', 'SNES9x', 'snes');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('nds1', 'desmume', 'nds');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('ps1', 'ePSXe', 'ps');

CREATE TABLE GAME
(
	Game_ID			VARCHAR(10) 			 PRIMARY KEY,
	Title			VARCHAR(40)		NOT NULL UNIQUE		,
	ESRB_Rtng		VARCHAR(3)		NOT NULL			,
	Company_ID		VARCHAR(10)							,
	Description		VARCHAR(1000)						,
	FOREIGN KEY(ESRB_Rtng) REFERENCES ESRB(ESRB_Rtng)	,
	FOREIGN KEY(Company_ID) REFERENCES COMPANY(Company_ID)
);

	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffi', 'Final Fantasy', 'E', 'se', 'Players embark on a journey to find four magical crystals that can restore peace to the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffii', 'Final Fantasy II', 'E', 'se', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffiii', 'Final Fantasy III', 'E10', 'se', 'Players embark on a journey to defeat an evil empire and stop a madman from destroying the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffiv', 'Final Fantasy IV', 'E10', 'se', 'An adventure involving magical crystals and a mysterious kingdom.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffv', 'Final Fantasy V', 'T', 'se', 'Embark on a quest to prevent an evil being from destroying the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffvi', 'Final Fantasy VI', 'E10', 'se', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffvii', 'Final Fantasy VII', 'T', 'se', 'Mako: the discovery of this natural resource drawn directly from the planet\'s life force marked the dawn of a new era, and now the energy sustains the lives of people across the world. However, the Shinra Company has monopolized mako production, and in doing so established a powerful hegemony, its influence reaching the far corners of the globe. Cloud, a former member of Shinra\'s military organization, SOLDIER, joins the anti-Shinra resistance group AVALANCHE, despite caring little for their motives. During one of the groups attempts to stop the company, they learn of the return of Sephiroth, Cloud\'s nemesis, and that with his reemergence, the planet is in greater danger than anyone had expected. With the fate of the world riding on their success, Cloud and his allies set out to quell this deadly threat.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('des','Destiny','T','act','You are one of humanity’s last remaining Guardians. Your home and your power has been taken from you by a brutal invader – Ghaul. With humanity on the brink, it’s up to you to fight back and reclaim our world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('des2','Destiny 2','T','act','Humanity’s last safe city has fallen to an overwhelming invasion force, led by Ghaul, the imposing commander of the brutal Red Legion. He has stripped the city’s Guardians of their power, and forced the survivors to flee. You will venture to mysterious, unexplored worlds of our solar system to discover an arsenal of weapons and devastating new combat abilities.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('pkmsm','Pokemon: Sun and Moon','E','gf','The player and the mother move from Kanto to Alola. However, at roughly the same time, a young girl is seen escaping what seems to be a lab with an unidentified Pokémon in her bag. As she gets cornered by the workers in the area, the Pokémon teleports itself and the girl away from the lab and away from danger.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('pkmu2sm','Pokemon: Ultra Sun and Moon','E','gf','');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('starc','StarCraft','T','bl','Long ago four supercarriers loaded with political dissidents and convicts from Earth crash-landed on the distant planets of Tarsonis, Moria, and Umoja.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('crntr', 'Chrono Trigger', 'E10', 'se', 'Chrono, a boy from the year 1000 A.D., befriended a girl named Marle at Leene Square during a carnival. Chrono then to visit his friend Lucca, who\'s working on a teleportation unit. Marle is too eager to try out the unfinished machine and it malfunctions. Instead of transporting her from one podium to another, she is sent somewhere far beyond Chrono\'s time. Chrono volunteers to help and is thrust back through time. During his great adventures throughout time, Chrono discovers that, in 1999 A.D., Lavos erupts from the Earth and turns it into a desolate wasteland. United by this oncoming threat, Chrono and his comrades traverse the corridors of time in an attempt to alter the future...');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('crnrd', 'Radical Dreamers: Nusumenai H?seki', 'NR', 'se', 'A side story to Chrono Trigger.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mtrd', 'Metroid', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mtrdii', 'Metroid II: Return of Samus', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mtrds', 'Super Metroid', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('gstpd', 'Ghost Trick: Phantom Detective', 'T', 'cap', 'You wake up only to find that you are dead and without memories. To make things worse, you will disappear forever when the first light of dawn comes. Will you be able to uncover the truth in time?');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('9hrs', '9 Hours 9 Persons 9 Doors', 'M', 'chn', 'You are held captive inside a large ship with eight other characters, and must solve a series of pernicious and deadly puzzles in order to escape. ');

CREATE TABLE ROM
(
	Rom_ID			VARCHAR(7)				 PRIMARY KEY,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Emulator_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)		,
	FOREIGN KEY(Emulator_ID) REFERENCES EMULATOR(Emulator_ID)
);

	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffvii1', 'ffvii', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr1', 'crntr', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr2', 'crntr', 'nds1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr3', 'crntr', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crnrd1', 'crnrd', 'snes1');

CREATE TABLE GAMEVERSION
(
	Platform_ID		VARCHAR(7)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Platform_ID, Game_ID)					,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'ffi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'ffi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'ffii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'ffii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'ffiii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffiii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', 'ffiii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'ffiv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffiv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffiv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'ffiv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', 'ffiv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'ffv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'ffv');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffvi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'ffvi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'ffvi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'ffvi');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'ffvii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'ffvii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'crntr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', 'crntr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'crntr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'crnrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3','des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4','des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1','des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360','des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc','des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4','des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1','des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'mtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'mtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'mtrdii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'smtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', 'gstpd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', '9hrs');

CREATE TABLE GAMEPLAY
(
	Gameplay_ID		VARCHAR(5)				 PRIMARY KEY,
	Name			VARCHAR(25)		NOT NULL UNIQUE
);

	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('sp', 'Single Player');
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('mp', 'Multiplayer')
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('lp','Local Play');
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('omp','Multiplayer Online');

CREATE TABLE GAMEPLAYTAG
(
	Gameplay_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Gameplay_ID, Game_ID)					,
	FOREIGN KEY(Gameplay_ID) REFERENCES GAMEPLAY(Gameplay_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffi');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffii');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffiii');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffiv');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffv');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffvi');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ffvii');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'crntr');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'crnrd');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('omp','des');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp','des');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('omp','des2');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp','des2');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp','pkmsm');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp','pkmu2sm');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'mtrd');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'mtrdii');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'smtrd');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'gtpd');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', '9hrs');

CREATE TABLE EXPANSION
(
	Expansion_ID	VARCHAR(7) 				 PRIMARY KEY,
	Name			VARCHAR(20) 	NOT NULL UNIQUE		,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e1','The Dark Below','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e2','House of Wolves','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e3','The Taken King','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e4','Rise of Iron','des');

CREATE TABLE GENRE
(
	Genre_ID		VARCHAR(5)				 PRIMARY KEY,
	Name			VARCHAR(30)		NOT NULL UNIQUE
);

	INSERT INTO GENRE (Genre_ID, Name) VALUES ('jrp', 'JRPG');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('rp', 'RPG');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('act', 'Action');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('adv', 'Adventure');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('cl', 'Classic');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('txt', 'Text Based Adventure');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('vn', 'Visual Novel');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('sh', 'Shooter');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('pzl', 'Puzzle');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('hr', 'Horror');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('str', 'Story Rich');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('fan', 'Fantasy');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('mst', 'Mystery');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('plt', 'Platformer');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('exp', 'Exploration');

CREATE TABLE GENRETAG
(
	Genre_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Genre_ID, Game_ID)						,
	FOREIGN KEY(Genre_ID) REFERENCES GENRE(Genre_ID)	,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'ffi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffiii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffiii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffiii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffiii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffiv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffv');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffvi');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'ffvii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('jrp', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'crntr');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'crnrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'crnrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'crnrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('vn', 'crnrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('txt', 'crnrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'des');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'des2');

CREATE TABLE SERIES
(
	Series_ID		VARCHAR(10)				 PRIMARY KEY,
	Title			VARCHAR(30)		NOT NULL UNIQUE
);

	INSERT INTO SERIES (Series_ID, Title) VALUES ('fnlf', 'Final Fantasy');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('crno', 'Chrono');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('dstny','Destiny');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('pkm','Pokemon');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('strcft','StarCraft');

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
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('crno', 'crntr', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('dstny','des', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('dstny','des2', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('pkm','pkmsm', 17, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('pkm','pkmu2sm', 18, NULL);

CREATE TABLE PERSON	
(
	Person_ID		VARCHAR(10)				 PRIMARY KEY,
	First_Name		VARCHAR(15)		NOT NULL			,
	Last_Name		VARCHAR(15)		NOT NULL
);

	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('sqec', 'Yosuke', 'Matsuda');

CREATE TABLE POSITION
(
	Position_ID		VARCHAR(10)				 PRIMARY KEY,
	Person_ID		VARCHAR(10)		NOT NULL			,
	Company_ID		VARCHAR(10)		NOT NULL			,
	Title			VARCHAR(20) 	NOT NULL			,
	FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)	,
	FOREIGN KEY(Company_ID) REFERENCES COMPANY(Company_ID)
);

	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('sqceo', 'sqec', 'se', 'CEO');

CREATE TABLE REVIEWER	
(
	Reviewer_ID		VARCHAR(10)				 PRIMARY KEY,
	Usr_Name		VARCHAR(20)		NOT NULL			,
	Credibility		VARCHAR(15)		NOT NULL
);

	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r1', 'Ratheria', 'Trustworthy');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r2', 'SpringCherry', 'Trustworthy');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r3', 'hazmat', 'Unknown');

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
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r2', 'crntr', '5', 'One of the best games I\'ve ever played.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r3', 'des2', '2', 'The first Destiny is so much better. They ruined grinding. >(');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r3', 'des', '4', 'This game roxxx!!!');

