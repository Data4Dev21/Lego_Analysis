--Creating a view    
CREATE VIEW unique_sets AS
WITH UNIQUE_PARTS AS
(
SELECT p.part_num
      ,p.name as part_name
      --,s.name as set_name
      ,count(distinct i.set_num) as unique_set
      --,c.id
      --,i.id
      FROM TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_PARTS p
      join TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_INVENTORY_PARTS ip on p.part_num=ip.part_num
      join TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_INVENTORIES i on i.id=ip.inventory_id
     --join TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_SETS s on s.set_num=d.set_num
      group by 1,2
      having count(distinct i.set_num) = 1
      order by 1
 )     
SELECT s.name as set_name
      ,s.year
      ,t.name as theme
      ,count(up.part_num) as unique_parts
      ,count(p.name) as parts
      ,count(up.part_num)/count(p.name) as uniqueness 
    FROM TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_PARTS p
    JOIN TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_INVENTORY_PARTS ip on p.part_num = ip.part_num
    JOIN TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_INVENTORIES i on ip.inventory_id = i.id
    JOIN TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_SETS s on i.set_num = s.set_num
    LEFT JOIN TIL_PORTFOLIO_PROJECTS.MICHAEL_AP.LEGO_THEMES t on t.id = s.theme_id
