CREATE TABLE PLATFORM
(
	Platform_ID		VARCHAR(7)				 PRIMARY KEY,
	Name			VARCHAR(20)		NOT NULL 			,
	Manufacturer	VARCHAR(15)
);

#18

	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('pc','PC', NULL);
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('nes','Nintendo', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('snes','Super Nintendo', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('n64','Nintendo 64', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('nds','Nintendo DS', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('n2ds','Nintendo 2DS', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('n3ds','Nintendo 3DS', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('gb','Game Boy', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('gba','Game Boy Advance', 'Nintendo');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps', 'PlayStation', 'Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps2','PlayStation 2', 'Sony');
 	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps3','PlayStation 3', 'Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('ps4','PlayStation 4', 'Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('psp','PlayStation Portable', 'Sony');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ("psv", "Playstation Vita", "Sony");
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ("xb", "Xbox", "Microsoft");
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('xb1','Xbox One', 'Microsoft');
	INSERT INTO PLATFORM (Platform_ID, Name, Manufacturer) VALUES ('xb360','Xbox360', 'Microsoft');

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

#16

	INSERT INTO COMPANY (Company_ID, Name) VALUES ('se','Square Enix');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('act','Activision');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('bl','Blizzard');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('gf','Game Freak');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('nin', 'Nintendo');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('cap', 'Capcom');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ('chn', 'Chunsoft');
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("rstr", "RockStar Games");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("hmx", "Harmonix");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("frg", "Frictional Games");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("pd", "Playdead");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("vlv", "Valve");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("rl", "Re-Logic");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("2k", "2K Games");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("quand", "Quantic Dream");
	INSERT INTO COMPANY (Company_ID, Name) VALUES ("atlus", "Atlus");

CREATE TABLE EMULATOR
(
	Emulator_ID		VARCHAR(7)				 PRIMARY KEY,
	Name			VARCHAR(10) 	NOT NULL UNIQUE		,
	Platform_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID)
);

#7

	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('nes1', 'nestopia', 'nes');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('snes1', 'SNES9x', 'snes');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('nds1', 'desmume', 'nds');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ('ps1', 'ePSXe', 'ps');
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ("n3ds1", "Citra", "n3ds");
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ("gba1", "My Boy", "gba");
	INSERT INTO EMULATOR (Emulator_ID, Name, Platform_ID) VALUES ("gb1", "Visual Boy", "gb");

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

#48

	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffi', 'Final Fantasy', 'E', 'se', 'Players embark on a journey to find four magical crystals that can restore peace to the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffii', 'Final Fantasy II', 'E', 'se', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffiii', 'Final Fantasy III', 'E10', 'se', 'Players embark on a journey to defeat an evil empire and stop a madman from destroying the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffiv', 'Final Fantasy IV', 'E10', 'se', 'An adventure involving magical crystals and a mysterious kingdom.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffv', 'Final Fantasy V', 'T', 'se', 'Embark on a quest to prevent an evil being from destroying the world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffvi', 'Final Fantasy VI', 'E10', 'se', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ffvii', 'Final Fantasy VII', 'T', 'se', 'Mako: the discovery of this natural resource drawn directly from the planet’s life force marked the dawn of a new era, and now the energy sustains the lives of people across the world. However, the Shinra Company has monopolized mako production, and in doing so established a powerful hegemony, its influence reaching the far corners of the globe. Cloud, a former member of Shinra’s military organization, SOLDIER, joins the anti-Shinra resistance group AVALANCHE, despite caring little for their motives. During one of the groups attempts to stop the company, they learn of the return of Sephiroth, Cloud’s nemesis, and that with his reemergence, the planet is in greater danger than anyone had expected. With the fate of the world riding on their success, Cloud and his allies set out to quell this deadly threat.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('crntr', 'Chrono Trigger', 'E10', 'se', 'Chrono, a boy from the year 1000 A.D., befriended a girl named Marle at Leene Square during a carnival. Chrono then to visit his friend Lucca, who’s working on a teleportation unit. Marle is too eager to try out the unfinished machine and it malfunctions. Instead of transporting her from one podium to another, she is sent somewhere far beyond Chrono’s time. Chrono volunteers to help and is thrust back through time. During his great adventures throughout time, Chrono discovers that, in 1999 A.D., Lavos erupts from the Earth and turns it into a desolate wasteland. United by this oncoming threat, Chrono and his comrades traverse the corridors of time in an attempt to alter the future...');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('crnrd', 'Radical Dreamers: Nusumenai Hoseki', 'NR', 'se', 'A side story to Chrono Trigger.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mtrd', 'Metroid', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mtrdii', 'Metroid II: Return of Samus', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('smtrd', 'Super Metroid', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('gstpd', 'Ghost Trick: Phantom Detective', 'T', 'cap', 'You wake up only to find that you are dead and without memories. To make things worse, you will disappear forever when the first light of dawn comes. Will you be able to uncover the truth in time?');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('9hrs', '9 Hours 9 Persons 9 Doors', 'M', 'chn', 'You are held captive inside a large ship with eight other characters, and must solve a series of pernicious and deadly puzzles in order to escape.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mm', 'Mega Man', 'E', 'cap', 'In the year 200X, robots developed to assist mankind are commonplace thanks to the efforts of renowned robot designer Dr. Light. However, one day these robots go out of control and start attacking the populace, among them six advanced humanoid robots made by Dr. Light for industrial purposes: Cut Man, Guts Man, Ice Man, Bomb Man, Fire Man, and Elec Man. He realizes the culprit is his old rival Dr. Wily (who plots to take over the world), but is unsure of what to do. His helper robot Rock, having a strong sense of justice, offers to be converted into a fighting robot to stop Dr. Wily’s plan, becoming Mega Man. Mega Man faces off against Wily and his robots so that order may be restored.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mmii', 'Mega Man II', 'E', 'cap', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('mmx', 'Mega Man X', 'E', 'cap', '');	
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('zloz', 'The Legend of Zelda', 'E', 'nin', 'A small kingdom in the land of Hyrule is engulfed in chaos after an army led by Ganon, the Prince of Darkness, invaded it and stole the Triforce of Power, a part of a magical artifact bestowing great strength. In an attempt to prevent Ganon from acquiring the Triforce of Wisdom, another of the pieces, Princess Zelda splits it and hides the eight fragments in secret dungeons throughout the land. Before the princess is eventually kidnapped by Ganon, she commands her nursemaid Impa to find someone courageous enough to save the kingdom. While wandering the land, the old woman is surrounded by Ganon’s henchmen, though a young boy named Link appears and rescues her. After hearing Impa’s plea, he resolves to save Zelda and sets out to reassemble the scattered fragments of the Triforce of Wisdom, to become powerful enough to defeat Ganon.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('zaol', 'The Adventure of Link', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('zltp', 'A Link to the Past', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('zlsa', 'Link’s Awakening', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('zoot', 'The Ocarina of Time', 'E', 'nin', '');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('amns', 'Amnesia: The Dark Descent', 'NR', 'frg', '.....');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('lmb', 'LIMBO', 'NR', 'pd', 'Uncertain of his sister’s fate, a boy enters LIMBO');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ptl', 'Portal', 'NR', 'vlv', 'Players must solve physical puzzles and challenges by opening portals to maneuvering objects, and themselves, through space.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('ptl2', 'Portal 2', 'NR', 'vlv', 'Players will explore never-before-seen areas of the Aperture Science Labs and be reunited with GLaDOS, the occasionally murderous computer companion who guided them through the original game.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('trr', 'Terraria', 'T', 'rl', 'The very world is at your fingertips as you fight for survival, fortune, and glory. Delve deep into cavernous expanses, seek out ever-greater foes to test your mettle in combat, or construct your own city - In the World of Terraria, the choice is yours! Blending elements of classic action games with the freedom of sandbox-style creativity, Terraria is a unique gaming experience where both the journey and the destination are as unique as the players themselves!');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('bsk', 'BioShock', 'M', '2k', 'BioShock is a shooter unlike any you’ve ever played, loaded with weapons and tactics never seen. You’ll have a complete arsenal at your disposal from simple revolvers to grenade launchers and chemical throwers, but you’ll also be forced to genetically modify your DNA to create an even more deadly weapon: you. Injectable plasmids give you super human powers: blast electrical currents into water to electrocute multiple enemies, or freeze them solid and obliterate them with the swing of a wrench. No encounter ever plays out the same, and no two gamers will play the game the same way.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('bsk2', 'BioShock 2', 'M', '2k', 'Set approximately 10 years after the events of the original BioShock, the halls of Rapture once again echo with sins of the past. Along the Atlantic coastline, a monster has been snatching little girls and bringing them back to the undersea city of Rapture. Players step into the boots of the most iconic denizen of Rapture, the Big Daddy, as they travel through the decrepit and beautiful fallen city, chasing an unseen foe in search of answers and their own survival.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('bski', 'BioShock: Infinite', 'M', '2k', 'Indebted to the wrong people, with his life on the line, veteran of the U.S. Cavalry and now hired gun, Booker DeWitt has only one opportunity to wipe his slate clean. He must rescue Elizabeth, a mysterious girl imprisoned since childhood and locked up in the flying city of Columbia. Forced to trust one another, Booker and Elizabeth form a powerful bond during their daring escape. Together, they learn to harness an expanding arsenal of weapons and abilities, as they fight on zeppelins in the clouds, along high-speed Sky-Lines, and down in the streets of Columbia, all while surviving the threats of the air-city and uncovering its dark secret.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('des','Destiny','T','act','You are one of humanity’s last remaining Guardians. Your home and your power has been taken from you by a brutal invader – Ghaul. With humanity on the brink, it’s up to you to fight back and reclaim our world.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('des2','Destiny 2','T','act','Humanity’s last safe city has fallen to an overwhelming invasion force, led by Ghaul, the imposing commander of the brutal Red Legion. He has stripped the city’s Guardians of their power, and forced the survivors to flee. You will venture to mysterious, unexplored worlds of our solar system to discover an arsenal of weapons and devastating new combat abilities.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('pkmsm','Pokemon: Sun and Moon','E','gf','The player and the mother move from Kanto to Alola. However, at roughly the same time, a young girl is seen escaping what seems to be a lab with an unidentified Pokémon in her bag. As she gets cornered by the workers in the area, the Pokémon teleports itself and the girl away from the lab and away from danger.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('pkmu2sm','Pokemon: Ultra Sun and Moon','E','gf','');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ('starc','StarCraft','T','bl','Long ago four supercarriers loaded with political dissidents and convicts from Earth crash-landed on the distant planets of Tarsonis, Moria, and Umoja.');
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("gta5", "Grand Theft Auto 5", "M", "rstr", "Play as three guys and take control of the city or just roam around and perform illegal actions");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("gh2", "Guitar Hero 2", "T", "hmx","Rock the Rhythm, Lead, and Bass Guitar tracks in the follow-up sequel to Guitar Hero. With over 55 tracks to rock out to, you'll go from Guitar Hero to Guitar god in one press of a fret button.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("gh", "Guitar Hero", "T", "hmx", "Ready to rock?! Play the top rock songs while using a guitar controller.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("gta4","Grand Theft Auto 4", "M", "rstr", "Rockstar's vivid tale of Niko Bellic, an immigrant with convictions powerful enough to rocket him through the crumbling substructures of Liberty City's world.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("gtasa", "Grand Theft Auto San Andreas", "M", "rstr", "On his return to the neighborhood, a couple of corrupt cops framed Carl 'CJ' Johnson (Main Character) for homicide. CJ is forced on a journey that takes him across the entire state of San Andreas, to save his family and to take control of the streets.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("heavy", "Heavy Rain", "M", "quand","The game is a film noir thriller, featuring four diverse protagonists involved with the mystery of the Origami Killer, a serial killer who uses extended periods of rainfall to drown his victims");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("kh", "Kingdom Hearts" ,"E10","se","Kingdom Hearts is about a boy named Sora who travels world-to-world, to save his friends and to tame the world from darkness"); 
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("kh2", "Kingdom Hearts 2", "E10","se", "After a couple of years in sleep, Sora finds out that there will be a war soon, It is up to him to stop who's behind it all...Xehanort");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("kh3", "Kingdom Hearts 3", "E10","se", "Sora is joined by Donald Duck, Goofy, King Mickey and Riku in their search for the seven Guardians of Light and the 'Key to Return Hearts' as they attempt to thwart Master Xehanort's plan to bring about a second Keyblade War.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("khbbs", "Kingdom Hears: Birth By Sleep","E10","se", "The prequel of the first Kingdom Hearts game, you follow 3 best friends on their on-going journies to figure out who is starting an uproar amonst the worlds");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("psna3", "Persona 3", "M", "atlus", "Persona 3 follows a group of high school students trying to cope with, understand and accept death in a world surrounded by it, as well as find their own reasons for living.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("psna4", "Persona 4", "M", "atlus", "Persona 4 follows a group of high school students dealing with a mysterious TV channel dedicated to distorting and exaggerating the truth of who they are and their identities.");
	INSERT INTO GAME (Game_ID, Title, ESRB_Rtng, Company_ID, Description) VALUES ("psna5", "Persona 5", "M", "atlus", "Persona 5 is a fantasy based on reality which follows a group of troubled high school students: the protagonist and a collection of compatriots he meets. "); 

CREATE TABLE ROM
(
	Rom_ID			VARCHAR(7)				 PRIMARY KEY,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Emulator_ID		VARCHAR(7)		NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)		,
	FOREIGN KEY(Emulator_ID) REFERENCES EMULATOR(Emulator_ID)
);

#22

	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffi1', 'ffi', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffii1', 'ffii', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffiii1', 'ffiii', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffiv1', 'ffiv', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffv1', 'ffv', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffvi1', 'ffvi', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('ffvii1', 'ffvii', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr1', 'crntr', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr2', 'crntr', 'nds1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crntr3', 'crntr', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('crnrd1', 'crnrd', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mtrd1', 'mtrd', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mtrdii1', 'mtrdii', 'gba1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('smtrd1', 'smtrd', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('gstpd1', 'gstpd', 'nds1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('9hrs1', '9hrs', 'nds1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mm1', 'mm', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mm2', 'mm', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mmii1', 'mmii', 'nes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mmii2', 'mmii', 'ps1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('mmx1', 'mmx', 'snes1');
	INSERT INTO ROM (Rom_ID, Game_ID, Emulator_ID) VALUES ('zloz1', 'zloz', 'nes1');

CREATE TABLE GAMEVERSION
(
	Platform_ID		VARCHAR(7)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Platform_ID, Game_ID)					,
	FOREIGN KEY(Platform_ID) REFERENCES PLATFORM(Platform_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

#104

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
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'mtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'mtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'mtrdii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'smtrd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', 'gstpd');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nds', '9hrs');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'mm');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'mm');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'mm');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'mmii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps', 'mmii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'mmii');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('snes', 'mmx');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps2', 'mmx');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('psp', 'mmx');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'zloz');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('nes', 'zaol');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gba', 'zaol');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('gb', 'zlsa');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('n64', 'zoot');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('n3ds', 'zoot');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'amns');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'lmb');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'ptl');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'ptl');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'ptl2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'ptl2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'trr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'trr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'trr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360', 'trr');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1', 'bsk');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360', 'bsk');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'bsk');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'bsk');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'bsk');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1', 'bsk2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360', 'bsk2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'bsk2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'bsk2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'bsk2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1', 'bski');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360', 'bski');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'bski');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'bski');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'bski');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps3', 'des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1', 'des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb360', 'des');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('pc', 'des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('ps4', 'des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ('xb1', 'des2');
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "gh");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "gh2");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb360","gh2");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("pc", "gta5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "gta5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps4", "gta5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb360", "gta5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb1", "gta5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb360","gta4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb1","gta4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("pc","gta4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2","gtasa");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb","gtasa");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb360", "gtasa");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "gtasa");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "heavy");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "kh");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "kh2");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps4", "kh3");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb1", "kh3");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("psp", "khbbs");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "psna3");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "psna3");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("psp", "psna3");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps2", "psna4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "psna4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("psv", "psna4");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb360", "psna5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps3", "psna5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("xb1", "psna5");
	INSERT INTO GAMEVERSION (Platform_ID, Game_ID) VALUES ("ps4", "psna5");


CREATE TABLE GAMEPLAY
(
	Gameplay_ID		VARCHAR(5)				 PRIMARY KEY,
	Name			VARCHAR(25)		NOT NULL UNIQUE
);

#4

	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('sp', 'Single Player');
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('mp', 'Multiplayer');
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('lp', 'Local Play');
	INSERT INTO GAMEPLAY (Gameplay_ID, Name) VALUES ('omp','Multiplayer Online');

CREATE TABLE GAMEPLAYTAG
(
	Gameplay_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Gameplay_ID, Game_ID)					,
	FOREIGN KEY(Gameplay_ID) REFERENCES GAMEPLAY(Gameplay_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

#56

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
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'gstpd');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', '9hrs');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'mm');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'mmii');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'mmx');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'zloz');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'zaol');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'zltp');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'zlsa');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'zoot');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'amns');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'lmb');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ptl');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'ptl2');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('mp', 'ptl2');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'trr');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('mp', 'trr');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'bsk');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'bsk2');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ('sp', 'bski');
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "gh");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("lp", "gh");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "gh2");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("lp", "gh2");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "gta5");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("omp", "gta5");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("omp", "gta4");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "gta4");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "gtasa");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("lp", "gtasa");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "heavy");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "kh");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "kh2");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "kh3");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "khbbs");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "psna3");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "psna4");
	INSERT INTO GAMEPLAYTAG (Gameplay_ID, Game_ID) VALUES ("sp", "psna5");

