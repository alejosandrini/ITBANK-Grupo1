DROP TABLE IF EXISTS direcciones;
CREATE TABLE direcciones (
    id_direccion integer PRIMARY KEY,
    calle text NOT NULL,
    numero integer NOT NULL,
    ciudad text NOT NULL, 
    provincia text NOT NULL,
    pais text NOT NULL,
    id_cliente integer,
    id_empleado integer,
    id_sucursal integer UNIQUE,
    CONSTRAINT fk_direcciones
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(customer_id), 
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(employee_id),
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(branch_id)
    );

INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (1,"2528 Praesent Rd.","95641","Cavaion Veronese","Veneto","Italy",420,NULL,14),
  (2,"Ap #129-8764 Aliquam, Rd.","18-452","Suwałki","Podlaskie","Poland",376,426,NULL),
  (3,"8537 In, Rd.","828793","Changi Bay","East Region","Singapore",489,253,NULL),
  (4,"P.O. Box 770, 6552 Ac Av.","1233","Cork","Munster","Ireland",NULL,34,NULL),
  (5,"P.O. Box 480, 2434 Tristique Street","01882","Yongin","Gyeonggi","South Korea",292,321,NULL),
  (6,"7782 Nulla. St.","5881","Marawi","Bangsamoro","Philippines",53,16,29),
  (7,"Ap #376-9126 Sit Rd.","2156","Christchurch","South Island","New Zealand",204,384,NULL),
  (8,"Ap #327-100 Diam Ave","41675","Berlin","Berlin","Germany",61,390,NULL),
  (9,"Ap #294-9581 A St.","25433","Avesta","Dalarnas län","Sweden",358,NULL,NULL),
  (10,"176-9680 Sociis St.","12711","Patarrá","San José","Costa Rica",216,354,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (11,"104-1095 Purus Av.","31743","Sicuani","Cusco","Peru",298,NULL,64),
  (12,"2701 Vestibulum Rd.","6267","Vienna","Vienna","Austria",199,249,NULL),
  (13,"419-9609 Feugiat Rd.","81555","Castelnuovo Magra","Liguria","Italy",263,NULL,94),
  (14,"545-5671 Quis, Street","455878","Kusa","Chelyabinsk Oblast","Russian Federation",441,148,NULL),
  (15,"479-8627 Diam Street","51333","Sankt Ingbert","Saarland","Germany",149,194,NULL),
  (16,"746-5181 Elit Av.","CG57 8VI","Alva","Stirlingshire","United Kingdom",224,186,NULL),
  (17,"524-7769 Risus. Ave","6532","Mackay","Queensland","Australia",462,380,NULL),
  (18,"587-2611 Nisi Rd.","QP13 8HC","Barmouth","Merionethshire","United Kingdom",247,373,NULL),
  (19,"Ap #198-2221 Quisque Street","634962","Swat","Khyber Pakhtoonkhwa","Pakistan",263,220,82),
  (20,"738-9513 Lacus. St.","29208","İskenderun","Hatay","Turkey",285,429,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (21,"3981 Curabitur St.","41-949","Olsztyn","Warmińsko-mazurskie","Poland",401,201,NULL),
  (22,"315-4095 Et St.","2515","Hamilton","Victoria","Australia",124,67,13),
  (23,"919-5420 Quam Rd.","58183-635","Santa Rita","Paraíba","Brazil",34,19,NULL),
  (24,"499-6530 Leo Rd.","BV57 6VU","Crewe","Cheshire","United Kingdom",NULL,482,NULL),
  (25,"7262 Blandit. Rd.","521725","Serangoon","North-East Region","Singapore",67,156,NULL),
  (26,"116-6467 Quis St.","19890","Icheon","Gyeonggi","South Korea",NULL,NULL,63),
  (27,"3488 Taciti Street","99643","Juneau","Alaska","United States",154,NULL,5),
  (28,"4129 Egestas, Ave","78-44","Nikopol","Dnipropetrovsk oblast","Ukraine",307,490,NULL),
  (29,"Ap #771-9363 Sit Rd.","657221","Panjgur","Balochistan","Pakistan",289,461,NULL),
  (30,"318-2920 Conubia Avenue","1612 DS","Roosendaal","Noord Brabant","Netherlands",358,371,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (31,"2112 Cras Street","32-871","Sosnowiec","Sląskie","Poland",105,53,NULL),
  (32,"795-6720 Iaculis, Ave","66619","Spokane","Washington","United States",264,158,NULL),
  (33,"Ap #157-9332 Quis Rd.","711959","Daman","Daman and Diu","India",339,NULL,NULL),
  (34,"Ap #561-8908 Elit, Av.","6433","Rangiora","South Island","New Zealand",NULL,158,NULL),
  (35,"P.O. Box 901, 1886 Aliquam Street","59556","Hamburg","Hamburg","Germany",124,390,NULL),
  (36,"P.O. Box 991, 1769 Eu Rd.","V3K 8R6","Charlottetown","Prince Edward Island","Canada",468,404,81),
  (37,"921-3784 Phasellus Street","485791","Changi Bay","East Region","Singapore",290,NULL,NULL),
  (38,"197-4102 Ullamcorper Rd.","90843","Lauco","Friuli-Venezia Giulia","Italy",NULL,462,NULL),
  (39,"974-5788 Pellentesque Avenue","237466","Kaliningrad","Kaliningrad Oblast","Russian Federation",72,146,NULL),
  (40,"164-5743 In Rd.","6748","Redcliffe","Queensland","Australia",NULL,365,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (41,"Ap #460-7241 Tempus Ave","76-37","Pervomaisk","Mykolaiv oblast","Ukraine",121,381,NULL),
  (42,"Ap #453-5778 Molestie Av.","3139-6884","Ladysmith","KwaZulu-Natal","South Africa",174,311,NULL),
  (43,"Ap #420-7784 Pede Rd.","172420","Tver","Tver Oblast","Russian Federation",NULL,423,NULL),
  (44,"P.O. Box 434, 4869 Curabitur Ave","QN23 2KS","Camborne","Cornwall","United Kingdom",109,28,96),
  (45,"368-9567 Inceptos Avenue","693561","Sakhalin","Sakhalin Oblast","Russian Federation",462,306,NULL),
  (46,"Ap #312-7831 Eu Street","41864","Lambayeque","Lambayeque","Peru",106,177,NULL),
  (47,"784-7675 Enim. Av.","29227","Cajamarca","Cajamarca","Peru",169,25,NULL),
  (48,"Ap #941-9905 Mattis. St.","37X 4X1","Cambridge Bay","Nunavut","Canada",68,29,40),
  (49,"251-6789 Nulla Rd.","7879","Canberra","Australian Capital Territory","Australia",51,288,NULL),
  (50,"Ap #363-819 Iaculis, St.","2970","Kristiansund","Møre og Romsdal","Norway",71,NULL,52);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (51,"792-4427 Ultricies Rd.","97368","Vallentuna","Stockholms län","Sweden",55,NULL,70),
  (52,"Ap #724-8984 Tristique Road","25596","Cusco","Cusco","Peru",10,NULL,55),
  (53,"Ap #891-9358 At St.","64782","San Giuliano di Puglia","Molise","Italy",387,244,NULL),
  (54,"2896 Neque Rd.","96143","Termini Imerese","Sicilia","Italy",NULL,500,NULL),
  (55,"143-3780 Suspendisse Road","22344","Huaral","Lima","Peru",156,235,NULL),
  (56,"862-6114 Quisque Road","257241","Lâm","Nam Định","Vietnam",483,NULL,NULL),
  (57,"745-6929 Velit. Ave","12281","Suncheon","South Jeolla","South Korea",443,112,NULL),
  (58,"P.O. Box 208, 1124 Egestas Ave","21435","Borlänge","Dalarnas län","Sweden",63,42,NULL),
  (59,"5184 Nec, Av.","6496","Cork","Munster","Ireland",62,13,18),
  (60,"349-3517 Amet, Avenue","242260","Quảng Ngãi","Quảng Ngãi","Vietnam",277,441,21);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (61,"392-3206 Mauris Road","47410","Stockholm","Stockholms län","Sweden",283,219,93),
  (62,"Ap #766-2403 Lectus Road","37877-68874","Iguala","Guerrero","Mexico",394,155,NULL),
  (63,"Ap #120-2965 Morbi Ave","65434-155","Balsas","Maranhão","Brazil",156,NULL,77),
  (64,"1775 Aliquam Road","69-747","Stargard Szczeciński","Zachodniopomorskie","Poland",157,379,NULL),
  (65,"Ap #303-7889 Nunc Av.","5848","Ørsta","Møre og Romsdal","Norway",497,173,NULL),
  (66,"Ap #856-5479 Vitae Av.","6273","El Salvador","Northern Mindanao","Philippines",380,344,NULL),
  (67,"P.O. Box 545, 2011 Lacus. Ave","OP2 6VC","Devizes","Wiltshire","United Kingdom",NULL,398,NULL),
  (68,"257-6610 Scelerisque Road","70855","Lexington","Kentucky","United States",362,NULL,NULL),
  (69,"P.O. Box 114, 5854 Commodo St.","676579","Paya Lebar","East Region","Singapore",NULL,298,NULL),
  (70,"7546 Donec Avenue","678333","Agustín Codazzi","Cesar","Colombia",351,132,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (71,"Ap #697-911 Rutrum Avenue","647846","Beijing","Huáběi","China",379,445,NULL),
  (72,"P.O. Box 129, 1684 Cursus Rd.","10137-25106","Juárez","Chihuahua","Mexico",186,296,NULL),
  (73,"Ap #205-5032 Iaculis, Street","0374 AU","Hoogeveen","Drenthe","Netherlands",99,NULL,NULL),
  (74,"856-5381 Erat St.","8401","Alexandra","South Island","New Zealand",113,336,NULL),
  (75,"983-359 Tincidunt Ave","836153","Funtua","Katsina","Nigeria",216,NULL,79),
  (76,"P.O. Box 335, 3134 Eros. Street","72665","Piscinas","Sardegna","Italy",26,188,67),
  (77,"217-6561 Enim St.","31206","Puntarenas","Puntarenas","Costa Rica",360,132,27),
  (78,"117-4282 Tortor, Ave","55621","Tual","Maluku","Indonesia",455,155,NULL),
  (79,"Ap #345-7161 Nec Avenue","R8S 2A7","Flin Flon","Manitoba","Canada",241,314,NULL),
  (80,"P.O. Box 331, 985 Suspendisse Street","82695","Challand-Saint-Victor","Valle d'Aosta","Italy",404,395,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (81,"7447 Orci. Ave","85236-545","Curitiba","Paraná","Brazil",NULL,252,44),
  (82,"3556 Sed Ave","28841-241","Niterói","Rio de Janeiro","Brazil",NULL,205,NULL),
  (83,"Ap #766-6487 Vivamus Street","45524-66694","Mazatlán","Sinaloa","Mexico",NULL,34,NULL),
  (84,"222-7199 Neque. Av.","982151","Awka","Anambra","Nigeria",279,70,NULL),
  (85,"4472 Mauris Av.","16236","Suruç","Şanlıurfa","Turkey",31,405,20),
  (86,"8769 Turpis Road","73155","Finspång","Östergötlands län","Sweden",78,196,NULL),
  (87,"629-4006 Ante St.","6146","Palmerston","Northern Territory","Australia",183,95,NULL),
  (88,"P.O. Box 715, 5862 Lacinia St.","984237","Shillong","Meghalaya","India",416,NULL,NULL),
  (89,"7524 Dolor, Ave","3876","Amstetten","Lower Austria","Austria",438,143,6),
  (90,"Ap #621-1571 Nam Avenue","65776-50927","San Pedro Garza García","Nuevo León","Mexico",235,214,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (91,"Ap #969-2149 Sit Rd.","25519-52414","Oaxaca","Oaxaca","Mexico",469,464,NULL),
  (92,"552-6142 Hendrerit Ave","7566","Feldkirch","Vorarlberg","Austria",418,136,NULL),
  (93,"P.O. Box 572, 371 Ligula Street","82671","Hamburg","Hamburg","Germany",191,22,NULL),
  (94,"6278 Urna Av.","32032","Corbara","Campania","Italy",298,68,NULL),
  (95,"8121 Est Rd.","2023","Kristiansund","Møre og Romsdal","Norway",361,41,33),
  (96,"2195 Non St.","559269","Gbongan","Osun","Nigeria",290,53,26),
  (97,"1601 Pellentesque Rd.","613383","Khyber Agency","FATA","Pakistan",420,401,NULL),
  (98,"389-3950 Aliquet Rd.","43366","Pacasmayo","La Libertad","Peru",179,491,NULL),
  (99,"Ap #923-8162 Venenatis Rd.","08445","Beypazarı","Ankara","Turkey",115,360,NULL),
  (100,"4688 Dictum Ave","15119","Yeongcheon","North Gyeongsang","South Korea",31,NULL,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (101,"Ap #667-1348 Massa St.","24625","Jaén","Cajamarca","Peru",330,450,NULL),
  (102,"Ap #223-8218 Donec Ave","07-794","Radom","Mazowieckie","Poland",111,187,NULL),
  (103,"Ap #211-811 In Rd.","05194","Lunel","Languedoc-Roussillon","France",NULL,181,NULL),
  (104,"P.O. Box 825, 3849 Eu Rd.","671785","Hà Tĩnh","Hà Tĩnh","Vietnam",336,324,NULL),
  (105,"P.O. Box 688, 1443 Ac Rd.","45661-702","Salvador","Bahia","Brazil",409,190,NULL),
  (106,"P.O. Box 968, 5479 Mi. Ave","487065","Chandigarh","Chandigarh","India",314,181,NULL),
  (107,"138-6559 Vivamus Rd.","6323","Geest-GŽrompont-Petit-RosiŽre","Waals-Brabant","Belgium",181,418,NULL),
  (108,"762-4627 Risus Street","81-117","Białystok","Podlaskie","Poland",184,308,NULL),
  (109,"232-3396 Sed Av.","4871","Marchienne-au-Pont","Henegouwen","Belgium",48,98,NULL),
  (110,"Ap #862-7702 Nec Rd.","321157","Puqueldón","Los Lagos","Chile",128,349,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (111,"P.O. Box 177, 1498 Non Street","1821","Matamata","North Island","New Zealand",171,252,92),
  (112,"P.O. Box 180, 5371 Et St.","630227","Novosibirsk","Novosibirsk Oblast","Russian Federation",192,497,NULL),
  (113,"242-441 Neque Rd.","856661","Kohat","Khyber Pakhtoonkhwa","Pakistan",NULL,80,NULL),
  (114,"Ap #852-419 Malesuada Rd.","38-606","Olsztyn","Warmińsko-mazurskie","Poland",385,390,NULL),
  (115,"P.O. Box 157, 7802 Arcu. Av.","136436","Chillán","Biobío","Chile",NULL,315,24),
  (116,"615-3989 Nec St.","83T 7R4","Tuktoyaktuk","Northwest Territories","Canada",370,488,NULL),
  (117,"4075 Magna. Ave","14379-63677","Monterrey","Nuevo León","Mexico",41,NULL,3),
  (118,"401-5180 Viverra. Street","2179","Westport","South Island","New Zealand",377,4,NULL),
  (119,"712 Curabitur St.","8943","Molde","Møre og Romsdal","Norway",NULL,424,NULL),
  (120,"P.O. Box 404, 1126 Nibh Street","1182","Isabela City","Zamboanga Peninsula","Philippines",339,93,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (121,"Ap #790-7545 Scelerisque St.","055855","Hijuelas","Valparaíso","Chile",423,305,NULL),
  (122,"3151 Amet St.","889795","Buguma","Rivers","Nigeria",18,469,NULL),
  (123,"P.O. Box 491, 3496 Odio Avenue","319943","Villa Alegre","Maule","Chile",143,414,NULL),
  (124,"Ap #258-6408 Aliquam Road","BT58 1HH","Lochranza","Buteshire","United Kingdom",280,330,NULL),
  (125,"Ap #797-2243 Eu Rd.","142804","Roshal","Moscow Oblast","Russian Federation",182,84,NULL),
  (126,"917-3905 Ac Av.","2521 FJ","Sluis","Zeeland","Netherlands",347,485,NULL),
  (127,"677-5284 Inceptos Ave","57487","Gagliato","Calabria","Italy",390,493,NULL),
  (128,"Ap #753-7037 Sociis Rd.","5456","Balanga","Central Luzon","Philippines",45,136,NULL),
  (129,"P.O. Box 481, 2504 Eros. Ave","83V 8S8","Deline","Northwest Territories","Canada",231,4,69),
  (130,"Ap #310-9805 Sociis Ave","MV0I 1LD","Liverpool","Lancashire","United Kingdom",150,295,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (131,"Ap #768-1261 At Street","I52 1WX","Gretna","Dumfriesshire","United Kingdom",430,242,NULL),
  (132,"Ap #102-2089 Pretium Rd.","Y8J 4W4","Watson Lake","Yukon","Canada",NULL,346,NULL),
  (133,"6767 Ante. Street","T5W 0WO","Stourbridge","Worcestershire","United Kingdom",90,448,NULL),
  (134,"230-1566 Semper St.","8856","Hard","Vorarlberg","Austria",457,33,NULL),
  (135,"140-9859 Nec Rd.","42347","Zweibrücken","Rheinland-Pfalz","Germany",210,365,NULL),
  (136,"P.O. Box 728, 3570 Sed Street","33511","Tarma","Junín","Peru",18,200,NULL),
  (137,"760-2246 Cursus Road","542316","Las Condes","Metropolitana de Santiago","Chile",222,281,NULL),
  (138,"Ap #639-3062 Nisl. Ave","28646","Asan","South Chungcheong","South Korea",452,295,NULL),
  (139,"635-7394 Proin Rd.","631736","Duitama","Boyacá","Colombia",140,356,NULL),
  (140,"143 Vulputate St.","63-342","Biała Podlaska","Lubelskie","Poland",192,79,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (141,"P.O. Box 673, 5347 Et, Avenue","66-58","Pervomaisk","Mykolaiv oblast","Ukraine",437,461,NULL),
  (142,"Ap #488-9089 Lorem Ave","816485","Puerto Nariño","Amazonas","Colombia",328,271,NULL),
  (143,"Ap #127-5908 Donec Avenue","W25 4QC","Llandrindod Wells","Radnorshire","United Kingdom",396,265,NULL),
  (144,"Ap #317-7085 Eu St.","43428","West Valley City","Utah","United States",NULL,51,NULL),
  (145,"P.O. Box 675, 8272 Felis Ave","69233","Freital","Sachsen","Germany",185,325,NULL),
  (146,"708-376 In, St.","51613","Cañas","Guanacaste","Costa Rica",49,348,NULL),
  (147,"Ap #565-3861 Risus. Rd.","262725","Kano","Kano","Nigeria",434,483,43),
  (148,"Ap #447-3510 Eu Av.","518664","Tianjin","Huáběi","China",418,402,NULL),
  (149,"P.O. Box 982, 6602 Enim Av.","B7Y 7J5","New Glasgow","Nova Scotia","Canada",219,29,23),
  (150,"277-9850 Donec Rd.","4771","Wierde","Namen","Belgium",58,478,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (151,"P.O. Box 766, 4182 Consectetuer St.","37-47","Nizhyn","Chernihiv oblast","Ukraine",180,218,NULL),
  (152,"446-784 Auctor Avenue","432423","Simpang","North Region","Singapore",69,62,NULL),
  (153,"1995 Semper Ave","7781","Gosnells","Western Australia","Australia",423,474,47),
  (154,"Ap #517-5290 Est Ave","78818-06157","Villahermosa","Tabasco","Mexico",48,NULL,NULL),
  (155,"P.O. Box 741, 1169 Risus. St.","12622","Gunsan","North Jeolla","South Korea",146,402,NULL),
  (156,"3984 Eros. Avenue","38618","Püttlingen","Saarland","Germany",266,275,NULL),
  (157,"964-6277 Dictum Rd.","504889","San Pedro de Atacama","Antofagasta","Chile",NULL,481,NULL),
  (158,"916-2320 Posuere Rd.","QQ9 5ZM","St. Neots","Huntingdonshire","United Kingdom",200,72,39),
  (159,"Ap #479-5621 Commodo St.","669846","Irkutsk","Irkutsk Oblast","Russian Federation",202,467,88),
  (160,"Ap #556-5855 Tempus Street","58566-072","Patos","Paraíba","Brazil",126,51,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (161,"Ap #711-9779 Curabitur Road","72552","Springdale","Arkansas","United States",183,375,NULL),
  (162,"Ap #378-6111 Eu, Av.","86-26","Rivne","Rivne oblast","Ukraine",437,311,NULL),
  (163,"359-5765 Vestibulum Av.","54882","Palma de Mallorca","Illes Balears","Spain",469,184,73),
  (164,"851-6213 Integer St.","2443","Sandnes","Rogaland","Norway",486,457,36),
  (165,"100-481 Lorem Ave","1706 LP","Dordrecht","Zuid Holland","Netherlands",128,240,NULL),
  (166,"Ap #360-432 Massa. Ave","871119","Manizales","Caldas","Colombia",299,24,4),
  (167,"4965 Interdum. Road","35785","Kızılcahamam","Ankara","Turkey",139,448,66),
  (168,"172-5336 Faucibus Avenue","285686","Bukit Panjang","West Region","Singapore",105,293,NULL),
  (169,"P.O. Box 166, 5444 Enim. St.","31475","Palangka Raya","Central Kalimantan","Indonesia",221,104,NULL),
  (170,"Ap #184-4289 Aliquet St.","24624-838","Duque de Caxias","Rio de Janeiro","Brazil",424,189,17);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (171,"Ap #973-1435 Diam Av.","3375","Invercargill","South Island","New Zealand",101,146,59),
  (172,"Ap #399-8417 Sapien. Street","767532","Liaoning","Dōngběi","China",175,198,NULL),
  (173,"2951 Vulputate St.","42884","Palopo","South Sulawesi","Indonesia",NULL,459,NULL),
  (174,"388-9589 Metus. Ave","299724","Bhimber","Azad Kashmir","Pakistan",NULL,289,NULL),
  (175,"846-770 Lorem, Rd.","6438-4957","Thabazimbi","Limpopo","South Africa",472,NULL,NULL),
  (176,"Ap #432-6022 Morbi Av.","53880","Roccanova","Basilicata","Italy",469,17,NULL),
  (177,"5914 Bibendum. Av.","77-73","Kherson","Kherson oblast","Ukraine",291,226,NULL),
  (178,"P.O. Box 647, 1687 Orci. Street","611565","Xinjiang","Xīběi","China",83,158,NULL),
  (179,"P.O. Box 448, 2704 Massa Road","263503","Parbhani","Maharastra","India",487,381,NULL),
  (180,"300-6394 Ac Avenue","47544","Dover","Delaware","United States",361,122,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (181,"Ap #353-5860 Nunc Ave","BH7H 4GS","Talgarth","Brecknockshire","United Kingdom",58,451,NULL),
  (182,"P.O. Box 765, 2229 Vel Ave","751094","Kharmang","Gilgit Baltistan","Pakistan",127,208,NULL),
  (183,"9730 Dolor Road","133301","Hồ Chí Minh City","Hồ Chí Minh City","Vietnam",245,NULL,NULL),
  (184,"343-8992 Semper Road","272645","Calera de Tango","Metropolitana de Santiago","Chile",230,182,76),
  (185,"Ap #711-4829 Purus, St.","542685","Gorbea","Araucanía","Chile",400,NULL,NULL),
  (186,"Ap #632-3217 Dolor Rd.","633132","Novosibirsk","Novosibirsk Oblast","Russian Federation",107,363,NULL),
  (187,"611-4968 Quisque St.","171565","Qambar Shahdadkot","Sindh","Pakistan",NULL,382,NULL),
  (188,"531-2157 Risus. Street","849611","Ratlam","Madhya Pradesh","India",209,NULL,NULL),
  (189,"6063 Erat. Rd.","2673-1258","Kimberley","Northern Cape","South Africa",NULL,188,85),
  (190,"706-9563 Erat St.","79137","Dijon","Bourgogne","France",330,464,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (191,"984-4210 Eget Av.","24330","Palma de Mallorca","Illes Balears","Spain",329,350,NULL),
  (192,"849-7719 Eget Rd.","0434","Himamaylan","Western Visayas","Philippines",90,278,NULL),
  (193,"Ap #800-7818 Commodo Street","34653","Nässjö","Jönköpings län","Sweden",435,62,NULL),
  (194,"6535 Cras Rd.","764562","Oyo","Oyo","Nigeria",491,369,NULL),
  (195,"P.O. Box 624, 8668 Pharetra St.","312786","Liaoning","Dōngběi","China",260,125,NULL),
  (196,"P.O. Box 515, 6468 In Street","2116","Muntinlupa","National Capital Region","Philippines",135,356,NULL),
  (197,"Ap #407-9218 Purus St.","20802","San Rafael","Alajuela","Costa Rica",275,117,NULL),
  (198,"282-8301 Nunc Rd.","5888","Napier","North Island","New Zealand",264,418,NULL),
  (199,"276-1904 Turpis Av.","0347","Motueka","South Island","New Zealand",493,181,NULL),
  (200,"2685 At Av.","779433","Tanglin","Central Region","Singapore",468,42,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (201,"P.O. Box 106, 8529 Varius St.","67252","Brive-la-Gaillarde","Limousin","France",151,154,NULL),
  (202,"P.O. Box 345, 6196 Proin St.","56-531","Gorzów Wielkopolski","Lubuskie","Poland",124,74,NULL),
  (203,"5485 Tempor Street","68354","Murcia","Murcia","Spain",79,173,NULL),
  (204,"Ap #974-9248 Natoque Av.","51205","Nicoya","Guanacaste","Costa Rica",NULL,223,NULL),
  (205,"P.O. Box 647, 2731 Lacinia Av.","962153","La Cisterna","Metropolitana de Santiago","Chile",38,482,12),
  (206,"659-8496 Tristique St.","840436","Karak","Khyber Pakhtoonkhwa","Pakistan",260,42,1),
  (207,"Ap #367-4869 Proin Av.","109272","Katsina","Katsina","Nigeria",NULL,89,NULL),
  (208,"Ap #434-7748 Elit, Ave","15449","Gorontalo","Gorontalo","Indonesia",NULL,347,NULL),
  (209,"4929 Ligula. Avenue","01152","Monfumo","Veneto","Italy",331,242,100),
  (210,"P.O. Box 586, 899 Dignissim Rd.","7867","Cork","Munster","Ireland",301,222,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (211,"Ap #962-2491 Mi Avenue","3348","Jauchelette","Waals-Brabant","Belgium",220,349,NULL),
  (212,"Ap #224-8596 Ornare Av.","50372","Medea","Friuli-Venezia Giulia","Italy",443,468,99),
  (213,"760-2854 Facilisis Av.","228653","Straits View","Central Region","Singapore",139,404,NULL),
  (214,"Ap #564-6943 Accumsan St.","37193","Huaraz","Ancash","Peru",56,412,NULL),
  (215,"Ap #318-3239 Amet Street","9337","Zirl","Tyrol","Austria",447,406,NULL),
  (216,"355-3647 Eleifend, Ave","6627","Cork","Munster","Ireland",81,467,NULL),
  (217,"2449 Non St.","CA50 7RB","Rothesay","Buteshire","United Kingdom",91,236,NULL),
  (218,"Ap #718-4390 Euismod Road","801710","Gansu","Xīběi","China",256,313,NULL),
  (219,"121-7860 Morbi St.","174753","Dera Bugti","Balochistan","Pakistan",NULL,388,NULL),
  (220,"Ap #866-8673 Mauris Street","7591","Beerse","Antwerpen","Belgium",233,NULL,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (221,"195-6871 Nulla Rd.","T24 1HF","Grantham","Lincolnshire","United Kingdom",222,NULL,NULL),
  (222,"163-9223 Luctus Avenue","25396-714","Campos dos Goytacazes","Rio de Janeiro","Brazil",206,342,NULL),
  (223,"Ap #261-7808 Rutrum, Av.","165266","Sungei Kadut","North Region","Singapore",486,61,NULL),
  (224,"7079 Nec, Rd.","8691","Horsham","Victoria","Australia",NULL,122,NULL),
  (225,"Ap #233-603 Adipiscing Road","5758","Baguio","Cordillera Administrative Region","Philippines",6,403,NULL),
  (226,"P.O. Box 888, 6237 Nunc St.","56747","Ribnitz-Damgarten","Mecklenburg-Vorpommern","Germany",373,427,51),
  (227,"Ap #623-3851 Vitae, Street","784311","Bauchi","Bauchi","Nigeria",177,NULL,NULL),
  (228,"179-9865 Fringilla. Rd.","8043","Picton","South Island","New Zealand",22,259,NULL),
  (229,"716-9310 Vitae Av.","15833","Gumi","North Gyeongsang","South Korea",226,253,NULL),
  (230,"P.O. Box 209, 7015 Velit. Avenue","3239","Oberwart","Burgenland","Austria",215,7,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (231,"361-6415 Nulla Rd.","4072","Tromsø","Troms og Finnmark","Norway",404,61,NULL),
  (232,"Ap #719-8976 Laoreet, Rd.","S5L 4E5","Weyburn","Saskatchewan","Canada",364,360,NULL),
  (233,"7813 Dictum Rd.","4718 HU","Roosendaal","Noord Brabant","Netherlands",375,293,54),
  (234,"Ap #562-8565 Libero. Rd.","S6P 2H3","Assiniboia","Saskatchewan","Canada",303,NULL,NULL),
  (235,"Ap #353-2032 Magna Avenue","23336","Chungju","North Chungcheong","South Korea",NULL,497,NULL),
  (236,"912-4193 Et Rd.","41418","Heredia","Heredia","Costa Rica",290,372,98),
  (237,"541-2418 Congue Road","37-485","Toruń","Kujawsko-pomorskie","Poland",NULL,334,84),
  (238,"P.O. Box 354, 7158 Vel Road","51-295","Kraków","Małopolskie","Poland",57,442,NULL),
  (239,"3562 Fusce Ave","760377","Sokoto","Sokoto","Nigeria",178,30,NULL),
  (240,"P.O. Box 130, 7311 Ornare St.","L10 5WY","Witney","Oxfordshire","United Kingdom",NULL,413,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (241,"Ap #513-3813 Adipiscing Ave","82-83","Mukachevo","Zakarpattia oblast","Ukraine",106,177,NULL),
  (242,"7566 Gravida Avenue","791435","Tibet","Xīnán","China",NULL,179,NULL),
  (243,"484-5344 Arcu. Street","11023","Jaén","Cajamarca","Peru",187,NULL,72),
  (244,"7053 Commodo Rd.","9393 KG","Laren","Noord Holland","Netherlands",34,463,NULL),
  (245,"811-5102 Vivamus St.","2665","Vienna","Vienna","Austria",345,418,NULL),
  (246,"216-1634 Purus Rd.","76462","İskenderun","Hatay","Turkey",252,235,NULL),
  (247,"805-3477 Feugiat St.","30212","Cartago","Cartago","Costa Rica",NULL,489,NULL),
  (248,"Ap #765-478 Sit Rd.","84757","Värnamo","Jönköpings län","Sweden",262,292,16),
  (249,"Ap #978-8085 Tincidunt. Av.","2193","Tromsø","Troms og Finnmark","Norway",NULL,93,NULL),
  (250,"P.O. Box 540, 8091 Lobortis Av.","16-111","Tomaszów Mazowiecki","łódzkie","Poland",251,301,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (251,"Ap #877-7668 Sed Rd.","75333","Gasteiz","Euskadi","Spain",85,119,NULL),
  (252,"P.O. Box 760, 3749 Eu St.","599735","Hà Nội","Hà Nội","Vietnam",470,112,NULL),
  (253,"Ap #545-5590 Nisi. St.","861077","Raurkela","Odisha","India",73,70,NULL),
  (254,"P.O. Box 493, 8424 Sociis Rd.","16757","Yeoju","Gyeonggi","South Korea",NULL,487,NULL),
  (255,"P.O. Box 484, 3284 Consectetuer Street","47235","Hameln","Niedersachsen","Germany",475,288,NULL),
  (256,"483-9150 Neque. St.","53293-63328","Villahermosa","Tabasco","Mexico",NULL,174,NULL),
  (257,"P.O. Box 149, 6536 Dui. Av.","482407","La Unión","Los Ríos","Chile",140,68,NULL),
  (258,"P.O. Box 619, 1650 Fermentum Ave","60945-317","Fortaleza","Ceará","Brazil",295,8,NULL),
  (259,"740-167 Tincidunt Rd.","554377","Shanxi","Huáběi","China",355,NULL,89),
  (260,"Ap #185-3528 Ultricies Rd.","26821","Albi","Midi-Pyrénées","France",496,8,32);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (261,"310-6792 Sed Rd.","L9M 0K2","Charlottetown","Prince Edward Island","Canada",34,NULL,74),
  (262,"Ap #309-8997 Nunc Ave","0075","Taguig","National Capital Region","Philippines",NULL,437,11),
  (263,"563-2112 Diam St.","28693","Sandviken","Gävleborgs län","Sweden",78,NULL,87),
  (264,"881-6057 Ut Av.","2989","HŽron","Luik","Belgium",237,426,NULL),
  (265,"P.O. Box 496, 1162 Enim. Av.","567582","Geylang","Central Region","Singapore",200,183,NULL),
  (266,"Ap #313-6645 Curabitur Street","31177","Radebeul","Sachsen","Germany",NULL,125,NULL),
  (267,"197-6374 Eros Avenue","0648 AU","Groenlo","Gelderland","Netherlands",NULL,436,NULL),
  (268,"276-8397 Dolor Rd.","2641","Vigan","Ilocos Region","Philippines",NULL,141,NULL),
  (269,"Ap #923-7430 Etiam Road","15187","Chungju","North Chungcheong","South Korea",NULL,233,NULL),
  (270,"Ap #147-4643 Eleifend St.","36934767","Uberlândia","Minas Gerais","Brazil",378,NULL,62);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (271,"P.O. Box 943, 4608 Luctus St.","3744","Feldkirch","Vorarlberg","Austria",190,445,NULL),
  (272,"8183 Sociosqu Ave","37-61","Kremenchuk","Poltava oblast","Ukraine",24,176,NULL),
  (273,"Ap #991-7830 Ullamcorper, Ave","18463","Yeongju","North Gyeongsang","South Korea",368,88,NULL),
  (274,"Ap #210-9119 Pede St.","225744","Bukit Timah","Central Region","Singapore",304,98,NULL),
  (275,"P.O. Box 753, 6828 Proin Rd.","8536 NH","Helmond","Noord Brabant","Netherlands",460,244,NULL),
  (276,"767-827 Proin St.","874755","Haveli","Azad Kashmir","Pakistan",430,230,NULL),
  (277,"198-7375 Ut, Street","81881-712","Paranaguá","Paraná","Brazil",393,383,NULL),
  (278,"P.O. Box 666, 7854 Neque Av.","52-702","Wałbrzych","Dolnośląskie","Poland",230,15,NULL),
  (279,"227-4610 Elementum St.","25567","Palembang","South Sumatra","Indonesia",NULL,158,NULL),
  (280,"Ap #317-8262 Tellus Rd.","2159 JN","Almere","Flevoland","Netherlands",266,NULL,19);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (281,"Ap #384-4957 Luctus Road","7774 OT","Enkhuizen","Noord Holland","Netherlands",237,155,NULL),
  (282,"Ap #179-4708 Ut Street","1273","Palmerston North","North Island","New Zealand",NULL,324,NULL),
  (283,"415-4843 Feugiat St.","69352","Avesta","Dalarnas län","Sweden",53,NULL,38),
  (284,"136-3427 Ullamcorper St.","81348","Owensboro","Kentucky","United States",500,43,NULL),
  (285,"523-9776 Arcu. St.","65429-122","Caxias","Maranhão","Brazil",326,381,NULL),
  (286,"Ap #476-9382 Scelerisque Street","411860","Saratov","Saratov Oblast","Russian Federation",148,226,NULL),
  (287,"Ap #998-2958 Dapibus Avenue","4784","Orp-Jauche","Waals-Brabant","Belgium",NULL,397,NULL),
  (288,"2769 Cras Ave","45695-462","Lauro de Freitas","Bahia","Brazil",127,189,NULL),
  (289,"P.O. Box 969, 8334 Tellus Av.","34134","Cajamarca","Cajamarca","Peru",17,349,49),
  (290,"Ap #192-5745 Cursus, Ave","687167","Simpang","North Region","Singapore",NULL,155,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (291,"2788 Sollicitudin Ave","95988","San Floriano del Collio","Friuli-Venezia Giulia","Italy",255,12,NULL),
  (292,"Ap #321-8153 Orci Rd.","72355","Springfield","Massachusetts","United States",59,36,NULL),
  (293,"980 Fusce Av.","974426","Raipur","Chhattisgarh","India",325,155,34),
  (294,"P.O. Box 826, 8083 Dolor. Av.","376544","Huara","Tarapacá","Chile",156,NULL,NULL),
  (295,"1041 Urna St.","424521","Hồ Chí Minh City","Hồ Chí Minh City","Vietnam",105,213,NULL),
  (296,"Ap #885-5696 Ridiculus Rd.","2895","Lombardsijde","West-Vlaanderen","Belgium",NULL,262,NULL),
  (297,"Ap #101-8462 Sed St.","02052","Tranås","Jönköpings län","Sweden",144,NULL,NULL),
  (298,"769-1075 Adipiscing Ave","22856","Göteborg","Västra Götalands län","Sweden",44,87,NULL),
  (299,"714-5262 Adipiscing Av.","99953","Fairbanks","Alaska","United States",456,141,NULL),
  (300,"9150 Felis Rd.","50202","Guápiles","Limón","Costa Rica",231,NULL,10);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (301,"Ap #599-8239 Nec Rd.","8386","Samal","Davao Region","Philippines",52,424,NULL),
  (302,"743-3292 Libero Av.","74012","Bengkulu","Bengkulu","Indonesia",135,100,NULL),
  (303,"654-9030 Sagittis Ave","7658","Westport","South Island","New Zealand",276,395,NULL),
  (304,"P.O. Box 133, 2660 Interdum Road","411925","Saratov","Saratov Oblast","Russian Federation",49,313,46),
  (305,"P.O. Box 644, 4204 Malesuada. Road","469375","Manizales","Caldas","Colombia",499,42,NULL),
  (306,"Ap #614-347 Eu Road","653315","Paya Lebar","East Region","Singapore",195,NULL,NULL),
  (307,"511-5636 Vitae, Rd.","44688","Gaithersburg","Maryland","United States",484,77,57),
  (308,"P.O. Box 990, 5563 Ipsum Ave","486173","Đồng Xoài","Bình Phước","Vietnam",43,NULL,NULL),
  (309,"P.O. Box 914, 5761 Tempus Rd.","53-45","Berdiansk","Zaporizhzhia oblast","Ukraine",499,485,NULL),
  (310,"P.O. Box 161, 4654 Per Av.","80732","Schwalbach","Saarland","Germany",200,101,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (311,"Ap #559-3568 Luctus Av.","61510","Toledo","Castilla - La Mancha","Spain",NULL,309,NULL),
  (312,"P.O. Box 252, 4389 Id Rd.","52470","Jayapura","Papua","Indonesia",NULL,134,NULL),
  (313,"Ap #792-1083 Sit Rd.","973586","Trà Vinh","Trà Vinh","Vietnam",169,40,NULL),
  (314,"Ap #168-9441 Eu St.","0368","Victorias","Western Visayas","Philippines",20,28,53),
  (315,"Ap #512-7740 Arcu Ave","583144","Lạng Sơn","Lạng Sơn","Vietnam",132,186,28),
  (316,"788-7114 Iaculis Street","254418","Guwahati","Assam","India",223,11,NULL),
  (317,"561-9294 Vel St.","84756-325","Guarapuava","Paraná","Brazil",NULL,2,31),
  (318,"Ap #621-3808 Ut Rd.","95354","Bad Dürkheim","Rheinland-Pfalz","Germany",NULL,381,NULL),
  (319,"158-8157 Id Street","53948","Gebze","Kocaeli","Turkey",456,108,NULL),
  (320,"Ap #141-6661 Mollis. Avenue","6599","Salzburg","Salzburg","Austria",339,383,61);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (321,"2774 Sem Street","52878","Karapınar","Konya","Turkey",189,323,NULL),
  (322,"5709 Justo Road","640170","Aizwal","Mizoram","India",341,14,NULL),
  (323,"Ap #144-339 Ut Rd.","45558","Göteborg","Västra Götalands län","Sweden",99,139,NULL),
  (324,"858-2908 Donec Av.","50214","Limón (Puerto Limón]","Limón","Costa Rica",NULL,184,NULL),
  (325,"121-7742 Aliquam Avenue","54222","Chesapeake","Virginia","United States",121,358,75),
  (326,"2888 Ac Street","381654","Vĩnh Long","Vĩnh Long","Vietnam",442,391,NULL),
  (327,"Ap #925-2379 In, Av.","6703","Ilagan","Cagayan Valley","Philippines",247,489,NULL),
  (328,"868-2010 Ipsum. Rd.","693201","Sakhalin","Sakhalin Oblast","Russian Federation",371,154,NULL),
  (329,"Ap #276-4186 Amet Rd.","8464 QX","Nieuwegein","Utrecht","Netherlands",332,85,NULL),
  (330,"9285 Fusce Rd.","677179","Cartagena del Chairá","Caquetá","Colombia",370,9,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (331,"P.O. Box 560, 5540 Cras Street","3729","Launceston","Tasmania","Australia",NULL,22,NULL),
  (332,"P.O. Box 852, 8536 Ante, Avenue","3227","Sarpsborg","Viken","Norway",88,237,NULL),
  (333,"242-7395 Eros. Av.","11207","Barranca","Puntarenas","Costa Rica",27,111,NULL),
  (334,"Ap #252-3307 Nec Road","7796-5520","Bellville","Western Cape","South Africa",433,33,22),
  (335,"Ap #799-9502 Ligula. Street","38354","Berlin","Berlin","Germany",218,262,NULL),
  (336,"Ap #599-7265 Mauris Avenue","253562","Ogbomosho","Oyo","Nigeria",470,354,NULL),
  (337,"778-6520 A, Avenue","3848 VS","Zutphen","Gelderland","Netherlands",281,149,NULL),
  (338,"492-7304 At Ave","82-236","Częstochowa","Sląskie","Poland",104,291,NULL),
  (339,"P.O. Box 401, 4726 Donec Avenue","339381","Yunnan","Xīnán","China",26,322,NULL),
  (340,"P.O. Box 647, 2598 Arcu. Av.","50115","Siquirres","Limón","Costa Rica",115,500,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (341,"P.O. Box 898, 8146 Lectus Rd.","185583","Chillán","Biobío","Chile",NULL,53,NULL),
  (342,"Ap #933-2927 Dis Ave","112068","Buôn Ma Thuột","Đắk Lắk","Vietnam",403,216,NULL),
  (343,"Ap #515-8465 Vitae, Road","6239-3893","Phalaborwa","Limpopo","South Africa",451,244,45),
  (344,"8383 Ligula St.","34771","Kendari","Southeast Sulawesi","Indonesia",403,290,NULL),
  (345,"409-1864 Odio Street","12101","San Antonio","San José","Costa Rica",NULL,184,NULL),
  (346,"Ap #848-6694 Magnis Rd.","916853","Gangtok","Sikkim","India",233,2,NULL),
  (347,"P.O. Box 926, 3355 Non Ave","333371","Gilgit","Gilgit Baltistan","Pakistan",492,411,NULL),
  (348,"Ap #331-1974 Dictum Avenue","743123","Liaoning","Dōngběi","China",151,353,NULL),
  (349,"372-8574 Auctor Avenue","0470","Puerto Princesa","Southwestern Tagalog Region","Philippines",235,231,NULL),
  (350,"Ap #435-5642 Ut Av.","40809","San Pablo","Heredia","Costa Rica",443,127,71);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (351,"Ap #108-342 Nam Rd.","59-464","Częstochowa","Sląskie","Poland",30,309,NULL),
  (352,"914-9143 Justo St.","912736","Ikot Ekpene","Akwa Ibom","Nigeria",188,68,NULL),
  (353,"2547 Nisi. Rd.","936285","Manizales","Caldas","Colombia",210,100,NULL),
  (354,"P.O. Box 567, 4790 Vitae, Street","67680","Berlin","Berlin","Germany",414,102,NULL),
  (355,"Ap #552-1368 Vel St.","Y39 7QL","Weston-super-Mare","Somerset","United Kingdom",219,451,NULL),
  (356,"Ap #709-3567 Imperdiet Street","66223","Pekanbaru","Riau","Indonesia",NULL,30,NULL),
  (357,"733-5772 Id Street","54-34","Haisyn","Vinnytsia oblast","Ukraine",276,NULL,NULL),
  (358,"783-4125 Placerat. Street","6472","Launceston","Tasmania","Australia",NULL,379,NULL),
  (359,"P.O. Box 246, 9317 Lacus. Rd.","8471","Whyalla","South Australia","Australia",16,379,NULL),
  (360,"Ap #781-8240 Ut Av.","432191","Ajmer","Rajasthan","India",495,413,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (361,"891-5153 Hendrerit Rd.","521122","Hubei","Zhōngnán","China",328,135,NULL),
  (362,"P.O. Box 369, 6611 Sodales Ave","9751","Alaminos","Ilocos Region","Philippines",276,471,NULL),
  (363,"Ap #777-8308 Magnis Ave","915563","Kohima","Nagaland","India",NULL,407,NULL),
  (364,"871-3913 Aliquam Av.","27442-967","Rio de Janeiro","Rio de Janeiro","Brazil",481,396,NULL),
  (365,"P.O. Box 817, 2355 Molestie Road","PM4R 9CB","Holyhead","Anglesey","United Kingdom",NULL,471,NULL),
  (366,"495-6272 Sed, Road","26783","Cerignola","Puglia","Italy",491,227,NULL),
  (367,"8247 Urna Rd.","1159","Grimstad","Agder","Norway",NULL,259,80),
  (368,"951-4518 Aliquet, Road","10522","Boise","Idaho","United States",NULL,212,NULL),
  (369,"6459 Nisi. St.","8354","Palmerston","Northern Territory","Australia",422,327,NULL),
  (370,"Ap #926-4762 Mauris, Road","05870","Seydişehir","Konya","Turkey",408,NULL,97);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (371,"8140 Eget Rd.","26831","Chepén","La Libertad","Peru",84,290,NULL),
  (372,"338-3924 Neque Avenue","38506","Reims","Champagne-Ardenne","France",319,297,NULL),
  (373,"228-2795 Nibh Street","32-82","Dovzhansk","Luhansk oblast","Ukraine",NULL,339,NULL),
  (374,"3647 Nunc Avenue","141177","Staraya Kupavna","Moscow Oblast","Russian Federation",438,226,NULL),
  (375,"Ap #925-2832 Erat. St.","854015","Bhuj","Gujarat","India",198,78,NULL),
  (376,"882-6737 Aliquam, Road","558497","Chitral","Khyber Pakhtoonkhwa","Pakistan",NULL,269,NULL),
  (377,"P.O. Box 692, 9985 Quisque St.","1590","Bago","Western Visayas","Philippines",338,187,NULL),
  (378,"177-9864 Lectus Av.","KT12 3YW","Peterborough","Northamptonshire","United Kingdom",30,443,NULL),
  (379,"Ap #805-307 Nisi. St.","456699","Tryokhgorny","Chelyabinsk Oblast","Russian Federation",NULL,224,NULL),
  (380,"527-7210 Parturient St.","3358","Noorderwijk","Antwerpen","Belgium",233,NULL,58);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (381,"602-3324 Diam Road","34-168","Gliwice","Sląskie","Poland",NULL,347,NULL),
  (382,"477-9843 Sapien. Rd.","38599","Mustafakemalpaşa","Bursa","Turkey",NULL,310,NULL),
  (383,"Ap #324-9145 Consectetuer Rd.","723778","Kotli","Azad Kashmir","Pakistan",392,435,NULL),
  (384,"8397 Imperdiet, Rd.","80-227","Jelenia Góra","Dolnośląskie","Poland",367,266,NULL),
  (385,"P.O. Box 202, 7630 Luctus Rd.","88416-740","Itajaí","Santa Catarina","Brazil",254,NULL,8),
  (386,"P.O. Box 117, 3082 Blandit St.","1121","Parndorf","Burgenland","Austria",92,409,NULL),
  (387,"781-9462 Rutrum St.","64815","Teruel","Aragón","Spain",253,133,NULL),
  (388,"101-5191 Vulputate Avenue","52639-13495","San Cristóbal de las Casas","Chiapas","Mexico",487,187,60),
  (389,"Ap #630-4097 In Avenue","8804-6742","Alice","Eastern Cape","South Africa",498,127,NULL),
  (390,"P.O. Box 493, 8603 Integer Avenue","768176","Pallavaram","Tamil Nadu","India",88,67,78);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (391,"458-5827 Vel Street","522843","Changi Bay","East Region","Singapore",240,354,NULL),
  (392,"423-6636 Curabitur Road","71544","Joué-lès-Tours","Centre","France",402,282,NULL),
  (393,"P.O. Box 739, 6941 Quis Rd.","5346","Pironchamps","Henegouwen","Belgium",385,345,42),
  (394,"568-7918 Quam Rd.","S6N 4C3","Weyburn","Saskatchewan","Canada",224,307,NULL),
  (395,"Ap #595-3476 Semper St.","89717","Bollnäs","Gävleborgs län","Sweden",149,193,NULL),
  (396,"662-6922 Vestibulum Avenue","629610","Futrono","Los Ríos","Chile",8,474,NULL),
  (397,"Ap #890-3215 Vehicula Rd.","51595-242","Recife","Pernambuco","Brazil",442,118,NULL),
  (398,"7237 Proin Rd.","5802","Voitsberg","Styria","Austria",410,446,NULL),
  (399,"P.O. Box 610, 8811 Orci, St.","843263","Lạng Sơn","Lạng Sơn","Vietnam",171,391,NULL),
  (400,"5523 Nibh Av.","301288","Tula","Tula Oblast","Russian Federation",492,366,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (401,"2077 Orci. Av.","835175","Cali","Valle del Cauca","Colombia",185,377,95),
  (402,"194-8659 Accumsan Av.","12233","Mokpo","South Jeolla","South Korea",NULL,346,NULL),
  (403,"Ap #940-1487 Arcu. St.","50305","Cañas","Guanacaste","Costa Rica",NULL,185,NULL),
  (404,"Ap #365-6143 Quis Rd.","67113","Saint-Malo","Bretagne","France",NULL,123,NULL),
  (405,"P.O. Box 757, 5068 Venenatis Avenue","7615","Iriga","Bicol Region","Philippines",325,98,NULL),
  (406,"P.O. Box 210, 8097 Quis Street","11458","Straubing","Bayern","Germany",443,NULL,NULL),
  (407,"Ap #194-206 Et St.","3755","Christchurch","South Island","New Zealand",187,NULL,NULL),
  (408,"P.O. Box 578, 4246 Felis St.","6264","Rulles","Luxemburg","Belgium",76,NULL,NULL),
  (409,"146-1339 Turpis. Rd.","11821-82482","Celaya","Guanajuato","Mexico",13,127,NULL),
  (410,"473 Felis Av.","568063","Gia Nghĩa","Đắk Nông","Vietnam",54,7,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (411,"3889 Vivamus Rd.","06285","Seogwipo","Jeju","South Korea",NULL,410,NULL),
  (412,"P.O. Box 390, 2147 Dui, Rd.","34-38","Nizhyn","Chernihiv oblast","Ukraine",80,NULL,91),
  (413,"710-8888 Nulla. Av.","15-261","Rzeszów","Podkarpackie","Poland",239,401,41),
  (414,"620-8916 Lorem, St.","454536","Las Condes","Metropolitana de Santiago","Chile",NULL,282,NULL),
  (415,"P.O. Box 840, 1855 Dolor. St.","8752","Porsgrunn","Vestfold og Telemark","Norway",35,1,NULL),
  (416,"Ap #793-5970 Lacinia Street","6816","Dandenong","Victoria","Australia",205,281,NULL),
  (417,"P.O. Box 529, 484 Vel, Road","72761","Minneapolis","Minnesota","United States",223,NULL,NULL),
  (418,"P.O. Box 660, 1910 Massa Street","8023","Tokoroa","North Island","New Zealand",NULL,358,NULL),
  (419,"Ap #557-5167 Ligula Rd.","18505","Ahrensburg","Schleswig-Holstein","Germany",277,73,NULL),
  (420,"P.O. Box 137, 6257 Malesuada Street","40849","Jaén","Cajamarca","Peru",195,315,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (421,"Ap #735-5012 Semper Ave","4589","Dublin","Leinster","Ireland",315,277,NULL),
  (422,"757-8445 Eros Rd.","8318 BR","Gouda","Zuid Holland","Netherlands",433,402,NULL),
  (423,"223-3175 Sed Street","26692","Huacho","Lima","Peru",NULL,440,NULL),
  (424,"229-1796 Mauris. Rd.","778722","Constitución","Maule","Chile",162,NULL,NULL),
  (425,"5525 Aliquam Ave","58573-275","Patos","Paraíba","Brazil",233,105,NULL),
  (426,"4596 Nunc Road","823576","Khuzdar","Balochistan","Pakistan",12,229,25),
  (427,"306-9559 Consectetuer Avenue","562292","Sherani","Balochistan","Pakistan",330,NULL,83),
  (428,"419-1950 Mauris, Rd.","5334","Schwaz","Tyrol","Austria",299,NULL,NULL),
  (429,"Ap #487-3386 Ultrices Rd.","21557","Baiso","Emilia-Romagna","Italy",NULL,479,NULL),
  (430,"479-5621 In Rd.","709171","Purulia","Jharkhand","India",298,NULL,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (431,"Ap #949-3275 Nunc. Avenue","55654","Söke","Aydın","Turkey",NULL,460,NULL),
  (432,"P.O. Box 385, 7553 Varius Avenue","331757","Chakwal","Punjab","Pakistan",128,76,30),
  (433,"298-5846 Id Road","400175","Volgograd","Volgograd Oblast","Russian Federation",321,261,86),
  (434,"Ap #650-4720 Parturient St.","4480","Whyalla","South Australia","Australia",NULL,103,NULL),
  (435,"863-8186 Id Rd.","95-63","Varash","Rivne oblast","Ukraine",329,279,68),
  (436,"Ap #541-2755 Cursus Street","45186","Honolulu","Hawaii","United States",NULL,467,NULL),
  (437,"Ap #650-6173 Augue. St.","2848-5781","Phalaborwa","Limpopo","South Africa",213,442,NULL),
  (438,"440-3287 Ut Road","6426-5277","Umlazi","KwaZulu-Natal","South Africa",404,155,NULL),
  (439,"P.O. Box 452, 2432 Cras Av.","HZ6 2SP","Kinross","Kinross-shire","United Kingdom",134,180,NULL),
  (440,"294-8736 Scelerisque Street","7234","Palmerston","Northern Territory","Australia",234,35,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (441,"636 Ut, Road","4132","Sarpsborg","Viken","Norway",5,401,NULL),
  (442,"Ap #863-4095 Mauris Rd.","7742","Rotorua","North Island","New Zealand",325,378,NULL),
  (443,"Ap #722-2516 Donec Rd.","762326","Tianjin","Huáběi","China",28,70,NULL),
  (444,"774-7902 Ut, St.","67R 8B5","Rae-Edzo","Northwest Territories","Canada",103,NULL,90),
  (445,"Ap #284-1763 Donec Avenue","7271","Kristiansund","Møre og Romsdal","Norway",77,156,NULL),
  (446,"979-8784 Eget Ave","8706","Puerto Princesa","Southwestern Tagalog Region","Philippines",121,NULL,NULL),
  (447,"Ap #222-8697 Dignissim Ave","17514","Albi","Midi-Pyrénées","France",173,201,NULL),
  (448,"437-9135 Vulputate, Rd.","5786","Waidhofen an der Ybbs","Lower Austria","Austria",254,NULL,NULL),
  (449,"350-9820 Volutpat. Avenue","5836","Belfast","Ulster","Ireland",65,451,15),
  (450,"186-6799 Leo. Ave","5110","Trazegnies","Henegouwen","Belgium",233,NULL,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (451,"Ap #560-3684 Sodales. Rd.","174574","Novgorod","Novgorod Oblast","Russian Federation",24,103,NULL),
  (452,"637-3245 Eu, Rd.","506442","Mohmand Agency","FATA","Pakistan",470,387,NULL),
  (453,"8893 Scelerisque Street","221268","Mitú","Vaupés","Colombia",432,202,48),
  (454,"8458 Facilisi. Ave","688136","Quảng Ngãi","Quảng Ngãi","Vietnam",80,NULL,NULL),
  (455,"158-6666 Gravida. St.","3789","Marchtrenk","Upper Austria","Austria",85,NULL,NULL),
  (456,"P.O. Box 783, 3544 Amet, Street","42328","Castiglione a Casauria","Abruzzo","Italy",274,NULL,NULL),
  (457,"3403 Lacus Avenue","74-573","Wałbrzych","Dolnośląskie","Poland",69,229,NULL),
  (458,"Ap #324-6201 Vel Ave","1889","San Carlos","Ilocos Region","Philippines",NULL,38,NULL),
  (459,"218-1745 Semper Street","453896","Sierra Gorda","Antofagasta","Chile",NULL,439,NULL),
  (460,"8025 Magna Av.","574948","Huara","Tarapacá","Chile",148,67,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (461,"1523 Ut Rd.","R7W 2Y6","Minitonas","Manitoba","Canada",196,408,NULL),
  (462,"6272 Fringilla Ave","518250","Agartala","Tripura","India",224,76,NULL),
  (463,"611-6764 Vulputate Rd.","RJ15 3LD","Coupar Angus","Perthshire","United Kingdom",413,17,NULL),
  (464,"412 Urna. Ave","4864","Uitkerke","West-Vlaanderen","Belgium",NULL,416,NULL),
  (465,"1314 Tempor Ave","48-46","Izmail","Odessa oblast","Ukraine",NULL,410,9),
  (466,"8326 Ultrices, Road","86331-477","Curitiba","Paraná","Brazil",NULL,225,NULL),
  (467,"6530 Arcu. Rd.","76721","Casole d'Elsa","Toscana","Italy",431,138,NULL),
  (468,"420-1150 Eu, Rd.","846305","Bến Tre","Bến Tre","Vietnam",NULL,327,NULL),
  (469,"Ap #670-1230 Phasellus Avenue","845277","Tengah","West Region","Singapore",473,342,NULL),
  (470,"198-9793 Fermentum Rd.","327842","Los Álamos","Biobío","Chile",106,239,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (471,"Ap #187-7751 Sed Ave","98543","Loreto","Marche","Italy",296,323,NULL),
  (472,"P.O. Box 780, 8956 Convallis Rd.","516896","Aligarh","Uttar Pradesh","India",NULL,380,NULL),
  (473,"Ap #684-9700 Ac Road","FE8 1JR","Sandy","Bedfordshire","United Kingdom",53,51,NULL),
  (474,"P.O. Box 621, 8422 Rhoncus. St.","26061","Palagano","Emilia-Romagna","Italy",475,304,NULL),
  (475,"Ap #667-2547 Posuere St.","68752-31815","Ciudad Victoria","Tamaulipas","Mexico",401,NULL,NULL),
  (476,"P.O. Box 918, 3844 Sed St.","613291","Tengah","West Region","Singapore",158,NULL,NULL),
  (477,"Ap #429-688 Feugiat Ave","6565-5887","Swellendam","Western Cape","South Africa",175,74,NULL),
  (478,"Ap #731-2494 Elementum St.","24453","Lambayeque","Lambayeque","Peru",NULL,442,NULL),
  (479,"Ap #680-7606 Magna Rd.","4152","Naga","Bicol Region","Philippines",165,339,35),
  (480,"413-9155 Dolor. Road","45838","San Cristóbal de la Laguna","Canarias","Spain",140,428,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (481,"Ap #234-7972 Lobortis St.","09466","Jeju","Jeju","South Korea",125,100,NULL),
  (482,"P.O. Box 234, 6181 Vitae Avenue","23153","Albacete","Castilla - La Mancha","Spain",401,101,37),
  (483,"6338 Interdum. St.","16778","Kungälv","Västra Götalands län","Sweden",426,455,NULL),
  (484,"Ap #471-3889 Fermentum Rd.","2475","Oamaru","South Island","New Zealand",27,206,NULL),
  (485,"3805 Duis Ave","456622","Maule","Maule","Chile",277,85,7),
  (486,"Ap #121-4799 Integer Rd.","22646","Chesapeake","Virginia","United States",488,269,56),
  (487,"P.O. Box 117, 4068 Nec Rd.","5963","Townsville","Queensland","Australia",29,78,NULL),
  (488,"Ap #645-2263 Laoreet, Street","9432","Kristiansand","Agder","Norway",114,453,NULL),
  (489,"Ap #113-4185 Duis Av.","5607","Oslo","Oslo","Norway",130,40,NULL),
  (490,"531-5171 Vel Rd.","23555","Alingsås","Västra Götalands län","Sweden",497,NULL,NULL);
INSERT INTO `direcciones` (`id_direccion`,`calle`,`numero`,`ciudad`,`provincia`,`pais`,`id_cliente`,`id_empleado`,`id_sucursal`)
VALUES
  (491,"P.O. Box 503, 3185 Lobortis Av.","0721-6594","Klerksdorp","North West","South Africa",NULL,239,2),
  (492,"Ap #950-642 In Rd.","53314","Kırıkhan","Hatay","Turkey",230,247,NULL),
  (493,"211-3466 Ridiculus Rd.","T7 4EM","Blaenau Ffestiniog","Merionethshire","United Kingdom",NULL,207,50),
  (494,"Ap #213-2885 Vitae Ave","263757","Bogotá","Distrito Capital","Colombia",NULL,378,NULL),
  (495,"607-6738 Eleifend St.","79541","Hamburg","Hamburg","Germany",NULL,217,65),
  (496,"451-8030 Rutrum St.","73739-614","Goiânia","Goiás","Brazil",NULL,259,NULL),
  (497,"Ap #433-2280 Nulla. Avenue","2646","Stirling","Western Australia","Australia",192,4,NULL),
  (498,"Ap #212-3697 Erat Road","11683","Yurimaguas","Loreto","Peru",NULL,95,NULL),
  (499,"3115 Quis Ave","883874","Bettiah","Bihar","India",NULL,37,NULL),
  (500,"743-589 Est, Road","99909","Fairbanks","Alaska","United States",433,NULL,NULL);
