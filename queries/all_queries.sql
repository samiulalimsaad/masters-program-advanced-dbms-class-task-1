-- delete all databases
DROP TABLE IF EXISTS teaches;

DROP TABLE IF EXISTS advisor;

DROP TABLE IF EXISTS instructor;

DROP TABLE IF EXISTS takes;

DROP TABLE IF EXISTS student;

DROP TABLE IF EXISTS section;

DROP TABLE IF EXISTS time_slot;

DROP TABLE IF EXISTS prereq;

DROP TABLE IF EXISTS course;

DROP TABLE IF EXISTS classroom;

DROP TABLE IF EXISTS department;

-- Create the "department" table
CREATE TABLE
    department (
        dept_name varchar(50),
        building varchar(50),
        budget numeric(12, 2),
        primary key (dept_name)
    );

-- Create the "classroom" table
CREATE TABLE
    classroom (
        room_no numeric(10),
        capacity numeric(10),
        building varchar(50),
        primary key (room_no, building)
    );

-- Create the "course" table
CREATE TABLE
    course (
        course_id numeric(10),
        dept_name varchar(50),
        title varchar(50),
        credit numeric(10),
        primary key (course_id),
        foreign key (dept_name) references department
    );

-- Create the "prereq" table
CREATE TABLE
    prereq (
        course_id numeric(10),
        prereq_id numeric(10),
        primary key (course_id, prereq_id),
        foreign key (prereq_id) references course (course_id),
        foreign key (course_id) references course (course_id)
    );

-- Create the "time_slot" table
CREATE TABLE
    time_slot (
        time_slot_id numeric(10),
        day varchar(50),
        start_time timestamp,
        end_time timestamp,
        primary key (time_slot_id, start_time, day)
    );

-- Create the "section" table
CREATE TABLE
    section (
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        room_no numeric(10),
        building varchar(50),
        time_slot_id timestamp,
        primary key (course_id, sec_id, semester, year),
        foreign key (room_no) references classroom (room_no),
        foreign key (building) references classroom (building),
        foreign key (course_id) references course (course_id),
        foreign key (time_slot_id) references time_slot (time_slot_id)
    );

-- Create the "student" table
CREATE TABLE
    student (
        ID numeric(10),
        name varchar(50),
        dept_name varchar(50),
        tot_cred numeric(3),
        primary key (ID),
        foreign key (dept_name) references department
    );

-- Create the "takes" table
CREATE TABLE
    takes (
        ID numeric(10),
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        grade varchar(5),
        primary key (ID, course_id, sec_id, semester, year),
        foreign key (course_id) references section (course_id),
        foreign key (sec_id) references section (sec_id),
        foreign key (semester) references section (semester),
        foreign key (year) references section (year),
        foreign key (ID) references student (ID)
    );

-- Create the "instructor" table
CREATE TABLE
    instructor (
        ID numeric(10),
        name varchar(50),
        dept_name varchar(50),
        salary numeric(12, 2),
        primary key (ID),
        foreign key (dept_name) references department
    );

-- Create the "advisor" table
CREATE TABLE
    advisor (
        s_id numeric(10),
        i_id numeric(10),
        primary key (s_id),
        foreign key (s_id) references student (ID),
        foreign key (i_id) references instructor (ID)
    );

-- Create the "teaches" table
CREATE TABLE
    teaches (
        ID numeric(10),
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        primary key (ID, course_id, sec_id, semester),
        foreign key (course_id) references section (course_id),
        foreign key (sec_id) references section (sec_id),
        foreign key (semester) references section (semester),
        foreign key (ID) references instructor (ID)
    );

