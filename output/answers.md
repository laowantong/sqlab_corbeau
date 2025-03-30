# Cheat sheet


## Aventure


### Question 1

**Token.** `call decrypt(35475034373353)`

Écrivez une requête SQL renvoyant le nom et l'adresse de ce M. Germain.   <br>_Aide._ Utilisez l'opérateur `LIKE` sur la table `person`.

```sql
SELECT person, complement, num, street
FROM person A
WHERE person LIKE "% Germain"
    AND sex = "M"
    AND age = 45
```

**Formule**. `salt_064(sum(A.hash) OVER()) AS token`

### Question 2

**Token.** `call decrypt(139825195129217)`

Écrivez une requête donnant le nom des voisines. <br>_Aide._ Vous aurez besoin de la table `relation` qui, pour certaines personnes, donne la nature de leur relation avec certaines autres. Cette table est symétrique, c'est-à-dire par exemple que si la personne 1 est répertoriée comme fille des personnes 2 et 3, les personnes 2 et 3 sont également répertoriées comme père et mère de la personne 1.

```sql
SELECT person_1
FROM relation A
WHERE person_2 = "Henriette Beaugé"
    AND nature = "voisine"
```

**Formule**. `salt_002(sum(A.hash) OVER()) AS token`

### Question 3

**Token.** `call decrypt(26814008885635)`

Extrayez de la table `relation` deux lignes comportant, à gauche le nom de l'infirmière et de sa sœur, et à droite celui du Dr. Vorzet. <br>_Aide._ La sœur de ma femme est ma _____-____.

```sql
SELECT person_1, nature, person_2
FROM relation A
WHERE (nature = "femme"
       OR nature = "belle-soeur")
    AND person_2 LIKE "% Vorzet"
```

**Formule**. `salt_048(sum(A.hash) OVER()) AS token`

**Variante**. Avec l'opérateur d'appartenance `IN`.

```sql
SELECT person_1, nature, person_2
FROM relation A
WHERE nature IN ("femme", "belle-sœur")
    AND person_2 LIKE "% Vorzet"
```


### Question 4

**Token.** `call decrypt(132632717410880)`

Qui est ce patient ? <br>_Aide._ Vous devez deviner le numéro du lit (stocké comme un entier), et rechercher qui est hospitalisé ce jour-là dans ce lit. Relisez le début de l'histoire si vous ne souvenez plus quel jour elle commence. Chaque ligne de la table `consultation` donne les noms d'un patient et du médecin qui l'a examiné. Si cette consultation a donné lieu à une hospitalisation, celle-ci se trouve dans la table `hospitalization`, sous le même identifiant, avec les dates d'entrée et de sortie, ainsi que le numéro de lit. L'information étant répartie dans ces deux tables, vous avez besoin d'une jointure.

```sql
SELECT patient
FROM consultation A
JOIN hospitalization B USING(consultation)
WHERE bed = 13
    AND "1933-04-21" BETWEEN check_in AND check_out
```

**Formule**. `salt_073(sum(A.hash + B.hash) OVER ()) AS token`

### Question 5

**Token.** `call decrypt(548639268795494)`

Dressez la liste du personnel de l'hôpital de Saint-Robin avec, pour chaque membre, sa fonction dans l'établissement. <br>_Aide._ Pour chaque personne de la table `person`, vous avez une clé étrangère vers la table `job` qui va vous permettre de retrouver le nom de son métier, ainsi que la structure qui l'emploie.

```sql
SELECT person
FROM person A
JOIN job B USING(job)
WHERE structure = "hôpital"
```

**Formule**. `salt_060(sum(A.hash) OVER()) AS token`

**Variante**. En imbriqué.

```sql
SELECT person
FROM person A
JOIN job B USING(job)
WHERE job in
        (SELECT job
         FROM job
         WHERE structure = "hôpital" )
```


### Question 6

**Token.** `call decrypt(1402152924966667)`

