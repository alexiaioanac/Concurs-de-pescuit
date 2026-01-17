TYPE=VIEW
query=select `s`.`nume` AS `nume`,`s`.`prenume` AS `prenume`,`cs`.`Denumire` AS `concurs`,`cs`.`Localitate` AS `Localitate` from ((`concurs_pescuit2`.`sportivi` `s` join `concurs_pescuit2`.`participari` `p` on(`s`.`id` = `p`.`id_sportiv`)) join `concurs_pescuit2`.`concursuri` `cs` on(`p`.`id_concurs` = `cs`.`id`)) where `cs`.`id` in (1,2)
md5=1010aa359fbed00f57bb9bad167e5254
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001767629207486587
create-version=2
source=SELECT \n    s.nume, \n    s.prenume, \n    cs.Denumire AS concurs,\n    cs.Localitate\nFROM sportivi s\nJOIN participari p ON s.id = p.id_sportiv\nJOIN concursuri cs ON p.id_concurs = cs.id\nWHERE cs.id IN (1, 2)
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `s`.`nume` AS `nume`,`s`.`prenume` AS `prenume`,`cs`.`Denumire` AS `concurs`,`cs`.`Localitate` AS `Localitate` from ((`concurs_pescuit2`.`sportivi` `s` join `concurs_pescuit2`.`participari` `p` on(`s`.`id` = `p`.`id_sportiv`)) join `concurs_pescuit2`.`concursuri` `cs` on(`p`.`id_concurs` = `cs`.`id`)) where `cs`.`id` in (1,2)
mariadb-version=100432
