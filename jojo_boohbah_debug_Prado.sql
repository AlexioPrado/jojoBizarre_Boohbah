
SELECT * FROM BOOHBAH_STAND_LINK;
SELECT * FROM JOJO_STAND;
SELECT * FROM BOOHBAH;

--Q1
SELECT boohbah_id, AVG(sync_level), name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
GROUP BY boohbah_id, name;

--Q2
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l
WHERE l.boohbah_id = b.boohbah_id AND l.stand_id = s.stand_id;

--Q3
SELECT name, color
FROM boohbah
WHERE energy_level > 80;

--Q4
SELECT b.boohbah_id, l.stand_id
FROM boohbah b JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;

--Q5
SELECT name
FROM boohbah b
WHERE energy_level > (SELECT AVG(energy_level) FROM boohbah);

--Q6
SELECT name
FROM boohbah
WHERE energy_level > (SELECT MAX(power)
                      FROM jojo_stand
                      WHERE season = 3);

--Q7
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l
WHERE l.boohbah_id = b.boohbah_id AND l.stand_id = s.stand_id AND b.energy_level > 80;

--Q8
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (SELECT AVG(sync_level)
                    FROM BOOHBAH_STAND_LINK);

--Q9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN (SELECT boohbah_id, stand_id
                                 FROM boohbah_stand_link);

--Q10
MERGE INTO boohbah b
USING boohbah_stand_link l
ON (l.boohbah_id = b.boohbah_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = b.energy_level + 10;

SELECT * FROM BOOHBAH;