CREATE TABLE EXPANSION
(
	Expansion_ID	VARCHAR(7) 				 PRIMARY KEY,
	Name			VARCHAR(40) 	NOT NULL UNIQUE		,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

#18

	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e1','The Dark Below','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e2','House of Wolves','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e3','The Taken King','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ('des1e4','Rise of Iron','des');
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c1", "Holloween 2016", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c2", "Be My Valentine 2016", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c3", "Festive Surprise ", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c4", "Holloween Surprise ", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c6", "Online Ind. Day ", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c7", "V Day Massacre", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta5c8", "Holiday Gifts", "gta5");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta4c1", "Lost and Damned", "gta4");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta4c2", "Ballad of Gay Tony", "gta4");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("gta4c3", "Chinatown Wars", "gta4");
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("heavyc1", "Taxidermist", "heavy");  
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("psna5c1", "Catherine Costume Set", "psna5"); 
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("psna5c2", "Persona 4 BGM Costume Set", "psna5"); 
	INSERT INTO EXPANSION (Expansion_ID, Name, Game_ID) VALUES ("psna5c3", "Christmas Costume Set", "psna5"); 

CREATE TABLE GENRE
(
	Genre_ID		VARCHAR(5)				 PRIMARY KEY,
	Name			VARCHAR(30)		NOT NULL UNIQUE
);

