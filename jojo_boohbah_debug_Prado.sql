
SELECT * FROM BOOHBAH_STAND_LINK;
SELECT * FROM JOJO_STAND;
SELECT * FROM BOOHBAH;

--Q1
SELECT boohbah_id, AVG(sync_level) name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
GROUP BY boohbah_id;

--Q2
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l
WHERE l.boohbah_id = b.boohbah_id AND l.stand_id = s.stand_id;
--b.boohbah and s.stand_id have no relation
--Joined boohbah_standlink to compare columns

--Q3
SELECT name, color
FROM boohbah
WHERE energy_level > 80;
--Fixed name of column: boohbah_name --> name
--Invalid identifier

--Q4
SELECT b.boohbah_id, l.stand_id
FROM boohbah b JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;
--Columns ambiguously defined
--Added aliases to columns in the select and where statements

--Q5
SELECT name
FROM boohbah b
WHERE energy_level > (SELECT AVG(energy_level) FROM boohbah);
--Where Statement is uneccesary WHERE boohbah_id = boohbah_id
--Removed where statement

--Q6
SELECT name
FROM boohbah
WHERE energy_level > (SELECT MAX(power)
                      FROM jojo_stand
                      WHERE season = 3);
--Comparing a single column with multiple values
--Set Power to finding the MAX
--Note: Outputs nothing

--Q7
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l
WHERE l.boohbah_id = b.boohbah_id AND l.stand_id = s.stand_id AND b.energy_level > 80;
-- boohbah_id in boohbah and stand_id in jojo_stand has no correlation
-- used boohbah_stand_link to connect them properly

--Q8
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (SELECT AVG(sync_level)
                    FROM BOOHBAH_STAND_LINK);
--Group function is not allowed
--Create a subquery taking the avg of sync_levels from boohbah_stand_link

--Q9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN (SELECT boohbah_id, stand_id
                                 FROM boohbah_stand_link);
--Incorrect order of columns in subquery
--Switched columns

--Q10
MERGE INTO boohbah b
USING boohbah_stand_link l
ON (l.boohbah_id = b.boohbah_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = b.energy_level + 10;
--jojo_stand does not relate to boohbah
--replace jojo_stand with boohbah_stand_link since this tabe does correlate

SELECT * FROM BOOHBAH;

