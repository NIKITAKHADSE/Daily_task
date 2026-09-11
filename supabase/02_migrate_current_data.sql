-- Existing SQLite data migrated from the uploaded project.
-- Run AFTER 01_schema.sql. This preserves users, categories, the current Google Sheet connection, and current task snapshot.

begin;

truncate table public.tasks restart identity cascade;
truncate table public.categories restart identity cascade;
truncate table public.users restart identity cascade;
delete from public.google_sheet_settings;

insert into public.users (id,name,email,password_hash,role,department,status,created_at) values
(1,'System Admin','admin@example.com','$2y$10$yNbetENKauOfqoW3OA6NROat8pe.xKsbMbbHgEk3CQUsz5ReiBqky','admin','Management','active','2026-08-18 09:58:05'),
(2,'Rushikesh','sheet.rushikesh@local.invalid','$2y$10$5kY.kZcooep9gRoRV2.MRelbC30lT73lpv.lomLK.Z7gUYUkrFOW.','employee','Google Sheet','active','2026-08-18 10:01:31'),
(3,'Swaraj','sheet.swaraj@local.invalid','$2y$10$KaTAXQxElcOAMTHPdO3RrOzLHOFvLOOxp5nzo4eQngrkjnc536NkW','employee','Google Sheet','active','2026-08-18 10:01:31'),
(4,'Shratayu','sheet.shratayu@local.invalid','$2y$10$gu01dJM3eXjT5KpBNSC6quiRV7TdFsryQMXGE6ZzLp1fybynQXrgW','employee','Google Sheet','active','2026-08-18 10:01:31'),
(5,'Sakib','sheet.sakib@local.invalid','$2y$10$qz4aHmPlFUifFpzpghNtOuhiYssvabxrgPo7obosWHMUpseDk4z3S','employee','Google Sheet','active','2026-08-18 10:01:31'),
(6,'Suraj','sheet.suraj@local.invalid','$2y$10$7jg4kAAfFDUML..XCArIPus2wha2W0rOzHrE.og3KCRtZrMif9Cy6','employee','Google Sheet','active','2026-08-18 10:01:31'),
(7,'Vivek','sheet.vivek@local.invalid','$2y$10$mT47/26XenNHAhhEQ/wtJeptbfgZzCTz/yLmbhObsSEbcMXMfbBAa','employee','Google Sheet','active','2026-08-18 10:01:31'),
(8,'sanika','sheet.sanika@local.invalid','$2y$10$BTnbN31QQVOHz6zJDiCUSe0AVztMCXLfpsZM/9p4JPWTnXRMYUefy','employee','Google Sheet','active','2026-08-18 10:01:31'),
(9,'Swaraj, Sakib','sheet.swaraj.sakib@local.invalid','$2y$10$V6FdLme5RTMtV44s7ycOUO8560Hik88IrBwhGf1MGawuT67VIW7we','employee','Google Sheet','active','2026-08-18 10:01:31'),
(10,'YASH MANDE','sheet.yash.mande@local.invalid','$2y$10$dz1B6vtvWU.3jXDireKGS.9DrAQKjpQ4PBq3653GxVsmt3PHM5DDe','employee','Google Sheet','active','2026-08-18 10:01:31'),
(11,'Yash','sheet.yash@local.invalid','$2y$10$QomsQcQvnDOw7n6NCTGJnO8pe1rT0ydTRgvOfHIoPUDZypNhGTBam','employee','Google Sheet','active','2026-08-18 10:01:31'),
(12,'Guru','sheet.guru@local.invalid','$2y$10$V/2sLDhRiigMv7J4IU0ru.JjXb0aJcy4p4FoukVRI/PaarbdXb9iG','employee','Google Sheet','active','2026-08-18 10:01:31'),
(13,'Unassigned','sheet.unassigned@local.invalid','$2y$10$ebKpvUmtsN1yZZmqlAkUBuGVZbhAuZNesb4PR0pJkHPNyGcWkhAta','employee','Google Sheet','active','2026-08-18 10:01:31'),
(14,'Sushmeet','sheet.sushmeet@local.invalid','$2y$10$2MZJmjNvark5N08F9y1Fvuc86/gTwH0.Gl69EZJ3qcfbMFdtutEsi','employee','Google Sheet','active','2026-08-18 10:01:31'),
(15,'surekha','sheet.surekha@local.invalid','$2y$10$yiyuxBHpoBM2payChlI59OdLH8j7nmMIldGJcW6yomnSqCo8MhZtG','employee','Google Sheet','active','2026-08-18 10:01:31'),
(16,'Sejal','sheet.sejal@local.invalid','$2y$10$/IL3ag.6wOr6fXbEgAbcYuy4BH/ow31oDR2DMgxg2cxyRUvKIBXf2','employee','Google Sheet','active','2026-08-18 10:01:32'),
(17,'Nikita','sheet.nikita@local.invalid','$2y$10$E/pEA3VsgaGYneeJ1VFdxuKqY3WJtGArr82nUOg/drj8dwy0MMEHe','employee','Google Sheet','active','2026-08-18 10:01:32'),
(18,'Sandeep','sheet.sandeep@local.invalid','$2y$10$DIIM8O5SnSEH63KkSZwx3Op65SthOYQ/ZHggl3EnHi7NL7Fjq.G6G','employee','Google Sheet','active','2026-08-18 10:01:32'),
(19,'Amardeep, Sandeep','sheet.amardeep.sandeep@local.invalid','$2y$10$nWqf4Xlb6fwuw5kj98RRX.Dcwqc0x/dsAMTe0Dz/4p7xNsZ6p6LNG','employee','Google Sheet','inactive','2026-08-18 10:01:32'),
(20,'Amardeep','sheet.amardeep@local.invalid','$2y$10$2.YbTk1LMy.NbxMdz471ae59wM4w6qWByNhL.UVHYBiwH.jWnVyp6','employee','Google Sheet','inactive','2026-08-18 10:01:32'),
(21,'YASH MANDE, Swaraj','sheet.yash.mande.swaraj@local.invalid','$2y$10$/sU/e8t32/85Z1wYyZMUx.GT3RpxMgU1TEySpG7QULmf.HrBEmaBi','employee','Google Sheet','active','2026-08-19 05:13:53'),
(22,'Kartik','sheet.kartik@local.invalid','$2y$10$Pn8bMyEw0DMoehWD4a.DR.JN7D1oJp/bW5MOksWrb5sBPY0yS6T1G','employee','Google Sheet','active','2026-08-24 07:50:34'),
(23,'Omkar','sheet.omkar@local.invalid','$2y$10$AHioBB/jy02RJMe5IDI0reYvx1aOVSnIUHzd2Id3dVj61CxT5TnVq','employee','Google Sheet','active','2026-09-02 06:34:40'),
(24,'vidhi','sheet.vidhi@local.invalid','$2y$10$.x76fj2U7F0V3IeJ/2zGIeIbwbb8yivQaJ7EnF4s6y4GAXHvx5PVW','employee','Google Sheet','active','2026-09-03 13:06:03'),
(25,'trish, Rushikesh','sheet.trish.rushikesh@local.invalid','$2y$10$ul99403mb2a92F2ZJgdi4ueDSBwRzjR8LHqK3ZljeAm6AYLr5tQpG','employee','Google Sheet','active','2026-09-03 13:06:03'),
(26,'Suraj, Rushikesh','sheet.suraj.rushikesh@local.invalid','$2y$10$kKgMzWwpWj3i4RIWST4iaesthyiqlaaB9NCwkGJqfFVJjZwLMcrDm','employee','Google Sheet','active','2026-09-11 06:31:59'),
(27,'SOMA','sheet.soma@local.invalid','$2y$10$LjMPu5ZhOyEqMJXzxptpCOQIIlggvmtUahieTN8t5Mi5yX6KKo6P.','employee','Google Sheet','active','2026-09-11 06:31:59'),
(28,'Rushikesh, Suraj','sheet.rushikesh.suraj@local.invalid','$2y$10$fjJKo41stb3vhKik1scqLeMN0ROQQ620Aqu9nqj1G/68D.hraPntm','employee','Google Sheet','active','2026-09-11 06:31:59');
insert into public.categories (id,name,status) values
(1,'Daily Work','active'),
(2,'Client Work','active'),
(3,'Internal','active'),
(4,'Follow-up','active'),
(5,'Meeting','active'),
(6,'Learning','active'),
(7,'Video','active'),
(8,'Static','active'),
(9,'PENDING','active'),
(10,'Changes','active'),
(11,'Menu','active'),
(12,'Flyer','active'),
(13,'Carousel','active'),
(14,'Standee','active'),
(15,'Motion','active'),
(16,'Ai Video','active'),
(17,'Logo','active'),
(18,'Story Creative','active'),
(19,'Outro','active'),
(20,'Resizes','active'),
(21,'Motion Reel','active'),
(22,'Motion Carousel','active'),
(23,'Thumbnail','active'),
(24,'Highlight Covers','active'),
(25,'Package','active'),
(26,'Visiting Card','active'),
(27,'BG','active');
insert into public.google_sheet_settings (id,sheet_url,sheet_id,gid,sync_interval,sync_year,enabled,last_sync_at,last_sync_status,last_sync_message,last_sync_count) values
(1,'https://docs.google.com/spreadsheets/d/1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0/edit?gid=1490653592#gid=1490653592','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0','1490653592',60,2026,0,'2026-09-11 12:10:56','success','708 tasks synced from Google Sheet.',708);
insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(4888,4,'2026-09-11','Botox: What it actually does',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Heal and Care','Static','Soma','','Shratayu','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',2,'2026-09-11 12:10:56'),
(4889,4,'2026-09-11','Acne: Stop doing this',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Heal and Care','Static','Soma','','Shratayu','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',3,'2026-09-11 12:10:56'),
(4890,22,'2026-09-11','Food based reel',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Video','Siddhi','Siddhi','Kartik','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',4,'2026-09-11 12:10:56'),
(4891,26,'2026-09-11','Menu Changes',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Changes','Soma','Soma','Suraj, Rushikesh','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',5,'2026-09-11 12:10:56'),
(4892,2,'2026-09-11','Karaoke Night - 15th sept',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',6,'2026-09-11 12:10:56'),
(4893,2,'2026-09-11','Ladies Night - 16th sept',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',7,'2026-09-11 12:10:56'),
(4894,2,'2026-09-11','Beer @ 25 - 17th sept',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',8,'2026-09-11 12:10:56'),
(4895,2,'2026-09-11','Friday Live with Firat',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',9,'2026-09-11 12:10:56'),
(4896,22,'2026-09-11','Chef (Extra Reel)',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DV8kd4Qk_qn/?utm_source=chatgpt.com','','','','','Friday','Half done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',10,'2026-09-11 12:10:56'),
(4897,3,'2026-09-11','Definition of Happiness',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Swaraj','Ref: https://www.instagram.com/reels/DcjE8p4KHjM/?utm_source=chatgpt.com','','','','','Friday','Creative only','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',11,'2026-09-11 12:10:56'),
(4898,3,'2026-09-11','Ganapati Wishing story',15,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Motion','Soma','Guru','Swaraj','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',12,'2026-09-11 12:10:56'),
(4899,2,'2026-09-11','Corporate Perk',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Rushikesh','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',13,'2026-09-11 12:10:56'),
(4900,2,'2026-09-11','Pasta Party',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Rushikesh','Ref: https://pin.it/3pH00gAzI','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',14,'2026-09-11 12:10:56'),
(4901,2,'2026-09-11','GANESH CHATURTHI FLYER',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','kumkum','Rushikesh','https://pin.it/uuyul4tgq','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',15,'2026-09-11 12:10:56'),
(4902,22,'2026-09-11','1 reel',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Changes','Soma','kumkum','Kartik','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',16,'2026-09-11 12:10:56'),
(4903,2,'2026-09-11','1 Carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','kumkum','Rushikesh','https://www.instagram.com/p/DUVf1vHE35E/?stkn=Y2wybHY1dnJ2cXQ0','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',17,'2026-09-11 12:10:56'),
(4904,2,'2026-09-11','1 Static',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','kumkum','Rushikesh','https://www.instagram.com/p/DbBAzm7D6Ab/?stkn=c3M1dTNjb3kxN2Ny','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',18,'2026-09-11 12:10:56'),
(4905,6,'2026-09-11','Static',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Static','Sushmeet','','Suraj','https://in.pinterest.com/pin/24488391721245246/feedback/?invite_code=588af5657da5491787ae42a5bdd07003&sender_id=1013239753572696440','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',19,'2026-09-11 12:10:56'),
(4906,22,'2026-09-11','Location reel changs, change hidden cafe to hiddn spot, add entrance and staircase shot',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Video','Siddhi','Siddhi','Kartik','https://www.instagram.com/reel/DP30i-Kkbzi/?stkn=Zng4OXUyaHVwOGY1','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',20,'2026-09-11 12:10:56'),
(4907,4,'2026-09-11','Reel 4',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Shratayu','Refer to reel 7: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',21,'2026-09-11 12:10:56'),
(4908,23,'2026-09-11','Reel 3',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Omkar','Refer to reel 10: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Friday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',22,'2026-09-11 12:10:56'),
(4909,23,'2026-09-11','Reel 2',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Omkar','Refer to reel 6: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Friday','Content not given proper','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',23,'2026-09-11 12:10:56'),
(4910,3,'2026-09-11','Reel 1',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Swaraj','Refer to reel 4: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',24,'2026-09-11 12:10:56'),
(4911,6,'2026-09-11','GANESH CHATURTHI FLYER  - wishing story',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',25,'2026-09-11 12:10:56'),
(4912,22,'2026-09-11','80''s Trend',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Video','Sushmeet','','Kartik','https://www.instagram.com/reel/DdBDtn_p8YP/?stkn=bWEwNGIwbDRnbDJw','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',26,'2026-09-11 12:10:56'),
(4913,5,'2026-09-11','GANESH CHATURTHI FLYER  - wishing story',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Flyer','Sushmeet','','Sakib','','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',27,'2026-09-11 12:10:56'),
(4914,4,'2026-09-11','Anniversary Creative - Motion',15,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Motion','Sushmeet','Guru','Shratayu','https://www.instagram.com/reel/DYmyGqDuwXS/?stkn=MThoanNmbGRmOTNqcg==','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',28,'2026-09-11 12:10:56'),
(4915,5,'2026-09-11','Anniversary Creative',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Static','Sushmeet','Guru','Sakib','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',29,'2026-09-11 12:10:56'),
(4916,5,'2026-09-11','GANESH CHATURTHI FLYER',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','Flyer','Trisha','kumkum','Sakib','https://pin.it/2ET9Y5JGx','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',30,'2026-09-11 12:10:56'),
(4917,23,'2026-09-11','Video',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','Video','Trisha','kumkum','Omkar','','','','','','Friday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',31,'2026-09-11 12:10:56'),
(4918,5,'2026-09-11','1 Carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','Carousel','Trisha','kumkum','Sakib','https://www.instagram.com/p/DbdRgbJGAS5/?utm_source=ig_web_button_share_sheet','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',32,'2026-09-11 12:10:56'),
(4919,2,'2026-09-11','1 Carousel',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','Carousel','Trisha','kumkum','Rushikesh','https://www.instagram.com/p/DYjf2mEEUW0/?igsi=c2VqdHh0ZjA5bmtu','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',33,'2026-09-11 12:10:56'),
(4920,5,'2026-09-11','GANESH CHATURTHI FLYER',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA belle','Flyer','Trisha','kumkum','Sakib','https://pin.it/6HQs9vH5q','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',34,'2026-09-11 12:10:56'),
(4921,2,'2026-09-11','1 Carousel If You''re In Hinjewadi…
Slide 1: If you''re in Hinjewadi, you already know…
Slide 2: Work is here.
Slide 3: Traffic is here.
Slide 4: Your people are here.
Slide 5: So should your evenings be.
LA BELLE',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA belle','Carousel','Trisha','kumkum','Rushikesh','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',35,'2026-09-11 12:10:56'),
(4922,5,'2026-09-11','1 Carousel  What If Life Crises Had Solutions?
Role: Relatable life problems turned into humorous food/drink solutions.

Slide 1 — Hook
WHAT IF LIFE CRISES HAD SOLUTIONS?
Swipe to know →
Slide 2 — Office Stress
1. OFFICE STRESS
Solution: Butter Chicken.
Because your boss can''t bother you while you''re eating.
Slide 3 — Love Life Issues
2. LOVE LIFE ISSUES
Solution: A good drink.
At least this one knows how to keep you company.
Slide 4 — Friends Cancelled
3. FRIENDS CANCELLED
Solution: Order the whole thing.
More for you. Problem solved.
Slide 5 — Everything Else
4. EVERYTHING ELSE
Solution: La Belle.
Some problems deserve a better setting.',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA belle','Carousel','Trisha','kumkum','Sakib','https://www.instagram.com/p/DcV9bJFArw5/?igsi=MXMwbjl2MXVldnVoNw==','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',36,'2026-09-11 12:10:56'),
(4923,23,'2026-09-11','1 reel',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA belle','Video','Trisha','kumkum','Omkar','','','','','','Friday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',37,'2026-09-11 12:10:56'),
(4924,3,'2026-09-11','GANESH CHATURTHI FLYER',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Flyer','Sushmeet','kumkum','Swaraj','https://pin.it/18lMe2D0s','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',38,'2026-09-11 12:10:56'),
(4925,5,'2026-09-11','Grid',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Carousel','Sushmeet','','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',39,'2026-09-11 12:10:56'),
(4926,3,'2026-09-11','1 Static',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Static','Sushmeet','kumkum','Swaraj','https://www.instagram.com/p/DdDwXOgi4Ts/?stkn=MTJ2OHFobm5zb3NjaQ==','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',40,'2026-09-11 12:10:56'),
(4927,22,'2026-09-11','marathi influencer  reel',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Video','Trisha','kumkum','Kartik','','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',41,'2026-09-11 12:10:56'),
(4928,5,'2026-09-11','DRINK creative : WHAT COMPLETES YOUR MEAL',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Static','Trisha','kumkum','Sakib','https://www.instagram.com/p/DcLiTM1DYfk/?stkn=MXdzNXIwdmZjMmt6eQ==','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',42,'2026-09-11 12:10:56'),
(4929,2,'2026-09-11','GRILLING CAROUSEL',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Carousel','Trisha','kumkum','Rushikesh','https://www.instagram.com/p/DXYfbSYDfHm/?stkn=MWM4dHc3MDMxOHBueQ==','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',43,'2026-09-11 12:10:56'),
(4930,23,'2026-09-11','fitness gym guy reel',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Video','Trisha','kumkum','Omkar','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',44,'2026-09-11 12:10:56'),
(4931,4,'2026-09-11','CLOCK IT',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Video','Trisha','kumkum','Shratayu','https://www.instagram.com/reel/DZFZsyWMfbO/?stkn=NzM5NTZwM21jNXNv','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',45,'2026-09-11 12:10:56'),
(4932,22,'2026-09-11','KIDs',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','chimbori','Video','Trisha','','Kartik','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',46,'2026-09-11 12:10:56'),
(4933,4,'2026-09-11','ganesh chaturthi wishing',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Shratayu','https://pin.it/6o8ikHoV8','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',47,'2026-09-11 12:10:56'),
(4934,5,'2026-09-11','how barrels used to look in 80''S',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','kumkum','Sakib','https://www.instagram.com/p/DdBnSHFgM_T/?stkn=MWRvbTBvb2Qwamo3ZQ==','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',48,'2026-09-11 12:10:56'),
(4935,23,'2026-09-11','1 REEL  DRINK',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Video','Trisha','kumkum','Omkar','https://www.instagram.com/reel/DY-lK6vSDYl/?stkn=ajlra3lqNDRuOGhs','','','','','Friday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',49,'2026-09-11 12:10:56'),
(4936,5,'2026-09-11','Retro bollywood Night - 16th Sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',50,'2026-09-11 12:10:56'),
(4937,5,'2026-09-11','Mix Bag Night - 18th Sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',51,'2026-09-11 12:10:56'),
(4938,5,'2026-09-11','UK Punjabi Night - 19th sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',52,'2026-09-11 12:10:56'),
(4939,5,'2026-09-11','13th Sept - Sunday - BACK TO 80s',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',53,'2026-09-11 12:10:56'),
(4940,5,'2026-09-11','Post 17',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Carousel','Siddhi','Siddhi','Sakib','https://www.instagram.com/p/Dak0yjUiMmQ/?utm_source=ig_web_button_share_sheet','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',54,'2026-09-11 12:10:56'),
(4941,23,'2026-09-11','reel 1',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Changes','Trisha','vidhi','Omkar','explaination - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist 
data - https://drive.google.com/drive/folders/1GuK75DSx1EUcgGcZhUmfkmm1yK2EBkyf','','','','','Friday','Content not given proper','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',55,'2026-09-11 12:10:56'),
(4942,3,'2026-09-11','1 motion video - static 2 
check text add copy as mentioned and increase the visual size',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Changes','Trisha','vidhi','Swaraj','https://www.instagram.com/p/DcYhYvnExWK/?stkn=Zzh2NHUwYjNtMG92 reference 
explaination static 2  - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',56,'2026-09-11 12:10:56'),
(4943,3,'2026-09-11','carousel video STATIC 3',9,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','PENDING','Trisha','vidhi','Swaraj','ref - https://www.instagram.com/p/DcLntjzlKu5/?img_index=1
data - https://drive.google.com/drive/folders/1nNCc2uZr6uir5uSuTKpfo4B8b5gyuPNC 
explaination - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',57,'2026-09-11 12:10:56'),
(4944,4,'2026-09-11','1 reel changes',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','digivik','Changes','Vidhi','vidhi','Shratayu','changes shared on whstp','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',58,'2026-09-11 12:10:56'),
(4945,3,'2026-09-11','Mutton rogan josh',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Video','Sanika','','Swaraj','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',59,'2026-09-11 12:10:56'),
(4946,3,'2026-09-11','Karaoke Night - 15th sept',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Swaraj','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',60,'2026-09-11 12:10:56'),
(4947,2,'2026-09-11','Audience picture carousel changes',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',61,'2026-09-11 12:10:56'),
(4948,5,'2026-09-11','Loyalty cards',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Sakib','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',62,'2026-09-11 12:10:56'),
(4949,2,'2026-09-11','Tent card back side change',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',63,'2026-09-11 12:10:56'),
(4950,2,'2026-09-11','Lunch combo food menu',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Menu','Sanika','','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',64,'2026-09-11 12:10:56'),
(4951,22,'2026-09-11','Lunch meal video 3',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Video','Sanika','','Kartik','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',65,'2026-09-11 12:10:56'),
(4952,3,'2026-09-11','Karaoke Night - 15th sept',20,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Resizes','Sanika','','Swaraj','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',66,'2026-09-11 12:10:56'),
(4953,5,'2026-09-10','Weekly Event Calendar',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on whatsapp','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',72,'2026-09-11 12:10:56'),
(4954,23,'2026-09-10','Reel 2',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Omkar','Refer to reel 6: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',73,'2026-09-11 12:10:56'),
(4955,3,'2026-09-10','Artist',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Swaraj','https://drive.google.com/drive/folders/152aH7u4Gw82wQC_JmXbN0tlbqLOGw1OJ','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',74,'2026-09-11 12:10:56'),
(4956,3,'2026-09-10','Reel 1',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Swaraj','Refer to reel 4: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',75,'2026-09-11 12:10:56'),
(4957,17,'2026-09-10','Grid - Just do the bottom 2',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Carousel','Sushmeet','','Nikita','','','','','','Thursday','','on hold','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',76,'2026-09-11 12:10:56'),
(4958,23,'2026-09-10','Reel - NIBM''s Largest Rooftop',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','Guru','Omkar','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',77,'2026-09-11 12:10:56'),
(4959,4,'2026-09-10','Sensitive Skin Warning Signs',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Heal and Care','Static','Soma','Soma','Shratayu','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',78,'2026-09-11 12:10:56'),
(4960,4,'2026-09-10','Rainy Season Makeup Tips',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Heal and Care','Static','Soma','Soma','Shratayu','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',79,'2026-09-11 12:10:56'),
(4961,4,'2026-09-10','Anti-Aging Habits (2 slides)',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Heal and Care','Carousel','Soma','Soma','Shratayu','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',80,'2026-09-11 12:10:56'),
(4962,2,'2026-09-10','1 Static',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','kumkum','Rushikesh','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',81,'2026-09-11 12:10:56'),
(4963,2,'2026-09-10','1 Static',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','kumkum','Rushikesh','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',82,'2026-09-11 12:10:56'),
(4964,22,'2026-09-10','Bloggers reel',7,'High',NULL,'Completed','waiting for outro','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','kumkum','Kartik','https://www.instagram.com/reel/DWLTzDQxZGf/?stkn=bTdxMnBtcmhrNTJu','','waiting for outro','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',83,'2026-09-11 12:10:56'),
(4965,6,'2026-09-10','what is topings',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','kumkum','Suraj','https://www.instagram.com/p/DaQBPp4DLTq/?stkn=eHNmbzZqa2p0amNw','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',84,'2026-09-11 12:10:56'),
(4966,6,'2026-09-10','BRAND GUIDELINES',27,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','kumkum','Suraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',85,'2026-09-11 12:10:56'),
(4967,4,'2026-09-10','1 REEL',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','DIGIVIK','Video','Vidhi','VIDHI','Shratayu','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',86,'2026-09-11 12:10:56'),
(4968,4,'2026-09-10','Food Motion reel',21,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','kumkum','Shratayu','','','','','','Thursday','content not given by client','imp','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',87,'2026-09-11 12:10:56'),
(4969,22,'2026-09-10','Behind the plate',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer & Beans','Video','Soma','Guru','Kartik','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',88,'2026-09-11 12:10:56'),
(4970,5,'2026-09-10','Post 16',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Static','Siddhi','Siddhi','Sakib','https://pin.it/78ma6G4Tl','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',89,'2026-09-11 12:10:56'),
(4971,6,'2026-09-10','Catering Services',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Changes','Soma','Guru','Suraj','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',90,'2026-09-11 12:10:56'),
(4972,2,'2026-09-10','Ganapati Wishing story',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',91,'2026-09-11 12:10:56'),
(4973,22,'2026-09-10','Where Are We Eating Tonight?',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DWCAJbXkrD8/?utm_source=chatgpt.com','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',92,'2026-09-11 12:10:56'),
(4974,22,'2026-09-10','Chef (Extra Reel)',7,'Medium',NULL,'Not Started','Footage Problem','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DV8kd4Qk_qn/?utm_source=chatgpt.com','','Footage Problem','','','Thursday','Content not given proper','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',93,'2026-09-11 12:10:56'),
(4975,3,'2026-09-10','Definition of Happiness',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Swaraj','Ref: https://www.instagram.com/reels/DcjE8p4KHjM/?utm_source=chatgpt.com','','','','','Thursday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',94,'2026-09-11 12:10:56'),
(4976,6,'2026-09-10','Karaoke Night - 15th sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',95,'2026-09-11 12:10:56'),
(4977,2,'2026-09-10','Ladies Night - 16th sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',96,'2026-09-11 12:10:56'),
(4978,2,'2026-09-10','Beer @ 25 - 17th sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',97,'2026-09-11 12:10:56'),
(4979,6,'2026-09-10','Friday Live with Firat',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',98,'2026-09-11 12:10:56'),
(4980,2,'2026-09-10','Happy Hours',14,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Rushikesh','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',99,'2026-09-11 12:10:56'),
(4981,2,'2026-09-10','Weekly Calendar (L= 88cm. W=58cm)',14,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',100,'2026-09-11 12:10:56'),
(4982,6,'2026-09-10','Food Menu',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Changes','Soma','Soma','Suraj','','','','','','Thursday','Done','imp','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',101,'2026-09-11 12:10:56'),
(4983,5,'2026-09-10','STATIC 1',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ripplees','Static','Vidhi','GURU','Sakib','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',102,'2026-09-11 12:10:56'),
(4984,2,'2026-09-10','LIVE MUSIC FLYER',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ripplees','Flyer','Vidhi','GURU','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',103,'2026-09-11 12:10:56'),
(4985,6,'2026-09-10','Lunch combos Carousel -5 Slides',13,'Critical',NULL,'Completed','( 5 Slides )','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','','','Suraj','','','( 5 Slides )','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',104,'2026-09-11 12:10:56'),
(4986,2,'2026-09-10','Lunch combo carousel changes',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',105,'2026-09-11 12:10:56'),
(4987,6,'2026-09-10','Lunch combo food menu',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Menu','Sanika','','Suraj','','','','','','Thursday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',106,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(4988,2,'2026-09-10','lunch combo tent card food change',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',107,'2026-09-11 12:10:56'),
(4989,3,'2026-09-10','Karaoke Night- 14 sept',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Swaraj','','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',108,'2026-09-11 12:10:56'),
(4990,6,'2026-09-10','Loyalty cards',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Static','Sanika','','Suraj','Want it by eod','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',109,'2026-09-11 12:10:56'),
(4991,6,'2026-09-10','Retro Night- 16th sept',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Suraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',110,'2026-09-11 12:10:56'),
(4992,6,'2026-09-10','Carousel 2  ( 5 Slides )',13,'Critical',NULL,'Completed','( 5 Slides )','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Suraj','','','( 5 Slides )','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',111,'2026-09-11 12:10:56'),
(4993,2,'2026-09-10','Audience picture carousel',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','Very urgent','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',112,'2026-09-11 12:10:56'),
(4994,2,'2026-09-10','Food menu baner',11,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Menu','Sanika','','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',113,'2026-09-11 12:10:56'),
(4995,3,'2026-09-10','Muttom rogan josh',7,'Medium',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Video','Sanika','','Swaraj','','','','','','Thursday','WIP','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',114,'2026-09-11 12:10:56'),
(4996,3,'2026-09-10','Bill style static',15,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Motion','Sanika','','Swaraj','','','','','','Thursday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',115,'2026-09-11 12:10:56'),
(4997,5,'2026-09-10','Happily single resizes',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Resizes','Sanika','','Sakib','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',116,'2026-09-11 12:10:56'),
(4998,3,'2026-09-10','1 motion video - static 2',9,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','PENDING','Trisha','vidhi','Swaraj','https://www.instagram.com/p/DcYhYvnExWK/?stkn=Zzh2NHUwYjNtMG92 reference 
explaination static 2  - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',117,'2026-09-11 12:10:56'),
(4999,3,'2026-09-10','carousel video STATIC 3',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Static','Trisha','vidhi','Swaraj','ref - https://www.instagram.com/p/DcLntjzlKu5/?img_index=1
data - https://drive.google.com/drive/folders/1nNCc2uZr6uir5uSuTKpfo4B8b5gyuPNC 
explaination - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',118,'2026-09-11 12:10:56'),
(5000,23,'2026-09-10','reel 1',9,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','PENDING','Trisha','vidhi','Omkar','explaination - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist 
data - https://drive.google.com/drive/folders/1GuK75DSx1EUcgGcZhUmfkmm1yK2EBkyf','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',119,'2026-09-11 12:10:56'),
(5001,23,'2026-09-10','meet the la team',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Video','Trisha','kumkum','Omkar','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',120,'2026-09-11 12:10:56'),
(5002,22,'2026-09-10','Food Making',9,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','PENDING','Trisha','kumkum','Kartik','Data - https://we.tl/t-fhF5a8uHzASgJ31c','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',121,'2026-09-11 12:10:56'),
(5003,2,'2026-09-10','Friday Night',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','Rushikesh','Data - https://drive.google.com/drive/folders/1vVviqcAzyH0z4EuRMen9eeOqSCUsFjG3','','','','','Thursday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',122,'2026-09-11 12:10:56'),
(5004,2,'2026-09-10','THURDAY NIGHT',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',123,'2026-09-11 12:10:56'),
(5005,5,'2026-09-10','1 static',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Static','Trisha','kumkum','Sakib','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',124,'2026-09-11 12:10:56'),
(5006,2,'2026-09-10','1 carousel',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Carousel','Trisha','kumkum','Rushikesh','','','','','','Thursday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',125,'2026-09-11 12:10:56'),
(5007,6,'2026-09-10','Logo design',17,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','NOVA','Logo','Soma','guru','Suraj','','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',126,'2026-09-11 12:10:56'),
(5008,5,'2026-09-10','Static 1',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','Static','Trisha','kumkum','Sakib','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',127,'2026-09-11 12:10:56'),
(5009,15,'2026-09-10','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','Flyer','Trisha','kumkum','surekha','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',128,'2026-09-11 12:10:56'),
(5010,2,'2026-09-10','1 carousel customer',9,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','PENDING','Trisha','kumkum','Rushikesh','','','','','','Thursday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',129,'2026-09-11 12:10:56'),
(5011,2,'2026-09-10','1 story creative  : K VALENTINA 


YOUR STUDY SPOT
SHOULD HAVE A BETTER VIEW.

Assignments.
Deadlines.
Group work.

Good food. Cold drinks.
A rooftop view.

STUDY HERE.
MAKE IT A VIBE.

K VALENTINA DINE & WINE',9,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','PENDING','Trisha','kumkum','Rushikesh','MAKE IT LIKE AN AD POSTER','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',130,'2026-09-11 12:10:56'),
(5012,23,'2026-09-10','FOOD MAKING',7,'Medium',NULL,'Not Started','no ref','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Video','Trisha','kumkum','Omkar','','','no ref','','','Thursday','Content not given proper','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',131,'2026-09-11 12:10:56'),
(5013,22,'2026-09-10','CAPTIONS CHANGES',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Changes','Sushmeet','kumkum','Kartik','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',132,'2026-09-11 12:10:56'),
(5014,5,'2026-09-10','CAROUSEL CHANGES',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Changes','Sushmeet','kumkum','Sakib','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',133,'2026-09-11 12:10:56'),
(5015,5,'2026-09-10','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','gayatri','Flyer','Sushmeet','kumkum','Sakib','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',134,'2026-09-11 12:10:56'),
(5016,5,'2026-09-10','11th Resize',20,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Resizes','Trisha','kumkum','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',135,'2026-09-11 12:10:56'),
(5017,23,'2026-09-10','12th sept promo video',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Video','Trisha','kumkum','Omkar','Data - https://we.tl/t-dVez32vX13ski4si


https://www.instagram.com/reel/DTqnV8IE88o/?stkn=eWpqOGhudm01Mnlx','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',136,'2026-09-11 12:10:56'),
(5018,5,'2026-09-10','12th sept',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',137,'2026-09-11 12:10:56'),
(5019,5,'2026-09-10','12th sept',20,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Resizes','Trisha','kumkum','Sakib','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',138,'2026-09-11 12:10:56'),
(5020,22,'2026-09-10','Shravan reel',10,'Critical',NULL,'Completed','For','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Changes','Trisha','','Kartik','song changes','','For','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',139,'2026-09-11 12:10:56'),
(5021,2,'2026-09-10','1 static',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Static','Trisha','kumkum','Rushikesh','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',140,'2026-09-11 12:10:56'),
(5022,2,'2026-09-10','1 carousel',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Carousel','Trisha','kumkum','Rushikesh','fitness','','','','','Thursday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',141,'2026-09-11 12:10:56'),
(5023,23,'2026-09-10','fitness reel',7,'Medium',NULL,'Not Started','no ref','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Video','Trisha','kumkum','Omkar','fitness','','no ref','','','Thursday','Content not given proper','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',142,'2026-09-11 12:10:56'),
(5024,3,'2026-09-09','Bill style static motion',15,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Motion','Sanika','','Swaraj','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',143,'2026-09-11 12:10:56'),
(5025,3,'2026-09-09','Mutton rogan josh reel - addition',15,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Motion','Sanika','','Swaraj','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',144,'2026-09-11 12:10:56'),
(5026,3,'2026-09-09','Event motion carousel - 01',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',145,'2026-09-11 12:10:56'),
(5027,3,'2026-09-09','Event motion carousel - 02',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',146,'2026-09-11 12:10:56'),
(5028,3,'2026-09-09','Event motion carousel - 03',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',147,'2026-09-11 12:10:56'),
(5029,6,'2026-09-09','Happily Single Flyer',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Suraj','Very Very urgent','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',148,'2026-09-11 12:10:56'),
(5030,6,'2026-09-09','Loyalty cards',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Static','Sanika','','Suraj','Want it by eod','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',149,'2026-09-11 12:10:56'),
(5031,2,'2026-09-09','Menu changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Rushikesh','Want it by eod','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',150,'2026-09-11 12:10:56'),
(5032,2,'2026-09-09','Event carousel 2',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','Ref shared on whatsapp','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',151,'2026-09-11 12:10:56'),
(5033,22,'2026-09-09','Lunch meal video 2 changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Kartik','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',152,'2026-09-11 12:10:56'),
(5034,2,'2026-09-09','PPc Creative',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Rushikesh','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',153,'2026-09-11 12:10:56'),
(5035,17,'2026-09-09','Lunch combo tent card',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Nikita','','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',154,'2026-09-11 12:10:56'),
(5036,6,'2026-09-09','Lunch combo menu card',11,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Menu','Sanika','','Suraj','','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',155,'2026-09-11 12:10:56'),
(5037,5,'2026-09-09','Lunch carousel changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Sakib','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',156,'2026-09-11 12:10:56'),
(5038,4,'2026-09-09','1 video - reel 8',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer and beans','Video','Soma','Guru','Shratayu','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',157,'2026-09-11 12:10:56'),
(5039,22,'2026-09-09','Behind the plate',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer & Beans','Video','Soma','Guru','Kartik','','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',158,'2026-09-11 12:10:56'),
(5040,6,'2026-09-09','Catering services',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Suraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',159,'2026-09-11 12:10:56'),
(5041,2,'2026-09-09','Ganapati Wishing story',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Rushikesh','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',160,'2026-09-11 12:10:56'),
(5042,22,'2026-09-09','Where Are We Eating Tonight?',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DWCAJbXkrD8/?utm_source=chatgpt.com','','','','','Wednesday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',161,'2026-09-11 12:10:56'),
(5043,22,'2026-09-09','Chef (Extra Reel)',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DV8kd4Qk_qn/?utm_source=chatgpt.com','','','','','Wednesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',162,'2026-09-11 12:10:56'),
(5044,23,'2026-09-09','Two blondes',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Omkar','Ref: https://www.instagram.com/reel/DY-n_szxyxP/?igsi=Y3JjZmczZm02Z3Jl','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',163,'2026-09-11 12:10:56'),
(5045,23,'2026-09-09','Remember Who You Really Are',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Omkar','Ref: https://www.instagram.com/reels/DbneK4lN6yc/?utm_source=chatgpt.com','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',164,'2026-09-11 12:10:56'),
(5046,3,'2026-09-09','Those Two Blondes',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Swaraj','Ref: https://www.instagram.com/reels/DZSTBc_Io6G/?utm_source=chatgpt.com','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',165,'2026-09-11 12:10:56'),
(5047,3,'2026-09-09','Definition of Happiness',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Swaraj','Ref: https://www.instagram.com/reels/DcjE8p4KHjM/?utm_source=chatgpt.com','','','','','Wednesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',166,'2026-09-11 12:10:56'),
(5048,2,'2026-09-09','Happy Hours',14,'Medium',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Rushikesh','Shared on Whatsapp','','','','','Wednesday','WIP','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',167,'2026-09-11 12:10:56'),
(5049,6,'2026-09-09','Karaoke Night - 15th sept',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',168,'2026-09-11 12:10:56'),
(5050,2,'2026-09-09','Ladies Night - 16th sept',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',169,'2026-09-11 12:10:56'),
(5051,2,'2026-09-09','Beer @ 25 - 17th sept',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',170,'2026-09-11 12:10:56'),
(5052,6,'2026-09-09','Friday Live with Firat',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',171,'2026-09-11 12:10:56'),
(5053,6,'2026-09-09','Food Menu ( Total 15 Pages )',11,'Critical',NULL,'Completed','15 Pages Menu','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','add decriptions will be provided','','15 Pages Menu','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',172,'2026-09-11 12:10:56'),
(5054,6,'2026-09-09','what is topings',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','kumkum','Suraj','https://www.instagram.com/p/DaQBPp4DLTq/?stkn=eHNmbzZqa2p0amNw','','','','','Wednesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',173,'2026-09-11 12:10:56'),
(5055,5,'2026-09-09','Static post on ambienc, will provide image',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Static','Siddhi','Siddhi','Sakib','https://pin.it/1O0A8PQ08','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',174,'2026-09-11 12:10:56'),
(5056,6,'2026-09-09','BRAND GUIDELINES',27,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','','Suraj','','','','','','Wednesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',175,'2026-09-11 12:10:56'),
(5057,2,'2026-09-09','food static',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','kumkum','Rushikesh','https://pin.it/60ABFwJ9Y','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',176,'2026-09-11 12:10:56'),
(5058,6,'2026-09-09','1 story creative',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','kumkum','Suraj','','','','','','Wednesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',177,'2026-09-11 12:10:56'),
(5059,4,'2026-09-09','Dessert Motion Reel',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Changes','Soma','kumkum','Shratayu','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',178,'2026-09-11 12:10:56'),
(5060,4,'2026-09-09','Food motion ( SNACKS AND MEALS)',21,'High',NULL,'Not Started','First Draft not approved , and this video is part of it','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','kumkum','Shratayu','','','First Draft not approved , and this video is part of it','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',179,'2026-09-11 12:10:56'),
(5061,5,'2026-09-09','1 static',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ripplees','Static','Vidhi','guru','Sakib','','','','','','Wednesday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',180,'2026-09-11 12:10:56'),
(5062,22,'2026-09-09','1 reel tmkoc add tarakh mehta clip',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Changes','Sushmeet','','Kartik','reel changes https://youtu.be/lHXzw6fakPQ?si=0l4rTx8fpwMkAb0W  
explaination - reel 6 - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Wednesday','Done','imp','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',181,'2026-09-11 12:10:56'),
(5063,17,'2026-09-09','Saturday Flyer',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Nikita','','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',182,'2026-09-11 12:10:56'),
(5064,16,'2026-09-09','Sunday Flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sejal','Shared on whatsapp','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',183,'2026-09-11 12:10:56'),
(5065,23,'2026-09-09','1 video reel 8 
data- old drive - elix - 26 august juhi influencer',7,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Video','Sushmeet','vidhi','Omkar','ref - https://www.instagram.com/p/Dbpws7-gKRM/?igsh=MWc3NjBuajFjbzZ1dQ==&igsi=MWc3NjBuajFjbzZ1dQ==
reel 8 - explaination https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',184,'2026-09-11 12:10:56'),
(5066,2,'2026-09-09','carousel changes add text static 16 
copy shared on whtsp',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Changes','Sushmeet','vidhi','Rushikesh','copy shared on whtsp 
explaination static 16 - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.4sicnopvtx0z','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',185,'2026-09-11 12:10:56'),
(5067,5,'2026-09-09','Weekly Event Calendar',12,'Low',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on whatsapp','','','','','Wednesday','NO DATA','low','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',186,'2026-09-11 12:10:56'),
(5068,4,'2026-09-09','Anniversary Reel - Comming Soon',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Changes','Sushmeet','','Shratayu','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',187,'2026-09-11 12:10:56'),
(5069,5,'2026-09-09','Anniversary Carousel',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Carousel','Sushmeet','','Sakib','','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',188,'2026-09-11 12:10:56'),
(5070,17,'2026-09-09','Grid - Just do the bottom 2',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Carousel','Sushmeet','','Nikita','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',189,'2026-09-11 12:10:56'),
(5071,6,'2026-09-09','Artist Flyer - Trio - Sufi Night',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',190,'2026-09-11 12:10:56'),
(5072,3,'2026-09-09','Reel 1',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','Guru','Swaraj','Refer to reel 4: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',191,'2026-09-11 12:10:56'),
(5073,23,'2026-09-09','Reel - NIBM''s Largest Rooftop',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','Guru','Omkar','','','','','','Wednesday','Half done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',192,'2026-09-11 12:10:56'),
(5074,22,'2026-09-09','Artist Reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Kartik','Data - https://drive.google.com/drive/folders/152aH7u4Gw82wQC_JmXbN0tlbqLOGw1OJ','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',193,'2026-09-11 12:10:56'),
(5075,3,'2026-09-09','1 motion video - static 2',15,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Motion','Trisha','vidhi','Swaraj','https://www.instagram.com/p/DcYhYvnExWK/?stkn=Zzh2NHUwYjNtMG92 reference 
explaination static 2  - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',194,'2026-09-11 12:10:56'),
(5076,2,'2026-09-09','1 static',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Static','Trisha','vidhi','Rushikesh','Ref - https://in.pinterest.com/pin/921760248752470765/ 
explaination static 1 - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',195,'2026-09-11 12:10:56'),
(5077,22,'2026-09-09','Food',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Video','Trisha','kumkum','Kartik','Data - https://we.tl/t-Ni5gf8NVt8Zz6jG0','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',196,'2026-09-11 12:10:56'),
(5078,4,'2026-09-09','Guest Review - Thumbnail',23,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Thumbnail','Trisha','kumkum','Shratayu','https://www.instagram.com/reel/DWouzoEDQBW/?stkn=MTI0eWtsYmlibnh5cw==

https://www.instagram.com/reel/Dac-D-2I_nm/?stkn=cXNpamQ5Z3FyMXQw','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',197,'2026-09-11 12:10:56'),
(5079,4,'2026-09-09','Guest Review',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Video','Trisha','kumkum','Shratayu','https://www.instagram.com/reel/DWouzoEDQBW/?stkn=MTI0eWtsYmlibnh5cw==

https://www.instagram.com/reel/Dac-D-2I_nm/?stkn=cXNpamQ5Z3FyMXQw','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',198,'2026-09-11 12:10:56'),
(5080,16,'2026-09-09','1 creative flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Flyer','Trisha','kumkum','Sejal','https://www.instagram.com/reel/DWouzoEDQBW/?stkn=MTI0eWtsYmlibnh5cw==

https://www.instagram.com/reel/Dac-D-2I_nm/?stkn=cXNpamQ5Z3FyMXQw','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',199,'2026-09-11 12:10:56'),
(5081,15,'2026-09-09','STATIC POST',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','surekha','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',200,'2026-09-11 12:10:56'),
(5082,15,'2026-09-09','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','surekha','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',201,'2026-09-11 12:10:56'),
(5083,3,'2026-09-09','Review Reel',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Video','Trisha','kumkum','Swaraj','Data - https://we.tl/t-W17PZ831vdtOQJQe','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',202,'2026-09-11 12:10:56'),
(5084,22,'2026-09-09','Food Making',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Video','Trisha','kumkum','Kartik','Data - https://we.tl/t-fhF5a8uHzASgJ31c','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',203,'2026-09-11 12:10:56'),
(5085,2,'2026-09-09','1 static',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','vfc','Static','Trisha','kumkum','Rushikesh','Data - https://we.tl/t-R6LpyM6ao9wzkoS7','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',204,'2026-09-11 12:10:56'),
(5086,6,'2026-09-09','12th Sept',12,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Suraj','','','','','','Wednesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',205,'2026-09-11 12:10:56'),
(5087,6,'2026-09-09','Guest People',13,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','kumkum','Suraj','https://drive.google.com/drive/folders/1GX57_e6bN0yIRcGzSGlFZc9neyKDKs8s','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',206,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5088,6,'2026-09-09','1 creative',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Suraj','','','','','','Wednesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',207,'2026-09-11 12:10:56'),
(5089,5,'2026-09-09','ftc',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Sakib','Data - https://drive.google.com/drive/folders/12Jb167j1YLYvaQkBelimkXgb7fnyCAFT?usp=sharing','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',209,'2026-09-11 12:10:56'),
(5090,2,'2026-09-09','BRAND GUIDELINES',27,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','BG','Trisha','kumkum','Rushikesh','','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',210,'2026-09-11 12:10:56'),
(5091,5,'2026-09-09','1 static',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Static','Trisha','','Sakib','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',211,'2026-09-11 12:10:56'),
(5092,2,'2026-09-09','1 carousel customer',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Carousel','Trisha','kumkum','Rushikesh','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',212,'2026-09-11 12:10:56'),
(5093,2,'2026-09-09','1 story creative  : K VALENTINA 


YOUR STUDY SPOT
SHOULD HAVE A BETTER VIEW.

Assignments.
Deadlines.
Group work.

Good food. Cold drinks.
A rooftop view.

STUDY HERE.
MAKE IT A VIBE.

K VALENTINA DINE & WINE',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','kumkum','Rushikesh','','','','','','Wednesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',213,'2026-09-11 12:10:56'),
(5094,23,'2026-09-09','video of chef and 2 people',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Video','Trisha','kumkum','Omkar','','','','','','Wednesday','NO DATA','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',214,'2026-09-11 12:10:56'),
(5095,5,'2026-09-09','RAKSHA BANDHAN THUMBNAIL',23,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Thumbnail','Sushmeet','','Sakib','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',215,'2026-09-11 12:10:56'),
(5096,5,'2026-09-09','### SLIDE 1

**ONLINE SE SASTA?**
**CHECK GAYATRI FIRST. 👀**

Because your next appliance
might cost you **less here.**

---

### SLIDE 2

**THAT NEW TV.**
**THAT NEW FRIDGE.**
**THAT APPLIANCE YOU’VE BEEN WAITING FOR.**

Now get it at
**UP TO 60% OFF**

**ONLINE SE SASTA.**

---

### SLIDE 3

**YOUR CARD CAN SAVE YOU MORE.**

Pay by Credit or Debit Card
and get **UP TO 30% DISCOUNT**

**ONE MORE REASON
TO SHOP AT GAYATRI.**

---

### SLIDE 4

**OLD APPLIANCE?
TURN IT INTO SAVINGS.**

Exchange it and get
**UP TO ₹5,000 OFF**

And your new appliance?
**SAME DAY DELIVERY.**

---

### SLIDE 5

**WHY WAIT FOR AN ONLINE DEAL
WHEN YOU CAN GET A BETTER ONE HERE?**

**UP TO 60% OFF**
Electronics & Appliances

**UP TO 30% DISCOUNT**
Credit & Debit Cards

**EXCHANGE UP TO ₹5,000**

**SAME DAY DELIVERY**

### **ONLINE SE SASTA.

only at gayatri',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Carousel','Sushmeet','kumkum','Sakib','','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',216,'2026-09-11 12:10:56'),
(5097,16,'2026-09-09','1 creative story',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Flyer','Sushmeet','kumkum','Sejal','','','','','','Wednesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',217,'2026-09-11 12:10:56'),
(5098,23,'2026-09-09','reel 1',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Video','Trisha','vidhi','Omkar','explaination - https://docs.google.com/document/d/1eqOpAYe6D89pw2xXYH5W4HwiM70L_K-eof7JI003s1k/edit?tab=t.y5r0qabveist 
data - https://drive.google.com/drive/folders/1GuK75DSx1EUcgGcZhUmfkmm1yK2EBkyf','','','','','Wednesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',218,'2026-09-11 12:10:56'),
(5099,3,'2026-09-09','Bill style static motion',15,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Motion','Sanika','','Swaraj','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',219,'2026-09-11 12:10:56'),
(5100,4,'2026-09-09','Comming soon',23,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Thumbnail','Trisha','KumKum','Shratayu','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',220,'2026-09-11 12:10:56'),
(5101,4,'2026-09-09','Outro',19,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Fire fly','Outro','Sushmeet','Guru','Shratayu','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',221,'2026-09-11 12:10:56'),
(5102,4,'2026-09-09','Comming soon',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Fire fly','Video','Sushmeet','Guru','Shratayu','REF: https://in.pinterest.com/pin/957859414506012603/ 
Song: Mundian to bach ke','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',222,'2026-09-11 12:10:56'),
(5103,4,'2026-09-09','Why do you like this place',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer and beans','Video','Soma','','Shratayu','','','','','','Tuesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',223,'2026-09-11 12:10:56'),
(5104,6,'2026-09-09','Food Menu',11,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','add decriptions will be provided','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',224,'2026-09-11 12:10:56'),
(5105,6,'2026-09-09','Corporate Events  ( 10 Slides )',13,'Critical',NULL,'Completed','( 10 Slides )','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Carousel','Soma','Soma','Suraj','Data & Reference were already shared on whatsapp on 4th sept.','','( 10 Slides )','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',225,'2026-09-11 12:10:56'),
(5106,27,'2026-09-09','Karaoke Night (SMS & Swiggy size only)',20,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','SOMA','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',226,'2026-09-11 12:10:56'),
(5107,27,'2026-09-09','Ladies Night (Zomato,swiggy,sms)',20,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','SOMA','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',227,'2026-09-11 12:10:56'),
(5108,2,'2026-09-09','Beer @ 25 (Zomato,swiggy,sms)',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',228,'2026-09-11 12:10:56'),
(5109,27,'2026-09-09','Friday Sabali (Zomato,swiggy,sms)',20,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','SOMA','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',229,'2026-09-11 12:10:56'),
(5110,2,'2026-09-09','House of desi (Zomato,swiggy,sms)',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',230,'2026-09-11 12:10:56'),
(5111,2,'2026-09-09','Sunday Brunch (Zomato,swiggy,sms)',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',231,'2026-09-11 12:10:56'),
(5112,27,'2026-09-09','Jam session (Zomato,swiggy,sms)',20,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','Soma','SOMA','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',232,'2026-09-11 12:10:56'),
(5113,2,'2026-09-09','Happy Hours Standee',14,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Rushikesh','You already have the data, need to redesign.','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',233,'2026-09-11 12:10:56'),
(5114,6,'2026-09-09','Happy Hours table template',14,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Suraj','Shared on whatsapp','','','','','Tuesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',234,'2026-09-11 12:10:56'),
(5115,4,'2026-09-09','SABALI REEL ADD oN''s',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Changes','Soma','Soma','Shratayu','Add ons : https://drive.google.com/drive/folders/1VOBvHLMqyJritBrjxexr2sl2qIbsDt6O?usp=sharing','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',235,'2026-09-11 12:10:56'),
(5116,22,'2026-09-09','A Glipmse of our menu',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reels/DOyKW-ECGoo/ 
Data: https://drive.google.com/drive/folders/1piI7seprfPVuf-bXJKcbH5Yi0IfL02a6?usp=drive_link','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',236,'2026-09-11 12:10:56'),
(5117,23,'2026-09-09','What makes B&B different?',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer & Beans','Video','Soma','Guru','Omkar','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',237,'2026-09-11 12:10:56'),
(5118,22,'2026-09-09','What''s for lunch?',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer & Beans','Video','Soma','Guru','Kartik','Ref: https://www.instagram.com/reel/DcVK-wQRyYP/?igsi=eXIzNTdibzU3MHFr','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',238,'2026-09-11 12:10:56'),
(5119,3,'2026-09-09','Rebranding',7,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Club 020','Video','Soma','Guru','Swaraj','shared on whatsapp by guru','','','','','Tuesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',239,'2026-09-11 12:10:56'),
(5120,5,'2026-09-09','Event creative',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Grains and grills','Static','Sanika','Guru','Sakib','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',240,'2026-09-11 12:10:56'),
(5121,6,'2026-09-09','Loyalty Cards',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Static','Sanika','','Suraj','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',241,'2026-09-11 12:10:56'),
(5122,6,'2026-09-09','Happily Divorced- 12th sept- 8pm onw',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Suraj','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',242,'2026-09-11 12:10:56'),
(5123,3,'2026-09-09','Happily divorced carousel',15,'High',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Motion','Sanika','','Swaraj','','','','','','Tuesday','WIP','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',243,'2026-09-11 12:10:56'),
(5124,6,'2026-09-09','Carousel 2 ( 6 Slides )',13,'High',NULL,'Completed','( 6 Slides )','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Suraj','','','( 6 Slides )','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',244,'2026-09-11 12:10:56'),
(5125,2,'2026-09-09','Food Menu changes',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Rushikesh','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',245,'2026-09-11 12:10:56'),
(5126,6,'2026-09-09','Lunch combo food carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Suraj','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',246,'2026-09-11 12:10:56'),
(5127,2,'2026-09-09','Event carousel',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',247,'2026-09-11 12:10:56'),
(5128,2,'2026-09-09','Ppc Static',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Rushikesh','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',248,'2026-09-11 12:10:56'),
(5129,6,'2026-09-09','Lunch combo tent card',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Suraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',249,'2026-09-11 12:10:56'),
(5130,6,'2026-09-09','Lunch combio menu',11,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Menu','Sanika','','Suraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',250,'2026-09-11 12:10:56'),
(5131,23,'2026-09-09','Reel 2',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Omkar','Refer to Reel 2: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0#heading=h.9nyehnbrhq2n','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',251,'2026-09-11 12:10:56'),
(5132,3,'2026-09-09','Reel  changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Swaraj','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',252,'2026-09-11 12:10:56'),
(5133,3,'2026-09-09','Reel 1',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Swaraj','Beer Reel','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',253,'2026-09-11 12:10:56'),
(5134,5,'2026-09-09','REEL THUMBNAIL',23,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Thumbnail','Trisha','','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',254,'2026-09-11 12:10:56'),
(5135,2,'2026-09-09','BRAND GUIDELINES',27,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','BG','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',255,'2026-09-11 12:10:56'),
(5136,2,'2026-09-09','K VALENTINA 


YOUR STUDY SPOT
SHOULD HAVE A BETTER VIEW.

Assignments.
Deadlines.
Group work.

Good food. Cold drinks.
A rooftop view.

STUDY HERE.
MAKE IT A VIBE.

K VALENTINA DINE & WINE',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Flyer','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',256,'2026-09-11 12:10:56'),
(5137,3,'2026-09-09','video - ambience reel',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Video','Trisha','kumkum','Swaraj','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',257,'2026-09-11 12:10:56'),
(5138,5,'2026-09-08','Changes in food and drink carousel',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Carousel','Siddhi','Siddhi','Sakib','https://drive.google.com/drive/folders/1aDpiZHTslFKyRfZ1D7WRLLHXfBZ_ibVn?usp=sharing','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',258,'2026-09-11 12:10:56'),
(5139,2,'2026-09-08','1 Carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Carousel','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',259,'2026-09-11 12:10:56'),
(5140,5,'2026-09-08','K VALENTINA static


THE BEST VIEWS FEEL BETTER FROM UP HERE

K VALENTINA
YOUR TABLE IS WAITING',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Static','Trisha','kumkum','Sakib','https://www.instagram.com/p/DaX5D6aBl83/?stkn=emZnazgwaWlwcWpv','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',260,'2026-09-11 12:10:56'),
(5141,5,'2026-09-08','1 Flyer MADE TO BE SAVOURED

Beautiful plates
Unforgettable evenings

K VALENTINA
YOUR TABLE AWAITS',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Flyer','Trisha','kumkum','Sakib','https://www.instagram.com/p/DUQvUIDCXEV/?stkn=MTlrMjR3d2p5MDd0cA==','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',261,'2026-09-11 12:10:56'),
(5142,3,'2026-09-08','CHIMBORI CLOCK IT REEL',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Video','Trisha','kumkum','Swaraj','https://www.instagram.com/reel/DZFZsyWMfbO/?stkn=NzM5NTZwM21jNXNv','','','','','Tuesday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',262,'2026-09-11 12:10:56'),
(5143,5,'2026-09-08','Chimbori flyer

TONIGHT’S SEAFOOD MOOD? 👀

🔥 Straight from the grill
🦐 Dive into the boil

CHOOSE YOUR CRAVING
CHIMBORI',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','kumkum','Sakib','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',263,'2026-09-11 12:10:56'),
(5144,2,'2026-09-08','location static',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Static','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',264,'2026-09-11 12:10:56'),
(5145,3,'2026-09-08','Story video',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','kumkum','Swaraj','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',265,'2026-09-11 12:10:56'),
(5146,2,'2026-09-08','1 carousel CRAB A DAY',13,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Carousel','Trisha','kumkum','Rushikesh','','','','','','Tuesday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',266,'2026-09-11 12:10:56'),
(5147,22,'2026-09-08','REDUCE THE DURATION OF GRILLED VIDWO',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Changes','Trisha','','Kartik','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',267,'2026-09-11 12:10:56'),
(5148,5,'2026-09-08','ADD ON TASK OF BOLLYWOOD NIGHT',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Sushmeet','kumkum','Sakib','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',269,'2026-09-11 12:10:56'),
(5149,3,'2026-09-08','Gayatri flyer

YOUR NEXT HOME UPGRADE? 👀

POLL:
🛒 I’M READY
💸 WAITING FOR A DEAL',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Flyer','Sushmeet','kumkum','Swaraj','','','','','','Tuesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',270,'2026-09-11 12:10:56'),
(5150,22,'2026-09-08','hindi influencer reel',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Video','Sushmeet','kumkum','Kartik','https://drive.google.com/drive/folders/1iRT6HTAtqAx4f2UCXdupjvYVzQnwOK6X


https://docs.google.com/document/d/17HfuM-0i_ba3lsLufKJyi6NzGNT6k9-JRiGWy1-oPa4/edit?tab=t.0','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',271,'2026-09-11 12:10:56'),
(5151,3,'2026-09-08','video thumbnail',23,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Thumbnail','Sushmeet','kumkum','Swaraj','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',272,'2026-09-11 12:10:56'),
(5152,5,'2026-09-08','change copy',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Changes','Sushmeet','kumkum','Sakib','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',273,'2026-09-11 12:10:56'),
(5153,6,'2026-09-08','BRAND GUIDELINES',27,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','kumkum','Suraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',274,'2026-09-11 12:10:56'),
(5154,2,'2026-09-08','vfc static 

PLANTS NEVER
LOOKED THIS CRAVEABLE.

VFC — VEGAN FOOD COURT',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','kumkum','Rushikesh','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',275,'2026-09-11 12:10:56'),
(5155,2,'2026-09-08','Vfc flyer
YOUR FRIEND SAID VEGAN FOOD IS BORING. 👀

POLL:
THAT’S A BOLD CLAIM
LET’S TEST IT 🌱

CTA:
TRY VFC. PROVE THEM WRONG.',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','kumkum','Rushikesh','','','','','','Tuesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',276,'2026-09-11 12:10:56'),
(5156,4,'2026-09-08','MENU DESERT DISPLAY REEL',21,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','kumkum','Shratayu','https://www.instagram.com/reels/DXZU8ISjLpc/','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',277,'2026-09-11 12:10:56'),
(5157,2,'2026-09-08','Thumbnail',23,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Thumbnail','Soma','kumkum','Rushikesh','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',278,'2026-09-11 12:10:56'),
(5158,2,'2026-09-08','Thumbnail',23,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Thumbnail','Soma','kumkum','Rushikesh','','','','','','Tuesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',279,'2026-09-11 12:10:56'),
(5159,5,'2026-09-08','10th event',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','','Sakib','','','','','','Tuesday','content not given by client','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',280,'2026-09-11 12:10:56'),
(5160,23,'2026-09-08','VIBE AT BARRELS',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Video','Trisha','kumkum','Omkar','https://www.instagram.com/reels/DXZU8ISjLpc/','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',281,'2026-09-11 12:10:56'),
(5161,5,'2026-09-08','TTMM',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',282,'2026-09-11 12:10:56'),
(5162,6,'2026-09-08','TTMM  one more design',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','barrels','Flyer','Trisha','kumkum','Suraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',283,'2026-09-11 12:10:56'),
(5163,2,'2026-09-08','crowd carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','barrels','Carousel','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',284,'2026-09-11 12:10:56'),
(5164,5,'2026-09-08','barreels flyer 
WHERE THE NIGHT HITS DIFFERENT. 🍻

POLL:
I’M COMING
ALREADY HERE',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','barrels','Flyer','Trisha','kumkum','Sakib','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',285,'2026-09-11 12:10:56'),
(5165,3,'2026-09-08','CHANGES',22,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Motion Carousel','Trisha','','Swaraj','','','','','','Tuesday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',286,'2026-09-11 12:10:56'),
(5166,23,'2026-09-08','meet the team',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Video','Trisha','kumkum','Omkar','','','','','','Tuesday','Half done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',287,'2026-09-11 12:10:56'),
(5167,2,'2026-09-08','09. CAROUSEL 3 — What If Life Crises Had Solutions?
Role: Relatable life problems turned into humorous food/drink solutions.

Slide 1 — Hook
WHAT IF LIFE CRISES HAD SOLUTIONS?
Swipe to know →

Slide 2 — Office Stress
1. OFFICE STRESS
Solution: Butter Chicken.
Because your boss can''t bother you while you''re eating.



Slide 3 — Love Life Issues
2. LOVE LIFE ISSUES
Solution: A good drink.
At least this one knows how to keep you company.


Slide 4 — Friends Cancelled
3. FRIENDS CANCELLED
Solution: Order the whole thing.
More for you. Problem solved.


Slide 5 — Everything Else
4. EVERYTHING ELSE
Solution: La Belle.
Some problems deserve a better setting.',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Carousel','Trisha','kumkum','Rushikesh','https://www.instagram.com/p/DcV9bJFArw5/?utm_source=ig_web_button_share_sheet','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',288,'2026-09-11 12:10:56'),
(5168,5,'2026-09-08','1 static  SOMETIMES THE BEST PART
OF THE WEEK LOOKS EXACTLY LIKE THIS

LA BELLE',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Static','Trisha','kumkum','Sakib','https://www.instagram.com/p/DSaCwXRE5qv/?stkn=ZWZ2Y3I2a2Qyb3Nr','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',289,'2026-09-11 12:10:56'),
(5169,2,'2026-09-08','La belle story flyer
THE CITY LOOKS DIFFERENT
FROM UP HERE.

Come for the view
Stay for the vibe

LA BELLE',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','Rushikesh','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',290,'2026-09-11 12:10:56'),
(5170,5,'2026-09-08','1 static',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ripplees','Static','Vidhi','guru','Sakib','','','','','','Tuesday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',291,'2026-09-11 12:10:56'),
(5171,7,'2026-09-08','1 video',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Video','Sushmeet','vidhi','Vivek','ref - https://www.instagram.com/p/DYF1cQey68s/','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',292,'2026-09-11 12:10:56'),
(5172,2,'2026-09-08','static 1 thecha paratha',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Static','Trisha','vidhi','Rushikesh','Ref - https://www.instagram.com/p/DVicoSzDF7B/?igsh=MThsNHBoanF4ZW9zag==&igsi=MThsNHBoanF4ZW9zag== 
DATA -','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',293,'2026-09-11 12:10:56'),
(5173,6,'2026-09-08','Font and color theory',27,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','BG','Sushmeet','','Suraj','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',294,'2026-09-11 12:10:56'),
(5174,2,'2026-09-08','Ambiance',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Carousel','Sushmeet','vidhi','Rushikesh','Ref - https://www.instagram.com/p/DVicoSzDF7B/?igsh=MThsNHBoanF4ZW9zag==&igsi=MThsNHBoanF4ZW9zag== 
DATA - https://drive.google.com/drive/folders/1fvHqorRjzykqxGOuj2ibKnJwlFBLB8EP','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',295,'2026-09-11 12:10:56'),
(5175,23,'2026-09-08','explain what elix have reel 8',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Video','Sushmeet','vidhi','Omkar','ref - https://www.instagram.com/p/Dbpws7-gKRM/?igsh=MWc3NjBuajFjbzZ1dQ==&igsi=MWc3NjBuajFjbzZ1dQ==  
data - 
explaination - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Tuesday','NO DATA','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',296,'2026-09-11 12:10:56'),
(5176,22,'2026-09-08','couple reel changes',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Changes','Sushmeet','vidhi','Kartik','show 60 percent off','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',297,'2026-09-11 12:10:56'),
(5177,3,'2026-09-07','Concept reel 2',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Video','Sanika','','Swaraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',299,'2026-09-11 12:10:56'),
(5178,6,'2026-09-07','Carousel 2',13,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Suraj','','','','','','Monday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',300,'2026-09-11 12:10:56'),
(5179,5,'2026-09-07','Retro night',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Sakib','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',301,'2026-09-11 12:10:56'),
(5180,2,'2026-09-07','Food Menu changes',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Rushikesh','','','','','','Monday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',302,'2026-09-11 12:10:56'),
(5181,2,'2026-09-07','Carousel 3',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Carousel','Sanika','','Rushikesh','','','','','','Monday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',303,'2026-09-11 12:10:56'),
(5182,6,'2026-09-07','Royalty Card',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Static','Sanika','','Suraj','','','','','','Monday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',304,'2026-09-11 12:10:56'),
(5183,3,'2026-09-07','Mutton Rogan Josh Reel',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Video','Sanika','','Swaraj','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',305,'2026-09-11 12:10:56'),
(5184,5,'2026-09-07','Retro night',20,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Resizes','Sanika','','Sakib','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',306,'2026-09-11 12:10:56'),
(5185,2,'2026-09-07','Banner Change',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',307,'2026-09-11 12:10:56'),
(5186,2,'2026-09-07','Event Carousel 1',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','','','','','','Monday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',308,'2026-09-11 12:10:56'),
(5187,6,'2026-09-07','Food carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','Given','Suraj','','','','','','Monday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',309,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5188,22,'2026-09-07','Lunh meal Video - Add text',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Kartik','Ref:','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',310,'2026-09-11 12:10:56'),
(5189,2,'2026-09-07','crab a day keeps a doctor away',NULL,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','','','','','Rushikesh','','','','','','cgimbori','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',311,'2026-09-11 12:10:56'),
(5190,13,'2026-09-07','5 slide carousel',NULL,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','','','','','Unassigned','','','','','','gayatri','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',312,'2026-09-11 12:10:56'),
(5191,2,'2026-09-07','PPc Creative',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',313,'2026-09-11 12:10:56'),
(5192,5,'2026-09-07','4 drinks and 4 food ite4ms carousel, background wooden table',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Carousel','Siddhi','Siddhi','Sakib','https://drive.google.com/drive/folders/1aDpiZHTslFKyRfZ1D7WRLLHXfBZ_ibVn?usp=sharing','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',314,'2026-09-11 12:10:56'),
(5193,24,'2026-09-07','changes in creative , make food bright and in good quality food texture shouldbe improved 
copy - Donnar Murg write name on 1st slide',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Changes','Sushmeet','vidhi','vidhi','ref - https://www.instagram.com/p/Db5xZQojsJt/?igsh=djBmcnBqZnVreGp3   
data - https://drive.google.com/drive/folders/1Gv7KNrBJeNUc16nTkf150-RPHXrlCIWy','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',315,'2026-09-11 12:10:56'),
(5194,5,'2026-09-07','Friday Flyer',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on Whatsapp','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',316,'2026-09-11 12:10:56'),
(5195,23,'2026-09-07','Reel 3',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Omkar','Refer to reel 12: https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',317,'2026-09-11 12:10:56'),
(5196,3,'2026-09-07','Reel',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Swaraj','','','','','','Monday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',318,'2026-09-11 12:10:56'),
(5197,6,'2026-09-07','Artist Flyer - Trio - Sufi Night',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Monday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',319,'2026-09-11 12:10:56'),
(5198,6,'2026-09-07','Food Menu',11,'Critical',NULL,'In Progress','5 Pages Done','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','Need this today before 5pm','','5 Pages Done','','','Monday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',320,'2026-09-11 12:10:56'),
(5199,6,'2026-09-07','Corporate Events',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Carousel','Soma','Soma','Suraj','Data & Reference were already shared on whatsapp on 4th sept.','','','','','Monday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',321,'2026-09-11 12:10:56'),
(5200,2,'2026-09-07','Friday Live with Sabali',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',322,'2026-09-11 12:10:56'),
(5201,2,'2026-09-07','Sunday Brunch',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',323,'2026-09-11 12:10:56'),
(5202,6,'2026-09-07','Jam Session - with small world',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',324,'2026-09-11 12:10:56'),
(5203,6,'2026-09-07','Beer @25',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','','Suraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',325,'2026-09-11 12:10:56'),
(5204,6,'2026-09-07','Karaoke Night - Jimmy',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','','Suraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',326,'2026-09-11 12:10:56'),
(5205,4,'2026-09-07','Sabali Reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Video','Soma','','Shratayu','Data: https://drive.google.com/drive/folders/1pleNL9BblSw8gEOZxWoMkNSZRoThFSXH?usp=sharing','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',327,'2026-09-11 12:10:56'),
(5206,6,'2026-09-07','Lunch combo tent card design',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Suraj','','','','','','Monday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',328,'2026-09-11 12:10:56'),
(5207,6,'2026-09-07','Lunch combo menu card design ( LUNCH WITH SUKOON )',11,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Menu','Sanika','','Suraj','','','','','','Monday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',329,'2026-09-11 12:10:56'),
(5208,22,'2026-09-05','1 reel 
font -  Playfair Display Bold',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Video','Trisha','','Kartik','https://www.instagram.com/reel/Dbq02HJN-IP/?igsh=ZG9haHVnZjc3bTVu  
https://drive.google.com/drive/folders/14MZw-YldYsO0Hu30uWO0ZOAnbHlbdD2N?usp=sharing   
https://drive.google.com/drive/folders/1hxjy1HlpMOC7eUAyf7Elzb3GDAcvHf8b','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',330,'2026-09-11 12:10:56'),
(5209,3,'2026-09-07','Thumbnail - Marati reel',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Gayatri','Flyer','Sushmeet','','Swaraj','Highlight the offer -','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',331,'2026-09-11 12:10:56'),
(5210,22,'2026-09-07','Reel',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Changes','Sushmeet','','Kartik','Have to change the 1st dialogue','','','','','Monday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',332,'2026-09-11 12:10:56'),
(5211,22,'2026-09-07','A Glipmse of our menu',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Kartik','Ref: https://www.instagram.com/reels/DOyKW-ECGoo/ 
Data: https://drive.google.com/drive/folders/1piI7seprfPVuf-bXJKcbH5Yi0IfL02a6?usp=drive_link','','','','','Monday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',333,'2026-09-11 12:10:56'),
(5212,23,'2026-09-07','Location (colour grade)',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','Guru','Omkar','Ref:https://www.instagram.com/reel/DZuU2eMggta/utm_source=ig_web_copy_link&stkn=NTc4MTIwNjQ2YQ== 
Data: https://drive.google.com/drive/folders/1Jp3Zt_SHzUJoJFicMFlfuKWHt1BJe5aM?usp=drive_link','','','','','Monday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',334,'2026-09-11 12:10:56'),
(5213,4,'2026-09-07','deserts ADD ON',21,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','kumkum','Shratayu','','','','','','Monday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',335,'2026-09-11 12:10:56'),
(5214,6,'2026-09-07','BRAND GUIDELINES',27,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','kumkum','Suraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',336,'2026-09-11 12:10:56'),
(5215,3,'2026-09-07','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','kumkum','Swaraj','','','','','','Monday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',337,'2026-09-11 12:10:56'),
(5216,5,'2026-09-07','1 carousel',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','kumkum','Sakib','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',338,'2026-09-11 12:10:56'),
(5217,22,'2026-09-07','1 reel       PART 2',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','kumkum','Kartik','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',339,'2026-09-11 12:10:56'),
(5218,4,'2026-09-07','OUTRO reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','kumkum','Shratayu','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',340,'2026-09-11 12:10:56'),
(5219,5,'2026-09-07','1 carousel : SLIDE 1
WE DON''T ASK:

“What can we sell you?”

SLIDE 2
WE ASK:

“What does your home need?”

That''s the difference.

Gayatri Electronics
Wakad | Sinhagad Road',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Carousel','Sushmeet','kumkum','Sakib','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',341,'2026-09-11 12:10:56'),
(5220,5,'2026-09-07','1 static',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Static','Sushmeet','kumkum','Sakib','','','','','','Monday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',342,'2026-09-11 12:10:56'),
(5221,22,'2026-09-07','VIDEO NEEDS TO BE SHORTEN',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Video','Trisha','kumkum','Kartik','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',343,'2026-09-11 12:10:56'),
(5222,4,'2026-09-07','Reel https://www.instagram.com/reels/DbkgrwnBe-T/',7,'Medium',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Video','Sushmeet','kumkum','Shratayu','Refer to Reel 3: https://docs.google.com/document/d/17HfuM-0i_ba3lsLufKJyi6NzGNT6k9-JRiGWy1-oPa4/edit?tab=t.0','','','','','Monday','WIP','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',344,'2026-09-11 12:10:56'),
(5223,5,'2026-09-07','1 static',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Static','Trisha','kumkum','Sakib','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',345,'2026-09-11 12:10:56'),
(5224,3,'2026-09-07','video carousels - check the names',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Changes','Trisha','kumkum','Swaraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',346,'2026-09-11 12:10:56'),
(5225,2,'2026-09-07','ADD ON Kingfisher Draught beer @99/-',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Flyer','Trisha','kumkum','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',347,'2026-09-11 12:10:56'),
(5226,2,'2026-09-07','ADD ON VISITING CARD',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Static','Trisha','kumkum','Rushikesh','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',348,'2026-09-11 12:10:56'),
(5227,23,'2026-09-07','1 reel pastaaaaa',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Video','Trisha','kumkum','Omkar','https://drive.google.com/drive/folders/1QYd8LT63eVIdNNVUhXZDnWwsetSTPVKk?usp=drive_link','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',349,'2026-09-11 12:10:56'),
(5228,2,'2026-09-07','Static 1 — Location
Hinjewadi has enough places to go.
You just need one worth staying at.
LA BELLE',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La belle','Static','Trisha','kumkum','Rushikesh','','','','','','Monday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',350,'2026-09-11 12:10:56'),
(5229,2,'2026-09-07','BRAND GUIDELINES',27,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','BG','Trisha','kumkum','Rushikesh','','','','','','Monday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',351,'2026-09-11 12:10:56'),
(5230,5,'2026-09-07','MENU RECHECK PAGES',11,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Menu','Trisha','kumkum','Sakib','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',352,'2026-09-11 12:10:56'),
(5231,23,'2026-09-07','1 reel',7,'Medium',NULL,'Not Started','no proper data','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Video','Trisha','kumkum','Omkar','https://drive.google.com/drive/folders/148IDiJDsDO9zq6_yCgGB-htNbQFJFVNC?usp=drive_link','','no proper data','','','Monday','Content not given proper','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',353,'2026-09-11 12:10:56'),
(5232,5,'2026-09-07','1 static',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Static','Trisha','kumkum','Sakib','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',354,'2026-09-11 12:10:56'),
(5233,6,'2026-09-07','TTMM',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Suraj','','','','','','Monday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',355,'2026-09-11 12:10:56'),
(5234,6,'2026-09-07','10th sept flyer',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Suraj','','','','','','Monday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',356,'2026-09-11 12:10:56'),
(5235,3,'2026-09-07','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','kumkum','Swaraj','','','','','','Monday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',357,'2026-09-11 12:10:56'),
(5236,2,'2026-09-07','guest carousel',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','kumkum','Rushikesh','','','','','','Monday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',358,'2026-09-11 12:10:56'),
(5237,2,'2026-09-07','guest carousel',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','kumkum','Rushikesh','','','','','','Monday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',359,'2026-09-11 12:10:56'),
(5238,3,'2026-09-05','Concept reel new',7,'High',NULL,'In Progress','30% done','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Video','Sanika','','Swaraj','3','','30% done','','','Saturday','WIP','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',360,'2026-09-11 12:10:56'),
(5239,3,'2026-09-05','Concept reel changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Swaraj','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',361,'2026-09-11 12:10:56'),
(5240,6,'2026-09-05','Carousel 1 changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Suraj','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',362,'2026-09-11 12:10:56'),
(5241,6,'2026-09-05','Carousel 2',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Carousel','Sanika','','Suraj','Given on whaatsapp','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',363,'2026-09-11 12:10:56'),
(5242,6,'2026-09-05','Barcode',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Static','Sanika','','Suraj','Given on whaatsapp','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',364,'2026-09-11 12:10:56'),
(5243,5,'2026-09-05','Retro night',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','Sanika','','Sakib','Wait for Confirmation','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',365,'2026-09-11 12:10:56'),
(5244,3,'2026-09-05','Chill skill flyer change',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Swaraj','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',366,'2026-09-11 12:10:56'),
(5245,2,'2026-09-05','Cd post',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Static','Sanika','','Rushikesh','','','','','','Saturday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',367,'2026-09-11 12:10:56'),
(5246,26,'2026-09-05','Menu changes',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Suraj, Rushikesh','','','','','','Saturday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',368,'2026-09-11 12:10:56'),
(5247,2,'2026-09-05','Offer creative ADD ON',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Flyer','Sanika','','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',369,'2026-09-11 12:10:56'),
(5248,2,'2026-09-05','Event carousel',13,'High',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','','','','','','Saturday','WIP','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',370,'2026-09-11 12:10:56'),
(5249,5,'2026-09-05','Sizzling sundays- REDO',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Sakib','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',371,'2026-09-11 12:10:56'),
(5250,5,'2026-09-05','Static',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Static','Sanika','','Sakib','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',372,'2026-09-11 12:10:56'),
(5251,6,'2026-09-05','PPC Creative',8,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Suraj','','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',373,'2026-09-11 12:10:56'),
(5252,22,'2026-09-05','lunch meal video changes',10,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Kartik','','','','','','Saturday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',374,'2026-09-11 12:10:56'),
(5253,6,'2026-09-05','Food carousel lunch combo',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Suraj','Given on whatsapp','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',375,'2026-09-11 12:10:56'),
(5254,2,'2026-09-05','Ladies Night (Free cocktails and shots for ladies)',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',376,'2026-09-11 12:10:56'),
(5255,2,'2026-09-05','Sunday Brunch',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',377,'2026-09-11 12:10:56'),
(5256,6,'2026-09-05','Corporate Events',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Carousel','Soma','Soma','Suraj','','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',378,'2026-09-11 12:10:56'),
(5257,6,'2026-09-05','Weekly Calender Changes',8,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Static','Soma','Soma','Suraj','Need New Design','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',379,'2026-09-11 12:10:56'),
(5258,2,'2026-09-05','Jam Session - with small world',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',380,'2026-09-11 12:10:56'),
(5259,5,'2026-09-05','Thursday Flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','','','','','','Saturday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',381,'2026-09-11 12:10:56'),
(5260,2,'2026-09-05','Thumbnail',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Gayatri','Flyer','Sushmeet','kumkum','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',382,'2026-09-11 12:10:56'),
(5261,5,'2026-09-05','Wednesday Flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',383,'2026-09-11 12:10:56'),
(5262,3,'2026-09-05','Reel 1',7,'Critical',NULL,'Completed','Problem in shoot','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Swaraj','https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0','','Problem in shoot','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',384,'2026-09-11 12:10:56'),
(5263,2,'2026-09-05','Weekly Event Calendar',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','Kumkum','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',385,'2026-09-11 12:10:56'),
(5264,23,'2026-09-05','1 ambiance video - swiggy size client need on urgent basis 
data is in old drive',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Video','Sushmeet','','Omkar','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',386,'2026-09-11 12:10:56'),
(5265,22,'2026-09-05','Reel 7 couple  
navigation - Data is in old drive - elix - 26th august - video - couple reel',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Video','Sushmeet','vidhi','Kartik','EXPLAINATION - Reel 7  https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Saturday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',387,'2026-09-11 12:10:56'),
(5266,22,'2026-09-05','Changes in old reel',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Static','Siddhi','Siddhi','Kartik','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',388,'2026-09-11 12:10:56'),
(5267,23,'2026-09-05','Event flow reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer and beans','Video','Soma','Guru','Omkar','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',389,'2026-09-11 12:10:56'),
(5268,3,'2026-09-05','Testimonial reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer and Beans','Video','Soma','Guru','Swaraj','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',390,'2026-09-11 12:10:56'),
(5269,22,'2026-09-05','1 reel 
font -  Playfair Display Bold',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Video','Trisha','','Kartik','https://www.instagram.com/reel/Dbq02HJN-IP/?igsh=ZG9haHVnZjc3bTVu  
https://drive.google.com/drive/folders/14MZw-YldYsO0Hu30uWO0ZOAnbHlbdD2N?usp=sharing   
https://drive.google.com/drive/folders/1hxjy1HlpMOC7eUAyf7Elzb3GDAcvHf8b','','','','','Saturday','Data is in process','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',391,'2026-09-11 12:10:56'),
(5270,6,'2026-09-05','26TH SEPT - LIVE MUSIC',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Flyer','Trisha','vidhi','Suraj','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',392,'2026-09-11 12:10:56'),
(5271,2,'2026-09-05','19TH SEPT - LIVE MUSIC',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Flyer','Trisha','vidhi','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',393,'2026-09-11 12:10:56'),
(5272,2,'2026-09-05','GRILLED FOOD',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Static','Trisha','','Rushikesh','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',394,'2026-09-11 12:10:56'),
(5273,6,'2026-09-05','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','KUMKUM','Suraj','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',395,'2026-09-11 12:10:56'),
(5274,5,'2026-09-05','1 creative',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Static','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',396,'2026-09-11 12:10:56'),
(5275,22,'2026-09-05','1 reel ( GRILLING )',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Video','Trisha','KUMKUM','Kartik','CHIMBORI GRILLING PRAWNS AND CHIKEN','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',397,'2026-09-11 12:10:56'),
(5276,2,'2026-09-05','flyer changes',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Changes','Trisha','KUMKUM','Rushikesh','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',398,'2026-09-11 12:10:56'),
(5277,5,'2026-09-05','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Flyer','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',399,'2026-09-11 12:10:56'),
(5278,23,'2026-09-05','1 reel  meet the la bella team',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Video','Trisha','KUMKUM','Omkar','https://www.instagram.com/reels/Daa-KTkFdNm/','','','','','Saturday','Half done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',400,'2026-09-11 12:10:56'),
(5279,6,'2026-09-05','CAROUSEL 1 — What Are The Plans This Week?
Role: A short, relatable friends'' chat aimed at the young working audience.

Slide 1 — Property
A: “Plans this week?”
B: “Same old?”
A: “Absolutely not.”
Slide 2 — Drinks + Food
B: “So?”
A: “Drinks. Food. Good company.”
Slide 3 — People + Ambience
B: “And the vibe?”
A: “Non-negotiable.”
Slide 4 — La Belle
B: “Where?”
A: “La Belle.”
End: “This week''s plan > last week''s plan.”',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Carousel','Trisha','KUMKUM','Suraj','https://www.instagram.com/p/DcqYYriMw_u/?utm_source=ig_web_button_share_sheet','','','','','Saturday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',401,'2026-09-11 12:10:56'),
(5280,2,'2026-09-05','ADD ON TASK',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Static','Trisha','KUMKUM','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',402,'2026-09-11 12:10:56'),
(5281,5,'2026-09-05','menu printable file',11,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','Menu','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',403,'2026-09-11 12:10:56'),
(5282,2,'2026-09-05','1 creative',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','Flyer','Trisha','KUMKUM','Rushikesh','','','','','','Saturday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',404,'2026-09-11 12:10:56'),
(5283,5,'2026-09-05','1 carousel',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','Carousel','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',405,'2026-09-11 12:10:56'),
(5284,6,'2026-09-05','BRAND GUIDELINES',27,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','k valentina','BG','Trisha','KUMKUM','Suraj','','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',406,'2026-09-11 12:10:56'),
(5285,6,'2026-09-05','YOUR STUDY SPOT
SHOULD HAVE A BETTER VIEW.

Assignments.
Deadlines.
Group work.

Good food. Cold drinks.
A rooftop view.

STUDY HERE.
MAKE IT A VIBE.

K VALENTINA DINE & WINE',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K  valentina','Flyer','Trisha','KUMKUM','Suraj','https://in.pinterest.com/pin/260716265924660213/  , https://in.pinterest.com/pin/1144336586596885011/','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',407,'2026-09-11 12:10:56'),
(5286,23,'2026-09-05','BARRELS BRAN',7,'Medium',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Video','Trisha','KUMKUM','Omkar','','','','','','Saturday','WIP','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',408,'2026-09-11 12:10:56'),
(5287,6,'2026-09-05','FLYER culture Sunday',12,'Critical',NULL,'Completed','2 Options','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Trisha','','Suraj','https://in.pinterest.com/pin/1618549863655392/','','2 Options','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',409,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5288,5,'2026-09-05','mix tape flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',410,'2026-09-11 12:10:56'),
(5289,5,'2026-09-05','Tuesday Flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',411,'2026-09-11 12:10:56'),
(5290,2,'2026-09-05','Guest Carousel 2',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Carousel','Trisha','KUMKUM','Rushikesh','','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',412,'2026-09-11 12:10:56'),
(5291,2,'2026-09-05','Guest Carousel 1',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Carousel','Trisha','KUMKUM','Rushikesh','https://drive.google.com/drive/folders/1BcsfRlTB-6Y9z4yGyzgesBdGxVNVHS2Q','','','','','Saturday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',413,'2026-09-11 12:10:56'),
(5292,5,'2026-09-05','BEER LOVER DAY - 7TH SEP',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Trisha','KUMKUM','Sakib','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',414,'2026-09-11 12:10:56'),
(5293,2,'2026-09-05','TECAHEERS DAY CHANGES',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Static','','KUMKUM','Rushikesh','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',415,'2026-09-11 12:10:56'),
(5294,3,'2026-09-05','reviews',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Flyer','Sushmeet','KUMKUM','Swaraj','','','','','','Saturday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',416,'2026-09-11 12:10:56'),
(5295,6,'2026-09-05','BRAND GUIDELINES',27,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','KUMKUM','Suraj','','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',417,'2026-09-11 12:10:56'),
(5296,5,'2026-09-05','1 creative',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','KUMKUM','Sakib','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',418,'2026-09-11 12:10:56'),
(5297,6,'2026-09-05','product carousel',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','KUMKUM','Suraj','','','','','','Saturday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',419,'2026-09-11 12:10:56'),
(5298,22,'2026-09-05','interview reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','KUMKUM','Kartik','https://drive.google.com/drive/folders/1RiXiPRAv7D5hZXbT6UIrAGWixkFLfkke?usp=drive_link','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',420,'2026-09-11 12:10:56'),
(5299,23,'2026-09-05','packing reel just to export',10,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Changes','Soma','KUMKUM','Omkar','PC PROBLEM','','','','','Saturday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',421,'2026-09-11 12:10:56'),
(5300,23,'2026-09-05','influencer meetup reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','KUMKUM','Omkar','https://drive.google.com/drive/folders/1cVu0WL5ejIU79L3f5EpwNcAR9m0BWdpX?usp=drive_link','','','','','Saturday','Half done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',422,'2026-09-11 12:10:56'),
(5301,6,'2026-09-05','Karaoke Night with Jimmy',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Saturday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',423,'2026-09-11 12:10:56'),
(5302,6,'2026-09-05','Karaoke Night with KJ Ali',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Saturday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',424,'2026-09-11 12:10:56'),
(5303,6,'2026-09-05','Offer Creative',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',425,'2026-09-11 12:10:56'),
(5304,6,'2026-09-05','Barcode',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Static','Soma','Soma','Suraj','','','','','','Saturday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',426,'2026-09-11 12:10:56'),
(5305,23,'2026-09-04','yesterday video Note - dont make it fast transition',9,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','PENDING','Sushmeet','vidhi','Omkar','ref - https://www.instagram.com/reel/DTr5JnYCamZ/?igsi=MXh5OGdxbTViYmZkaQ== 
old drive data','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',428,'2026-09-11 12:10:56'),
(5306,6,'2026-09-04','Weekly Calender Changes',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Static','Soma','Soma','Suraj','change live wednesday with ladies night','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',429,'2026-09-11 12:10:56'),
(5307,2,'2026-09-04','Happy Hours Standee',14,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Standee','Soma','Soma','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',430,'2026-09-11 12:10:56'),
(5308,6,'2026-09-04','Corporate Events',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Carousel','Soma','Soma','Suraj','','','','','','Friday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',431,'2026-09-11 12:10:56'),
(5309,6,'2026-09-04','Food Menu',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','','','','','','Friday','content not given by client','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',432,'2026-09-11 12:10:56'),
(5310,22,'2026-09-04','Changes in reel from last drive, change first orange slide to #661818
, and change logo in last slide to new updated logo',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Video','Siddhi','Siddhi','Kartik','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',433,'2026-09-11 12:10:56'),
(5311,2,'2026-09-04','Ladies Night (Free cocktails and shots for ladies)',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',434,'2026-09-11 12:10:56'),
(5312,2,'2026-09-04','Friday Live with Sabali',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',435,'2026-09-11 12:10:56'),
(5313,2,'2026-09-04','Sunday Brunch',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',436,'2026-09-11 12:10:56'),
(5314,2,'2026-09-04','Jam Session - with small world',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',437,'2026-09-11 12:10:56'),
(5315,22,'2026-09-04','Recap',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Kartik','Ref: https://www.instagram.com/reel/DbbFWkWiKPa/?igsi=Y253MHBmZXRqaDZ2','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',438,'2026-09-11 12:10:56'),
(5316,23,'2026-09-04','Intuition Test',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Omkar','Ref: https://www.instagram.com/reel/DapvhnqIH24/?igsi=NnBuY21ud3Q2OGJo','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',439,'2026-09-11 12:10:56'),
(5317,4,'2026-09-04','Motion Carousel',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Changes','Sushmeet','Kumkum','Shratayu','','','','','','Friday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',440,'2026-09-11 12:10:56'),
(5318,5,'2026-09-04','Sunday Flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on whatsapp','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',441,'2026-09-11 12:10:56'),
(5319,5,'2026-09-04','Saturday Flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on whatsapp','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',442,'2026-09-11 12:10:56'),
(5320,3,'2026-09-04','1 creative changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Changes','Sushmeet','','Swaraj','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',443,'2026-09-11 12:10:56'),
(5321,2,'2026-09-04','we are back in town flyer for ThC  add on by client',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','thc','Flyer','Vidhi','guru','Rushikesh','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',444,'2026-09-11 12:10:56'),
(5322,3,'2026-09-04','carousel video',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Carousel','Sushmeet','vidhi','Swaraj','Ref- https://www.instagram.com/p/Db5xZQojsJt/?igsh=djBmcnBqZnVreGp3
Data- https://www.instagram.com/p/Db5xZQojsJt/?igsh=djBmcnBqZnVreGp3  
Explaination static 15 -  https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',445,'2026-09-11 12:10:56'),
(5323,22,'2026-09-03','Reel 8 
Best flow:
PUNE, YOU CAN’T MISS THIS PLACE.
↓
WONDERING WHERE? 👀
↓
last 2 sec CHECK THE CAPTION TO FIND OUT.
song - begin 0.13 sec - https://youtu.be/WlgoUlOkyzU?si=lHk9ftfs3T-QNGvn',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Changes','Sushmeet','vidhi','Kartik','reel 8 ref -  https://www.instagram.com/reel/Dbljq1sBrQ3/?igsh=MWRrMWh5MHh3cHhoZw==&igsi=MWRrMWh5MHh3cHhoZw== https://www.instagram.com/reels/Db3FcQ-MVaA/ 
explaination - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',446,'2026-09-11 12:10:56'),
(5324,2,'2026-09-04','60 percent off on menu 
EXTRA! EXTRA! PUNEKARS, THIS JUST IN!
60% OFF ON FOOD & DRINKS
Now that''s news worth making plans for.',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Static','Sushmeet','vidhi','Rushikesh','Ref - https://in.pinterest.com/pin/1001488035898180001/','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',447,'2026-09-11 12:10:56'),
(5325,4,'2026-09-04','Menu ai video',21,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','','Shratayu','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',448,'2026-09-11 12:10:56'),
(5326,2,'2026-09-04','TEACHERS DAY',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','','Rushikesh','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',449,'2026-09-11 12:10:56'),
(5327,2,'2026-09-04','colour grade  crowd images',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Carousel','Soma','','Rushikesh','CC','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',450,'2026-09-11 12:10:56'),
(5328,6,'2026-09-04','VFC OPENS.

THE WAIT IS OVER.

4 SEPTEMBER 2026

📍 ADRESS

SAVE THE DATE. 🌱',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','KUMKUM','Suraj','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',451,'2026-09-11 12:10:56'),
(5329,5,'2026-09-04','3 blocks',14,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Standee','Soma','KUMKUM','Sakib','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',452,'2026-09-11 12:10:56'),
(5330,6,'2026-09-04','gift carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','KUMKUM','Suraj','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',453,'2026-09-11 12:10:56'),
(5331,23,'2026-09-04','gift wrapping reel',7,'Critical',NULL,'Completed','facing system issue, unable to export due to iphone footage','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','KUMKUM','Omkar','https://www.instagram.com/reel/DWtluWwMDdv/?igsi=MTl1ZzRhd2dnbWhqZA==','','facing system issue, unable to export due to iphone footage','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',454,'2026-09-11 12:10:56'),
(5332,6,'2026-09-04','bollywood',12,'Critical',NULL,'Completed','Add On','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','KUMKUM','Suraj','','','Add On','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',455,'2026-09-11 12:10:56'),
(5333,6,'2026-09-04','colour grade  crowd images',13,'Critical',NULL,'Completed','Add On','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Carousel','Soma','','Suraj','CC','','Add On','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',456,'2026-09-11 12:10:56'),
(5334,5,'2026-09-04','TEACHERS  DAY',12,'Critical',NULL,'Completed','do on priority','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','KUMKUM','Sakib','','','do on priority','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',457,'2026-09-11 12:10:56'),
(5335,5,'2026-09-04','tuesday offer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',458,'2026-09-11 12:10:56'),
(5336,5,'2026-09-04','Table standee',14,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Standee','Trisha','Kumkum','Sakib','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',459,'2026-09-11 12:10:56'),
(5337,5,'2026-09-04','pour 99',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Flyer','Trisha','KUMKUM','Sakib','','','','','','Friday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',460,'2026-09-11 12:10:56'),
(5338,5,'2026-09-04','25%',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','BARRELS','Carousel','Trisha','KUMKUM','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',461,'2026-09-11 12:10:56'),
(5339,6,'2026-09-04','TEACHERS DAY WISHING POST',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K  valentina','Flyer','Trisha','KUMKUM','Suraj','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',462,'2026-09-11 12:10:56'),
(5340,5,'2026-09-04','menu file proper',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K  valentina','Menu','Trisha','KUMKUM','Sakib','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',463,'2026-09-11 12:10:56'),
(5341,2,'2026-09-04','TEACHERS DAY WISHING POST',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','KUMKUM','Rushikesh','','','','','','Friday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',464,'2026-09-11 12:10:56'),
(5342,22,'2026-09-04','ambiance reel',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K  valentina','Video','Trisha','KUMKUM','Kartik','REEL 05 ( FOOD PROMOTION ) 

REFRENCE : 

https://www.instagram.com/reel/DTZpHZ2DAHh/?utm_source=ig_web_button_share_sheet

Reel Summary:
 Two friends are confused about what to order at K Valentina. They ask the waiter for a recommendation, and he suggests one of the restaurant’s popular dishes while highlighting what makes it special. Impressed by the description, they order it — ending with a fun, relatable food moment.



SCENE 1 — AT THE TABLE
[Two friends are sitting at the table, looking through the menu]
CUSTOMER 1:
“Excuse me, sir?”
WAITER:
“Hi, sir!”
CUSTOMER 2:
“Hi!”
WAITER:
“What would you like to order, sir?”
CUSTOMER 1:
“Actually… can you help us choose? We’re a little confused.”
WAITER:
“Of course, sir. If you want to try something really good, I’d recommend our [DISH NAME].”

SCENE 2 — DISH ELABORATION
[Close-up shots of the dish being prepared / served]
WAITER:
“It’s one of our most popular dishes.
It’s made with [MAIN INGREDIENT], tossed in [SAUCE / FLAVOURS], and finished with [SPECIAL ELEMENT].
It’s got the perfect mix of [FLAVOUR 1] and [FLAVOUR 2], so if you’re trying it for the first time, this is definitely a good one to start with.”

SCENE 3 — CUSTOMER REACTION
CUSTOMER 2:
“Okay… that actually sounds really good.”
CUSTOMER 1:
“Yeah, let''s go for this.”
CUSTOMER 2:
“Sir, get this one for us.”
WAITER:
“Sure, sir!”
[Waiter walks away → Cut to dish arriving → Food close-up → Customers tasting it]
END FRAME
“When the menu is confusing,
let the favourites do the talking.”
K VALENTINA','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',465,'2026-09-11 12:10:56'),
(5343,2,'2026-09-04','50%',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Changes','Trisha','KUMKUM','Rushikesh','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',466,'2026-09-11 12:10:56'),
(5344,23,'2026-09-04','1 reel regular evening at hinjewadi',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Video','Trisha','KUMKUM','Omkar','https://www.instagram.com/reels/DXZU8ISjLpc/','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',467,'2026-09-11 12:10:56'),
(5345,2,'2026-09-04','TEACHERS DAY',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Flyer','Trisha','KUMKUM','Rushikesh','','','','','','Friday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',468,'2026-09-11 12:10:56'),
(5346,3,'2026-09-04','food abiance carousel',22,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Motion Carousel','Trisha','KUMKUM','Swaraj','https://www.instagram.com/p/DcQ0rPPgbYa/?utm_source=ig_web_button_share_sheet','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',469,'2026-09-11 12:10:56'),
(5347,22,'2026-09-04','?',7,'Low',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Video','Trisha','KUMKUM','Kartik','https://www.instagram.com/reels/DbXqd2guHwk/','','','','','Friday','Done','low','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',470,'2026-09-11 12:10:56'),
(5348,6,'2026-09-04','1 creative',8,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Static','Trisha','KUMKUM','Suraj','https://www.instagram.com/p/DSaCwXRE5qv/?igsi=ZWZ2Y3I2a2Qyb3Nr','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',471,'2026-09-11 12:10:56'),
(5349,3,'2026-09-04','Reel',7,'High',NULL,'In Progress','Problem in shoot','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Swaraj','https://docs.google.com/document/d/1OtSpz335fV6CUXrN3BTH5Ze0HBmBdbTd-8JWq9nb6go/edit?tab=t.0','','Problem in shoot','','','Friday','WIP','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',472,'2026-09-11 12:10:56'),
(5350,5,'2026-09-04','TEACHERS DAY WISHING POST',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Flyer','Trisha','KUMKUM','Sakib','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',473,'2026-09-11 12:10:56'),
(5351,6,'2026-09-04','ZOMATO SIZE 10 pictures',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Resizes','Trisha','KUMKUM','Suraj','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',474,'2026-09-11 12:10:56'),
(5352,3,'2026-09-04','zomato pics',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Resizes','Trisha','KUMKUM','Swaraj','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',475,'2026-09-11 12:10:56'),
(5353,6,'2026-09-04','bollywood night',12,'Critical',NULL,'Completed','Add On','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Flyer','Trisha','','Suraj','','','Add On','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',476,'2026-09-11 12:10:56'),
(5354,2,'2026-09-03','BRAND guidelines',27,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','BG','Trisha','Kumkum','Rushikesh','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',477,'2026-09-11 12:10:56'),
(5355,2,'2026-09-04','wishing post',20,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Resizes','Trisha','KUMKUM','Rushikesh','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',478,'2026-09-11 12:10:56'),
(5356,6,'2026-09-04','SLIDE 1  CRAB A DAY

### KEEPS A DOCTOR AWAY. 🦀

**SLIDE 2**

### BUT ONE PLATE?

### THAT WON’T BE ENOUGH.

**SLIDE 3**

### THE KIND OF CRAB

### YOU DON’T JUST EAT.

### YOU GO BACK FOR MORE.

**SLIDE 4 — CTA**

### GOT CRAB CRAVINGS?

### CHIMBORI

CHIMBORI HAS A TABLE READY FOR YOU',13,'Low',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Carousel','Trisha','KUMKUM','Suraj','','','','','','Friday','','low','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',479,'2026-09-11 12:10:56'),
(5357,3,'2026-09-04','CHANGES',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Video','Trisha','KUMKUM','Swaraj','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',480,'2026-09-11 12:10:56'),
(5358,2,'2026-09-04','live music - 19th Sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Flyer','Trisha','','Rushikesh','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',481,'2026-09-11 12:10:56'),
(5359,3,'2026-09-04','karaoke night',20,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Resizes','Sanika','','Swaraj','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',482,'2026-09-11 12:10:56'),
(5360,2,'2026-09-04','Audience picture carousel changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Rushikesh','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',483,'2026-09-11 12:10:56'),
(5361,5,'2026-09-04','Retro in the metro- 9th sept',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','Sanika','','Sakib','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',484,'2026-09-11 12:10:56'),
(5362,5,'2026-09-04','Retro in the metro- 9th sept',20,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Resizes','Sanika','','Sakib','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',485,'2026-09-11 12:10:56'),
(5363,6,'2026-09-04','Mood kharab hai? - Carousel',13,'Critical',NULL,'Completed','6 Slides','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Carousel','Sanika','','Suraj','','','6 Slides','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',486,'2026-09-11 12:10:56'),
(5364,3,'2026-09-04','Concept reel video',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Video','Sanika','','Swaraj','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',487,'2026-09-11 12:10:56'),
(5365,23,'2026-09-04','Concept reel video',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Video','Sanika','','Omkar','','','','','','Friday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',488,'2026-09-11 12:10:56'),
(5366,6,'2026-09-04','Carousel - 3',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Carousel','Sanika','','Suraj','Reference shared on Whatsapp','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',489,'2026-09-11 12:10:56'),
(5367,28,'2026-09-04','Food menu changes',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Rushikesh, Suraj','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',490,'2026-09-11 12:10:56'),
(5368,2,'2026-09-04','Bill style static post',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Static','Sanika','','Rushikesh','','','','','','Friday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',491,'2026-09-11 12:10:56'),
(5369,3,'2026-09-04','Chill skill flyer change',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Swaraj','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',492,'2026-09-11 12:10:56'),
(5370,5,'2026-09-04','Carousel new',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Carousel','Sanika','','Sakib','On whatsapp','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',493,'2026-09-11 12:10:56'),
(5371,23,'2026-09-04','Hinjewadi after dark',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Video','Sanika','','Omkar','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',494,'2026-09-11 12:10:56'),
(5372,5,'2026-09-04','Sizzling Sundays- DJ k-one',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Sakib','','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',495,'2026-09-11 12:10:56'),
(5373,4,'2026-09-04','Food carousel Lunch combo',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Shratayu','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',496,'2026-09-11 12:10:56'),
(5374,6,'2026-09-04','PPc Creative',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Suraj','','','','','','Friday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',497,'2026-09-11 12:10:56'),
(5375,4,'2026-09-04','Motion',21,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Motion Reel','Sushmeet','','Shratayu','Refer to M2: https://docs.google.com/document/d/1UwJuSig4LFXuilpWPaJJvoN9BC-Dl_FYXR_WLYs2iC0/edit?tab=t.oik1ljhailqf','','','','','Friday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',498,'2026-09-11 12:10:56'),
(5376,2,'2026-09-04','Banner for upcoming event',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Static','Sanika','','Rushikesh','','','','','','Friday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',499,'2026-09-11 12:10:56'),
(5377,6,'2026-09-03','Janmashtami Wishing Flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Suraj','Ref:https://in.pinterest.com/pin/1146095805200105191/','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',500,'2026-09-11 12:10:56'),
(5378,5,'2026-09-03','Friday Flyer - Need DJ Photo',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','Shared on whatsapp','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',501,'2026-09-11 12:10:56'),
(5379,2,'2026-09-03','customer photos',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Carousel','Sushmeet','vidhi','Rushikesh','just enhance , add logo','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',502,'2026-09-11 12:10:56'),
(5380,23,'2026-09-03','elix video',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Video','Sushmeet','vidhi','Omkar','ref - https://www.instagram.com/reel/DTr5JnYCamZ/?igsi=MXh5OGdxbTViYmZkaQ==','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',503,'2026-09-11 12:10:56'),
(5381,5,'2026-09-03','BRAND GUIDELINES',27,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','BG','Sushmeet','Kumkum','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',504,'2026-09-11 12:10:56'),
(5382,3,'2026-09-03','"CLEAR THE SMOKE.
NOT YOUR BUDGET.
KITCHEN CHIMNEY
MRP ₹29,990/-
SPECIAL PRICE ₹11,990/-
GAYATRI ELECTRONICS
ONLINE SE SASTA
📍 Sinhagad Road
☎️ CONTACT US: [NUMBER] "',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Static','Sushmeet','Kumkum','Swaraj','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',505,'2026-09-11 12:10:56'),
(5383,4,'2026-09-03','INFLUENCER VIDEO ADD SUBTITELS',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Changes','Sushmeet','Kumkum','Shratayu','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',506,'2026-09-11 12:10:56'),
(5384,3,'2026-09-03','REVIEW STATIC FOR SINHAGAD',8,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Static','Sushmeet','Kumkum','Swaraj','https://www.instagram.com/p/Dcvm8XGNamS/?igsi=c3cwNHphNG96dzJx','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',507,'2026-09-11 12:10:56'),
(5385,5,'2026-09-02','Post 9 - Needs to be finished by 3',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Carousel','Siddhi','Siddhi','Sakib','https://docs.google.com/document/d/1qjv-mm1WnjJxueiJAtLAEsTMGwr2iBaTRaK8VOl-Q7c/edit?tab=t.eyw01z6n0w3x','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',508,'2026-09-11 12:10:56'),
(5386,5,'2026-09-03','Post 11 - changes in teacher''s day static',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Speakez','Carousel','Siddhi','Siddhi','Sakib','https://docs.google.com/document/d/1qjv-mm1WnjJxueiJAtLAEsTMGwr2iBaTRaK8VOl-Q7c/edit?tab=t.eyw01z6n0w3x','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',509,'2026-09-11 12:10:56'),
(5387,6,'2026-09-03','Food Menu',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','','','','','','Thursday','content not given by client','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',510,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5388,6,'2026-09-03','Ladies Night (Free cocktails and shots for ladies)',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',511,'2026-09-11 12:10:56'),
(5389,2,'2026-09-03','Drinks carousel',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Carousel','Soma','Soma','Rushikesh','Data: https://we.tl/t-XNC1u0Nbi48hJHMa','','','','','Thursday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',512,'2026-09-11 12:10:56'),
(5390,6,'2026-09-03','Karaoke Night with Jimmy',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',513,'2026-09-11 12:10:56'),
(5391,6,'2026-09-03','Friday Live with Sabali',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',514,'2026-09-11 12:10:56'),
(5392,6,'2026-09-03','Sunday Brunch',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',515,'2026-09-11 12:10:56'),
(5393,6,'2026-09-03','Karaoke Night with KJ Ali',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',516,'2026-09-11 12:10:56'),
(5394,2,'2026-09-03','Jam Session - with small world',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',517,'2026-09-11 12:10:56'),
(5395,2,'2026-09-03','KRISHNA JANMASHTAMI',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',518,'2026-09-11 12:10:56'),
(5396,22,'2026-09-03','Recap',7,'Medium',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Kartik','Ref: https://www.instagram.com/reel/DbbFWkWiKPa/?igsi=Y253MHBmZXRqaDZ2','','','','','Thursday','WIP','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',519,'2026-09-11 12:10:56'),
(5397,23,'2026-09-03','Location',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Omkar','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',520,'2026-09-11 12:10:56'),
(5398,23,'2026-09-03','Intuition Test',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Seven Ace','Video','Soma','','Omkar','Ref: https://www.instagram.com/reel/DapvhnqIH24/?igsi=NnBuY21ud3Q2OGJo','','','','','Thursday','NO DATA','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',521,'2026-09-11 12:10:56'),
(5399,4,'2026-09-03','ADD DARK COLOUR ON THE MOTION',10,'Medium',NULL,'Pending','Brand guideline not made yet','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Changes','Soma','','Shratayu','','','Brand guideline not made yet','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',522,'2026-09-11 12:10:56'),
(5400,6,'2026-09-03','Launch Menu',11,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Menu','Soma','Kumkum','Suraj','SHARED ON WHATSAPP','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',523,'2026-09-11 12:10:56'),
(5401,5,'2026-09-03','KRISHNA JANMASHTAMI',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','Kumkum','Sakib','https://pin.it/347kqQkb7','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',524,'2026-09-11 12:10:56'),
(5402,4,'2026-09-03','OUTRO FOR VFC',19,'High',NULL,'Pending','Brand guideline not made yet','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Outro','Soma','Kumkum','Shratayu','','','Brand guideline not made yet','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',525,'2026-09-11 12:10:56'),
(5403,6,'2026-09-03','BRAND guidelines',27,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','BG','Soma','Kumkum','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',526,'2026-09-11 12:10:56'),
(5404,5,'2026-09-03','VFC',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','Kumkum','Sakib','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',527,'2026-09-11 12:10:56'),
(5405,6,'2026-09-03','coming soon https://pin.it/1egIMh94X',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','Kumkum','Suraj','https://pin.it/76encCepu','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',528,'2026-09-11 12:10:56'),
(5406,5,'2026-09-03','1 cfeative',18,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Story Creative','Soma','Kumkum','Sakib','','','','','','Thursday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',529,'2026-09-11 12:10:56'),
(5407,6,'2026-09-03','1 cfeative',18,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Story Creative','Soma','Kumkum','Suraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',530,'2026-09-11 12:10:56'),
(5408,2,'2026-09-03','1 cfeative  POLL',18,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Story Creative','Soma','Kumkum','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',531,'2026-09-11 12:10:56'),
(5409,23,'2026-09-03','Stay tuned  : GIFTS',7,'Critical',NULL,'Completed','Due to system problem i am unable to export the video','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','Kumkum','Omkar','https://www.instagram.com/reel/DWtluWwMDdv/?igsi=MTl1ZzRhd2dnbWhqZA==','','Due to system problem i am unable to export the video','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',532,'2026-09-11 12:10:56'),
(5410,6,'2026-09-03','mashroom',8,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','Kumkum','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',533,'2026-09-11 12:10:56'),
(5411,5,'2026-09-03','CAROUSEL',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','Kumkum','Sakib','','','','','','Thursday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',534,'2026-09-11 12:10:56'),
(5412,2,'2026-09-03','1 creative',23,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Thumbnail','Soma','Kumkum','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',535,'2026-09-11 12:10:56'),
(5413,4,'2026-09-03','Reel 7 DAY BEFORE yesterday work
data is in old drive - 7a - august sorted',9,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','PENDING','Trisha','vidhi','Shratayu','https://www.instagram.com/p/DZ-UDZRhEit/','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',536,'2026-09-11 12:10:56'),
(5414,24,'2026-09-03','1 video',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Video','Trisha','vidhi','vidhi','https://www.instagram.com/reel/Dbq02HJN-IP/?igsh=ZG9haHVnZjc3bTVu','','','','','Thursday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',537,'2026-09-11 12:10:56'),
(5415,22,'2026-09-03','Reel 8 
Best flow:
PUNE, YOU CAN’T MISS THIS PLACE.
↓
WONDERING WHERE? 👀
↓
last 2 sec CHECK THE CAPTION TO FIND OUT.
song - begin 0.13 sec - https://youtu.be/WlgoUlOkyzU?si=lHk9ftfs3T-QNGvn',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Video','Sushmeet','vidhi','Kartik','reel 8 ref -  https://www.instagram.com/reel/Dbljq1sBrQ3/?igsh=MWRrMWh5MHh3cHhoZw==&igsi=MWRrMWh5MHh3cHhoZw== https://www.instagram.com/reels/Db3FcQ-MVaA/ 
explaination - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',538,'2026-09-11 12:10:56'),
(5416,5,'2026-09-03','Janmashtami wishing post',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Flyer','Sushmeet','','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',539,'2026-09-11 12:10:56'),
(5417,5,'2026-09-03','Janmashtami wishing post',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Elix''r','Flyer','Sushmeet','','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',540,'2026-09-11 12:10:56'),
(5418,6,'2026-09-03','janmashtmi wishing flyer',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','digivik','Flyer','Vidhi','vidhi','Suraj','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',541,'2026-09-11 12:10:56'),
(5419,5,'2026-09-03','janmashtmi wishing flyer',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ripplees','Flyer','Vidhi','guru','Sakib','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',542,'2026-09-11 12:10:56'),
(5420,6,'2026-09-03','Teacher''s day wishing post',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',543,'2026-09-11 12:10:56'),
(5421,6,'2026-09-03','Janmashtami wishing post',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',544,'2026-09-11 12:10:56'),
(5422,2,'2026-09-03','Janmashtami wishing post',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Cafe peter','Flyer','Sushmeet','','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',545,'2026-09-11 12:10:56'),
(5423,3,'2026-09-03','ZOMATO SIZE',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Carousel','Trisha','','Swaraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',546,'2026-09-11 12:10:56'),
(5424,2,'2026-09-03','KRISHNA JANMASHTAMI',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/4gxERhjfr','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',547,'2026-09-11 12:10:56'),
(5425,6,'2026-09-03','* Flyer : BE HONEST.

When your favourite seafood lands on the table…

ARE YOU SHARING IT?

YES, WE SHARE. 🤝
NO. GET YOUR OWN. 😭

No wrong answers.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','Kumkum','Suraj','','','','','','Thursday','NO DATA','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',548,'2026-09-11 12:10:56'),
(5426,2,'2026-09-03','SLIDE 1THE PERFECT CHEAT MEAL
FOR “GYM FREAKS”

Because even your gains
deserve some flavour.

**SLIDE 2**

### CLEAN EATING

### CAN GET BORING.

So when cheat day hits,
make it worth every bite.

---

**SLIDE 3**

### GO GRILLED. 🔥

Smoky.
Juicy.
Loaded with flavour.

Your cheat meal
just got an upgrade.

---

**SLIDE 4**

### GRILLED SEAFOOD

### HITS DIFFERENT.

Fresh seafood.
Perfectly grilled.
Big on flavour.

**NO BORING BITES HERE.**

---

**SLIDE 5 — CTA**

### YOUR CHEAT DAY

### DESERVES THIS.

Head to **CHIMBORI**
and make your next meal
a grilled one.

**TAG YOUR GYM PARTNER
& PLAN YOUR CHEAT DAY.**',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Carousel','Trisha','Kumkum','Rushikesh','https://pin.it/7AOTvIYJD','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',549,'2026-09-11 12:10:56'),
(5427,3,'2026-09-03','sanika aditi',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Changes','Trisha','Kumkum','Swaraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',550,'2026-09-11 12:10:56'),
(5428,3,'2026-09-03','toit beer available at ek quarter',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','','','Swaraj','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',551,'2026-09-11 12:10:56'),
(5429,3,'2026-09-03','CHill skill flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','Sanika','','Swaraj','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',552,'2026-09-11 12:10:56'),
(5430,3,'2026-09-03','Concept reel',7,'Critical',NULL,'Completed','50% done','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Video','Sanika','','Swaraj','','','50% done','','','Thursday','Half done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',553,'2026-09-11 12:10:56'),
(5431,3,'2026-09-03','Karaoke night change background',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Changes','Sanika','','Swaraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',554,'2026-09-11 12:10:56'),
(5432,2,'2026-09-03','audience picture carousel',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Carousel','Sanika','','Rushikesh','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',555,'2026-09-11 12:10:56'),
(5433,5,'2026-09-03','Retro in the metro flyer',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Flyer','Sanika','','Sakib','','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',556,'2026-09-11 12:10:56'),
(5434,6,'2026-09-03','Janata Bar carousel',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Carousel','Sanika','','Suraj','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',557,'2026-09-11 12:10:56'),
(5435,6,'2026-09-03','Drink at Rs 1',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','EK quarter','Flyer','Sanika','','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',558,'2026-09-11 12:10:56'),
(5436,22,'2026-09-03','Lunch meal video 2 changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Kartik','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',559,'2026-09-11 12:10:56'),
(5437,2,'2026-09-03','Lunch meal Carousel 7',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','','','','','','Thursday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',560,'2026-09-11 12:10:56'),
(5438,10,'2026-09-03','Voice over change of mande reel',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','YASH MANDE','','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',561,'2026-09-11 12:10:56'),
(5439,5,'2026-09-03','Lunch meal carousel',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Sakib','Please do it todayyyy','','','','','Thursday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',562,'2026-09-11 12:10:56'),
(5440,23,'2026-09-03','Influencer video',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Video','Sanika','','Omkar','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',563,'2026-09-11 12:10:56'),
(5441,3,'2026-09-03','Pois influencer video changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Changes','Sanika','','Swaraj','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',564,'2026-09-11 12:10:56'),
(5442,5,'2026-09-03','Sizzling Sundays Flyer- DJ K-One',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Sakib','LOGO sent on whatsapp','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',565,'2026-09-11 12:10:56'),
(5443,6,'2026-09-03','LIVE MUSIC',12,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','7A','Flyer','Trisha','','Suraj','','','','','','Thursday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',566,'2026-09-11 12:10:56'),
(5444,3,'2026-09-03','Drinks - Motion',15,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Motion','Sushmeet','Guru','Swaraj','https://www.instagram.com/reel/DcdZ874TYrR/?igsi=MTB2YnYxZWlqYmdmbg==','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',567,'2026-09-11 12:10:56'),
(5445,3,'2026-09-03','1 creative',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','','Swaraj','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',568,'2026-09-11 12:10:56'),
(5446,6,'2026-09-03','1 college creative',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',569,'2026-09-11 12:10:56'),
(5447,23,'2026-09-03','1 reel',7,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Video','Trisha','Kumkum','Omkar','','','','','','Thursday','NO DATA','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',570,'2026-09-11 12:10:56'),
(5448,2,'2026-09-03','krishna janmashtami',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/5VdvEjbLV','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',571,'2026-09-11 12:10:56'),
(5449,6,'2026-09-03','an evening waiting
to unfold.',13,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Carousel','Trisha','Kumkum','Suraj','','','','','','Thursday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',572,'2026-09-11 12:10:56'),
(5450,2,'2026-09-03','Flyer : YOU PICK THE PLAN.
WE’LL PICK THE TABLE.

Who are you bringing to K Valentina?

❤️ DATE NIGHT
🥂 FRIENDS NIGHT
🍽️ FAMILY DINNER

Tag your person.',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','Flyer','Trisha','Kumkum','Rushikesh','','','','','','Thursday','Done','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',573,'2026-09-11 12:10:56'),
(5451,6,'2026-09-03','BRAND guidelines',27,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','K valentina','BG','Trisha','Kumkum','Suraj','','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',574,'2026-09-11 12:10:56'),
(5452,2,'2026-09-03','Guest carousel',13,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','Kumkum','Rushikesh','','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',575,'2026-09-11 12:10:56'),
(5453,5,'2026-09-03','table standee - tuesday',14,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Standee','Trisha','Kumkum','Sakib','','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',576,'2026-09-11 12:10:56'),
(5454,6,'2026-09-03','krishna janmashtami',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Suraj','https://pin.it/bOcCevzw4','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',577,'2026-09-11 12:10:56'),
(5455,5,'2026-09-03','Tuesday flyer',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','https://in.pinterest.com/pin/329536897757290502/','','','','','Thursday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',578,'2026-09-11 12:10:56'),
(5456,2,'2026-09-03','krishna janmashtami',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/59BoUheVV','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',579,'2026-09-11 12:10:56'),
(5457,25,'2026-09-03','carlsberg',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Flyer','Trisha','Kumkum','trish, Rushikesh','','','','','','Thursday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',580,'2026-09-11 12:10:56'),
(5458,3,'2026-09-03','VIDEO Carousel',13,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Carousel','Trisha','Kumkum','Swaraj','https://www.instagram.com/p/DcQ0rPPgbYa/?igsi=MXU0ajkwa2lhNGd6NQ%3D%3D','','','','','Thursday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',581,'2026-09-11 12:10:56'),
(5459,23,'2026-09-03','regular evening at hinjewadi',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Video','Trisha','Kumkum','Omkar','https://www.instagram.com/reels/DXZU8ISjLpc/','','','','','Thursday','Video only','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',582,'2026-09-11 12:10:56'),
(5460,3,'2026-09-03','meet the la bella team',7,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Video','Trisha','Kumkum','Swaraj','https://www.instagram.com/reels/Daa-KTkFdNm/','','','','','Thursday','Pending','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',583,'2026-09-11 12:10:56'),
(5461,22,'2026-09-03','food dakaiti - me',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Video','Trisha','Kumkum','Kartik','https://www.instagram.com/reels/DbXqd2guHwk/','','','','','Thursday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',584,'2026-09-11 12:10:56'),
(5462,23,'2026-09-03','pasta is the soln',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','Video','Trisha','Kumkum','Omkar','https://www.instagram.com/reels/DcKIk3SOzlt/','','','','','Thursday','NO DATA','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',585,'2026-09-11 12:10:56'),
(5463,2,'2026-09-03','BRAND guidelines',27,'High',NULL,'In Progress','50%','2026-09-11 06:40:56','2026-09-11 12:10:56','la belle','BG','Trisha','Kumkum','Rushikesh','','','50%','','','Thursday','WIP','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',586,'2026-09-11 12:10:56'),
(5464,3,'2026-09-02','InterviewReel_Changes',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Beer and beans','Changes','Soma','','Swaraj','','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',587,'2026-09-11 12:10:56'),
(5465,6,'2026-09-02','Food Menu',11,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','','','','','','Wednesday','content not given by client','on hold','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',588,'2026-09-11 12:10:56'),
(5466,6,'2026-09-02','Karaoke Night with Jimmy',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',589,'2026-09-11 12:10:56'),
(5467,2,'2026-09-02','Beer @ 25',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Wednesday','content not given by client','on hold','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',590,'2026-09-11 12:10:56'),
(5468,6,'2026-09-02','Friday Live with Sabali',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',591,'2026-09-11 12:10:56'),
(5469,2,'2026-09-02','House of Desi-by Kukoo Jhonny - It''s a Dhol Night',12,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',592,'2026-09-11 12:10:56'),
(5470,6,'2026-09-02','Sunday Brunch',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',593,'2026-09-11 12:10:56'),
(5471,6,'2026-09-02','Karaoke Night with KJ Ali',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Suraj','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',594,'2026-09-11 12:10:56'),
(5472,2,'2026-09-02','Jam Session - with small world',12,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Flyer','Soma','Soma','Rushikesh','','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',595,'2026-09-11 12:10:56'),
(5473,3,'2026-09-02','Friday Live Band Reel (change the song)',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Video','Soma','Soma','Swaraj','data: https://drive.google.com/drive/folders/1FhQ2jUyMdGgkWOdaDvhDfFmzO4-04yEy?usp=sharing','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',596,'2026-09-11 12:10:56'),
(5474,6,'2026-09-02','1 creative',13,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','Kumkum','Suraj','no food pictures to be added','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',597,'2026-09-11 12:10:56'),
(5475,6,'2026-09-02','Carousel',13,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Carousel','Soma','Kumkum','Suraj','no food pictures to be added','','','','','Wednesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',598,'2026-09-11 12:10:56'),
(5476,5,'2026-09-02','1 creative  : PCMC, ARE YOU READY? 👀

SOMETHING DELICIOUS
IS OPENING SOON.

🌱 100% VEGAN

VFC

4 SEPTEMBER



BE THERE FOR THE FIRST BITE.',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','Kumkum','Sakib','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',599,'2026-09-11 12:10:56'),
(5477,4,'2026-09-02','ADD SLOWLY TYPING EFFECT',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Changes','Soma','Kumkum','Shratayu','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',600,'2026-09-11 12:10:56'),
(5478,22,'2026-09-02','Date Reveal',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Video','Soma','Kumkum','Kartik','https://pin.it/20Yy1YApC','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',601,'2026-09-11 12:10:56'),
(5479,4,'2026-09-02','WE ARE OPEN NOW',15,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion','Soma','Kumkum','Shratayu','https://pin.it/51E0o59yX','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',602,'2026-09-11 12:10:56'),
(5480,5,'2026-09-02','KRISHNA JANMASHTAMI',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Flyer','Soma','Kumkum','Sakib','https://pin.it/347kqQkb7','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',603,'2026-09-11 12:10:56'),
(5481,2,'2026-09-02','PCMC, Something''s Cooking',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','Kumkum','Rushikesh','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',604,'2026-09-11 12:10:56'),
(5482,2,'2026-09-02','Teacher''s Day Wishing Flyer',18,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Story Creative','Soma','Guru','Rushikesh','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',605,'2026-09-11 12:10:56'),
(5483,2,'2026-09-02','Vegetarian promotion story',18,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Story Creative','Soma','Guru','Rushikesh','','','','','','Wednesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',606,'2026-09-11 12:10:56'),
(5484,6,'2026-09-02','Janmashtami Wishing Flyer',18,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Story Creative','Soma','Guru','Suraj','Ref:https://in.pinterest.com/pin/1146095805200105191/','','','','','Wednesday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',607,'2026-09-11 12:10:56'),
(5485,6,'2026-09-02','2KB - Grid ( 18 Creatives )',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Static','Sushmeet','','Suraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',608,'2026-09-11 12:10:56'),
(5486,6,'2026-09-02','2KB - Grid Mockup',8,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Static','Sushmeet','','Suraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',609,'2026-09-11 12:10:56'),
(5487,6,'2026-09-02','Artist Flyer',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Changes','Sushmeet','','Suraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',610,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5488,4,'2026-09-02','Motion',15,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Motion','Sushmeet','','Shratayu','Refer to M2: https://docs.google.com/document/d/1UwJuSig4LFXuilpWPaJJvoN9BC-Dl_FYXR_WLYs2iC0/edit?tab=t.oik1ljhailqf','','','','','Wednesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',611,'2026-09-11 12:10:56'),
(5489,6,'2026-09-02','Lunch combo Carousel- 5',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Suraj','https://we.tl/t-5Ea881AekfEpycBO','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',612,'2026-09-11 12:10:56'),
(5490,5,'2026-09-02','Lunch Combo Carousel-6',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Sakib','https://we.tl/t-BmuGo6vhX1x0hyoo','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',613,'2026-09-11 12:10:56'),
(5491,2,'2026-09-02','Lunch Combo Carousel- 3',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Carousel','Sanika','','Rushikesh','https://we.tl/t-K2MiKN9rkJdEo3rF','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',614,'2026-09-11 12:10:56'),
(5492,22,'2026-09-02','Golden drink',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Video','Vidhi','vidhi','Kartik','On Whatsapp','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',615,'2026-09-11 12:10:56'),
(5493,22,'2026-09-02','Text changes- meal reel 1',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Kartik','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',616,'2026-09-11 12:10:56'),
(5494,5,'2026-09-02','Thursday IMFL@99- DJ Aksh',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Sakib','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',617,'2026-09-11 12:10:56'),
(5495,5,'2026-09-02','Friday Hip Hop night- 4th Sept- DJ Nish',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Sakib','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',618,'2026-09-11 12:10:56'),
(5496,3,'2026-09-02','Desi Night - V-desi style- DJ NISH & DJ Bunny',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Flyer','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',619,'2026-09-11 12:10:56'),
(5497,3,'2026-09-02','Poise Influencer Reel new concept',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Video','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',620,'2026-09-11 12:10:56'),
(5498,4,'2026-09-02','Carousel',22,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Motion Carousel','Sanika','','Shratayu','https://we.tl/t-no8NMz075PqQ8MWO','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',621,'2026-09-11 12:10:56'),
(5499,3,'2026-09-02','Karoke night',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','Sanika','','Swaraj','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',622,'2026-09-11 12:10:56'),
(5500,5,'2026-09-02','Retro in the metro- 9th Sept',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Flyer','Sanika','','Sakib','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',623,'2026-09-11 12:10:56'),
(5501,2,'2026-09-02','Offer carousel changes',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek Quarter','Changes','Sanika','','Rushikesh','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',624,'2026-09-11 12:10:56'),
(5502,3,'2026-09-02','creative changes , change text',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','aroma','Changes','Vidhi','','Swaraj','changes shared on whtsp','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',625,'2026-09-11 12:10:56'),
(5503,6,'2026-09-02','janmashtmi wishing flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','digivik','Flyer','Vidhi','vidhi','Suraj','','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',626,'2026-09-11 12:10:56'),
(5504,5,'2026-09-02','janmashtmi wishing flyer',12,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','ripplees','Flyer','Vidhi','guru','Sakib','','','','','','Wednesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',627,'2026-09-11 12:10:56'),
(5505,2,'2026-09-02','sunday artist flyer',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ripplees','Changes','Vidhi','guru','Rushikesh','','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',628,'2026-09-11 12:10:56'),
(5506,3,'2026-09-02','1 CAROUSEL',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Carousel','Sushmeet','vidhi','Swaraj','Ref - https://www.instagram.com/p/DaK26s6mjae/?igsh=MWhsNnZzczlzYmFnNg%3D%3D&igsi=MWhsNnZzczlzYmFnNg%3D%3D&img_index=2  
Brand guideliness - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',629,'2026-09-11 12:10:56'),
(5507,22,'2026-09-02','TMKOC REEL 
data is in old drive',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Video','Sushmeet','vidhi','Kartik','REF - https://youtu.be/lHXzw6fakPQ?si=0l4rTx8fpwMkAb0W  
EXPLAINATION REEL 6  - https://docs.google.com/document/d/1UdRsNLGoB_R1UGPn0gsFZluqIlAP9ooWz5Y8L67JVR8/edit?tab=t.qpikm1kka7m6','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',630,'2026-09-11 12:10:56'),
(5508,2,'2026-09-02','will share before 4pm , data need to come',13,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','ELIX','Carousel','','vidhi','Rushikesh','Ref -','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',631,'2026-09-11 12:10:56'),
(5509,6,'2026-09-02','Static 15 copy shared on whtsp',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Flyer','Trisha','vidhi','Suraj','Ref - https://www.instagram.com/p/DblOcC6ime2/?igsh=ZjZhMjJkZzZtMWgz 
Data -https://drive.google.com/drive/folders/1zgMrbYIsMzuySVIqwSGHFTjz96QRJ6mS  
https://docs.google.com/document/d/10feSlcF5b10WG-S5RTLU_AkFun7zvNwc4Fl5ZAgx-9Y/edit?tab=t.qpikm1kka7m6 static 15','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',632,'2026-09-11 12:10:56'),
(5510,6,'2026-09-02','Static 15 copy shared on whtsp',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Changes','Trisha','vidhi','Suraj','Ref - https://www.instagram.com/p/DblOcC6ime2/?igsh=ZjZhMjJkZzZtMWgz 
Data -https://drive.google.com/drive/folders/1zgMrbYIsMzuySVIqwSGHFTjz96QRJ6mS  
https://docs.google.com/document/d/10feSlcF5b10WG-S5RTLU_AkFun7zvNwc4Fl5ZAgx-9Y/edit?tab=t.qpikm1kka7m6 static 15','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',633,'2026-09-11 12:10:56'),
(5511,4,'2026-09-02','Reel 7 yesterday work
data is in old drive - 7a - august sorted',7,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Video','Trisha','vidhi','Shratayu','https://www.instagram.com/p/DZ-UDZRhEit/','','','','','Wednesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',634,'2026-09-11 12:10:56'),
(5512,5,'2026-09-02','REVIEW STATIC FOR SINHAGAD',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Static','Sushmeet','Kumkum','Sakib','https://www.instagram.com/p/Dcvm8XGNamS/?igsi=c3cwNHphNG96dzJx','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',635,'2026-09-11 12:10:56'),
(5513,4,'2026-09-02','changes in marathi influencer reel',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Changes','Sushmeet','Kumkum','Shratayu','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',636,'2026-09-11 12:10:56'),
(5514,6,'2026-09-02','krishna janmashtami ( KRISHNA JI STANDING ON FRIDGE)',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','GAYATRI','Flyer','Sushmeet','Kumkum','Suraj','https://www.instagram.com/p/DbdRgbJGAS5/?utm_source=ig_web_button_share_sheet','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',637,'2026-09-11 12:10:56'),
(5515,2,'2026-09-02','50%',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Changes','Trisha','Kumkum','Rushikesh','https://pin.it/34p5xS39p','','','','','Wednesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',638,'2026-09-11 12:10:56'),
(5516,22,'2026-09-02','1 reel',7,'Low',NULL,'Completed','https://drive.google.com/drive/folders/1-97JDSFj4aGlao-nDqcXAfzyuVO8E93J?usp=drive_link','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Video','Trisha','Kumkum','Kartik','https://www.instagram.com/reel/DcLN8weJs2F/?utm_source=ig_web_button_share_sheet','','https://drive.google.com/drive/folders/1-97JDSFj4aGlao-nDqcXAfzyuVO8E93J?usp=drive_link','','','Wednesday','Done','low','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',639,'2026-09-11 12:10:56'),
(5517,5,'2026-09-02','0',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Carousel','Trisha','Kumkum','Sakib','','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',640,'2026-09-11 12:10:56'),
(5518,2,'2026-09-02','krishna janmashtami',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','LA BELLE','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/59BoUheVV','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',641,'2026-09-11 12:10:56'),
(5519,5,'2026-09-02','menu card',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Carousel','Trisha','Kumkum','Sakib','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',643,'2026-09-11 12:10:56'),
(5520,3,'2026-09-02','Flyer : YOU PICK THE PLAN.
WE’LL PICK THE TABLE.

Who are you bringing to K Valentina?

❤️ DATE NIGHT
🥂 FRIENDS NIGHT
🍽️ FAMILY DINNER

Tag your person.',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','Kumkum','Swaraj','https://pin.it/36SbM1a7B','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',644,'2026-09-11 12:10:56'),
(5521,2,'2026-09-02','krishna janmashtami',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K VALENTINA','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/5VdvEjbLV','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',645,'2026-09-11 12:10:56'),
(5522,6,'2026-09-02','carousel 8',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Suraj','https://drive.google.com/file/d/1wxFoboE0tU_KsmjhBCkBIlcqYVx5pVhB/view?usp=drive_link','','','​','​','Wednesday','Done','​','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',646,'2026-09-11 12:10:56'),
(5523,5,'2026-09-02','carousel 11',10,'Critical',NULL,'Completed','​','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Sakib','https://drive.google.com/drive/folders/1EDJsv2TThC5AccHHoHXHdiDfn_BuBILb','','​','','​','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',647,'2026-09-11 12:10:56'),
(5524,6,'2026-09-02','carousel 7',10,'Critical',NULL,'Completed','​','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Suraj','https://drive.google.com/drive/folders/1EDJsv2TThC5AccHHoHXHdiDfn_BuBILb','','​','','​','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',648,'2026-09-11 12:10:56'),
(5525,5,'2026-09-02','carousel 3',10,'Critical',NULL,'Completed','​','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Sakib','https://drive.google.com/drive/folders/1EDJsv2TThC5AccHHoHXHdiDfn_BuBILb','','​','','​','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',649,'2026-09-11 12:10:56'),
(5526,6,'2026-09-02','carousel 14 - slide 5',10,'Critical',NULL,'Completed','​','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Suraj','https://drive.google.com/drive/folders/1EDJsv2TThC5AccHHoHXHdiDfn_BuBILb','','​','','​','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',650,'2026-09-11 12:10:56'),
(5527,6,'2026-09-02','carousel 16',10,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Changes','Trisha','Kumkum','Suraj','https://drive.google.com/drive/folders/1EDJsv2TThC5AccHHoHXHdiDfn_BuBILb','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',651,'2026-09-11 12:10:56'),
(5528,2,'2026-09-02','guests',13,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','Kumkum','Rushikesh','','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',652,'2026-09-11 12:10:56'),
(5529,5,'2026-09-02','retro bollywood',12,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','https://in.pinterest.com/pin/91479436176552126/','','','','','Wednesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',653,'2026-09-11 12:10:56'),
(5530,6,'2026-09-02','krishna janmashtami',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Suraj','https://pin.it/bOcCevzw4','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',654,'2026-09-11 12:10:56'),
(5531,5,'2026-09-02','POUR 99 https://pin.it/5db5y8I5y
https://pin.it/6zH2flqw0',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','https://pin.it/6zH2flqw0','','','','','Wednesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',655,'2026-09-11 12:10:56'),
(5532,5,'2026-09-02','WIDWEEK WEDNESDAY',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',656,'2026-09-11 12:10:56'),
(5533,5,'2026-09-02','25% off',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',657,'2026-09-11 12:10:56'),
(5534,5,'2026-09-02','CRAFT BEER AT ₹99?

Slide 2

YES.
YOU READ THAT RIGHT.

Slide 3

JUST ₹99
FOR YOUR CRAFT BEER.

TUESDAY TO SUNDAY
4 PM TO 7 PM

Slide 4 — CTA

NOW, THE ONLY QUESTION IS—
WHICH ONE ARE YOU TRYING FIRST?

HIK. TOIT. MOONSHINE.
COME PICK YOUR POUR AT BARRELS.',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','Kumkum','Sakib','https://pin.it/5db5y8I5y','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',658,'2026-09-11 12:10:56'),
(5535,3,'2026-09-02','ZOMATO SIZE',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Carousel','Trisha','Kumkum','Swaraj','RESIZE','','','','','Wednesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',659,'2026-09-11 12:10:56'),
(5536,7,'2026-09-02','ADD voice',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Video','Trisha','Kumkum','Vivek','','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',660,'2026-09-11 12:10:56'),
(5537,2,'2026-09-02','KRISHNA JANMASHTAMI',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','CHIMBORI','Flyer','Trisha','Kumkum','Rushikesh','https://pin.it/4gxERhjfr','','','','','Wednesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',661,'2026-09-11 12:10:56'),
(5538,6,'2026-09-01','* Flyer: THERE’S ALWAYS THAT FRIEND.

Says they’re not hungry.
Then eats half your plate.

WHO IS IT? 

TAG THEM.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',662,'2026-09-11 12:10:56'),
(5539,5,'2026-09-01','* LAPTOP CLOSED.
WHAT’S NEXT?

A. “Going home.”
B. “Barrels?”

POLL:
 Home
Barrels',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',663,'2026-09-11 12:10:56'),
(5540,5,'2026-09-01','changes',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','grains & grills','Changes','Sanika','','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',664,'2026-09-11 12:10:56'),
(5541,3,'2026-09-01','interview part 3',10,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Bear and beans','Changes','Soma','Guru','Swaraj','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',665,'2026-09-11 12:10:56'),
(5542,23,'2026-09-01','Two model reel',7,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Video','Soma','Guru','Omkar','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',666,'2026-09-11 12:10:56'),
(5543,2,'2026-09-01','Teacher''s Day Wishing Flyer',12,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Flyer','Soma','Guru','Rushikesh','','','','','','Tuesday','Half done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',667,'2026-09-11 12:10:56'),
(5544,2,'2026-09-01','Vegetarian promotion story',18,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Little Italy','Story Creative','Soma','Guru','Rushikesh','','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',668,'2026-09-11 12:10:56'),
(5545,4,'2026-09-01','INVITATION TYPING REEL',21,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Motion Reel','Soma','Kumkum','Shratayu','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',669,'2026-09-11 12:10:56'),
(5546,2,'2026-09-01','PCMC, Something''s Cooking',8,'Medium',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Static','Soma','Kumkum','Rushikesh','','','','','','Tuesday','Pending','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',670,'2026-09-11 12:10:56'),
(5547,4,'2026-09-01','Coming Soon',16,'High',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','VFC','Ai Video','Soma','Kumkum','Shratayu','Ref: https://www.instagram.com/reel/DbDe9sVsDR_/?igsi=MWkyamhudHZlc3htcg==','','','','','Tuesday','Pending','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',671,'2026-09-11 12:10:56'),
(5548,3,'2026-09-01','Friday Live Band Reel (Need this reel before 12 pm today)',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Video','Soma','Soma','Swaraj','data: https://drive.google.com/drive/folders/1FhQ2jUyMdGgkWOdaDvhDfFmzO4-04yEy?usp=sharing','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',672,'2026-09-11 12:10:56'),
(5549,6,'2026-09-01','Food Menu',11,'High',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Menu','Soma','Soma','Suraj','','','','','','Tuesday','WIP','imp','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',673,'2026-09-11 12:10:56'),
(5550,2,'2026-09-01','Beer @ 25',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',674,'2026-09-11 12:10:56'),
(5551,2,'2026-09-01','Friday Live',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',675,'2026-09-11 12:10:56'),
(5552,2,'2026-09-01','House of desi',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',676,'2026-09-11 12:10:56'),
(5553,2,'2026-09-01','Sunday brunch',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',677,'2026-09-11 12:10:56'),
(5554,2,'2026-09-01','Karaoke with kj',20,'Medium',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','Kukoo Mills','Resizes','Soma','','Rushikesh','','','','','','Tuesday','Done','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',678,'2026-09-11 12:10:56'),
(5555,6,'2026-09-01','FRESH AATA.
RIGHT AT HOME.

AATA CHAKKI

GRIND FRESH.
EAT FRESH.

GET YOURS TODAY.

GAYATRI ELECTRONICS',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Gayatri','Flyer','Sushmeet','Kumkum','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',679,'2026-09-11 12:10:56'),
(5556,2,'2026-09-01','"CLEAR THE SMOKE.
NOT YOUR BUDGET.
KITCHEN CHIMNEY
MRP ₹29,990/-
SPECIAL PRICE ₹11,990/-
GAYATRI ELECTRONICS
ONLINE SE SASTA
📍 Sinhagad Road
☎️ CONTACT US: [NUMBER] "',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Gayatri','Static','Sushmeet','Kumkum','Rushikesh','','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',680,'2026-09-11 12:10:56'),
(5557,2,'2026-09-01','* YOUR FOOD.
READY IN MINUTES.
YOUR MICROWAVE.
AT A PRICE YOU WON’T EXPECT.
MRP ₹12,990/-
NOW ₹6,990/-
GAYATRI ELECTRONICS
ONLINE SE SASTA

Wakad address',8,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Gayatri','Static','Sushmeet','Kumkum','Rushikesh','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',681,'2026-09-11 12:10:56'),
(5558,3,'2026-09-01','Friends Reel',7,'Critical',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Video','Sushmeet','','Swaraj','','','','','','Tuesday','Done','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',682,'2026-09-11 12:10:56'),
(5559,6,'2026-09-01','Carousel 1',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Carousel','Sushmeet','Siddhi','Suraj','Refer to C1: https://docs.google.com/document/d/1HfhMGO0JLlcxa3wS0XENJYAAr2p84YqlgWPRjLWNF0M/edit?tab=t.yad43kvlfq2k#heading=h.rfy3chyexwji','','','','','Tuesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',683,'2026-09-11 12:10:56'),
(5560,6,'2026-09-01','Carousel 2',13,'Critical',NULL,'Pending','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Carousel','Sushmeet','Siddhi','Suraj','Refer to C2: https://docs.google.com/document/d/1HfhMGO0JLlcxa3wS0XENJYAAr2p84YqlgWPRjLWNF0M/edit?tab=t.yad43kvlfq2k#heading=h.rfy3chyexwji','','','','','Tuesday','Pending','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',684,'2026-09-11 12:10:56'),
(5561,6,'2026-09-01','Artist Flyer - Ritva (Anhad & Aditya)',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Flyer','Sushmeet','','Suraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',685,'2026-09-11 12:10:56'),
(5562,6,'2026-09-01','Update Brand Guidelines',13,'Critical',NULL,'In Progress','','2026-09-11 06:40:56','2026-09-11 12:10:56','2KB','Carousel','Sushmeet','Siddhi','Suraj','','','','','','Tuesday','WIP','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',686,'2026-09-11 12:10:56'),
(5563,4,'2026-09-01','Carousel 1',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Carousel','Sushmeet','','Shratayu','https://www.instagram.com/p/Dbt9jxciazY/?img_index=3&igsh=MWFtaW5ybHJ5NG5wdA==','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',687,'2026-09-11 12:10:56'),
(5564,2,'2026-09-01','Carousel 2',13,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Firefly','Carousel','Sushmeet','','Rushikesh','https://www.instagram.com/p/DHfckT3TZSl/?igsh=anV1ZDNzN3MyeHBv&img_index=5','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',688,'2026-09-11 12:10:56'),
(5565,5,'2026-09-01','Wednesday Flyer',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Flyer','Sushmeet','','Sakib','Shared on Whatsapp','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',689,'2026-09-11 12:10:56'),
(5566,5,'2026-09-01','Thursday Flyer',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Flyer','Sushmeet','','Sakib','Shared on Whatsapp','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',690,'2026-09-11 12:10:56'),
(5567,3,'2026-09-01','static 11 - motion video',10,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Changes','Sushmeet','','Swaraj','https://www.instagram.com/p/Db-v_uAiMes/?img_index=3&igsi=YnVpeHM1eHowOHFn','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',691,'2026-09-11 12:10:56'),
(5568,6,'2026-09-01','* Flyer: THERE’S ALWAYS THAT FRIEND.

Says they’re not hungry.
Then eats half your plate.

WHO IS IT? 

TAG THEM.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',693,'2026-09-11 12:10:56'),
(5569,5,'2026-09-01','* LAPTOP CLOSED.
WHAT’S NEXT?

A. “Going home.”
B. “Barrels?”

POLL:
 Home
Barrels',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Flyer','Trisha','Kumkum','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',694,'2026-09-11 12:10:56'),
(5570,2,'2026-09-01','Guest Apperance',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','Kumkum','Rushikesh','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',695,'2026-09-11 12:10:56'),
(5571,6,'2026-09-01','Flyer : YOU PICK THE PLAN.
WE’LL PICK THE TABLE.

Who are you bringing to K Valentina?

❤️ DATE NIGHT
🥂 FRIENDS NIGHT
🍽️ FAMILY DINNER

Tag your person.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Flyer','Trisha','','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',696,'2026-09-11 12:10:56'),
(5572,2,'2026-09-01','Influencer focus',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Static','Trisha','Kumkum','Rushikesh','REF - https://in.pinterest.com/pin/999517711106597856/feedback/?invite_code=6213eb302045446ca999ebaab36528ba&sender_id=1038361395244343383','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',697,'2026-09-11 12:10:56'),
(5573,6,'2026-09-01','Guest Face',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Static','Trisha','Kumkum','Suraj','Colour Grading and logo','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',698,'2026-09-11 12:10:56'),
(5574,3,'2026-09-01','VO - Ambience',7,'High',NULL,'Completed','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','Video','Trisha','Kumkum','Swaraj','ref - https://in.pinterest.com/pin/1125968710722419/ , Data - https://we.tl/t-am1tr601mHZ0sm24 ,','','','','','Tuesday','Done','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',699,'2026-09-11 12:10:56'),
(5575,6,'2026-09-01','* Flyer : WHERE ARE YOU
TAKING THEM TONIGHT? 👀

The safe choice?
Your usual spot.

The better choice?
LA BELLE.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La Belle','Flyer','Trisha','','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',700,'2026-09-11 12:10:56'),
(5576,2,'2026-09-01','HAPPY HOURS',9,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La Belle','PENDING','Trisha','Kumkum','Rushikesh','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',701,'2026-09-11 12:10:56'),
(5577,2,'2026-09-01','Corporate packages',9,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','La Belle','PENDING','Trisha','Kumkum','Rushikesh','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',702,'2026-09-11 12:10:56'),
(5578,2,'2026-09-01','1 CAROUSEL - FOOD BASED',9,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','K Valentina','PENDING','Trisha','Kumkum','Rushikesh','REF - https://www.instagram.com/p/DZNdPepDLQ9/?utm_source=ig_web_button_share_sheet&img_index=1 , data - https://we.tl/t-ygbwd3bDvVxFUCRD','','','','','Tuesday','','Medium','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',703,'2026-09-11 12:10:56'),
(5579,6,'2026-09-01','* Flyer : BE HONEST.

When your favourite seafood lands on the table…

ARE YOU SHARING IT?

YES, WE SHARE. 🤝
NO. GET YOUR OWN. 😭

No wrong answers.',12,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Flyer','Trisha','Kumkum','Suraj','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',704,'2026-09-11 12:10:56'),
(5580,5,'2026-09-01','* STATIC: SOME PEOPLE SEE A PLATE.
YOU SEE A FEAST.

Saucy.
Smoky.
Messy in the best way.

IF SEAFOOD IS YOUR LOVE LANGUAGE,
CHIMBORI GETS YOU. 🦀

COME EAT YOUR WAY.',8,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Static','Trisha','Kumkum','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',705,'2026-09-11 12:10:56'),
(5581,4,'2026-09-01','sanika & kumkum reel',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Chimbori','Changes','Trisha','Kumkum','Shratayu','voiceover issues','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',706,'2026-09-11 12:10:56'),
(5582,5,'2026-09-01','Crafts at 99/-',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Barrels','Carousel','Trisha','Kumkum','Sakib','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',707,'2026-09-11 12:10:56'),
(5583,5,'2026-09-01','Retro in the metro',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Sakib','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',708,'2026-09-11 12:10:56'),
(5584,5,'2026-09-01','Quarter time change',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Changes','Sanika','','Sakib','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',709,'2026-09-11 12:10:56'),
(5585,5,'2026-09-01','Retro in the metro',20,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Resizes','Sanika','','Sakib','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',710,'2026-09-11 12:10:56'),
(5586,3,'2026-09-01','Concept reel',7,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ek quarter','Video','Sanika','','Swaraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',711,'2026-09-11 12:10:56'),
(5587,2,'2026-09-01','static poise',8,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Static','Sanika','','Rushikesh','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',712,'2026-09-11 12:10:56');

insert into public.tasks (id,employee_id,task_date,task_description,category_id,priority,due_date,status,remarks,created_at,updated_at,client_name,task_type,poc,content_responsible,responsible_editor,reference_links,time_taken,editor_remarks,acc_manager_remark,manager_remark,sheet_day,raw_status,raw_priority,source,source_sheet_key,source_row,synced_at) values
(5588,4,'2026-09-01','Poise drink carousel',13,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Poise','Carousel','Sanika','','Shratayu','Please give in first half','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',713,'2026-09-11 12:10:56'),
(5589,3,'2026-09-01','Movie clip video changes',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Swaraj','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',714,'2026-09-11 12:10:56'),
(5590,5,'2026-09-01','Food carousel changes',10,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Sakib','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',715,'2026-09-11 12:10:56'),
(5591,3,'2026-09-01','VO change of first sukoon movie clip vdo',10,'High',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Sukoon','Changes','Sanika','','Swaraj','','','','','','Tuesday','','High','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',716,'2026-09-11 12:10:56'),
(5592,2,'2026-09-01','sunady artist',12,'Critical',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','Ripplees','Flyer','Vidhi','guru','Rushikesh','','','','','','Tuesday','','Urgent','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',717,'2026-09-11 12:10:56'),
(5593,22,'2026-09-01','1 creative video',7,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Video','Trisha','vidhi','Kartik','Ref - https://www.instagram.com/p/DblOcC6ime2/?igsh=ZjZhMjJkZzZtMWgz','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',719,'2026-09-11 12:10:56'),
(5594,2,'2026-09-01','Static 15',13,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','7a','Carousel','Trisha','vidhi','Rushikesh','Ref - https://www.instagram.com/p/DblOcC6ime2/?igsh=ZjZhMjJkZzZtMWgz 
Data -https://drive.google.com/drive/folders/1zgMrbYIsMzuySVIqwSGHFTjz96QRJ6mS  
https://docs.google.com/document/d/10feSlcF5b10WG-S5RTLU_AkFun7zvNwc4Fl5ZAgx-9Y/edit?tab=t.qpikm1kka7m6 static 15','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',720,'2026-09-11 12:10:56'),
(5595,22,'2026-09-01','1 video changes',10,'Medium',NULL,'Not Started','','2026-09-11 06:40:56','2026-09-11 12:10:56','elix','Changes','','','Kartik','','','','','','Tuesday','','','google_sheet','1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0:1490653592',721,'2026-09-11 12:10:56');

select setval(pg_get_serial_sequence('public.users','id'), coalesce((select max(id) from public.users),1), true);
select setval(pg_get_serial_sequence('public.categories','id'), coalesce((select max(id) from public.categories),1), true);
select setval(pg_get_serial_sequence('public.tasks','id'), coalesce((select max(id) from public.tasks),1), true);

commit;