Donnez la liste des accouchements assurés par le docteur Germain au cours des six dernières semaines (avec le numéro et la date de la consultation, le nom et l'âge de la patiente) ordonnée par date croissante. Le résultat vous permettra (facultativement) d'en déduire le nom de la fille de Mme Beaugé. <br>_Aide._ Vous avez besoin d'une jointure triple. Un accouchement est stocké comme une `consultation` dont le `diagnostic` inclut « accouchement » dans la colonne `trouble`. Utilisez la fonction `SUBDATE()` pour calculer proprement la date de début de cette période.

```sql
SELECT A.consultation, A.date, A.patient, B.age
FROM consultation A
JOIN person B ON(patient = person)
JOIN diagnostic C USING(consultation)
WHERE doctor = "Rémy Germain"
    AND trouble = "accouchement"
    AND date BETWEEN subdate("1933-04-21", INTERVAL 6 WEEK) AND "1933-04-21"
ORDER BY date
```

**Formule**. `salt_069(sum(A.hash + B.hash) OVER()) AS token`

### Question 7

**Token.** `call decrypt(1491886236279858)`

Quel patient du docteur Delorme présente ce pittoresque cas de gangrène ? <br>_Aide._ On s'intéresse à la date d'hospitalisation de ce patient, non à sa date de consultation.

```sql
SELECT C.patient
FROM consultation C
JOIN hospitalization H USING(consultation)
JOIN diagnostic D USING(consultation)
WHERE H.check_in = "1933-04-21"
    AND C.doctor LIKE "% Delorme"
    AND D.trouble = "gangrène"
```

**Formule**. `salt_090(sum(C.hash) OVER()) AS token`

### Question 8

**Token.** `call decrypt(4759373510280)`

Pourquoi François Boulin n'arrive-t-il pas à dormir ? Vous le saurez en listant les spécialités que Germain lui a prescrites, mais qui ne sont pas ou plus disponibles à la pharmacie. Vous projetterez également le stock correspondant. <br>_Aide._ La table `prescription` a pour clé primaire deux clés étrangères, l'une vers la table `consultation`, l'autre vers la table `speciality`. Celle-ci répertorie les différentes « spécialités » (ou médicaments), avec éventuellement leur stock en pharmacie.

```sql
SELECT A.speciality, A.stock
FROM consultation B
JOIN prescription C USING (consultation)
JOIN speciality A USING (speciality)
WHERE B.patient = "François Boulin"
    AND B.doctor = "Rémy Germain"
    AND (A.stock = 0
         OR A.stock IS NULL)
```

**Formule**. `salt_099(sum(A.hash + B.hash + C.hash) OVER()) AS token`

### Question 9

**Token.** `call decrypt(1214408487456300)`

Pour chaque habitant de l'école, donnez son adresse complète (incluant le complément, qui va donner l'appartement) et sa profession (ou `NULL` s'il est sans profession). <br>_Aide._ La table `structure` répertorie les établissements employant des gens de Saint-Robin. Vous y trouverez des adresses similaires à celles de `person` (mais sans complément d'adresse).

```sql
SELECT person, name, complement, num, street
FROM person A
LEFT JOIN job B USING(job)
JOIN structure C USING(num, street)
WHERE C.structure = "école"
```

**Formule**. `salt_013(sum(nn(A.hash) + nn(B.hash) + nn(C.hash)) OVER()) AS token`

### Question 10

**Token.** `call decrypt(3600096053250317)`

Rolande habite en face de son lieu de travail. Dressez la liste de toutes les personnes qui sont dans le même cas (on considérera que deux bâtiments de la même rue se font face si leurs numéros diffèrent de 1 ou 3). La table devra comporter les colonnes suivantes : nom, âge, adresse du domicile, travail, structure, adresse du travail. Chaque adresse consistera en la concaténation du numéro et de la rue. <br>_Aide._ Sous MySQL, la concaténation se fait avec une fonction `CONCAT()`.

```sql
SELECT person, age, concat(A.num, " ", A.street) AS "adresse domicile", B.name AS travail, C.structure, concat(C.num, " ", C.street) AS "adresse travail"
FROM person A
JOIN job B USING(job)
JOIN structure C USING(structure)
WHERE A.street = C.street
    AND A.num - C.num in (-3, -1, 1, 3)
```

**Formule**. `salt_093(sum(A.hash + B.hash + C.hash) OVER()) AS token`

### Question 11

**Token.** `call decrypt(1862182707925787)`

Quelles consultations (patient, date) du docteur Germain n'ont donné lieu au diagnostic d'aucun trouble ?

```sql
SELECT A.patient, A.date
FROM consultation A
LEFT JOIN diagnostic B USING(consultation)
WHERE A.doctor = "Rémy Germain"
    AND B.consultation IS NULL
```

**Formule**. `salt_033(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

### Question 12

**Token.** `call decrypt(751951002843097)`

Pour la lire à votre tour, extrayez de la table `sentence` toutes les lignes dont l'identifiant est divisible par celui de la lettre reçue ce jour-là par le docteur Germain, et triez-les par identifiant décroissant. <br>_Aide._ La table `sentence` comporte l'ensemble des phrases des lettres du Corbeau, mais mélangées. Elle n'est pas directement liée au reste de la base, et ne peut être exploitée que par des manipulations un peu « tordues » comme celle-ci, qui vous seront révélées au fur et à mesure. Ici, vous avez besoin de la fonction `MOD()`.

```sql
SELECT text
FROM sentence A
JOIN letter B ON(mod(A.sentence, B.letter) = 0)
WHERE B.recipient = "Rémy Germain"
    AND B.date = "1933-04-21"
