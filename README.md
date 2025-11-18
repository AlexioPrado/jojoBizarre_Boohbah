# jojoBizarre_Boohbah

Question 1:
The error occured at the group by statement because one column, Name, needed to be grouped and since it wasnt, it caused an error.

Question 2:
The error occured because it had no bridge table. jojo_stand and boohbah do not have correlation and needs another table to connect them.

Question 3:
The boohbah table does not have a column name called boohbah_name. Therefore the query couldnt work. 

Question 4:
Query cannot identify which column is found in which table. Columns where ambiguously defined and caused the error.

Question 5:
The WHERE statement was redundant and unnecesarry since it was finding rows that meet the statement: boohbah_id = boohbah_id. Though it does not create an error, the use of the WHERE statement does not effect the output

Question 6:
The original query was comparing the energy level of a boohbah to multiple values of power from jojo stand where season equal 3. Comparing one value to multiple will cause an error.

Question 7:
boohbah_id and stand_id have no correlation, therefore the output displayed could be incorrect.

Question 8:
Using a group function in the WHERE clause is not allowed and will cause an error. It will require a sub query.

Question 9:
Incorrect order of columns in the subquery, allowing for unseen errors to arise.

Question 10:
jojo_stand and boohbah ids do not have any correlation, causing unseen errors. Therefore, replace jojo_stand with a table that does have correlation.