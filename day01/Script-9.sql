select * from  lesson l
where l.departmentAffi ="인문대" /*인문대만 나오게 해주라*/

select *from lesson l 
where l.departmentHead ="채영일"

select * from lesson l 
where l.departmentAffi ="인문대" or l.departmentAffi ="미술대" /*인문대 또는 미술대*/

select * from lesson l 
where l.departmentNumber between 30 and 40;

select * from lesson l 
where l.departmentHead like "%안" 