ORDER BY sentence DESC
```

**Formule**. `salt_023(sum(A.hash + B.hash) OVER()) AS token`

### Question 13

**Token.** `call decrypt(2034599770740825)`

Parmi les couples mariés, quelle est la différence d'âge maximale en valeur absolue ? <br>_Aide._ Vous aurez besoin d'une auto-jointure (jointure d'une table avec elle-même), pour mettre sur la même ligne les âges requis pour le calcul des différences.

```sql
SELECT max(abs(A.age - B.age)) AS "maximum"
FROM person A
JOIN relation C ON (A.person = person_1)
JOIN person B ON (person_2 = B.person)
WHERE nature = "mari"
```

**Formule** (remplacez l'emoji 👀 par cette valeur). `salt_091(👀 + sum(bit_xor(A.hash + B.hash + C.hash)) OVER ()) AS token`

**Variante**. Symétriquement.

```sql
SELECT max(abs(A.age - B.age)) AS "maximum"
FROM person A
JOIN relation C ON (A.person = person_1)
JOIN person B ON (person_2 = B.person)
WHERE nature = "femme"
```


### Question 14

**Token.** `call decrypt(8346859713932946)`

Combien de lettres anonymes ont été reçues jusqu'à ce jour (22 avril 1933) ?

```sql
SELECT count(*) AS letters
FROM letter A
WHERE date <= "1933-04-22"
```

**Formule**. `salt_091(sum(A.hash) + count(*) OVER ()) AS token`

### Question 15

**Token.** `call decrypt(928210439336594)`

Pour connaître la suite de cette lettre, joignez les tables `sentence` et `consultation` sur leurs identifiants, en ne gardant que les neuf consultations les plus récentes du docteur Delorme. <br>_Aide._ Utilisez la clause `ORDER BY` pour trier les dates, et `LIMIT` pour n'afficher que le nombre de lignes voulu.

```sql
SELECT B.text
FROM consultation A
JOIN sentence B ON (consultation = sentence)
WHERE doctor = "Antoine Delorme"
    AND date <= "1933-04-27"