-- department
-- classroom
-- course
-- prereq
-- time_slot
-- section
-- student
-- takes
-- instructor
-- advisor
-- teachesINSERT INTO department VALUES ('Progressive web-enabled projection', '610', 346104.93);
INSERT INTO department VALUES ('Pre-emptive optimal complexity', '596', 529030.69);
INSERT INTO department VALUES ('User-centric 3rdgeneration paradigm', '61329', 49210.89);
INSERT INTO department VALUES ('Business-focused 24/7 approach', '0505', 461552.76);
INSERT INTO department VALUES ('Future-proofed impactful product', '300', 788444.17);
INSERT INTO department VALUES ('Synergistic tertiary workforce', '55042', 373924.40);
INSERT INTO department VALUES ('Pre-emptive client-driven adapter', '24767', 884975.81);
INSERT INTO department VALUES ('Operative tertiary functionalities', '25281', 695526.24);
INSERT INTO department VALUES ('Configurable reciprocal data-warehouse', '342', 803694.91);
INSERT INTO department VALUES ('Advanced systemic initiative', '63002', 82692.62);
INSERT INTO department VALUES ('Exclusive foreground challenge', '6711', 584825.73);
INSERT INTO department VALUES ('Progressive tertiary moratorium', '636', 785104.42);
INSERT INTO department VALUES ('Reverse-engineered systematic implementation', '010', 136849.15);
INSERT INTO department VALUES ('Phased responsive help-desk', '581', 660288.05);
INSERT INTO department VALUES ('Organized bi-directional adapter', '200', 755104.56);
INSERT INTO department VALUES ('Stand-alone discrete frame', '506', 201833.52);
INSERT INTO department VALUES ('Grass-roots 24/7 productivity', '97386', 756620.95);
INSERT INTO department VALUES ('Up-sized static pricing structure', '73847', 441501.32);
INSERT INTO department VALUES ('Open-source analyzing info-mediaries', '9923', 496735.71);
INSERT INTO department VALUES ('Expanded multi-tasking project', '650', 547579.39);
INSERT INTO department VALUES ('Phased system-worthy benchmark', '35291', 153833.56);
INSERT INTO department VALUES ('Sharable neutral contingency', '6703', 346819.27);
INSERT INTO department VALUES ('Self-enabling heuristic forecast', '87721', 300515.49);
INSERT INTO department VALUES ('Secured mission-critical open system', '091', 739720.44);
INSERT INTO department VALUES ('Devolved neutral protocol', '44282', 153305.33);
INSERT INTO department VALUES ('Robust contextually-based frame', '224', 875702.93);
INSERT INTO department VALUES ('Compatible heuristic moderator', '16415', 60406.33);
INSERT INTO department VALUES ('Proactive mission-critical challenge', '95323', 105069.13);
INSERT INTO department VALUES ('Enterprise-wide systemic protocol', '4548', 177767.47);
INSERT INTO department VALUES ('Compatible executive definition', '876', 290989.81);
INSERT INTO department VALUES ('Fundamental multimedia database', '987', 502927.78);
INSERT INTO department VALUES ('Balanced grid-enabled array', '048', 803120.84);
INSERT INTO department VALUES ('Enterprise-wide solution-oriented open system', '221', 466272.04);
INSERT INTO department VALUES ('Synergistic asynchronous flexibility', '872', 103450.52);
INSERT INTO department VALUES ('Cloned clear-thinking frame', '682', 994584.04);
INSERT INTO department VALUES ('Robust grid-enabled workforce', '924', 319106.80);
INSERT INTO department VALUES ('Switchable mobile open architecture', '3094', 785145.51);
INSERT INTO department VALUES ('Synchronized global emulation', '292', 785530.19);
INSERT INTO department VALUES ('Centralized eco-centric product', '173', 529360.04);
INSERT INTO department VALUES ('User-friendly optimizing Graphical User Interface', '1402', 232372.13);
INSERT INTO department VALUES ('Function-based human-resource alliance', '520', 935229.95);
INSERT INTO department VALUES ('Digitized user-facing infrastructure', '138', 334401.44);
INSERT INTO department VALUES ('Reactive didactic synergy', '695', 577476.51);
INSERT INTO department VALUES ('Virtual mission-critical projection', '37337', 256727.31);
INSERT INTO department VALUES ('Progressive well-modulated architecture', '29352', 674609.11);
INSERT INTO department VALUES ('Adaptive uniform moderator', '678', 498430.19);
INSERT INTO department VALUES ('Versatile tangible benchmark', '12055', 614899.25);
INSERT INTO department VALUES ('Up-sized bi-directional function', '619', 237509.51);
INSERT INTO department VALUES ('Mandatory responsive methodology', '0951', 499111.12);
INSERT INTO department VALUES ('Enhanced client-server infrastructure', '7764', 974177.41);
INSERT INTO department VALUES ('Distributed global application', '1916', 157041.73);
INSERT INTO department VALUES ('Assimilated next generation pricing structure', '787', 423498.83);
INSERT INTO department VALUES ('Enterprise-wide multimedia secured line', '667', 152227.34);
INSERT INTO department VALUES ('Integrated static collaboration', '63949', 460168.70);
INSERT INTO department VALUES ('Mandatory hybrid model', '23262', 126321.55);
INSERT INTO department VALUES ('Up-sized didactic secured line', '50209', 728994.04);
INSERT INTO department VALUES ('Progressive demand-driven process improvement', '53969', 433543.75);
INSERT INTO department VALUES ('Proactive executive frame', '4198', 367003.64);
INSERT INTO department VALUES ('Operative high-level Graphic Interface', '710', 256912.86);
INSERT INTO department VALUES ('Seamless context-sensitive capability', '2571', 467370.08);
INSERT INTO department VALUES ('Distributed asymmetric knowledge user', '842', 897563.71);
INSERT INTO department VALUES ('Optimized exuding focus group', '0803', 271328.91);
INSERT INTO department VALUES ('Configurable radical intranet', '788', 987114.99);
INSERT INTO department VALUES ('Distributed foreground structure', '69325', 852514.44);
INSERT INTO department VALUES ('Visionary modular Graphic Interface', '1768', 282167.09);
INSERT INTO department VALUES ('Horizontal scalable migration', '64628', 689914.56);
INSERT INTO department VALUES ('Up-sized asymmetric knowledgebase', '82624', 25305.06);
INSERT INTO department VALUES ('User-friendly contextually-based database', '9891', 902638.88);
INSERT INTO department VALUES ('Synergized global benchmark', '2913', 754695.60);
INSERT INTO department VALUES ('Vision-oriented high-level success', '31534', 416467.78);
INSERT INTO department VALUES ('Synergistic grid-enabled emulation', '41061', 775526.91);
INSERT INTO department VALUES ('Grass-roots non-volatile strategy', '07538', 525044.61);
INSERT INTO department VALUES ('Inverse needs-based function', '90929', 757709.12);
INSERT INTO department VALUES ('Ameliorated motivating matrix', '318', 394425.59);
INSERT INTO department VALUES ('De-engineered coherent structure', '0999', 392565.22);
INSERT INTO department VALUES ('Balanced optimal extranet', '70072', 408066.85);
INSERT INTO department VALUES ('Centralized analyzing support', '206', 961543.73);
INSERT INTO department VALUES ('Grass-roots system-worthy support', '5928', 695408.79);
INSERT INTO department VALUES ('Multi-layered secondary knowledgebase', '66868', 538002.96);
INSERT INTO department VALUES ('Devolved object-oriented standardization', '2987', 394445.88);
INSERT INTO department VALUES ('Reverse-engineered static encryption', '92839', 359257.85);
INSERT INTO department VALUES ('Automated background Local Area Network', '210', 597370.68);
INSERT INTO department VALUES ('User-friendly disintermediate synergy', '996', 433542.85);
INSERT INTO department VALUES ('Multi-lateral multimedia portal', '6226', 402795.58);
INSERT INTO department VALUES ('Ameliorated methodical open architecture', '14662', 628579.43);
INSERT INTO department VALUES ('Reactive next generation extranet', '9224', 317111.34);
INSERT INTO department VALUES ('Diverse modular pricing structure', '72677', 387191.43);
INSERT INTO department VALUES ('Digitized context-sensitive emulation', '9494', 244163.11);
INSERT INTO department VALUES ('Distributed 4thgeneration firmware', '3245', 164423.48);
INSERT INTO department VALUES ('Public-key web-enabled strategy', '38350', 171482.86);
INSERT INTO department VALUES ('Synergistic human-resource instruction set', '4121', 148638.08);
INSERT INTO department VALUES ('Decentralized modular hardware', '8643', 768636.02);
INSERT INTO department VALUES ('Business-focused intangible middleware', '92588', 485027.06);
INSERT INTO department VALUES ('Total 24hour software', '34988', 169108.64);
INSERT INTO department VALUES ('Universal composite ability', '343', 531343.20);
INSERT INTO department VALUES ('Mandatory bifurcated Internet solution', '45665', 43875.81);
INSERT INTO department VALUES ('Integrated foreground access', '72392', 853418.58);
INSERT INTO department VALUES ('Face-to-face scalable utilization', '377', 720575.97);
INSERT INTO department VALUES ('Multi-channeled methodical definition', '225', 957030.06);
INSERT INTO department VALUES ('Operative system-worthy forecast', '259', 357539.33);
INSERT INTO classroom VALUES (767, 63, '44282');
INSERT INTO classroom VALUES (701, 93, '1402');
INSERT INTO classroom VALUES (723, 20, '996');
INSERT INTO classroom VALUES (510, 87, '010');
INSERT INTO classroom VALUES (278, 50, '221');
INSERT INTO classroom VALUES (405, 42, '38350');
INSERT INTO classroom VALUES (384, 88, '682');
INSERT INTO classroom VALUES (777, 32, '87721');
INSERT INTO classroom VALUES (899, 63, '842');
INSERT INTO classroom VALUES (461, 31, '92588');
INSERT INTO classroom VALUES (960, 100, '92588');
INSERT INTO classroom VALUES (523, 95, '872');
INSERT INTO classroom VALUES (638, 36, '9494');
INSERT INTO classroom VALUES (743, 90, '695');
INSERT INTO classroom VALUES (481, 27, '07538');
INSERT INTO classroom VALUES (564, 64, '318');
INSERT INTO classroom VALUES (257, 65, '667');
INSERT INTO classroom VALUES (228, 76, '55042');
INSERT INTO classroom VALUES (398, 35, '55042');
INSERT INTO classroom VALUES (324, 68, '4548');
INSERT INTO classroom VALUES (955, 100, '41061');
INSERT INTO classroom VALUES (520, 26, '520');
INSERT INTO classroom VALUES (358, 77, '53969');
INSERT INTO classroom VALUES (956, 61, '710');
INSERT INTO classroom VALUES (712, 29, '37337');
INSERT INTO classroom VALUES (710, 31, '842');
INSERT INTO classroom VALUES (302, 77, '1916');
INSERT INTO classroom VALUES (266, 53, '0951');
INSERT INTO classroom VALUES (417, 72, '82624');
INSERT INTO classroom VALUES (227, 39, '259');
INSERT INTO classroom VALUES (161, 87, '07538');
INSERT INTO classroom VALUES (310, 98, '636');
INSERT INTO classroom VALUES (542, 96, '50209');
INSERT INTO classroom VALUES (717, 40, '9891');
INSERT INTO classroom VALUES (621, 23, '16415');
INSERT INTO classroom VALUES (532, 80, '650');
INSERT INTO classroom VALUES (902, 21, '224');
INSERT INTO classroom VALUES (722, 93, '29352');
INSERT INTO classroom VALUES (101, 83, '091');
INSERT INTO classroom VALUES (389, 57, '63949');
INSERT INTO classroom VALUES (632, 96, '667');
INSERT INTO classroom VALUES (176, 47, '636');
INSERT INTO classroom VALUES (414, 94, '996');
INSERT INTO classroom VALUES (510, 83, '87721');
INSERT INTO classroom VALUES (146, 94, '4121');
INSERT INTO classroom VALUES (801, 31, '63002');
INSERT INTO classroom VALUES (770, 25, '92588');
INSERT INTO classroom VALUES (447, 72, '1768');
INSERT INTO classroom VALUES (361, 45, '9891');
INSERT INTO classroom VALUES (532, 31, '14662');
INSERT INTO classroom VALUES (958, 58, '92588');
INSERT INTO classroom VALUES (763, 100, '010');
INSERT INTO classroom VALUES (190, 48, '92588');
INSERT INTO classroom VALUES (520, 20, '788');
INSERT INTO classroom VALUES (617, 76, '173');
INSERT INTO classroom VALUES (805, 83, '7764');
INSERT INTO classroom VALUES (709, 95, '259');
INSERT INTO classroom VALUES (794, 24, '97386');
INSERT INTO classroom VALUES (673, 33, '787');
INSERT INTO classroom VALUES (527, 27, '377');
INSERT INTO classroom VALUES (134, 71, '82624');
INSERT INTO classroom VALUES (145, 73, '9923');
INSERT INTO classroom VALUES (548, 80, '787');
INSERT INTO classroom VALUES (925, 51, '695');
INSERT INTO classroom VALUES (973, 22, '90929');
INSERT INTO classroom VALUES (508, 27, '6226');
INSERT INTO classroom VALUES (803, 74, '300');
INSERT INTO classroom VALUES (347, 59, '3094');
INSERT INTO classroom VALUES (332, 33, '82624');
INSERT INTO classroom VALUES (289, 72, '788');
INSERT INTO classroom VALUES (248, 77, '300');
INSERT INTO classroom VALUES (339, 54, '667');
INSERT INTO classroom VALUES (632, 65, '69325');
INSERT INTO classroom VALUES (945, 56, '0999');
INSERT INTO classroom VALUES (858, 36, '55042');
INSERT INTO classroom VALUES (872, 75, '5928');
INSERT INTO classroom VALUES (908, 68, '87721');
INSERT INTO classroom VALUES (742, 96, '506');
INSERT INTO classroom VALUES (514, 98, '4548');
INSERT INTO classroom VALUES (309, 47, '0803');
INSERT INTO classroom VALUES (523, 92, '924');
INSERT INTO classroom VALUES (966, 65, '610');
INSERT INTO classroom VALUES (941, 33, '97386');
INSERT INTO classroom VALUES (875, 37, '23262');
INSERT INTO classroom VALUES (262, 89, '342');
INSERT INTO classroom VALUES (222, 89, '73847');
INSERT INTO classroom VALUES (326, 94, '0951');
INSERT INTO classroom VALUES (267, 89, '787');
INSERT INTO classroom VALUES (866, 32, '0951');
INSERT INTO classroom VALUES (434, 96, '876');
INSERT INTO classroom VALUES (679, 70, '9891');
INSERT INTO classroom VALUES (946, 25, '200');
INSERT INTO classroom VALUES (863, 90, '4121');
INSERT INTO classroom VALUES (268, 30, '506');
INSERT INTO classroom VALUES (361, 22, '343');
INSERT INTO classroom VALUES (522, 47, '69325');
INSERT INTO classroom VALUES (174, 68, '41061');
INSERT INTO classroom VALUES (974, 55, '8643');
INSERT INTO classroom VALUES (941, 61, '31534');
INSERT INTO classroom VALUES (302, 91, '9494');
INSERT INTO course VALUES (1, 'Progressive demand-driven process improvement', 'Centralized coherent adapter', 3);
INSERT INTO course VALUES (2, 'Vision-oriented high-level success', 'Vision-oriented 4thgeneration hierarchy', 4);
INSERT INTO course VALUES (3, 'Proactive mission-critical challenge', 'Right-sized non-volatile structure', 1);
INSERT INTO course VALUES (4, 'Distributed asymmetric knowledge user', 'Universal incremental Graphical User Interface', 2);
INSERT INTO course VALUES (5, 'Compatible heuristic moderator', 'Quality-focused mission-critical Local Area Network', 4);
INSERT INTO course VALUES (6, 'Progressive web-enabled projection', 'Up-sized leadingedge synergy', 1);
INSERT INTO course VALUES (7, 'Configurable radical intranet', 'Programmable mobile data-warehouse', 1);
INSERT INTO course VALUES (8, 'Proactive executive frame', 'Centralized high-level workforce', 4);
INSERT INTO course VALUES (9, 'Distributed 4thgeneration firmware', 'Balanced upward-trending methodology', 2);
INSERT INTO course VALUES (10, 'Ameliorated motivating matrix', 'Team-oriented user-facing infrastructure', 1);
INSERT INTO course VALUES (11, 'Distributed foreground structure', 'Down-sized bottom-line strategy', 2);
INSERT INTO course VALUES (12, 'Face-to-face scalable utilization', 'Balanced asymmetric function', 2);
INSERT INTO course VALUES (13, 'Business-focused 24/7 approach', 'Universal incremental customer loyalty', 1);
INSERT INTO course VALUES (14, 'Grass-roots system-worthy support', 'Versatile cohesive secured line', 2);
INSERT INTO course VALUES (15, 'User-friendly contextually-based database', 'Distributed bottom-line instruction set', 3);
INSERT INTO course VALUES (16, 'Seamless context-sensitive capability', 'Customer-focused modular toolset', 1);
INSERT INTO course VALUES (17, 'Balanced grid-enabled array', 'Synergized upward-trending matrix', 4);
INSERT INTO course VALUES (18, 'Phased system-worthy benchmark', 'Cross-group non-volatile strategy', 2);
INSERT INTO course VALUES (19, 'Enterprise-wide solution-oriented open system', 'Robust reciprocal interface', 1);
INSERT INTO course VALUES (20, 'Progressive demand-driven process improvement', 'Mandatory uniform approach', 1);
INSERT INTO course VALUES (21, 'Diverse modular pricing structure', 'Up-sized content-based methodology', 3);
INSERT INTO course VALUES (22, 'Synergistic human-resource instruction set', 'Synergistic intangible Graphic Interface', 3);
INSERT INTO course VALUES (23, 'Ameliorated methodical open architecture', 'Organic coherent challenge', 2);
INSERT INTO course VALUES (24, 'Pre-emptive client-driven adapter', 'Multi-channeled bi-directional intranet', 4);
INSERT INTO course VALUES (25, 'Integrated foreground access', 'Total solution-oriented matrix', 4);
INSERT INTO course VALUES (26, 'Adaptive uniform moderator', 'Inverse contextually-based task-force', 3);
INSERT INTO course VALUES (27, 'Centralized analyzing support', 'Centralized multi-tasking functionalities', 4);
INSERT INTO course VALUES (28, 'Total 24hour software', 'Adaptive explicit paradigm', 4);
INSERT INTO course VALUES (29, 'Expanded multi-tasking project', 'Cross-platform dedicated success', 4);
INSERT INTO course VALUES (30, 'Sharable neutral contingency', 'Extended neutral contingency', 1);
INSERT INTO course VALUES (31, 'Reactive didactic synergy', 'Expanded well-modulated throughput', 4);
INSERT INTO course VALUES (32, 'Total 24hour software', 'Sharable cohesive concept', 3);
INSERT INTO course VALUES (33, 'Decentralized modular hardware', 'Optional 6thgeneration productivity', 3);
INSERT INTO course VALUES (34, 'Grass-roots non-volatile strategy', 'Face-to-face encompassing benchmark', 2);
INSERT INTO course VALUES (35, 'Automated background Local Area Network', 'Fundamental responsive toolset', 3);
INSERT INTO course VALUES (36, 'Balanced optimal extranet', 'Down-sized mobile infrastructure', 4);
INSERT INTO course VALUES (37, 'Switchable mobile open architecture', 'Synergized content-based alliance', 4);
INSERT INTO course VALUES (38, 'Automated background Local Area Network', 'Multi-channeled 5thgeneration approach', 3);
INSERT INTO course VALUES (39, 'Total 24hour software', 'Triple-buffered global productivity', 4);
INSERT INTO course VALUES (40, 'Function-based human-resource alliance', 'Fully-configurable tangible moratorium', 2);
INSERT INTO course VALUES (41, 'Synergistic human-resource instruction set', 'Reverse-engineered needs-based knowledge user', 2);
INSERT INTO course VALUES (42, 'Compatible heuristic moderator', 'Multi-channeled needs-based functionalities', 3);
INSERT INTO course VALUES (43, 'Open-source analyzing info-mediaries', 'Fully-configurable disintermediate conglomeration', 3);
INSERT INTO course VALUES (44, 'User-friendly disintermediate synergy', 'Centralized global hardware', 4);
INSERT INTO course VALUES (45, 'Operative system-worthy forecast', 'Decentralized upward-trending project', 3);
INSERT INTO course VALUES (46, 'Reactive didactic synergy', 'Programmable systematic concept', 1);
INSERT INTO course VALUES (47, 'User-centric 3rdgeneration paradigm', 'Cloned encompassing productivity', 1);
INSERT INTO course VALUES (48, 'Integrated static collaboration', 'Open-source demand-driven info-mediaries', 2);
INSERT INTO course VALUES (49, 'Distributed foreground structure', 'Cloned content-based frame', 3);
INSERT INTO course VALUES (50, 'Distributed global application', 'Enhanced tertiary pricing structure', 3);
INSERT INTO course VALUES (51, 'Decentralized modular hardware', 'Stand-alone systematic utilization', 2);
INSERT INTO course VALUES (52, 'Robust grid-enabled workforce', 'Quality-focused high-level methodology', 4);
INSERT INTO course VALUES (53, 'Reactive didactic synergy', 'Organic optimizing Local Area Network', 1);
INSERT INTO course VALUES (54, 'Integrated foreground access', 'Reduced fresh-thinking initiative', 3);
INSERT INTO course VALUES (55, 'Seamless context-sensitive capability', 'Persistent zero administration analyzer', 1);
INSERT INTO course VALUES (56, 'Reactive didactic synergy', 'Visionary systemic database', 4);
INSERT INTO course VALUES (57, 'Progressive demand-driven process improvement', 'Function-based transitional encryption', 3);
INSERT INTO course VALUES (58, 'Robust grid-enabled workforce', 'Horizontal value-added flexibility', 3);
INSERT INTO course VALUES (59, 'Grass-roots non-volatile strategy', 'Public-key tangible ability', 4);
INSERT INTO course VALUES (60, 'Optimized exuding focus group', 'Compatible encompassing Graphic Interface', 3);
INSERT INTO course VALUES (61, 'Up-sized asymmetric knowledgebase', 'Right-sized 5thgeneration benchmark', 2);
INSERT INTO course VALUES (62, 'Function-based human-resource alliance', 'Profound empowering projection', 4);
INSERT INTO course VALUES (63, 'Exclusive foreground challenge', 'Pre-emptive systematic instruction set', 4);
INSERT INTO course VALUES (64, 'Progressive web-enabled projection', 'Distributed coherent focus group', 4);
INSERT INTO course VALUES (65, 'Balanced grid-enabled array', 'Self-enabling incremental contingency', 1);
INSERT INTO course VALUES (66, 'Automated background Local Area Network', 'Digitized national Graphical User Interface', 4);
INSERT INTO course VALUES (67, 'Enterprise-wide solution-oriented open system', 'Devolved 6thgeneration collaboration', 1);
INSERT INTO course VALUES (68, 'Compatible heuristic moderator', 'Ameliorated disintermediate benchmark', 2);
INSERT INTO course VALUES (69, 'Business-focused intangible middleware', 'Enterprise-wide full-range time-frame', 3);
INSERT INTO course VALUES (70, 'Pre-emptive optimal complexity', 'Advanced even-keeled extranet', 3);
INSERT INTO course VALUES (71, 'Up-sized didactic secured line', 'Robust motivating architecture', 1);
INSERT INTO course VALUES (72, 'Stand-alone discrete frame', 'Ergonomic modular portal', 1);
INSERT INTO course VALUES (73, 'Inverse needs-based function', 'Open-source empowering parallelism', 1);
INSERT INTO course VALUES (74, 'Configurable radical intranet', 'Stand-alone actuating initiative', 3);
INSERT INTO course VALUES (75, 'Multi-lateral multimedia portal', 'Compatible 24hour capability', 4);
INSERT INTO course VALUES (76, 'Up-sized static pricing structure', 'Multi-tiered solution-oriented analyzer', 3);
INSERT INTO course VALUES (77, 'Operative system-worthy forecast', 'Adaptive asynchronous intranet', 2);
INSERT INTO course VALUES (78, 'Function-based human-resource alliance', 'Self-enabling executive policy', 3);
INSERT INTO course VALUES (79, 'Stand-alone discrete frame', 'Networked bottom-line concept', 4);
INSERT INTO course VALUES (80, 'Vision-oriented high-level success', 'Compatible optimal ability', 1);
INSERT INTO course VALUES (81, 'Mandatory responsive methodology', 'Devolved disintermediate adapter', 3);
INSERT INTO course VALUES (82, 'Automated background Local Area Network', 'Profit-focused stable projection', 3);
INSERT INTO course VALUES (83, 'Distributed foreground structure', 'Object-based contextually-based extranet', 1);
INSERT INTO course VALUES (84, 'Vision-oriented high-level success', 'Horizontal responsive function', 2);
INSERT INTO course VALUES (85, 'Robust contextually-based frame', 'Polarized 24/7 protocol', 3);
INSERT INTO course VALUES (86, 'Enterprise-wide systemic protocol', 'Configurable heuristic projection', 3);
INSERT INTO course VALUES (87, 'Mandatory bifurcated Internet solution', 'Customizable regional model', 3);
INSERT INTO course VALUES (88, 'Enterprise-wide solution-oriented open system', 'User-centric holistic data-warehouse', 2);
INSERT INTO course VALUES (89, 'Pre-emptive optimal complexity', 'Implemented homogeneous emulation', 1);
INSERT INTO course VALUES (90, 'Progressive demand-driven process improvement', 'Down-sized global instruction set', 4);
INSERT INTO course VALUES (91, 'Assimilated next generation pricing structure', 'Phased executive middleware', 2);
INSERT INTO course VALUES (92, 'Advanced systemic initiative', 'Future-proofed impactful standardization', 4);
INSERT INTO course VALUES (93, 'Advanced systemic initiative', 'Programmable secondary task-force', 3);
INSERT INTO course VALUES (94, 'Optimized exuding focus group', 'User-friendly impactful task-force', 3);
INSERT INTO course VALUES (95, 'Seamless context-sensitive capability', 'Adaptive incremental interface', 3);
INSERT INTO course VALUES (96, 'Distributed foreground structure', 'Multi-channeled 4thgeneration product', 3);
INSERT INTO course VALUES (97, 'Expanded multi-tasking project', 'Object-based hybrid process improvement', 4);
INSERT INTO course VALUES (98, 'Compatible heuristic moderator', 'De-engineered zero tolerance orchestration', 4);
INSERT INTO course VALUES (99, 'User-friendly contextually-based database', 'Profound radical help-desk', 4);
INSERT INTO course VALUES (100, 'Total 24hour software', 'Configurable high-level encoding', 3);
INSERT INTO prereq VALUES (43, 1);
INSERT INTO prereq VALUES (70, 2);
INSERT INTO prereq VALUES (23, 3);
INSERT INTO prereq VALUES (73, 4);
INSERT INTO prereq VALUES (31, 5);
INSERT INTO prereq VALUES (37, 6);
INSERT INTO prereq VALUES (76, 7);
INSERT INTO prereq VALUES (93, 8);
INSERT INTO prereq VALUES (35, 9);
INSERT INTO prereq VALUES (23, 10);
INSERT INTO prereq VALUES (21, 11);
INSERT INTO prereq VALUES (9, 12);
INSERT INTO prereq VALUES (69, 13);
INSERT INTO prereq VALUES (27, 14);
INSERT INTO prereq VALUES (26, 15);
INSERT INTO prereq VALUES (73, 16);
INSERT INTO prereq VALUES (42, 17);
INSERT INTO prereq VALUES (12, 18);
INSERT INTO prereq VALUES (88, 19);
INSERT INTO prereq VALUES (90, 20);
INSERT INTO prereq VALUES (64, 21);
INSERT INTO prereq VALUES (70, 22);
INSERT INTO prereq VALUES (76, 23);
INSERT INTO prereq VALUES (91, 24);
INSERT INTO prereq VALUES (88, 25);
INSERT INTO prereq VALUES (9, 26);
INSERT INTO prereq VALUES (95, 27);
INSERT INTO prereq VALUES (83, 28);
INSERT INTO prereq VALUES (82, 29);
INSERT INTO prereq VALUES (14, 30);
INSERT INTO prereq VALUES (7, 31);
INSERT INTO prereq VALUES (73, 32);
INSERT INTO prereq VALUES (20, 33);
INSERT INTO prereq VALUES (37, 34);
INSERT INTO prereq VALUES (48, 35);
INSERT INTO prereq VALUES (41, 36);
INSERT INTO prereq VALUES (49, 37);
INSERT INTO prereq VALUES (29, 38);
INSERT INTO prereq VALUES (90, 39);
INSERT INTO prereq VALUES (100, 40);
INSERT INTO prereq VALUES (60, 41);
INSERT INTO prereq VALUES (56, 42);
INSERT INTO prereq VALUES (15, 43);
INSERT INTO prereq VALUES (96, 44);
INSERT INTO prereq VALUES (82, 45);
INSERT INTO prereq VALUES (8, 46);
INSERT INTO prereq VALUES (97, 47);
INSERT INTO prereq VALUES (54, 48);
INSERT INTO prereq VALUES (63, 49);
INSERT INTO prereq VALUES (34, 50);
INSERT INTO prereq VALUES (20, 51);
INSERT INTO prereq VALUES (100, 52);
INSERT INTO prereq VALUES (67, 53);
INSERT INTO prereq VALUES (39, 54);
INSERT INTO prereq VALUES (92, 55);
INSERT INTO prereq VALUES (44, 56);
INSERT INTO prereq VALUES (66, 57);
INSERT INTO prereq VALUES (49, 58);
INSERT INTO prereq VALUES (88, 59);
INSERT INTO prereq VALUES (74, 60);
INSERT INTO prereq VALUES (80, 61);
INSERT INTO prereq VALUES (72, 62);
INSERT INTO prereq VALUES (77, 63);
INSERT INTO prereq VALUES (45, 64);
INSERT INTO prereq VALUES (66, 65);
INSERT INTO prereq VALUES (96, 66);
INSERT INTO prereq VALUES (100, 67);
INSERT INTO prereq VALUES (5, 68);
INSERT INTO prereq VALUES (42, 69);
INSERT INTO prereq VALUES (13, 70);
INSERT INTO prereq VALUES (90, 71);
INSERT INTO prereq VALUES (48, 72);
INSERT INTO prereq VALUES (34, 73);
INSERT INTO prereq VALUES (24, 74);
INSERT INTO prereq VALUES (67, 75);
INSERT INTO prereq VALUES (47, 76);
INSERT INTO prereq VALUES (100, 77);
INSERT INTO prereq VALUES (74, 78);
INSERT INTO prereq VALUES (14, 79);
INSERT INTO prereq VALUES (91, 80);
INSERT INTO prereq VALUES (89, 81);
INSERT INTO prereq VALUES (20, 82);
INSERT INTO prereq VALUES (52, 83);
INSERT INTO prereq VALUES (34, 84);
INSERT INTO prereq VALUES (91, 85);
INSERT INTO prereq VALUES (65, 86);
INSERT INTO prereq VALUES (24, 87);
INSERT INTO prereq VALUES (19, 88);
INSERT INTO prereq VALUES (47, 89);
INSERT INTO prereq VALUES (26, 90);
INSERT INTO prereq VALUES (92, 91);
INSERT INTO prereq VALUES (54, 92);
INSERT INTO prereq VALUES (59, 93);
INSERT INTO prereq VALUES (78, 94);
INSERT INTO prereq VALUES (47, 95);
INSERT INTO prereq VALUES (7, 96);
INSERT INTO prereq VALUES (3, 97);
INSERT INTO prereq VALUES (31, 98);
INSERT INTO prereq VALUES (37, 99);
INSERT INTO prereq VALUES (67, 100);
INSERT INTO time_slot VALUES (1, 'Thursday', '08:10:07', '11:35:03');
INSERT INTO time_slot VALUES (2, 'Wednesday', '01:54:24', '14:46:29');
INSERT INTO time_slot VALUES (3, 'Thursday', '23:20:39', '06:34:48');
INSERT INTO time_slot VALUES (4, 'Monday', '02:32:15', '22:23:43');
INSERT INTO time_slot VALUES (5, 'Wednesday', '23:50:45', '00:44:26');
INSERT INTO time_slot VALUES (6, 'Saturday', '14:41:08', '07:14:30');
INSERT INTO time_slot VALUES (7, 'Thursday', '16:57:55', '03:12:06');
INSERT INTO time_slot VALUES (8, 'Sunday', '08:47:25', '21:29:44');
INSERT INTO time_slot VALUES (9, 'Thursday', '11:21:01', '14:12:29');
INSERT INTO time_slot VALUES (10, 'Saturday', '05:44:48', '04:16:56');
INSERT INTO time_slot VALUES (11, 'Tuesday', '13:31:28', '15:01:05');
INSERT INTO time_slot VALUES (12, 'Saturday', '23:29:20', '23:25:37');
INSERT INTO time_slot VALUES (13, 'Sunday', '01:52:58', '07:04:15');
INSERT INTO time_slot VALUES (14, 'Tuesday', '17:28:18', '16:19:48');
INSERT INTO time_slot VALUES (15, 'Wednesday', '11:54:25', '18:00:08');
INSERT INTO time_slot VALUES (16, 'Sunday', '01:21:32', '02:41:26');
INSERT INTO time_slot VALUES (17, 'Saturday', '18:41:45', '21:43:12');
INSERT INTO time_slot VALUES (18, 'Sunday', '20:25:58', '03:41:24');
INSERT INTO time_slot VALUES (19, 'Monday', '17:03:06', '10:37:03');
INSERT INTO time_slot VALUES (20, 'Tuesday', '11:20:50', '16:25:12');
INSERT INTO time_slot VALUES (21, 'Sunday', '19:24:42', '05:38:44');
INSERT INTO time_slot VALUES (22, 'Sunday', '19:18:36', '06:25:11');
INSERT INTO time_slot VALUES (23, 'Tuesday', '09:08:33', '19:38:11');
INSERT INTO time_slot VALUES (24, 'Sunday', '16:46:37', '13:09:12');
INSERT INTO time_slot VALUES (25, 'Saturday', '09:07:42', '20:56:20');
INSERT INTO time_slot VALUES (26, 'Saturday', '02:13:55', '09:53:45');
INSERT INTO time_slot VALUES (27, 'Sunday', '10:58:08', '18:15:14');
INSERT INTO time_slot VALUES (28, 'Tuesday', '19:04:43', '07:31:34');
INSERT INTO time_slot VALUES (29, 'Friday', '07:25:38', '22:23:29');
INSERT INTO time_slot VALUES (30, 'Monday', '09:19:15', '13:53:39');
INSERT INTO time_slot VALUES (31, 'Sunday', '22:14:46', '03:24:45');
INSERT INTO time_slot VALUES (32, 'Saturday', '13:17:40', '12:50:33');
INSERT INTO time_slot VALUES (33, 'Sunday', '05:17:55', '07:57:05');
INSERT INTO time_slot VALUES (34, 'Friday', '05:28:14', '09:28:20');
INSERT INTO time_slot VALUES (35, 'Saturday', '21:24:06', '06:59:06');
INSERT INTO time_slot VALUES (36, 'Friday', '02:44:22', '23:45:13');
INSERT INTO time_slot VALUES (37, 'Tuesday', '19:44:41', '13:28:41');
INSERT INTO time_slot VALUES (38, 'Wednesday', '11:49:04', '10:46:06');
INSERT INTO time_slot VALUES (39, 'Sunday', '20:10:16', '10:05:18');
INSERT INTO time_slot VALUES (40, 'Thursday', '15:48:12', '16:11:28');
INSERT INTO time_slot VALUES (41, 'Wednesday', '11:15:16', '22:08:01');
INSERT INTO time_slot VALUES (42, 'Friday', '03:04:45', '19:22:54');
INSERT INTO time_slot VALUES (43, 'Sunday', '06:36:35', '23:30:17');
INSERT INTO time_slot VALUES (44, 'Sunday', '11:40:16', '06:05:04');
INSERT INTO time_slot VALUES (45, 'Tuesday', '16:10:15', '19:37:32');
INSERT INTO time_slot VALUES (46, 'Friday', '21:50:38', '03:21:46');
INSERT INTO time_slot VALUES (47, 'Saturday', '13:51:53', '16:55:12');
INSERT INTO time_slot VALUES (48, 'Monday', '17:01:00', '07:40:12');
INSERT INTO time_slot VALUES (49, 'Monday', '23:03:40', '11:34:15');
INSERT INTO time_slot VALUES (50, 'Sunday', '01:40:26', '13:53:32');
INSERT INTO time_slot VALUES (51, 'Wednesday', '03:22:33', '00:40:04');
INSERT INTO time_slot VALUES (52, 'Saturday', '04:06:07', '14:30:01');
INSERT INTO time_slot VALUES (53, 'Wednesday', '12:18:20', '21:36:33');
INSERT INTO time_slot VALUES (54, 'Tuesday', '15:57:27', '12:49:22');
INSERT INTO time_slot VALUES (55, 'Wednesday', '14:59:15', '22:33:00');
INSERT INTO time_slot VALUES (56, 'Friday', '03:59:44', '22:17:34');
INSERT INTO time_slot VALUES (57, 'Thursday', '09:25:53', '20:23:43');
INSERT INTO time_slot VALUES (58, 'Wednesday', '06:39:14', '06:16:36');
INSERT INTO time_slot VALUES (59, 'Thursday', '22:40:14', '02:14:41');
INSERT INTO time_slot VALUES (60, 'Thursday', '07:43:31', '08:18:25');
INSERT INTO time_slot VALUES (61, 'Monday', '11:36:02', '12:10:39');
INSERT INTO time_slot VALUES (62, 'Thursday', '05:48:02', '15:09:32');
INSERT INTO time_slot VALUES (63, 'Wednesday', '18:38:40', '21:21:21');
INSERT INTO time_slot VALUES (64, 'Wednesday', '06:11:49', '14:21:22');
INSERT INTO time_slot VALUES (65, 'Thursday', '13:17:50', '04:11:19');
INSERT INTO time_slot VALUES (66, 'Friday', '17:22:45', '22:56:19');
INSERT INTO time_slot VALUES (67, 'Tuesday', '08:50:07', '05:44:59');
INSERT INTO time_slot VALUES (68, 'Tuesday', '10:44:39', '19:44:54');
INSERT INTO time_slot VALUES (69, 'Tuesday', '11:18:44', '20:52:22');
INSERT INTO time_slot VALUES (70, 'Saturday', '19:19:39', '07:48:32');
INSERT INTO time_slot VALUES (71, 'Friday', '18:14:08', '15:46:39');
INSERT INTO time_slot VALUES (72, 'Monday', '08:39:29', '10:43:19');
INSERT INTO time_slot VALUES (73, 'Wednesday', '17:02:15', '23:03:10');
INSERT INTO time_slot VALUES (74, 'Wednesday', '16:08:39', '05:32:32');
INSERT INTO time_slot VALUES (75, 'Friday', '14:23:22', '03:55:44');
INSERT INTO time_slot VALUES (76, 'Tuesday', '04:41:55', '15:53:40');
INSERT INTO time_slot VALUES (77, 'Wednesday', '15:09:12', '01:02:50');
INSERT INTO time_slot VALUES (78, 'Thursday', '23:33:38', '04:46:50');
INSERT INTO time_slot VALUES (79, 'Saturday', '20:59:05', '07:31:24');
INSERT INTO time_slot VALUES (80, 'Saturday', '14:29:59', '01:36:38');
INSERT INTO time_slot VALUES (81, 'Tuesday', '12:36:44', '09:37:33');
INSERT INTO time_slot VALUES (82, 'Sunday', '21:58:00', '04:44:11');
INSERT INTO time_slot VALUES (83, 'Wednesday', '14:11:26', '19:07:17');
INSERT INTO time_slot VALUES (84, 'Friday', '14:22:32', '07:16:36');
INSERT INTO time_slot VALUES (85, 'Wednesday', '16:47:46', '08:23:52');
INSERT INTO time_slot VALUES (86, 'Monday', '23:24:34', '05:02:16');
INSERT INTO time_slot VALUES (87, 'Wednesday', '20:41:15', '16:26:00');
INSERT INTO time_slot VALUES (88, 'Friday', '15:06:58', '14:15:32');
INSERT INTO time_slot VALUES (89, 'Saturday', '14:40:26', '12:31:27');
INSERT INTO time_slot VALUES (90, 'Tuesday', '15:01:33', '03:08:09');
INSERT INTO time_slot VALUES (91, 'Thursday', '21:18:51', '01:24:59');
INSERT INTO time_slot VALUES (92, 'Friday', '17:45:40', '12:41:36');
INSERT INTO time_slot VALUES (93, 'Sunday', '15:05:20', '06:41:01');
INSERT INTO time_slot VALUES (94, 'Friday', '07:31:30', '11:13:39');
INSERT INTO time_slot VALUES (95, 'Thursday', '20:43:01', '03:56:09');
INSERT INTO time_slot VALUES (96, 'Saturday', '00:23:05', '13:22:56');
INSERT INTO time_slot VALUES (97, 'Friday', '19:28:44', '18:24:55');
INSERT INTO time_slot VALUES (98, 'Thursday', '20:43:11', '12:38:16');
INSERT INTO time_slot VALUES (99, 'Friday', '07:46:57', '21:49:54');
INSERT INTO time_slot VALUES (100, 'Monday', '04:59:51', '03:08:43');
INSERT INTO section VALUES (93, 3, 2, 2023, 310, '90929', 76);
INSERT INTO section VALUES (58, 1, 1, 2023, 863, '9494', 6);
INSERT INTO section VALUES (22, 4, 1, 2020, 310, '710', 100);
INSERT INTO section VALUES (7, 5, 2, 2022, 268, '69325', 9);
INSERT INTO section VALUES (95, 3, 2, 2020, 481, '29352', 80);
INSERT INTO section VALUES (16, 1, 2, 2020, 101, '92839', 44);
INSERT INTO section VALUES (69, 2, 1, 2020, 266, '506', 90);
INSERT INTO section VALUES (3, 4, 2, 2021, 946, '842', 48);
INSERT INTO section VALUES (90, 5, 1, 2022, 257, '872', 71);
INSERT INTO section VALUES (55, 1, 1, 2023, 621, '69325', 38);
INSERT INTO section VALUES (36, 1, 2, 2023, 801, '210', 51);
INSERT INTO section VALUES (55, 2, 2, 2021, 617, '4198', 83);
INSERT INTO section VALUES (51, 4, 2, 2022, 174, '5928', 23);
INSERT INTO section VALUES (75, 4, 2, 2022, 717, '12055', 66);
INSERT INTO section VALUES (27, 4, 2, 2022, 872, '2913', 1);
INSERT INTO section VALUES (51, 2, 1, 2023, 324, '292', 52);
INSERT INTO section VALUES (20, 4, 1, 2021, 176, '95323', 26);
INSERT INTO section VALUES (16, 5, 2, 2020, 358, '787', 89);
INSERT INTO section VALUES (9, 1, 2, 2023, 863, '24767', 20);
INSERT INTO section VALUES (49, 4, 1, 2022, 414, '206', 91);
INSERT INTO section VALUES (37, 5, 1, 2022, 673, '4198', 82);
INSERT INTO section VALUES (5, 3, 1, 2023, 248, '210', 57);
INSERT INTO section VALUES (81, 5, 2, 2020, 176, '95323', 37);
INSERT INTO section VALUES (52, 5, 1, 2022, 510, '377', 77);
INSERT INTO section VALUES (24, 3, 1, 2023, 481, '342', 26);
INSERT INTO section VALUES (23, 4, 1, 2020, 638, '300', 14);
INSERT INTO section VALUES (78, 5, 2, 2022, 958, '9224', 42);
INSERT INTO section VALUES (38, 1, 1, 2020, 228, '225', 10);
INSERT INTO section VALUES (73, 1, 2, 2023, 228, '300', 89);
INSERT INTO section VALUES (63, 3, 2, 2020, 794, '173', 65);
INSERT INTO section VALUES (2, 4, 1, 2021, 722, '45665', 9);
INSERT INTO section VALUES (12, 2, 1, 2021, 777, '73847', 41);
INSERT INTO section VALUES (79, 4, 2, 2023, 248, '38350', 62);
INSERT INTO section VALUES (85, 5, 1, 2022, 709, '6711', 88);
INSERT INTO section VALUES (57, 3, 2, 2022, 770, '225', 14);
INSERT INTO section VALUES (47, 4, 2, 2021, 266, '710', 65);
INSERT INTO section VALUES (92, 2, 2, 2022, 384, '72677', 16);
INSERT INTO section VALUES (31, 1, 1, 2020, 268, '1916', 49);
INSERT INTO section VALUES (30, 3, 2, 2021, 134, '3094', 92);
INSERT INTO section VALUES (23, 5, 2, 2021, 222, '12055', 42);
INSERT INTO section VALUES (22, 4, 1, 2023, 267, '8643', 9);
INSERT INTO section VALUES (8, 3, 2, 2021, 289, '6711', 12);
INSERT INTO section VALUES (25, 4, 1, 2020, 801, '35291', 32);
INSERT INTO section VALUES (33, 3, 1, 2020, 956, '221', 44);
INSERT INTO section VALUES (54, 2, 1, 2023, 899, '38350', 66);
INSERT INTO section VALUES (85, 5, 2, 2022, 461, '6226', 32);
INSERT INTO section VALUES (1, 3, 1, 2020, 508, '0999', 32);
INSERT INTO section VALUES (88, 5, 1, 2023, 960, '872', 87);
INSERT INTO section VALUES (45, 1, 2, 2022, 447, '3094', 52);
INSERT INTO section VALUES (1, 4, 1, 2020, 956, '7764', 22);
INSERT INTO section VALUES (78, 4, 1, 2023, 268, '682', 53);
INSERT INTO section VALUES (30, 4, 2, 2020, 523, '506', 17);
INSERT INTO section VALUES (60, 5, 2, 2021, 434, '90929', 79);
INSERT INTO section VALUES (28, 4, 1, 2023, 712, '72677', 29);
INSERT INTO section VALUES (26, 1, 1, 2023, 866, '29352', 81);
INSERT INTO section VALUES (1, 3, 2, 2022, 899, '16415', 82);
INSERT INTO section VALUES (63, 2, 1, 2020, 176, '200', 29);
INSERT INTO section VALUES (90, 3, 1, 2022, 310, '377', 37);
INSERT INTO section VALUES (65, 2, 1, 2022, 309, '2913', 20);
INSERT INTO section VALUES (99, 3, 1, 2022, 190, '682', 8);
INSERT INTO section VALUES (2, 2, 1, 2022, 638, '37337', 72);
INSERT INTO section VALUES (82, 3, 1, 2021, 803, '0803', 55);
INSERT INTO section VALUES (28, 3, 2, 2023, 722, '4198', 69);
INSERT INTO section VALUES (82, 1, 1, 2023, 973, '9891', 25);
INSERT INTO section VALUES (33, 4, 2, 2022, 434, '6703', 76);
INSERT INTO section VALUES (34, 3, 2, 2022, 268, '924', 41);
INSERT INTO section VALUES (80, 4, 2, 2023, 532, '343', 56);
INSERT INTO section VALUES (20, 2, 1, 2021, 339, '8643', 76);
INSERT INTO section VALUES (58, 3, 1, 2023, 621, '34988', 23);
INSERT INTO section VALUES (24, 2, 1, 2021, 709, '07538', 32);
INSERT INTO section VALUES (21, 2, 1, 2020, 398, '53969', 26);
INSERT INTO section VALUES (67, 1, 2, 2020, 302, '506', 77);
INSERT INTO section VALUES (51, 1, 2, 2022, 875, '24767', 28);
INSERT INTO section VALUES (66, 3, 2, 2021, 262, '787', 34);
INSERT INTO section VALUES (18, 5, 1, 2021, 673, '342', 70);
INSERT INTO section VALUES (22, 5, 2, 2021, 384, '4121', 12);
INSERT INTO section VALUES (34, 1, 2, 2023, 673, '24767', 48);
INSERT INTO section VALUES (41, 5, 2, 2022, 289, '987', 58);
INSERT INTO section VALUES (6, 5, 2, 2022, 384, '12055', 70);
INSERT INTO section VALUES (55, 3, 2, 2022, 941, '210', 51);
INSERT INTO section VALUES (1, 5, 2, 2020, 722, '3245', 94);
INSERT INTO section VALUES (93, 4, 1, 2021, 617, '34988', 27);
INSERT INTO section VALUES (100, 1, 1, 2023, 267, '4198', 64);
INSERT INTO section VALUES (90, 3, 2, 2022, 310, '610', 74);
INSERT INTO section VALUES (20, 2, 1, 2023, 510, '318', 10);
INSERT INTO section VALUES (95, 5, 2, 2021, 510, '259', 55);
INSERT INTO section VALUES (28, 1, 1, 2020, 722, '87721', 74);
INSERT INTO section VALUES (69, 5, 2, 2021, 227, '667', 75);
INSERT INTO section VALUES (49, 5, 1, 2023, 908, '8643', 88);
INSERT INTO section VALUES (52, 2, 2, 2022, 858, '72392', 88);
INSERT INTO section VALUES (14, 4, 1, 2022, 417, '69325', 46);
INSERT INTO section VALUES (81, 1, 1, 2022, 481, '61329', 36);
INSERT INTO section VALUES (69, 5, 2, 2020, 309, '506', 46);
INSERT INTO section VALUES (30, 5, 1, 2023, 161, '63002', 57);
INSERT INTO section VALUES (66, 3, 2, 2021, 770, '38350', 25);
INSERT INTO section VALUES (63, 2, 2, 2021, 176, '619', 100);
INSERT INTO section VALUES (76, 5, 1, 2020, 966, '31534', 57);
INSERT INTO section VALUES (72, 4, 2, 2020, 161, '581', 50);
INSERT INTO section VALUES (29, 2, 2, 2023, 326, '1402', 8);
INSERT INTO section VALUES (6, 1, 1, 2021, 717, '2913', 44);
INSERT INTO student VALUES (1821, 'Michael Lopez', 'Phased responsive help-desk', 135);
INSERT INTO student VALUES (1525, 'Christina King', 'Digitized context-sensitive emulation', 32);
INSERT INTO student VALUES (1155, 'Tiffany Roberts', 'Virtual mission-critical projection', 47);
INSERT INTO student VALUES (1366, 'Joshua Walsh', 'Function-based human-resource alliance', 63);
INSERT INTO student VALUES (1096, 'Linda Glover', 'Virtual mission-critical projection', 43);
INSERT INTO student VALUES (1288, 'Cheryl Walker', 'Future-proofed impactful product', 87);
INSERT INTO student VALUES (1005, 'Derrick Bailey', 'Visionary modular Graphic Interface', 37);
INSERT INTO student VALUES (1666, 'Angie Lindsey', 'Mandatory responsive methodology', 81);
INSERT INTO student VALUES (1130, 'James Davis', 'Robust grid-enabled workforce', 111);
INSERT INTO student VALUES (1870, 'Kimberly Kim', 'Progressive demand-driven process improvement', 27);
INSERT INTO student VALUES (1437, 'David Gonzalez', 'Integrated static collaboration', 128);
INSERT INTO student VALUES (1935, 'Kimberly Barnes', 'Organized bi-directional adapter', 99);
INSERT INTO student VALUES (1058, 'Jennifer Reed', 'Public-key web-enabled strategy', 80);
INSERT INTO student VALUES (1666, 'Rachel Johnson', 'De-engineered coherent structure', 51);
INSERT INTO student VALUES (1662, 'Timothy Lara', 'Proactive executive frame', 11);
INSERT INTO student VALUES (1537, 'Kristin Stewart', 'Balanced optimal extranet', 129);
INSERT INTO student VALUES (1925, 'Haley Ruiz', 'Versatile tangible benchmark', 13);
INSERT INTO student VALUES (1525, 'David Mitchell', 'Cloned clear-thinking frame', 5);
INSERT INTO student VALUES (1284, 'Sara Olson', 'Up-sized bi-directional function', 139);
INSERT INTO student VALUES (1542, 'Jessica Villanueva', 'Centralized analyzing support', 91);
INSERT INTO student VALUES (1031, 'Ann Pierce', 'Grass-roots system-worthy support', 5);
INSERT INTO student VALUES (1887, 'Scott Jones', 'Balanced grid-enabled array', 7);
INSERT INTO student VALUES (1364, 'Gregory Hansen', 'Optimized exuding focus group', 102);
INSERT INTO student VALUES (1251, 'David Roman', 'Operative high-level Graphic Interface', 97);
INSERT INTO student VALUES (1496, 'Sheri Weaver', 'Adaptive uniform moderator', 1);
INSERT INTO student VALUES (1536, 'Theresa Benjamin', 'Total 24hour software', 10);
INSERT INTO student VALUES (1677, 'John Bell', 'Stand-alone discrete frame', 4);
INSERT INTO student VALUES (1345, 'Sarah Parrish', 'Operative high-level Graphic Interface', 45);
INSERT INTO student VALUES (1900, 'Matthew Smith', 'Synergized global benchmark', 45);
INSERT INTO student VALUES (1732, 'Aaron Cooley', 'Multi-lateral multimedia portal', 109);
INSERT INTO student VALUES (1920, 'Earl Sanchez', 'Face-to-face scalable utilization', 120);
INSERT INTO student VALUES (1347, 'Daniel Krause', 'Distributed global application', 88);
INSERT INTO student VALUES (1832, 'Andrea Buchanan', 'Configurable reciprocal data-warehouse', 73);
INSERT INTO student VALUES (1965, 'Jacqueline Jensen', 'Open-source analyzing info-mediaries', 94);
INSERT INTO student VALUES (1326, 'Dawn Thompson', 'Pre-emptive optimal complexity', 147);
INSERT INTO student VALUES (1912, 'Stephanie Rivera', 'Secured mission-critical open system', 144);
INSERT INTO student VALUES (1118, 'Morgan Walker', 'Vision-oriented high-level success', 146);
INSERT INTO student VALUES (1945, 'Mr. Antonio Jackson', 'Configurable reciprocal data-warehouse', 48);
INSERT INTO student VALUES (1342, 'Justin Brooks', 'Future-proofed impactful product', 51);
INSERT INTO student VALUES (1068, 'Dennis Davis', 'Expanded multi-tasking project', 132);
INSERT INTO student VALUES (1879, 'Kathy Peterson', 'Distributed 4thgeneration firmware', 122);
INSERT INTO student VALUES (1220, 'Sarah Weaver', 'Visionary modular Graphic Interface', 149);
INSERT INTO student VALUES (1646, 'Dylan Wagner', 'Balanced optimal extranet', 36);
INSERT INTO student VALUES (1418, 'Jamie Adams', 'Assimilated next generation pricing structure', 91);
INSERT INTO student VALUES (1563, 'Kevin Zimmerman', 'Pre-emptive optimal complexity', 136);
INSERT INTO student VALUES (1148, 'Sara Miller', 'Secured mission-critical open system', 77);
INSERT INTO student VALUES (1075, 'Perry Mason', 'Versatile tangible benchmark', 42);
INSERT INTO student VALUES (1928, 'Jonathan Miles', 'Enterprise-wide multimedia secured line', 102);
INSERT INTO student VALUES (1202, 'Andrew Ochoa', 'Compatible executive definition', 33);
INSERT INTO student VALUES (1804, 'Karen Parker', 'Up-sized static pricing structure', 71);
INSERT INTO student VALUES (1585, 'Elizabeth Murphy', 'Function-based human-resource alliance', 60);
INSERT INTO student VALUES (1777, 'Nicholas Hall', 'Cloned clear-thinking frame', 108);
INSERT INTO student VALUES (1676, 'Jennifer Davis', 'Synergistic tertiary workforce', 31);
INSERT INTO student VALUES (1662, 'Julia Lopez', 'Horizontal scalable migration', 117);
INSERT INTO student VALUES (1206, 'Matthew Anderson', 'Open-source analyzing info-mediaries', 102);
INSERT INTO student VALUES (1354, 'Charles Alvarado', 'Cloned clear-thinking frame', 86);
INSERT INTO student VALUES (1380, 'Lydia Bullock', 'Enterprise-wide systemic protocol', 5);
INSERT INTO student VALUES (1181, 'Christopher Smith', 'Distributed foreground structure', 38);
INSERT INTO student VALUES (1886, 'Mrs. Heather Kim', 'Reactive didactic synergy', 66);
INSERT INTO student VALUES (1123, 'Christine Jensen', 'Operative high-level Graphic Interface', 5);
INSERT INTO student VALUES (1006, 'Adriana Brown', 'Centralized analyzing support', 9);
INSERT INTO student VALUES (1426, 'Kathy Brown', 'User-friendly contextually-based database', 58);
INSERT INTO student VALUES (1341, 'Debra Garcia', 'Virtual mission-critical projection', 51);
INSERT INTO student VALUES (1461, 'Sherry Douglas', 'Virtual mission-critical projection', 23);
INSERT INTO student VALUES (1828, 'Jose Murphy', 'Enterprise-wide systemic protocol', 16);
INSERT INTO student VALUES (1567, 'Michael Acosta', 'Configurable reciprocal data-warehouse', 0);
INSERT INTO student VALUES (1565, 'Laura Smith', 'Up-sized static pricing structure', 146);
INSERT INTO student VALUES (1656, 'Jennifer Hicks', 'Total 24hour software', 90);
INSERT INTO student VALUES (1751, 'Stephanie Garcia', 'Optimized exuding focus group', 118);
INSERT INTO student VALUES (1169, 'Heather Davis', 'Open-source analyzing info-mediaries', 105);
INSERT INTO student VALUES (1467, 'Jessica Smith', 'Synergistic asynchronous flexibility', 62);
INSERT INTO student VALUES (1859, 'Willie Chen', 'User-centric 3rdgeneration paradigm', 66);
INSERT INTO student VALUES (1687, 'Sandra Rowland', 'Phased system-worthy benchmark', 99);
INSERT INTO student VALUES (1881, 'Mr. Samuel Martin MD', 'Progressive web-enabled projection', 41);
INSERT INTO student VALUES (1685, 'Michelle Clayton', 'Expanded multi-tasking project', 20);
INSERT INTO student VALUES (1442, 'Seth Washington Jr.', 'Operative high-level Graphic Interface', 131);
INSERT INTO student VALUES (1339, 'Monica Adams', 'Digitized user-facing infrastructure', 36);
INSERT INTO student VALUES (1706, 'William Fields', 'Decentralized modular hardware', 90);
INSERT INTO student VALUES (1071, 'Eric Mitchell', 'User-friendly disintermediate synergy', 91);
INSERT INTO student VALUES (1192, 'Sharon Wilson', 'Reactive next generation extranet', 71);
INSERT INTO student VALUES (1804, 'Christopher Adams', 'Synergistic tertiary workforce', 9);
INSERT INTO student VALUES (1921, 'Pamela Coleman', 'Self-enabling heuristic forecast', 70);
INSERT INTO student VALUES (1393, 'Jack Burns', 'Synchronized global emulation', 116);
INSERT INTO student VALUES (1246, 'Catherine Cook', 'Reverse-engineered static encryption', 11);
INSERT INTO student VALUES (1126, 'Cynthia Lam', 'Centralized eco-centric product', 70);
INSERT INTO student VALUES (1492, 'Gregg Hampton', 'Enhanced client-server infrastructure', 91);
INSERT INTO student VALUES (1797, 'Benjamin Harrison', 'Business-focused intangible middleware', 15);
INSERT INTO student VALUES (1252, 'Rhonda Ochoa', 'Organized bi-directional adapter', 21);
INSERT INTO student VALUES (1472, 'Luis Huffman', 'Reverse-engineered systematic implementation', 93);
INSERT INTO student VALUES (1224, 'Jennifer Williams', 'Ameliorated methodical open architecture', 137);
INSERT INTO student VALUES (1396, 'Marcus Leonard', 'Enterprise-wide solution-oriented open system', 46);
INSERT INTO student VALUES (1335, 'Rebecca Lyons', 'Digitized context-sensitive emulation', 113);
INSERT INTO student VALUES (1561, 'Madison Murillo', 'Digitized user-facing infrastructure', 15);
INSERT INTO student VALUES (1268, 'Dylan Jackson', 'Proactive mission-critical challenge', 31);
INSERT INTO student VALUES (1280, 'John Rodriguez', 'Seamless context-sensitive capability', 104);
INSERT INTO student VALUES (1985, 'Michelle Perez', 'Up-sized static pricing structure', 76);
INSERT INTO student VALUES (1950, 'Elizabeth Wilson', 'Switchable mobile open architecture', 55);
INSERT INTO student VALUES (1475, 'Marcus Klein', 'Multi-layered secondary knowledgebase', 38);
INSERT INTO student VALUES (1266, 'Elizabeth Barton', 'Robust grid-enabled workforce', 88);
INSERT INTO student VALUES (1440, 'Brian Richardson', 'Multi-channeled methodical definition', 8);
INSERT INTO takes VALUES (1335, 95, 4, 1, 2021, 'C');
INSERT INTO takes VALUES (1542, 31, 4, 1, 2020, 'A');
INSERT INTO takes VALUES (1224, 10, 3, 2, 2021, 'B');
INSERT INTO takes VALUES (1426, 41, 3, 2, 2020, 'B');
INSERT INTO takes VALUES (1646, 81, 3, 1, 2022, 'B');
INSERT INTO takes VALUES (1777, 10, 2, 2, 2023, 'A');
INSERT INTO takes VALUES (1985, 45, 4, 1, 2023, 'A');
INSERT INTO takes VALUES (1096, 6, 4, 1, 2022, 'A');
INSERT INTO takes VALUES (1393, 79, 1, 2, 2020, 'B');
INSERT INTO takes VALUES (1380, 83, 5, 2, 2021, 'C');
INSERT INTO takes VALUES (1561, 18, 5, 2, 2020, 'F');
INSERT INTO takes VALUES (1130, 89, 2, 1, 2020, 'A');
INSERT INTO takes VALUES (1475, 87, 5, 2, 2020, 'D');
INSERT INTO takes VALUES (1341, 44, 2, 2, 2020, 'A');
INSERT INTO takes VALUES (1887, 91, 4, 2, 2022, 'C');
INSERT INTO takes VALUES (1563, 17, 2, 2, 2022, 'F');
INSERT INTO takes VALUES (1879, 11, 2, 1, 2023, 'B');
INSERT INTO takes VALUES (1677, 3, 3, 1, 2020, 'F');
INSERT INTO takes VALUES (1676, 23, 5, 1, 2020, 'D');
INSERT INTO takes VALUES (1925, 65, 5, 1, 2023, 'C');
INSERT INTO takes VALUES (1832, 66, 5, 2, 2020, 'C');
INSERT INTO takes VALUES (1732, 64, 2, 2, 2022, 'C');
INSERT INTO takes VALUES (1396, 73, 3, 2, 2021, 'D');
INSERT INTO takes VALUES (1870, 41, 5, 1, 2022, 'F');
INSERT INTO takes VALUES (1202, 61, 4, 2, 2021, 'A');
INSERT INTO takes VALUES (1797, 69, 3, 1, 2022, 'C');
INSERT INTO takes VALUES (1220, 85, 4, 1, 2021, 'A');
INSERT INTO takes VALUES (1418, 39, 5, 1, 2022, 'F');
INSERT INTO takes VALUES (1169, 42, 5, 2, 2023, 'A');
INSERT INTO takes VALUES (1366, 41, 4, 2, 2020, 'F');
INSERT INTO takes VALUES (1542, 23, 4, 2, 2022, 'C');
INSERT INTO takes VALUES (1366, 95, 1, 2, 2023, 'A');
INSERT INTO takes VALUES (1442, 29, 3, 2, 2020, 'C');
INSERT INTO takes VALUES (1732, 52, 3, 1, 2022, 'F');
INSERT INTO takes VALUES (1886, 67, 5, 2, 2020, 'C');
INSERT INTO takes VALUES (1155, 72, 4, 2, 2022, 'B');
INSERT INTO takes VALUES (1130, 7, 3, 2, 2023, 'C');
INSERT INTO takes VALUES (1266, 81, 1, 2, 2023, 'C');
INSERT INTO takes VALUES (1071, 66, 4, 2, 2020, 'D');
INSERT INTO takes VALUES (1646, 38, 4, 1, 2022, 'C');
INSERT INTO takes VALUES (1797, 87, 4, 1, 2023, 'F');
INSERT INTO takes VALUES (1288, 52, 4, 2, 2021, 'C');
INSERT INTO takes VALUES (1492, 84, 4, 2, 2021, 'B');
INSERT INTO takes VALUES (1537, 23, 1, 1, 2020, 'C');
INSERT INTO takes VALUES (1965, 6, 1, 1, 2023, 'C');
INSERT INTO takes VALUES (1280, 86, 4, 2, 2023, 'C');
INSERT INTO takes VALUES (1561, 9, 2, 2, 2022, 'C');
INSERT INTO takes VALUES (1870, 76, 2, 1, 2020, 'C');
INSERT INTO takes VALUES (1492, 19, 5, 2, 2023, 'A');
INSERT INTO takes VALUES (1364, 55, 5, 2, 2020, 'A');
INSERT INTO takes VALUES (1472, 46, 2, 2, 2020, 'B');
INSERT INTO takes VALUES (1206, 81, 3, 1, 2021, 'D');
INSERT INTO takes VALUES (1921, 16, 3, 1, 2022, 'A');
INSERT INTO takes VALUES (1364, 80, 2, 2, 2020, 'C');
INSERT INTO takes VALUES (1005, 88, 2, 1, 2021, 'A');
INSERT INTO takes VALUES (1965, 33, 5, 2, 2023, 'B');
INSERT INTO takes VALUES (1732, 12, 5, 1, 2021, 'C');
INSERT INTO takes VALUES (1732, 8, 4, 2, 2023, 'D');
INSERT INTO takes VALUES (1148, 39, 5, 1, 2021, 'A');
INSERT INTO takes VALUES (1563, 77, 3, 1, 2023, 'C');
INSERT INTO takes VALUES (1364, 37, 1, 2, 2020, 'A');
INSERT INTO takes VALUES (1326, 43, 1, 1, 2020, 'F');
INSERT INTO takes VALUES (1832, 63, 5, 1, 2022, 'F');
INSERT INTO takes VALUES (1542, 80, 2, 1, 2021, 'D');
INSERT INTO takes VALUES (1342, 20, 4, 1, 2023, 'C');
INSERT INTO takes VALUES (1537, 70, 2, 1, 2020, 'B');
INSERT INTO takes VALUES (1437, 31, 3, 1, 2020, 'C');
INSERT INTO takes VALUES (1887, 30, 1, 2, 2023, 'C');
INSERT INTO takes VALUES (1920, 72, 5, 2, 2023, 'B');
INSERT INTO takes VALUES (1202, 77, 1, 2, 2023, 'C');
INSERT INTO takes VALUES (1687, 98, 4, 2, 2021, 'D');
INSERT INTO takes VALUES (1475, 41, 1, 1, 2022, 'A');
INSERT INTO takes VALUES (1426, 33, 4, 1, 2022, 'A');
INSERT INTO takes VALUES (1732, 51, 1, 1, 2021, 'A');
INSERT INTO takes VALUES (1123, 40, 2, 2, 2020, 'F');
INSERT INTO takes VALUES (1656, 73, 2, 2, 2020, 'F');
INSERT INTO takes VALUES (1472, 24, 5, 1, 2022, 'F');
INSERT INTO takes VALUES (1567, 19, 2, 1, 2022, 'B');
INSERT INTO takes VALUES (1561, 5, 2, 2, 2022, 'A');
INSERT INTO takes VALUES (1828, 22, 3, 2, 2021, 'D');
INSERT INTO takes VALUES (1284, 39, 5, 2, 2023, 'D');
INSERT INTO takes VALUES (1192, 5, 2, 2, 2023, 'D');
INSERT INTO takes VALUES (1751, 33, 5, 2, 2023, 'B');
INSERT INTO takes VALUES (1130, 83, 5, 1, 2023, 'A');
INSERT INTO takes VALUES (1921, 97, 1, 2, 2022, 'B');
INSERT INTO takes VALUES (1148, 81, 1, 2, 2023, 'F');
INSERT INTO takes VALUES (1881, 23, 4, 2, 2021, 'F');
INSERT INTO takes VALUES (1804, 88, 4, 1, 2022, 'B');
INSERT INTO takes VALUES (1148, 93, 4, 2, 2023, 'B');
INSERT INTO takes VALUES (1280, 75, 4, 1, 2020, 'D');
INSERT INTO takes VALUES (1563, 54, 4, 1, 2021, 'F');
INSERT INTO takes VALUES (1536, 19, 1, 2, 2021, 'C');
INSERT INTO takes VALUES (1685, 99, 1, 2, 2023, 'B');
INSERT INTO takes VALUES (1326, 72, 2, 2, 2021, 'A');
INSERT INTO takes VALUES (1496, 26, 3, 2, 2023, 'C');
INSERT INTO takes VALUES (1341, 19, 1, 1, 2021, 'A');
INSERT INTO takes VALUES (1005, 40, 3, 1, 2020, 'A');
INSERT INTO takes VALUES (1536, 61, 1, 1, 2023, 'F');
INSERT INTO takes VALUES (1246, 29, 5, 1, 2022, 'F');
INSERT INTO takes VALUES (1475, 14, 3, 2, 2021, 'C');
INSERT INTO instructor VALUES (2369, 'Joshua Potter', 'User-friendly contextually-based database', 116379.54);
INSERT INTO instructor VALUES (2554, 'Mary Fowler', 'Integrated foreground access', 59146.44);
INSERT INTO instructor VALUES (2256, 'Jennifer Porter', 'Automated background Local Area Network', 138786.96);
INSERT INTO instructor VALUES (2346, 'Mark Mitchell', 'Seamless context-sensitive capability', 138323.49);
INSERT INTO instructor VALUES (2189, 'Eric Miranda', 'Synergistic human-resource instruction set', 130745.43);
INSERT INTO instructor VALUES (2737, 'Amanda Mcfarland', 'User-friendly optimizing Graphical User Interface', 118089.71);
INSERT INTO instructor VALUES (2702, 'Joshua Miller', 'Centralized analyzing support', 82812.01);
INSERT INTO instructor VALUES (2128, 'Corey Sullivan', 'Up-sized static pricing structure', 57814.07);
INSERT INTO instructor VALUES (2499, 'Debra Williams', 'Up-sized asymmetric knowledgebase', 65203.92);
INSERT INTO instructor VALUES (2603, 'Daniel Diaz', 'Progressive demand-driven process improvement', 51796.43);
INSERT INTO instructor VALUES (2497, 'Brittney James', 'Reverse-engineered static encryption', 132596.01);
INSERT INTO instructor VALUES (2402, 'Samantha Estrada', 'User-friendly optimizing Graphical User Interface', 50884.35);
INSERT INTO instructor VALUES (2852, 'Richard Thomas', 'Advanced systemic initiative', 73597.96);
INSERT INTO instructor VALUES (2947, 'John Ryan', 'Mandatory responsive methodology', 111172.04);
INSERT INTO instructor VALUES (2951, 'Nicole Payne', 'Cloned clear-thinking frame', 59270.10);
INSERT INTO instructor VALUES (2662, 'James Bernard', 'Enterprise-wide solution-oriented open system', 94809.55);
INSERT INTO instructor VALUES (2412, 'Kristy Lee', 'Reactive next generation extranet', 144541.38);
INSERT INTO instructor VALUES (2094, 'Matthew Hall', 'Visionary modular Graphic Interface', 128982.63);
INSERT INTO instructor VALUES (2678, 'Dawn Ford', 'Enterprise-wide multimedia secured line', 113491.84);
INSERT INTO instructor VALUES (2109, 'Jason Martinez', 'Ameliorated motivating matrix', 76208.95);
INSERT INTO instructor VALUES (2866, 'Zachary Hartman', 'Synergized global benchmark', 129254.92);
INSERT INTO instructor VALUES (2339, 'Martin Gutierrez', 'Decentralized modular hardware', 98624.59);
INSERT INTO instructor VALUES (2810, 'Brenda Sutton', 'Balanced optimal extranet', 55556.82);
INSERT INTO instructor VALUES (2780, 'Wendy Peters', 'Up-sized asymmetric knowledgebase', 93070.16);
INSERT INTO instructor VALUES (2196, 'Carlos Anderson', 'Pre-emptive client-driven adapter', 85290.37);
INSERT INTO instructor VALUES (2313, 'Christina Davis', 'Distributed 4thgeneration firmware', 62329.52);
INSERT INTO instructor VALUES (2459, 'Ronald Blair', 'Organized bi-directional adapter', 53725.78);
INSERT INTO instructor VALUES (2423, 'Harold Jensen', 'Reverse-engineered static encryption', 77822.67);
INSERT INTO instructor VALUES (2669, 'Jacob Murray', 'Proactive executive frame', 55806.79);
INSERT INTO instructor VALUES (2657, 'Julie Allen', 'Versatile tangible benchmark', 134712.78);
INSERT INTO instructor VALUES (2656, 'Robert Barker', 'Synergistic grid-enabled emulation', 74845.79);
INSERT INTO instructor VALUES (2354, 'Patricia Hayden', 'Progressive tertiary moratorium', 108250.81);
INSERT INTO instructor VALUES (2792, 'Brandon Klein', 'Automated background Local Area Network', 123274.25);
INSERT INTO instructor VALUES (2919, 'Angelica Lopez DDS', 'Phased system-worthy benchmark', 132324.43);
INSERT INTO instructor VALUES (2728, 'Michael Williams', 'Open-source analyzing info-mediaries', 81724.45);
INSERT INTO instructor VALUES (2992, 'Cassandra Hunter', 'Future-proofed impactful product', 145045.71);
INSERT INTO instructor VALUES (2458, 'William Frazier', 'Grass-roots system-worthy support', 116622.34);
INSERT INTO instructor VALUES (2517, 'Carolyn Mccullough', 'Configurable reciprocal data-warehouse', 68727.33);
INSERT INTO instructor VALUES (2751, 'Dean Whitney', 'Total 24hour software', 99444.11);
INSERT INTO instructor VALUES (2855, 'Craig Cantrell II', 'Advanced systemic initiative', 134250.03);
INSERT INTO instructor VALUES (2545, 'Jeffrey Holmes', 'Multi-layered secondary knowledgebase', 124017.94);
INSERT INTO instructor VALUES (2945, 'Tammy Nguyen', 'Integrated foreground access', 58931.41);
INSERT INTO instructor VALUES (2236, 'Joshua Griffin', 'Digitized user-facing infrastructure', 111071.50);
INSERT INTO instructor VALUES (2676, 'Amber Oconnor', 'Robust grid-enabled workforce', 121300.14);
INSERT INTO instructor VALUES (2282, 'Alejandro Armstrong', 'Seamless context-sensitive capability', 81896.15);
INSERT INTO instructor VALUES (2877, 'Douglas Patterson', 'Organized bi-directional adapter', 138430.82);
INSERT INTO instructor VALUES (2028, 'Brianna Whitney', 'Enhanced client-server infrastructure', 64508.02);
INSERT INTO instructor VALUES (2358, 'Phillip Allen', 'Balanced optimal extranet', 101461.21);
INSERT INTO instructor VALUES (2035, 'Nancy Rivera', 'Enterprise-wide multimedia secured line', 72893.28);
INSERT INTO instructor VALUES (2625, 'Alexandria Clarke', 'Operative high-level Graphic Interface', 116206.29);
INSERT INTO instructor VALUES (2861, 'Amy Erickson', 'Ameliorated motivating matrix', 98124.48);
INSERT INTO instructor VALUES (2327, 'Brandon Reyes', 'De-engineered coherent structure', 136076.42);
INSERT INTO instructor VALUES (2331, 'Jerry Miller', 'Optimized exuding focus group', 94262.92);
INSERT INTO instructor VALUES (2424, 'Monica Miller', 'Reactive next generation extranet', 87607.56);
INSERT INTO instructor VALUES (2516, 'Shelby Jones', 'Cloned clear-thinking frame', 54274.10);
INSERT INTO instructor VALUES (2981, 'Susan Butler', 'Fundamental multimedia database', 115605.75);
INSERT INTO instructor VALUES (2461, 'Joseph Tran', 'Integrated foreground access', 133967.58);
INSERT INTO instructor VALUES (2892, 'Michael Davenport', 'Ameliorated methodical open architecture', 52494.51);
INSERT INTO instructor VALUES (2831, 'Eduardo Adams', 'Enterprise-wide multimedia secured line', 54044.20);
INSERT INTO instructor VALUES (2063, 'Casey Mcbride', 'Cloned clear-thinking frame', 118955.72);
INSERT INTO instructor VALUES (2942, 'Todd Richardson', 'Enterprise-wide solution-oriented open system', 146482.20);
INSERT INTO instructor VALUES (2531, 'Jason Dunn', 'Multi-channeled methodical definition', 51353.20);
INSERT INTO instructor VALUES (2324, 'Scott Moore', 'Fundamental multimedia database', 112939.91);
INSERT INTO instructor VALUES (2862, 'Michael Butler', 'Mandatory hybrid model', 116349.18);
INSERT INTO instructor VALUES (2998, 'Alejandro Carlson', 'Progressive web-enabled projection', 54045.53);
INSERT INTO instructor VALUES (2359, 'Catherine Turner MD', 'Business-focused intangible middleware', 73339.86);
INSERT INTO instructor VALUES (2495, 'Ronald Hansen', 'Operative high-level Graphic Interface', 68811.41);
INSERT INTO instructor VALUES (2386, 'Bridget James', 'Enterprise-wide systemic protocol', 86974.74);
INSERT INTO instructor VALUES (2978, 'Jacqueline Scott', 'Reactive next generation extranet', 128511.49);
INSERT INTO instructor VALUES (2689, 'Justin Cox', 'Reactive didactic synergy', 118063.39);
INSERT INTO instructor VALUES (2071, 'Randy Reynolds', 'Cloned clear-thinking frame', 145208.68);
INSERT INTO instructor VALUES (2686, 'Scott Wong MD', 'Progressive demand-driven process improvement', 70973.12);
INSERT INTO instructor VALUES (2629, 'Brianna Owen', 'Multi-lateral multimedia portal', 148147.55);
INSERT INTO instructor VALUES (2906, 'Timothy Juarez', 'Mandatory hybrid model', 78797.76);
INSERT INTO instructor VALUES (2026, 'Meagan Levy', 'Centralized analyzing support', 58325.46);
INSERT INTO instructor VALUES (2111, 'Benjamin Jimenez', 'Versatile tangible benchmark', 60979.98);
INSERT INTO instructor VALUES (2652, 'Kenneth Lee', 'Pre-emptive client-driven adapter', 127749.10);
INSERT INTO instructor VALUES (2427, 'Lauren Collier', 'Adaptive uniform moderator', 121661.47);
INSERT INTO instructor VALUES (2283, 'Michael Woods', 'Total 24hour software', 84745.06);
INSERT INTO instructor VALUES (2846, 'Heather Mcdonald', 'Mandatory hybrid model', 58712.73);
INSERT INTO instructor VALUES (2925, 'Nicholas Martinez', 'Robust contextually-based frame', 113966.02);
INSERT INTO instructor VALUES (2097, 'Adam Franklin Jr.', 'Switchable mobile open architecture', 58151.58);
INSERT INTO instructor VALUES (2373, 'Michelle Scott', 'Secured mission-critical open system', 137089.64);
INSERT INTO instructor VALUES (2451, 'Jessica Russell', 'Progressive web-enabled projection', 143089.84);
INSERT INTO instructor VALUES (2489, 'Nathan Smith', 'Automated background Local Area Network', 102394.85);
INSERT INTO instructor VALUES (2100, 'Carol Johnson', 'Synchronized global emulation', 111700.57);
INSERT INTO instructor VALUES (2026, 'Patrick Hunt', 'Enterprise-wide multimedia secured line', 141232.69);
INSERT INTO instructor VALUES (2045, 'Briana Mcneil', 'Multi-layered secondary knowledgebase', 143503.22);
INSERT INTO instructor VALUES (2933, 'Paula Medina', 'Automated background Local Area Network', 136251.56);
INSERT INTO instructor VALUES (2345, 'Bryan Martinez', 'User-friendly contextually-based database', 97152.04);
INSERT INTO instructor VALUES (2319, 'David Horton', 'Compatible heuristic moderator', 68790.48);
INSERT INTO instructor VALUES (2855, 'Craig Hughes', 'Centralized analyzing support', 146453.65);
INSERT INTO instructor VALUES (2540, 'Cheryl Brown', 'Future-proofed impactful product', 104865.59);
INSERT INTO instructor VALUES (2373, 'Monica Franklin', 'Proactive executive frame', 130234.89);
INSERT INTO instructor VALUES (2704, 'Kayla Anthony', 'Visionary modular Graphic Interface', 89469.11);
INSERT INTO instructor VALUES (2443, 'Nicole Phillips', 'Function-based human-resource alliance', 148543.75);
INSERT INTO instructor VALUES (2904, 'Christine Leach', 'Automated background Local Area Network', 127642.90);
INSERT INTO instructor VALUES (2096, 'Linda Torres', 'Open-source analyzing info-mediaries', 52327.69);
INSERT INTO instructor VALUES (2321, 'Lisa Parker', 'User-centric 3rdgeneration paradigm', 53641.89);
INSERT INTO instructor VALUES (2542, 'Renee Mills', 'Mandatory bifurcated Internet solution', 134535.92);
INSERT INTO advisor VALUES (56, 56);
INSERT INTO advisor VALUES (67, 67);
INSERT INTO advisor VALUES (8, 8);
INSERT INTO advisor VALUES (77, 77);
INSERT INTO advisor VALUES (67, 67);
INSERT INTO advisor VALUES (72, 72);
INSERT INTO advisor VALUES (46, 46);
INSERT INTO advisor VALUES (26, 26);
INSERT INTO advisor VALUES (70, 70);
INSERT INTO advisor VALUES (44, 44);
INSERT INTO advisor VALUES (98, 98);
INSERT INTO advisor VALUES (48, 48);
INSERT INTO advisor VALUES (35, 35);
INSERT INTO advisor VALUES (28, 28);
INSERT INTO advisor VALUES (34, 34);
INSERT INTO advisor VALUES (43, 43);
INSERT INTO advisor VALUES (26, 26);
INSERT INTO advisor VALUES (48, 48);
INSERT INTO advisor VALUES (35, 35);
INSERT INTO advisor VALUES (84, 84);
INSERT INTO advisor VALUES (69, 69);
INSERT INTO advisor VALUES (22, 22);
INSERT INTO advisor VALUES (6, 6);
INSERT INTO advisor VALUES (36, 36);
INSERT INTO advisor VALUES (99, 99);
INSERT INTO advisor VALUES (58, 58);
INSERT INTO advisor VALUES (66, 66);
INSERT INTO advisor VALUES (32, 32);
INSERT INTO advisor VALUES (77, 77);
INSERT INTO advisor VALUES (56, 56);
INSERT INTO advisor VALUES (25, 25);
INSERT INTO advisor VALUES (76, 76);
INSERT INTO advisor VALUES (60, 60);
INSERT INTO advisor VALUES (2, 2);
INSERT INTO advisor VALUES (69, 69);
INSERT INTO advisor VALUES (41, 41);
INSERT INTO advisor VALUES (1, 1);
INSERT INTO advisor VALUES (17, 17);
INSERT INTO advisor VALUES (53, 53);
INSERT INTO advisor VALUES (60, 60);
INSERT INTO advisor VALUES (60, 60);
INSERT INTO advisor VALUES (74, 74);
INSERT INTO advisor VALUES (46, 46);
INSERT INTO advisor VALUES (16, 16);
INSERT INTO advisor VALUES (75, 75);
INSERT INTO advisor VALUES (23, 23);
INSERT INTO advisor VALUES (6, 6);
INSERT INTO advisor VALUES (20, 20);
INSERT INTO advisor VALUES (13, 13);
INSERT INTO advisor VALUES (6, 6);
INSERT INTO advisor VALUES (42, 42);
INSERT INTO advisor VALUES (1, 1);
INSERT INTO advisor VALUES (30, 30);
INSERT INTO advisor VALUES (62, 62);
INSERT INTO advisor VALUES (25, 25);
INSERT INTO advisor VALUES (56, 56);
INSERT INTO advisor VALUES (81, 81);
INSERT INTO advisor VALUES (44, 44);
INSERT INTO advisor VALUES (77, 77);
INSERT INTO advisor VALUES (96, 96);
INSERT INTO advisor VALUES (1, 1);
INSERT INTO advisor VALUES (35, 35);
INSERT INTO advisor VALUES (41, 41);
INSERT INTO advisor VALUES (90, 90);
INSERT INTO advisor VALUES (99, 99);
INSERT INTO advisor VALUES (39, 39);
INSERT INTO advisor VALUES (48, 48);
INSERT INTO advisor VALUES (19, 19);
INSERT INTO advisor VALUES (52, 52);
INSERT INTO advisor VALUES (12, 12);
INSERT INTO advisor VALUES (99, 99);
INSERT INTO advisor VALUES (16, 16);
INSERT INTO advisor VALUES (99, 99);
INSERT INTO advisor VALUES (15, 15);
INSERT INTO advisor VALUES (66, 66);
INSERT INTO advisor VALUES (18, 18);
INSERT INTO advisor VALUES (67, 67);
INSERT INTO advisor VALUES (38, 38);
INSERT INTO advisor VALUES (23, 23);
INSERT INTO advisor VALUES (77, 77);
INSERT INTO advisor VALUES (63, 63);
INSERT INTO advisor VALUES (64, 64);
INSERT INTO advisor VALUES (86, 86);
INSERT INTO advisor VALUES (64, 64);
INSERT INTO advisor VALUES (63, 63);
INSERT INTO advisor VALUES (67, 67);
INSERT INTO advisor VALUES (65, 65);
INSERT INTO advisor VALUES (63, 63);
INSERT INTO advisor VALUES (1, 1);
INSERT INTO advisor VALUES (66, 66);
INSERT INTO advisor VALUES (90, 90);
INSERT INTO advisor VALUES (98, 98);
INSERT INTO advisor VALUES (58, 58);
INSERT INTO advisor VALUES (83, 83);
INSERT INTO advisor VALUES (85, 85);
INSERT INTO advisor VALUES (82, 82);
INSERT INTO advisor VALUES (14, 14);
INSERT INTO advisor VALUES (67, 67);
INSERT INTO advisor VALUES (62, 62);
INSERT INTO advisor VALUES (72, 72);
INSERT INTO teaches VALUES (2547, 11, 4, 1, 2022);
INSERT INTO teaches VALUES (2748, 87, 2, 1, 2022);
INSERT INTO teaches VALUES (2600, 92, 5, 1, 2022);
INSERT INTO teaches VALUES (2679, 29, 2, 2, 2023);
INSERT INTO teaches VALUES (2540, 96, 2, 1, 2022);
INSERT INTO teaches VALUES (2562, 34, 5, 1, 2023);
INSERT INTO teaches VALUES (2041, 30, 4, 2, 2023);
INSERT INTO teaches VALUES (2666, 18, 3, 2, 2022);
INSERT INTO teaches VALUES (2911, 68, 1, 1, 2022);
INSERT INTO teaches VALUES (2026, 77, 5, 1, 2021);
INSERT INTO teaches VALUES (2305, 45, 1, 2, 2023);
INSERT INTO teaches VALUES (2465, 74, 1, 1, 2023);
INSERT INTO teaches VALUES (2676, 57, 2, 2, 2023);
INSERT INTO teaches VALUES (2632, 34, 1, 1, 2020);
INSERT INTO teaches VALUES (2323, 20, 5, 2, 2022);
INSERT INTO teaches VALUES (2830, 3, 2, 1, 2022);
INSERT INTO teaches VALUES (2689, 3, 5, 2, 2021);
INSERT INTO teaches VALUES (2384, 3, 5, 2, 2022);
INSERT INTO teaches VALUES (2901, 79, 3, 2, 2020);
INSERT INTO teaches VALUES (2342, 68, 4, 1, 2021);
INSERT INTO teaches VALUES (2843, 26, 5, 2, 2020);
INSERT INTO teaches VALUES (2202, 66, 4, 2, 2021);
INSERT INTO teaches VALUES (2154, 61, 4, 1, 2023);
INSERT INTO teaches VALUES (2679, 83, 5, 1, 2021);
INSERT INTO teaches VALUES (2994, 54, 5, 1, 2020);
INSERT INTO teaches VALUES (2275, 20, 5, 1, 2023);
INSERT INTO teaches VALUES (2906, 9, 5, 1, 2020);
INSERT INTO teaches VALUES (2354, 35, 2, 1, 2021);
INSERT INTO teaches VALUES (2525, 97, 2, 1, 2023);
INSERT INTO teaches VALUES (2279, 88, 2, 2, 2023);
INSERT INTO teaches VALUES (2138, 20, 1, 2, 2022);
INSERT INTO teaches VALUES (2279, 88, 5, 1, 2021);
INSERT INTO teaches VALUES (2164, 47, 4, 2, 2022);
INSERT INTO teaches VALUES (2884, 5, 4, 1, 2020);
INSERT INTO teaches VALUES (2971, 94, 2, 2, 2023);
INSERT INTO teaches VALUES (2301, 63, 5, 2, 2022);
INSERT INTO teaches VALUES (2158, 27, 2, 2, 2022);
INSERT INTO teaches VALUES (2824, 31, 5, 1, 2020);
INSERT INTO teaches VALUES (2327, 24, 2, 2, 2022);
INSERT INTO teaches VALUES (2537, 56, 4, 2, 2021);
INSERT INTO teaches VALUES (2676, 62, 2, 1, 2021);
INSERT INTO teaches VALUES (2435, 44, 2, 2, 2023);
INSERT INTO teaches VALUES (2864, 29, 2, 2, 2023);
INSERT INTO teaches VALUES (2409, 50, 2, 1, 2022);
INSERT INTO teaches VALUES (2697, 20, 2, 1, 2020);
INSERT INTO teaches VALUES (2183, 23, 2, 1, 2020);
INSERT INTO teaches VALUES (2155, 62, 2, 1, 2021);
INSERT INTO teaches VALUES (2148, 87, 2, 1, 2022);
INSERT INTO teaches VALUES (2467, 65, 2, 1, 2022);
INSERT INTO teaches VALUES (2336, 40, 2, 2, 2023);
INSERT INTO teaches VALUES (2878, 91, 5, 2, 2023);
INSERT INTO teaches VALUES (2651, 12, 5, 1, 2022);
INSERT INTO teaches VALUES (2126, 36, 3, 1, 2022);
INSERT INTO teaches VALUES (2741, 37, 5, 2, 2021);
INSERT INTO teaches VALUES (2149, 61, 4, 1, 2020);
INSERT INTO teaches VALUES (2527, 84, 3, 2, 2023);
INSERT INTO teaches VALUES (2308, 74, 2, 2, 2020);
INSERT INTO teaches VALUES (2470, 14, 5, 1, 2023);
INSERT INTO teaches VALUES (2813, 64, 1, 1, 2022);
INSERT INTO teaches VALUES (2092, 54, 2, 1, 2022);
INSERT INTO teaches VALUES (2096, 66, 3, 2, 2022);
INSERT INTO teaches VALUES (2015, 49, 2, 1, 2022);
INSERT INTO teaches VALUES (2669, 21, 2, 2, 2021);
INSERT INTO teaches VALUES (2624, 24, 5, 2, 2022);
INSERT INTO teaches VALUES (2304, 49, 2, 1, 2020);
INSERT INTO teaches VALUES (2834, 48, 4, 1, 2020);
INSERT INTO teaches VALUES (2733, 22, 2, 1, 2020);
INSERT INTO teaches VALUES (2627, 85, 3, 1, 2022);
INSERT INTO teaches VALUES (2803, 42, 4, 2, 2023);
INSERT INTO teaches VALUES (2445, 52, 5, 1, 2023);
INSERT INTO teaches VALUES (2233, 63, 1, 2, 2022);
INSERT INTO teaches VALUES (2466, 35, 5, 1, 2022);
INSERT INTO teaches VALUES (2323, 14, 3, 2, 2023);
INSERT INTO teaches VALUES (2398, 17, 5, 2, 2022);
INSERT INTO teaches VALUES (2217, 51, 4, 2, 2022);
INSERT INTO teaches VALUES (2622, 37, 2, 1, 2022);
INSERT INTO teaches VALUES (2733, 24, 2, 1, 2023);
INSERT INTO teaches VALUES (2054, 43, 3, 1, 2021);
INSERT INTO teaches VALUES (2740, 74, 4, 2, 2022);
INSERT INTO teaches VALUES (2752, 79, 5, 2, 2023);
INSERT INTO teaches VALUES (2643, 64, 2, 2, 2020);
INSERT INTO teaches VALUES (2796, 33, 2, 2, 2022);
INSERT INTO teaches VALUES (2744, 82, 4, 2, 2021);
INSERT INTO teaches VALUES (2338, 22, 5, 2, 2022);
INSERT INTO teaches VALUES (2832, 70, 5, 1, 2022);
INSERT INTO teaches VALUES (2410, 15, 1, 1, 2020);
INSERT INTO teaches VALUES (2881, 86, 1, 2, 2021);
INSERT INTO teaches VALUES (2339, 92, 4, 2, 2020);
INSERT INTO teaches VALUES (2298, 71, 5, 1, 2021);
INSERT INTO teaches VALUES (2879, 30, 2, 1, 2022);
INSERT INTO teaches VALUES (2841, 85, 4, 1, 2023);
INSERT INTO teaches VALUES (2693, 49, 1, 2, 2022);
INSERT INTO teaches VALUES (2553, 71, 5, 1, 2020);
INSERT INTO teaches VALUES (2772, 9, 3, 1, 2023);
INSERT INTO teaches VALUES (2811, 15, 1, 1, 2022);
INSERT INTO teaches VALUES (2749, 66, 2, 1, 2023);
INSERT INTO teaches VALUES (2969, 14, 4, 2, 2021);
INSERT INTO teaches VALUES (2979, 8, 4, 2, 2023);
INSERT INTO teaches VALUES (2405, 44, 2, 2, 2022);
INSERT INTO teaches VALUES (2421, 90, 2, 2, 2022);
