USE adlister_db;


Insert into ads
  (user_id, title, description, date_created) values
  (27, 'playstation for sale', 'This is a slightly used playstation', curdate()),
  (27, 'Super Nintendo', 'Get your game on with this old-school classic!', curdate()),
  (28, 'Junior Java Developer Position', 'Minimum 7 years of experience required. You will be working in the scripting language for Java, JavaScript', curdate()),
  (29, 'JavaScript Developer needed', 'Must have strong Java skills', curdate()),
  (27,'Selling wedding ring','I purchased this for my wife but she didnt like it', curdate()),
  (28, 'Trading golfing equipment','Golf clubs with golf bag (great condition, no rips or tears), golf balls, tees, practice golf balls. Clubs are : 2 drivers; irons 4 thru 9; a pitching wedge, and a putter. All in used but good condition. Looking to make trade for outdoors sports equipment (ie kayak, fishing gear, etc..) or camping gear or hiking gear.', curdate());


insert into categories (name) value
  ('Art'),
  ('Cars'),
  ('Computers'),
  ('Electronics'),
  ('Furniture'),
  ('IT Services'),
  ('Jewelery'),
  ('Other'),
  ('Sports'),
  ('Trade');