ORDER BY date DESC
LIMIT 9
```

**Formule**. `salt_078(sum(A.hash + B.hash) OVER()) AS token`

### Question 16

**Token.** `call decrypt(7636881732328396)`

Pour connaître la suite de cette lettre, convertissez en binaire la somme des identifiants des métiers des filles d'Henri Bonnevie, et extrayez de la table `sentence` toutes les lignes dont l'identifiant en binaire se termine par les mêmes chiffres. <br>_Aide._ Utilisez la fonction `CONV(nombre_à_convertir, base_de_départ, base_d'arrivée)` qui renvoie une chaîne de caractères, ainsi que la fonction `CONCAT()` et l'opérateur `LIKE`.

```sql
SELECT text
FROM sentence A
WHERE conv(sentence, 10, 2) LIKE
        (SELECT concat("%", conv(sum(job), 10, 2))
         FROM relation R
         JOIN person P ON (person_1 = person)
         WHERE nature = "fille"
             AND person_2 = "Henri Bonnevie" )
```

**Formule**. `salt_010(sum(A.hash) OVER()) AS token`

### Question 17

**Token.** `call decrypt(872515681869408)`

Quel pourcentage de la population de Saint-Robin aura été destinataire d'une ou plusieurs lettres du Corbeau jusqu'à ce mercredi 26 avril 1933 ?

```sql
SELECT concat(100 * count(DISTINCT recipient) / count(DISTINCT person), " %") AS pourcentage
FROM person A
LEFT JOIN letter B ON (person = recipient
                       AND date <= "1933-04-26")
```

**Formule** (remplacez l'emoji 👀 par la partie décimale de ce pourcentage). `salt_029(👀 + sum(bit_xor(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

**Variante**. Avec produit cartésien.

```sql
SELECT concat(100 * count(DISTINCT B.recipient) / count(DISTINCT A.person), " %") AS pourcentage
FROM person A, letter B
WHERE date <= "1933-04-26"
```


### Question 18

**Token.** `call decrypt(41346104857895363)`

Combien le 18 rue de la mairie a-t-il compté de locataires de sexe masculin, au maximum ? On supposera pour simplifier que tous les anciens amants de Denise résident encore à Saint-Robin. <br>_Aide._ La table `lovers` se concentre sur les relations illégitimes entre personnages. Au contraire de `relation`, elle ne comporte pas de doublons par symétrie. Notez le pluriel dans le nom de la table : chaque ligne comporte deux amants.

```sql
SELECT count(*) AS locataires
FROM lovers A
WHERE "Denise Saillens" in (person_1, person_2)
```

**Formule**. `salt_086(sum(A.hash) + count(*) OVER()) AS token`

### Question 19

**Token.** `call decrypt(5640579605849479)`

À cette époque, un enfant dont les parents n'étaient pas mariés ensemble était dit « naturel ». Donnez la liste des enfants naturels, avec pour chacun son père et sa mère.

```sql
SELECT R1.person_1 AS mother, R1.person_2 AS child, R2.person_1 AS father
FROM relation R1
JOIN relation R2 ON(R1.person_2 = R2.person_2)
WHERE R1.nature = "mère"
    AND R2.nature = "père"
    AND (R1.person_1, "femme", R2.person_1) not in
        (SELECT person_1, nature, person_2
         FROM relation A)
```

**Formule**. `salt_045(sum(R1.hash + R2.hash) OVER()) AS token`

**Variante**. Avec `LEFT JOIN`.

```sql
SELECT R1.person_1 AS mother, R1.person_2 AS child, R2.person_1 AS father
FROM relation R1
JOIN relation R2 ON (R1.person_2 = R2.person_2)
LEFT JOIN relation R3 ON (R1.person_1 = R3.person_1
                          AND R2.person_1 = R3.person_2)
WHERE R1.nature = "mère"
    AND R2.nature = "père"
    AND R3.nature IS NULL
```


### Question 20

**Token.** `call decrypt(1291995708763182)`

Vérifiez que Vorzet est le doyen du corps médical, en d'autres termes, qu'il est le plus vieux des employés de l'hôpital.

```sql
SELECT person, age
FROM person A
JOIN job B USING(job)
WHERE structure = "hôpital"
    AND age =
        (SELECT max(age)
         FROM person
         JOIN job USING(job)
         WHERE structure = "hôpital" )
```

**Formule**. `salt_012(sum(A.hash + B.hash) OVER()) AS token`

### Question 21

**Token.** `call decrypt(122341303290277)`

Pour chaque médecin ayant couché avec au moins l'une des personnes qui l'ont consulté, affichez le nombre de celles-ci.

```sql
SELECT doctor, count(DISTINCT patient) AS patients
FROM consultation C
JOIN lovers L ON(patient in (person_1, person_2)
                 AND doctor in (person_1, person_2))
GROUP BY doctor
```

**Formule** (remplacez l'emoji 👀 par le plus grand de ces nombres). `salt_046(👀 + sum(bit_xor(C.hash + L.hash)) OVER ()) AS token`

### Question 22

**Token.** `call decrypt(1506443788874084)`

Pour chaque patient, donner le nombre de médecins qu'il consulte. Triez par nombre de médecins décroissant et par patient croissant.

```sql
SELECT patient, count(DISTINCT doctor) AS doctors
FROM consultation A
GROUP BY patient
ORDER BY doctors DESC, patient ASC
```

**Formule** (remplacez l'emoji 👀 par le plus grand de ces nombres). `salt_036(👀 + sum(bit_xor(A.hash)* count(*)) OVER()) AS token`

### Question 23

**Token.** `call decrypt(22846319067556395)`

Pour chaque nom de profession exercée par au moins 3 personnes, afficher la fourchette des âges de ces personnes (âges minimal et maximal).

```sql
SELECT name AS profession, concat(min(age), "-", max(age)) AS slice
FROM person A
JOIN job B USING(job)
GROUP BY name
HAVING count(*) > 2
ORDER BY profession
```

**Formule**. `salt_071(sum(bit_xor(A.hash + B.hash) + count(*)) OVER ()) AS token`

### Question 24

**Token.** `call decrypt(7345836686987604)`

Dressez une liste de toutes les personnes de la ville avec, en face, leur nombre d'amants, trié par nombre croissant. Vous inclurez les personnes n'ayant aucun amant, mais exclurez celles qui n'ont pas atteint l'âge de la majorité sexuelle.

```sql
SELECT person, count(person_1) AS num
FROM person A
LEFT JOIN lovers B ON person in (person_1, person_2)
WHERE age >= 13
GROUP BY person
HAVING num != 1
ORDER BY num
```

**Formule**. `salt_018(sum(bit_xor(nn(A.hash) + nn(B.hash))) OVER ()) AS token`