#23
	
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
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('sf', 'Science Fiction');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('rthm', 'Rythm');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('op', 'Open World');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('atm', 'Atmospheric');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('sur', 'Survival');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ('stl', 'Stealth');
	INSERT INTO GENRE (Genre_ID, Name) VALUES ("int", "Interactive");
	INSERT INTO GENRE (Genre_ID, Name) VALUES ("hns"," Hack and Slash");

CREATE TABLE GENRETAG
(
	Genre_ID		VARCHAR(5)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	PRIMARY KEY(Genre_ID, Game_ID)						,
	FOREIGN KEY(Genre_ID) REFERENCES GENRE(Genre_ID)	,
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

#203

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
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('vn', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('txt', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', '9hrs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'gstpd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'gstpd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'gstpd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', 'gstpd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'mtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'mtrdii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'smtrd');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'mm');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'mm');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'mm');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'mm');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'mm');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'mmii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'mmii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'mmii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'mmii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'mmii');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'mmx');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'mmx');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'mmx');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'mmx');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'mmx');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'zloz');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'zaol');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'zltp');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'zlsa');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('cl', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('plt', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('exp', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('op', 'zoot');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('hr', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('atm', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sur', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('stl', 'amns');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', 'lmb');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'lmb');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('atm', 'lmb');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', 'ptl');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'ptl');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'ptl');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ptl');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('pzl', 'ptl2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'ptl2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'ptl2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'ptl2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('hr', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('atm', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'bsk');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('hr', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('atm', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'bsk2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('act', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('hr', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('rp', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sf', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('atm', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'bski');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'des');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('sh', 'des2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("rthm", "gh");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("rthm", "gh2");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("adv", "gta5");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "gta5");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("adv", "gta4");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "gta4");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("adv", "gtasa");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "gtasa");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("int", "heavy");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("adv", "heavy");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "kh");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "kh2");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "kh3");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("act", "khbbs");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("hns", "kh");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'kh');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'kh');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'kh');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("hns", "kh2");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'kh2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'kh2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'kh2');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("hns", "kh3");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'kh3');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'kh3');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'kh3');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("hns", "khbbs");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('adv', 'khbbs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('fan', 'khbbs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ('str', 'khbbs');
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("rp" , "psna3");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("str", "heavy");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("rp" , "psna4");
	INSERT INTO GENRETAG (Genre_ID, Game_ID) VALUES ("rp" , "psna5");

CREATE TABLE SERIES
(
	Series_ID		VARCHAR(10)				 PRIMARY KEY,
	Title			VARCHAR(30)		NOT NULL UNIQUE
);

#15

	INSERT INTO SERIES (Series_ID, Title) VALUES ('fnlf', 'Final Fantasy');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('crno', 'Chrono');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('mtrds', 'Metroid');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('mmc', 'Mega Man');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('mmnx', 'Mega Man X');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('loz', 'The Legend of Zelda');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('prtl', 'Portal');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('bshk', 'BioShock');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('dstny', 'Destiny');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('pkm', 'Pokemon');
	INSERT INTO SERIES (Series_ID, Title) VALUES ('strcft', 'StarCraft');
	INSERT INTO SERIES (Series_ID, Title) VALUES ("gtrh", "Guitar Hero");
	INSERT INTO SERIES (Series_ID, Title) VALUES ("gta", "Grand Theft Auto");
	INSERT INTO SERIES (Series_ID, Title) VALUES ("khs", "Kingdom Hearts");
	INSERT INTO SERIES (Series_ID, Title) VALUES ("psna", "Persona");

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

#41
	
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffi', 1, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffii', 2, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffiii', 3, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffiv', 4, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffv', 5, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffvi', 6, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('fnlf', 'ffvii', 7, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('crno', 'crntr', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('crno', 'crnrd', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mtrds', 'mtrd', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mtrds', 'mtrdii', 2, 7);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mtrds', 'smtrd', 3, 8);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mmc', 'mm', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mmc', 'mmii', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('mmnx', 'mmx', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('loz', 'zloz', 1, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('loz', 'zaol', 2, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('loz', 'zltp', 3, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('loz', 'zlsa', 4, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('loz', 'zoot', 5, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('prtl', 'ptl', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('prtl', 'ptl2', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('bshk', 'bsk', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('bshk', 'bsk2', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('bshk', 'bski', 3, 3);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('dstny','des', 1, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('dstny','des2', 2, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('pkm','pkmsm', 17, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ('pkm','pkmu2sm', 18, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("gtrh","gh", 1, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("gtrh", "gh2", 2, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("gta","gta5", 7, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("gta", "gta4", 6, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("gta", "gtasa", 4, NULL);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("khs","kh", 1, 2);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("khs", "kh2", 3, 3);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("khs","kh3", 11, 11);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("khs", "khbbs", 5, 1);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("psna", "psna3", 4, 4);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("psna", "psna4", 5, 5);
	INSERT INTO GAMEINSERIES (Series_ID, Game_ID, Rls_Order, Chrn_Order) VALUES ("psna", "psna5", 6, 6);

CREATE TABLE PERSON	
(
	Person_ID		VARCHAR(10)				 PRIMARY KEY,
	First_Name		VARCHAR(15)		NOT NULL			,
	Last_Name		VARCHAR(15)		NOT NULL
);

#6

	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('sqec', 'Yosuke', 'Matsuda');
	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('bstb', 'Tetsuya', 'Nomura');
	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('sqhc', 'Yasuhiro', 'Fukushima');
	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('ccc', 'Kenzo', 'Tsujimoto');
	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('cpc', 'Haruhiro', 'Tsujimoto');
	INSERT INTO PERSON (Person_ID, First_Name, Last_Name) VALUES ('pwl', 'Janet', 'Hsu');

CREATE TABLE POSITION
(
	Position_ID		VARCHAR(10)				 PRIMARY KEY,
	Person_ID		VARCHAR(10)		NOT NULL			,
	Company_ID		VARCHAR(10)		NOT NULL			,
	Title			VARCHAR(30) 	NOT NULL			,
	FOREIGN KEY(Person_ID) REFERENCES PERSON(Person_ID)	,
	FOREIGN KEY(Company_ID) REFERENCES COMPANY(Company_ID)
);

#9

	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('sqceo', 'sqec', 'se', 'CEO');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('svga1', 'bstb', 'se', 'Video Game Artist');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('svgds1', 'bstb', 'se', 'Video Game Designer');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('svgdi1', 'bstb', 'se', 'Video Game Director');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('cceo', 'ccc', 'cap', 'CEO');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('cch', 'ccc', 'cap', 'Chairman');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('ccoo', 'cpc', 'cap', 'COO');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('ccp', 'cpc', 'cap', 'President');
	INSERT INTO POSITION (Position_ID, Person_ID, Company_ID, Title) VALUES ('lzm1', 'pwl', 'cap', 'Localization Team Member');

CREATE TABLE REVIEWER	
(
	Reviewer_ID		VARCHAR(10)				 PRIMARY KEY,
	Usr_Name		VARCHAR(20)		NOT NULL			,
	Credibility		VARCHAR(15)		NOT NULL
);

#10

	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r0', 'OceanManPhD', 'Trusted');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r1', 'Ratheria', 'Trusted');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r2', 'SpringCherry', 'Trusted');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ('r3', 'hazmat', 'Unknown');
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r4", "MelanieLvr09", "Unknown");
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r5", "MannyLet5", "Unknown");
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r6", "LacacaMan", "Unknown");
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r7", "JoeSchmoe" ,"Suspicious");
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r8", "JottaHopForFun", "Trusted");
	INSERT INTO REVIEWER (Reviewer_ID, Usr_Name, Credibility) VALUES ("r9", "BrockLee5", "Trusted");

CREATE TABLE REVIEWS
(
	Reviewer_ID		VARCHAR(10)		NOT NULL			,
	Game_ID			VARCHAR(10) 	NOT NULL			,
	Rating			CHAR(2)	 		NOT NULL			,
	Text			VARCHAR(500)						,
	PRIMARY KEY(Reviewer_ID, Game_ID)					,
	FOREIGN KEY(Reviewer_ID) REFERENCES REVIEWER(Reviewer_ID),
	FOREIGN KEY(Game_ID) REFERENCES GAME(Game_ID)
);

#21	
	
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r1', 'ffvii', '10', 'It was good. I mean... I liked it, anyway.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r1', 'gstpd', '10', 'An engrossing game with unique, inventive gameplay. The story and soundtrack are wonderful.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r1', '9hrs', '7', 'An puzzle game with interesting twists and a sharp wit. A bit tedious at times, but still a good game overall.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r1', 'bsk', '9', 'From gameplay and mechanics to story and atmosphere, I thoroughly enjoyed all aspects of this game.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r2', 'crntr', '10', 'One of the best games I’ve ever played.');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r2', 'amns', '8', 'Oml...');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r3', 'des2', '3', 'The first Destiny is so much better. They ruined grinding. >(');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ('r3', 'des', '9', 'This game roxxx!!!');
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r3", "gta4", 3, "The older games are so much better. This one lacks so much content");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r3", "kh", 4, "I AM SO F****** FUSTRATED RIGHT NOW! IT'S SO F****** IMPOSSIBLE TO BEAT THE ICE TITAN!");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r4","gh", '6', "Fun game but I don't like");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r4", "gh2", '8', "This game is a lot better than the first one! I love how they added the hammer-ons.");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r4", "khbbs", 7, "***SPOLIER ALERT*** It made me really sad how the three amigos split up. They better reunite in the 3rd game.");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r5", "gh2", '3', "I wish my tiny fingers could reach the orange button. C'mon harmonix, get you head in the game!");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r5", "gtasa", 1,"I WOuld never let my kids play this game! This is definately only for grown ups.");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r6", "psna3", 10, "Out of all persona games, this one is my favorite");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r7", "smtrd", '1', "Love this game!");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r8", "gta4", 7, "The ending was very sad. I couldn't stop crying :`( !!!!!!!");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r8", "psna4", 8, "Love This game so much! Glad my wife recommended this game to me");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r9", "psna5", 9, "I love the art style in this game!"); 
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r9", "heavy", 9, "This game gave me goosebumps, If you're new to the consoles, good luck keeping the characters alive. One wrong move and they're dead");
	INSERT INTO REVIEWS (Reviewer_ID, Game_ID, Rating, Text) VALUES ("r9", "kh2", 10, "I am in LOVE with this game! 100x better than the first one, and I love that one too!");
