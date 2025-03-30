# Cheat sheet

## Aventure

### Épisode 1

**Token.** 064.

Écrivez une requête SQL renvoyant le nom et l'adresse de ce M. Germain.

_Aide._ Utilisez l'opérateur `LIKE` sur la table `personne`.

**Formule**. `salt_064(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne
     , complément
     , numéro
     , voie
FROM personne A
WHERE personne LIKE "% Germain"
    AND sexe = "M"
    AND âge = 45
```

### Épisode 2

**Token.** 63758212138630.

Écrivez une requête donnant le nom des voisines.

_Aide._ Vous aurez besoin de la table `relation` qui, pour certaines personnes, donne la nature de leur relation avec certaines autres. Cette table est symétrique, c'est-à-dire par exemple que si la personne 1 est répertoriée comme fille des personnes 2 et 3, les personnes 2 et 3 sont également répertoriées comme père et mère de la personne 1.

**Formule**. `salt_002(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne_1
FROM relation A
WHERE personne_2 = "Henriette Beaugé"
    AND nature = "voisine"
```

### Épisode 3

**Token.** 136520204158016.


Extrayez de la table `relation` deux lignes comportant, à gauche le nom de l'infirmière et de sa sœur, et à droite celui du Dr. Vorzet.

_Aide._ La sœur de ma femme est ma ....-.....

**Formule**. `salt_048(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne_1
     , nature
     , personne_2
FROM relation A
WHERE (nature = "femme"
       OR nature = "belle-soeur")
    AND personne_2 LIKE "% Vorzet"
```

Variante. Avec l'opérateur d'appartenance `IN`.

```sql
SELECT personne_1
     , nature
     , personne_2
FROM relation A
WHERE nature IN ("femme"
               , "belle-sœur")
    AND personne_2 LIKE "% Vorzet"
```

### Épisode 4

**Token.** 277525249483034.

Donner le nom de ce patient, avec son numéro de lit.

_Aide._ Vous devez deviner le numéro du lit (stocké comme un entier), et rechercher qui est hospitalisé ce jour-là dans ce lit. Chaque ligne de la table `consultation` donne les noms d'un patient et du médecin qui l'a examiné. Si cette consultation a donné lieu à une hospitalisation, celle-ci se trouve dans la table `hospitalisation`, sous le même identifiant, avec les dates d'entrée et de sortie, ainsi que le numéro de lit. L'information étant répartie dans ces deux tables, vous avez besoin d'une jointure.

**Formule**. `salt_073(sum(nn(A.hash) + nn(B.hash)) OVER ()) AS token`

```sql
SELECT patient
     , lit
FROM consultation A
JOIN hospitalisation B USING (consultation)
WHERE lit = 13
    AND '1933-04-21' BETWEEN entrée AND sortie
```

### Épisode 5

**Token.** 253113982671323.

Dressez la liste du personnel de l'hôpital de Saint-Robin avec, pour chaque membre, sa fonction
dans l'établissement.

_Aide._ Pour chaque personne de la table `personne`, vous avez une clé étrangère vers la table `travail` qui va
vous permettre de retrouver le nom de son travail, ainsi que le site qui l'emploie. La formule du token n'utilise
qu'une table. De façon générale, pour laisser la possibilité d'écrire les jointures en imbriqué, seules les tables dont une colonne est projetée dans le SELECT seront mentionnées dans la formule du token.

**Formule**. `salt_060(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne
FROM personne A
JOIN travail B USING (id_travail)
WHERE site = "hôpital"
```

Variante. En imbriqué.

```sql
SELECT personne
FROM personne A
JOIN travail B USING (id_travail)
WHERE id_travail IN
        (SELECT id_travail
         FROM travail
         WHERE site = "hôpital" )
```

### Épisode 6

**Token.** 109535642974975.

Donnez la liste des accouchements assurés par le docteur Germain au cours des six dernières semaines
(avec le numéro et la date de la consultation, le nom et l'âge de la patiente) ordonnée par date croissante.
Le résultat vous permettra (facultativement) d'en déduire le nom de la fille de Mme Beaugé.

_Aide._ Vous avez besoin d'une jointure triple. Un accouchement est stocké comme une `consultation` dont
le `diagnostic` inclut « accouchement » dans la colonne `trouble`. Utilisez la fonction `SUBDATE()` pour
calculer proprement la date de début de cette période.

**Formule**. `salt_069(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

```sql
SELECT A.consultation
     , A.date
     , A.patient
     , B.âge
FROM consultation A
JOIN personne B ON patient = personne
JOIN diagnostic C USING (consultation)
WHERE docteur = "Rémy Germain"
    AND trouble = "accouchement"
    AND DATE BETWEEN subdate("1933-04-21", INTERVAL 6 WEEK) AND "1933-04-21"
ORDER BY date
```

```sql
SELECT A.consultation
     , A.date
     , A.patient
     , B.âge
FROM consultation A
JOIN personne B ON patient = personne
JOIN diagnostic C USING (consultation)
WHERE docteur = "Rémy Germain"
    AND trouble = "accouchement"
    AND DATE BETWEEN subdate("1933-04-21", INTERVAL 6 WEEK) AND "1933-04-21"
ORDER BY date
```

```sql
SELECT A.consultation
     , A.date
     , A.patient
     , B.âge
FROM consultation A
JOIN personne B ON patient = personne
JOIN diagnostic C USING (consultation)
WHERE docteur = "Rémy Germain"
    AND trouble = "accouchement"
    AND DATE BETWEEN subdate("1933-04-21", INTERVAL 6 WEEK) AND "1933-04-21"
ORDER BY date
```

### Épisode 7

**Token.** 76167014014923.

Quel patient du docteur Delorme présente ce pittoresque cas de gangrène ?

_Aide._ On s'intéresse à la date d'hospitalisation de ce patient, non à sa date de consultation.

**Formule**. `salt_090(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.patient
FROM consultation A
JOIN hospitalisation H USING (consultation)
JOIN diagnostic D USING (consultation)
WHERE H.entrée = "1933-04-21"
    AND A.docteur LIKE "% Delorme"
    AND D.trouble = "gangrène"
```

### Épisode 8

**Token.** 30286867277324.

Pourquoi François Boulin n'arrive-t-il pas à dormir ? Vous le saurez en listant les spécialités que
Germain lui a prescrites, mais qui ne sont pas ou plus disponibles à la pharmacie. Vous projetterez également
le stock correspondant.

_Aide._ La table `prescription` a pour clé primaire deux clés étrangères, l'une vers la table `consultation`,
l'autre vers la table `spécialité`. Celle-ci répertorie les différentes « spécialités » (ou médicaments), avec
éventuellement leur stock en pharmacie.

**Formule**. `salt_099(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.spécialité
     , A.stock
FROM consultation B
JOIN prescription C USING (consultation)
JOIN spécialité A USING (spécialité)
WHERE B.patient = "François Boulin"
    AND B.docteur = "Rémy Germain"
    AND (A.stock = 0
         OR A.stock IS NULL)
```

### Épisode 9

**Token.** 8030012698937.

Pour chaque habitant de l'école, donnez son adresse complète (incluant le complément, qui va donner l'appartement) et le nom de son travail (ou la chaîne vide s'il est sans travail).

_Aide._ La table `site` répertorie les établissements employant des gens de Saint-Robin. Vous y trouverez des adresses similaires à celles de `personne` (mais sans complément d'adresse). Pour afficher la chaîne vide, cherchez la documentation de la fonction `coalesce()`.

**Formule**. `salt_013(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

```sql
SELECT A.personne
     , coalesce(B.nom_travail, '') as travail
     , A.complément
     , A.numéro
     , A.voie
FROM personne A
LEFT JOIN travail B USING (id_travail)
JOIN site C USING (numéro , voie)
WHERE C.site = "école"
```

### Épisode 10

**Token.** 148086545142137.

Rolande habite en face de son lieu de travail. Dressez la liste de toutes les personnes qui sont dans le même cas (on considérera que deux bâtiments de la même rue se font face si leurs numéros diffèrent de 1 ou 3). La table devra comporter les colonnes suivantes : nom, âge, adresse du domicile, travail, site, adresse du travail. Chaque adresse consistera en la concaténation du numéro et de la rue.

_Aide._ Sous MySQL, la concaténation se fait avec une fonction `CONCAT()`.

**Formule**. `salt_093(sum(nn(A.hash) + nn(B.hash) + nn(C.hash)) OVER()) AS token`

```sql
SELECT personne
     , âge
     , concat(A.numéro, " ", A.voie) AS "adresse domicile"
     , B.nom_travail AS travail
     , C.site
     , concat(C.numéro, " ", C.voie) AS "adresse travail"
FROM personne A
JOIN travail B USING (id_travail)
JOIN site C USING (site)
WHERE A.voie = C.voie
    AND A.numéro - C.numéro IN (-3, -1, 1, 3)
```

### Épisode 11

**Token.** 112873126312901.

Quelles consultations (patient, date) du docteur Germain n'ont donné lieu au diagnostic d'aucun trouble ?

**Formule**. `salt_033(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.patient
     , A.date
FROM consultation A
LEFT JOIN diagnostic B USING (consultation)
WHERE A.docteur = "Rémy Germain"
    AND B.consultation IS NULL
```

### Épisode 12

**Token.** 139733827413451.

Pour la lire à votre tour, extrayez de la table `fragment` toutes les lignes dont l'identifiant est
divisible par celui de la lettre reçue ce jour-là par le docteur Germain, et triez-les par identifiant
décroissant.

_Aide._ La table `fragment` comporte l'ensemble des phrases des lettres du Corbeau, mais mélangées. Elle
n'est pas directement liée au reste de la base, et ne peut être exploitée que par des manipulations un peu
« tordues » comme celle-ci, qui vous seront révélées au fur et à mesure. Ici, vous avez besoin de la fonction
`MOD()`.

**Formule**. `salt_023(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.texte
FROM fragment A
JOIN lettre B ON mod(A.fragment, B.lettre) = 0
WHERE destinataire = "Rémy Germain"
    AND date = "1933-04-21"
ORDER BY fragment DESC
```

### Épisode 13

**Token.** 48452550811506.

Parmi les couples mariés, quelle est la différence d'âge maximale ?

_Aide._ Vous aurez besoin d'une auto-jointure (jointure d'une table avec elle-même), pour mettre sur la même ligne les âges requis pour le calcul des différences.

**Formule** (remplacez (0) par cette valeur). `salt_091((0) + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT max(A.âge - B.âge) AS "maximum"
FROM personne A
JOIN relation C ON A.personne = personne_1
JOIN personne B ON personne_2 = B.personne
WHERE nature = "mari"
```

Variante. Symétriquement.

```sql
SELECT max(abs(A.âge - B.âge)) AS "maximum"
FROM personne A
JOIN relation C ON A.personne = personne_1
JOIN personne B ON personne_2 = B.personne
WHERE nature = "femme"
```

### Épisode 14

**Token.** 21298768906624.

Combien de lettres anonymes ont été reçues jusqu'à ce jour (22 avril 1933) ?

**Formule** (remplacez (0) par ce nombre). `salt_092((0) + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT count(*) AS letters
FROM lettre A
WHERE date <= "1933-04-22"
```

### Épisode 15

**Token.** 59494493715131.

Pour connaître la suite de cette lettre, joignez les tables `fragment` et `consultation` sur leurs identifiants, en ne gardant que les neuf consultations les plus récentes du docteur Delorme.

_Aide._ Utilisez la clause `ORDER BY` pour trier les dates, et `LIMIT` pour n'afficher que le nombre de lignes voulu.

**Formule**. `salt_078(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.texte
FROM fragment A
JOIN consultation ON consultation = fragment
WHERE docteur = "Antoine Delorme"
    AND date <= "1933-04-27"
ORDER BY date DESC
LIMIT 9
```

### Épisode 16

**Token.** 17727469371145.

Pour connaître la suite de cette lettre, convertissez en binaire la somme des identifiants des métiers des filles d'Henri Bonnevie, et extrayez de la table `fragment` toutes les lignes dont l'identifiant en binaire se termine par les mêmes chiffres.

_Aide._ Utilisez la fonction `CONV(nombre_à_convertir, base_de_départ, base_d'arrivée)` qui renvoie une chaîne de caractères, ainsi que la fonction `CONCAT()` et l'opérateur `LIKE`.

**Formule**. `salt_010(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT texte
FROM fragment A
WHERE conv(fragment, 10, 2) LIKE
        (SELECT concat("%", conv(sum(id_travail), 10, 2))
         FROM relation R
         JOIN personne P ON personne_1 = personne
         WHERE nature = "fille"
             AND personne_2 = "Henri Bonnevie" )
```

### Épisode 17

**Token.** 155334593873678.

Quel pourcentage de la population de Saint-Robin aura été destinataire d'une ou plusieurs lettres du Corbeau jusqu'à ce mercredi 26 avril 1933 ?

**Formule** (remplacez (0) par la partie décimale de ce pourcentage (p. ex., 1415 pour 3.1415 %)). `salt_029((0) + bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

```sql
SELECT concat(100 * count(DISTINCT B.destinataire) / count(DISTINCT A.personne), " %") AS pourcentage
FROM personne A
LEFT JOIN lettre B ON A.personne = B.destinataire AND date <= '1933-04-26'
```

Variante. Avec produit cartésien (potentiellement moins efficace).

```sql
SELECT concat(100 * count(DISTINCT B.destinataire) / count(DISTINCT A.personne), " %") AS pourcentage
FROM personne A, lettre B
WHERE date <= "1933-04-26"
```

### Épisode 18

**Token.** 3717185854762268.

Combien le 18 rue de la mairie a-t-il compté de locataires de sexe masculin, au maximum ? On supposera pour simplifier que tous les anciens amants de Denise résident encore à Saint-Robin.

_Aide._ La table `amants` se concentre sur les relations illégitimes entre personnages. Au contraire de `relation`, elle ne comporte pas de doublons par symétrie. Notez le pluriel dans le nom de la table : chaque ligne comporte deux amants.

**Formule**. `salt_086(bit_xor(sum(nn(A.hash))) OVER()) AS token`

```sql
SELECT count(*) AS locataires
FROM amants A
WHERE "Denise Saillens" IN (personne_1, personne_2)
```

### Épisode 19

**Token.** 216542043023011.

À cette époque, un enfant dont les parents n'étaient pas mariés ensemble était dit « naturel ».

Donnez la liste des enfants naturels, avec pour chacun son père et sa mère.

**Formule**. `salt_045(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

```sql
SELECT A.personne_1 AS mère
     , A.personne_2 AS enfant
     , B.personne_1 AS père
FROM relation A
JOIN relation B USING (personne_2)
WHERE A.nature = 'mère'
    AND B.nature = 'père'
    AND (A.personne_1, 'femme', B.personne_1) NOT IN
        (SELECT personne_1, nature, personne_2
         FROM relation)
```

Variante. Avec `LEFT JOIN`.

```sql
SELECT A.personne_1 AS mère
     , A.personne_2 AS enfant
     , B.personne_1 AS père
FROM relation A
JOIN relation B USING (personne_2)
LEFT JOIN relation C ON A.personne_1 = C.personne_1 AND B.personne_1 = C.personne_2
WHERE A.nature = 'mère'
    AND B.nature = 'père'
    AND C.nature IS NULL
```

### Épisode 20

**Token.** 246283082308474.

Vérifiez que Vorzet est le doyen du corps médical, en d'autres termes, qu'il est le plus vieux des employés de l'hôpital.

**Formule**. `salt_012(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.personne
     , A.âge
FROM personne A
JOIN travail B USING (id_travail)
WHERE site = "hôpital"
    AND âge =
        (SELECT max(âge)
         FROM personne
         JOIN travail USING (id_travail)
         WHERE site = "hôpital" )
```

### Épisode 21

**Token.** 237752598059822.

Pour chaque médecin ayant couché avec au moins l'une des personnes qui l'ont consulté, affichez le nombre de celles-ci.

**Formule** (remplacez (0) par le plus grand de ces nombres). `salt_046((0) + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT A.docteur
     , count(DISTINCT A.patient) AS patients
FROM consultation A
JOIN amants ON patient IN (personne_1, personne_2)
                 AND docteur IN (personne_1, personne_2)
GROUP BY docteur
```

### Épisode 22

**Token.** 202700035033277.

Pour chaque patient, donner le nombre de médecins qu'il consulte. Triez par nombre de médecins décroissant et par patient croissant.

**Formule** (remplacez (0) par le plus grand de ces nombres). `salt_036((0) + bit_xor(sum(nn(A.hash)) * count(*)) OVER()) AS token`

```sql
SELECT patient
     , count(DISTINCT docteur) AS doctors
FROM consultation A
GROUP BY patient
ORDER BY doctors DESC, patient ASC
```

### Épisode 23

**Token.** 2152176172787.

Pour chaque nom de travail exercé par au moins 3 personnes, afficher la fourchette des âges de ces personnes (âges minimal et maximal, par exemple "29-44").

**Formule**. `salt_071(bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

```sql
SELECT B.nom_travail
     , concat(min(A.âge), "-", max(A.âge)) AS fourchette
FROM personne A
JOIN travail B USING (id_travail)
GROUP BY nom_travail
HAVING count(*) >= 3
ORDER BY nom_travail
```

### Épisode 24

**Token.** 217710522097188.

Dressez une liste de toutes les personnes de la ville avec, en face, leur nombre d'amants, trié par
nombre croissant, puis nom croissant. Vous inclurez les personnes n'ayant aucun amant, mais exclurez celles qui n'ont pas atteint l'âge de la majorité sexuelle.

**Formule** (remplacez (0) par la première personne ayant exactement un(e) amant(e)). `salt_018(string_hash('(0)') + bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

```sql
SELECT A.personne
     , count(B.personne_1) AS amants
FROM personne A
LEFT JOIN amants B ON personne IN (personne_1, personne_2)
WHERE âge >= 13
GROUP BY personne
ORDER BY amants, personne
```

### Épisode 25

**Token.** 146695421101260.

Pour connaître le contenu de la lettre, restreignez `fragment` aux textes dont l'identifiant est une sous-chaîne du cube de l'identifiant de la lettre reçue par François Boulin le 28 avril 1933.

_Aide._ Utilisez à nouveau la fonction `CAST()` pour convertir un type en un autre.

**Formule**. `salt_051(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT A.texte
FROM fragment A
JOIN lettre B ON cast(lettre * lettre * lettre AS char) LIKE concat("%", cast(fragment AS char), "%")
WHERE destinataire = "François Boulin"
    AND date = "1933-04-28"
```

### Épisode 26

**Token.** 216551102692560.

Donner, pour chaque médecin, le nombre de patients décédés qu'il a reçus pour leur ultime consultation, avec la liste de ceux-ci, le tout classé par nombres de patients décédés décroissants.

_Aide._ La table `personne` donne, pour chaque habitant de Saint-Robin, la date de son décès lorsqu'elle est connue. Utilisez `GROUP_CONCAT()` avec une virgule comme séparateur.

**Formule** (remplacez (0) par le nombre de patients décédés sur la première ligne.). `salt_004((0) + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT A.docteur
     , count(*) AS total
     , group_concat(DISTINCT A.patient SEPARATOR ", ") AS patients
FROM consultation A
JOIN personne B ON patient = personne
WHERE A.date = (
        SELECT max(date)
        FROM consultation
        WHERE patient = A.patient
      )
      AND date_décès IS NOT NULL
GROUP BY docteur
ORDER BY total DESC
```

Variante. Les sous-requêtes corrélées peuvent souffrir de mauvaises performances. Utilisez plutôt une CTE.

```sql
WITH dernière_consultation AS (
    SELECT patient, MAX(date) AS dernière_date
    FROM consultation
    GROUP BY patient
)
SELECT A.docteur
     , COUNT(*) AS total
     , GROUP_CONCAT(DISTINCT A.patient SEPARATOR ", ") AS patients
FROM consultation A
JOIN personne B ON A.patient = B.personne
JOIN dernière_consultation C ON A.patient = C.patient AND A.date = C.dernière_date
WHERE B.date_décès IS NOT NULL
GROUP BY A.docteur
ORDER BY total DESC;
```

### Épisode 27

**Token.** 56444350319188.

Pour savoir ce qu'ils ont lu, extrayez de la table `fragment` toutes les lignes dont l'identifiant se termine par l'identifiant de cette lettre dans `lettre`, sachant que celle-ci est découverte le 30 avril 1933 et n'a pas de destinataire.

**Formule**. `salt_019(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT texte
FROM fragment A
WHERE fragment LIKE (
    SELECT concat("%", lettre)
    FROM lettre A
    WHERE destinataire IS NULL
      AND date = "1933-04-30"
)
```

### Épisode 28

**Token.** 146354356040596.

Listez par ordre alphabétique les personnes qui, soit ont reçu au moins une lettre du Corbeau jusqu'au dimanche 30 avril 1933, soit sont officiellement en relation avec au moins une telle personne. Vous exploiterez le fait que la table `relation` est symétrique, et ne tiendrez pas compte des relations (illégitimes !) de la table `amants`.

_Aide._ Passez par deux CTE, l'une pour les destinataires, l'autre pour leurs connaissances.

**Formule**. `salt_035(sum(nn(A.hash)) OVER()) AS token`

```sql
WITH destinataires AS
    (SELECT destinataire
     FROM lettre
     WHERE date <= "1933-04-30" )
   , connaissances AS
    (SELECT personne_1
     FROM relation
     JOIN destinataires ON personne_2 = destinataire)
SELECT personne
FROM personne A
WHERE personne IN
        (SELECT destinataire
         FROM destinataires)
    OR personne IN
        (SELECT personne_1
         FROM connaissances)
```

### Épisode 29

**Token.** 147086758520779.

Afficher la liste des personnes à qui Rolande doit au moins 50 francs au 3 mai 1933, avec le montant de la dette correspondante, le tout trié par dette décroissante.

_Aide._ La table `emprunt` répertorie l'ensemble des dettes contractées par Rolande : à qui, quand et combien elle a emprunté, et éventuellement quand elle a rendu l'argent.

**Formule** (remplacez (0) par la dette de la première ligne, plus le nombre de lignes). `salt_015((0) + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT A.personne
     , sum(A.montant) AS dette
FROM emprunt A
WHERE date_emprunt <= '1933-05-03'
    AND (date_rendu > '1933-05-03'
         OR date_rendu IS NULL)
GROUP BY personne having(dette) >= 50
ORDER BY dette DESC
```

### Épisode 30

**Token.** 60086115509306.

Pour prendre connaissance de cette nouvelle lettre du Corbeau, extraire de la table `fragment` toutes les phrases apparaissant exactement deux fois.

**Formule**. `salt_089(bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
SELECT texte
FROM fragment A
GROUP BY texte
HAVING count(*) = 2
```

### Épisode 31

**Token.** 231782804999116.

Lister les paroissiens assistant à la messe ce jour-là.

_Aide._ La colonne `pratiquant` de la table `personne` indique si un paroissien est pratiquant, c'est-à-dire s'il va normalement à l'église tous les dimanches. Pour optimiser le stockage et vous donner un peu de fil à retordre, la table `assistance` ne liste que les exceptions à la pratique religieuse, à savoir, les dates auxquelles soit tel pratiquant était absent, soit tel non-pratiquant était présent.

**Formule**. `salt_061(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne
FROM personne A
WHERE pratiquant xor personne IN
        (SELECT personne
         FROM assistance A
         WHERE date = "1933-05-07" )
```

### Épisode 32

**Token.** 225758797168147.

Avec qui (nom, nom de travail) le directeur de la poste trompe-t-il sa femme ?

_Aide._ À titre exceptionnel et pour vous aider, toutes les tables de la jointure figurent dans la formule du token.

**Formule**. `salt_088(sum(nn(A.hash) + nn(B.hash) + nn(C.hash) + nn(D.hash) + nn(E.hash)) OVER()) AS token`

```sql
SELECT D.personne
     , E.nom_travail
FROM personne A
JOIN travail B ON A.id_travail = B.id_travail
JOIN amants C ON A.personne IN (personne_1, personne_2)
JOIN personne D ON D.personne IN (personne_1 , personne_2)
JOIN travail E ON D.id_travail = E.id_travail
WHERE B.nom_travail = "directeur"
    AND B.site = "poste"
    AND A.personne != D.personne
```

### Épisode 33

**Token.** 198610734269545.

Donnez la liste des conspirateurs, avec le nom de leur travail, le site où ils sont employés et enfin leur voie. Seule la table `personne` sera utilisée dans la formule du token.

**Formule**. `salt_030(sum(nn(A.hash)) OVER()) AS token`

```sql
WITH
    hommes_mariés AS (
        SELECT personne_1 as personne
        FROM relation
        WHERE nature = 'mari'
    ),
    employés_sur_place AS (
        SELECT personne, nom_travail, site, voie
        FROM personne P
        JOIN travail USING (id_travail)
        JOIN site S USING (site, voie)
    ),
    personnes_2 AS (
        SELECT personne
        FROM personne
        WHERE (complément, numéro, voie) IN (
            SELECT complément, numéro, voie
            FROM personne
            GROUP BY complément, numéro, voie
            HAVING count(*) = 2
        )
    )
SELECT A.personne
     , C.nom_travail
     , C.site
     , A.voie
FROM personne A
JOIN hommes_mariés B using (personne)
JOIN employés_sur_place C using (personne)
JOIN personnes_2 D using (personne)
```

Variante. Sans CTE.

```sql
SELECT A.personne
     , B.nom_travail
     , C.site
     , A.voie
FROM personne A
JOIN travail B USING (id_travail)
JOIN site C USING (site, voie)
WHERE A.personne IN (
        SELECT personne_1
        FROM relation
        WHERE nature = "mari"
    )
    AND (A.complément, A.numéro, A.voie) IN (
        SELECT complément, numéro, voie
        FROM personne
        GROUP BY complément, numéro, voie
        HAVING count(*) = 2
    )
```

### Épisode 34

**Token.** 90805938243861.

Affichez la liste des femmes qui n'ont aucun amant (comme la femme du médecin-chef) ou n'ont jamais manqué la messe (comme la femme du maire).

**Formule**. `salt_081(sum(nn(A.hash)) OVER ()) AS token`

```sql
SELECT personne
FROM personne A
LEFT JOIN assistance B USING (personne)
WHERE sexe = "F"
    AND ((pratiquant AND B.personne IS NULL)
         OR (personne NOT IN
                 (SELECT personne_1
                  FROM amants)
             AND personne NOT IN
                 (SELECT personne_2
                  FROM amants)))
```

### Épisode 35

**Token.** 155975930645834.

Quel est le nom de cette fillette ?

**Formule**. `salt_009(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

```sql
SELECT A.personne
     , A.âge
FROM personne A
JOIN relation B ON personne = personne_2
WHERE nature = "mère"
    AND (personne_1 IN
             (SELECT personne_1
              FROM amants)
         OR personne_1 IN
             (SELECT personne_2
              FROM amants))
    AND âge = 7
    AND sexe = "F"
```

### Épisode 36

**Token.** 251739877315743.

Vérifiez que Vorzet est le médecin qui prescrit le plus fréquemment une spécialité ne faisant pas partie des indications d'un trouble qu'il a diagnostiqué, et que cette spécialité est la morphine. Pour cela, vous listerez par ordre décroissant, pour chaque prescripteur et chaque spécialité prescrite mais non indiquée, le nombre de prescriptions concernées.

_Aide._ La table `indication` liste des couples de troubles et de spécialités : elle note que telle et telle spécialité est _indiquée_ pour traiter tel ou tel trouble.

**Formule**. `salt_057(bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

```sql
SELECT B.docteur
     , A.spécialité
     , count(*) AS prescriptions
FROM prescription A
JOIN consultation B USING (consultation)
WHERE spécialité NOT IN
        (SELECT spécialité
         FROM indication I
         JOIN diagnostic USING (trouble)
         WHERE consultation = A.consultation )
GROUP BY docteur, spécialité
ORDER BY prescriptions DESC
```

Variante. Avec l'opérateur EXISTS (conseillé).

```sql
SELECT B.docteur
     , A.spécialité
     , count(*) AS prescriptions
FROM prescription A
JOIN consultation B USING (consultation)
WHERE NOT EXISTS (
        SELECT 1
        FROM indication I
        JOIN diagnostic USING (trouble)
        WHERE consultation = A.consultation
          AND I.spécialité = A.spécialité
      )
GROUP BY docteur, spécialité
ORDER BY prescriptions DESC
```

### Épisode 37

**Token.** 100323367752641.

Listez les patients qui ont été hospitalisés en même temps que François Boulin, avec leurs dates d'entrée et de sortie.

**Formule**. `salt_042(sum(nn(A.hash) + nn(B.hash)) OVER()) AS token`

```sql
SELECT A.patient
     , B.entrée
     , B.sortie
FROM consultation A
JOIN hospitalisation B ON A.consultation = B.consultation
JOIN hospitalisation C ON B.entrée < C.sortie AND B.sortie > C.entrée
JOIN consultation D ON C.consultation = D.consultation
WHERE D.patient = 'François Boulin' AND A.patient != 'François Boulin'
ORDER BY A.patient
```

### Épisode 38

**Token.** 258311964244527.

Lister les personnes qui ont reçu une lettre du Corbeau le jour de leur mort, avec leur nom et la date.

**Formule**. `salt_054(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne
     , date_décès
FROM personne A
JOIN lettre B ON date = date_décès
WHERE A.personne = B.destinataire
```

Variante. La condition du WHERE est en fait une condition de jointure.

```sql
SELECT personne
     , date_décès
FROM personne A
JOIN lettre B ON date = date_décès AND A.personne = B.destinataire
```

### Épisode 39

**Token.** 63948705644169.

Quels amants de Denise Saillens sont décédés ?

**Formule**. `salt_047(sum(nn(A.hash)) OVER()) AS token`

```sql
SELECT personne
FROM personne A
JOIN amants B ON "Denise Saillens" IN (personne_1, personne_2)
                  AND personne IN (personne_1, personne_2)
WHERE date_décès IS NOT NULL
```

### Épisode 40

**Token.** 78824031526341.

Concaténez avec un séparateur vide le premier caractère de toutes les phrases de `fragment` dont l'identifiant coïncide avec celui d'une lettre reçue par Laura Vorzet.

**Formule**. `salt_014(bit_xor(sum(nn(A.hash)) + count(*)) OVER ()) AS token`

```sql
SELECT group_concat(substring(A.texte, 1, 1) SEPARATOR "") AS acrostiche
FROM fragment A
JOIN lettre B ON lettre = fragment
WHERE destinataire = "Laura Vorzet"
```

### Épisode 41

**Token.** 118173955981433.

Quelle est la différence d'âge moyenne au sein des couples dont la femme trompe son mari ?

**Formule** (remplacez (0) par la partie décimale de cette différence (p. ex., 1415 pour 3.1415)). `salt_017((0) + bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER()) AS token`

```sql
WITH
    couples_infidèles AS (
        SELECT DISTINCT R.personne_1 as femme_infidèle, R.personne_2 as mari_trompé
        FROM relation R
        JOIN amants L ON R.personne_1 IN (L.personne_1, L.personne_2)
        WHERE R.nature = "femme"
    )
SELECT abs(avg(A.âge - B.âge)) AS différence       
FROM couples_infidèles
JOIN personne A ON A.personne = femme_infidèle
JOIN personne B ON B.personne = mari_trompé
```

Variante. Avec l'opérateur d'appartenance `IN`, le `DISTINCT` devient inutile.

```sql
SELECT abs(avg(A.âge - B.âge)) AS différence       
FROM personne A, personne B
WHERE (A.personne, B.personne) IN (
        SELECT R.personne_1 as femme_infidèle, R.personne_2 as mari_trompé
        FROM relation R
        JOIN amants L ON R.personne_1 IN (L.personne_1, L.personne_2)
        WHERE R.nature = "femme"
    )
```

Variante. Avec une union.

```sql
SELECT abs(avg(A.âge - B.âge)) AS différence       
FROM relation R
JOIN personne A ON A.personne = R.personne_1
JOIN personne B ON B.personne = R.personne_2
WHERE R.nature = "femme"
    AND R.personne_1 IN
        (SELECT personne_1 FROM amants
         UNION ALL
         SELECT personne_2 FROM amants)
```

### Épisode 42

**Token.** 202552683166466.

Listez par dates croissantes les consultations ayant donné lieu au diagnostic d'un seul trouble et à la prescription de sérum névrosthénique. Colonnes attendues : date, patient, médecin, troubles (concaténation des troubles, pour permettre de vérifier qu'il y en a un seul).

**Formule** (remplacez (0) par la date de la première de ces consultations). `salt_067(string_hash('(0)') + bit_xor(sum(nn(A.hash) + nn(B.hash))) OVER ()) AS token`

```sql
SELECT B.date
     , B.patient
     , B.docteur
     , group_concat(A.trouble) AS troubles
FROM diagnostic A
JOIN consultation B USING (consultation)
JOIN prescription USING (consultation)
WHERE spécialité = 'Sérum névrosthénique'
GROUP BY B.date, B.patient, B.docteur
HAVING count(*) = 1
ORDER BY B.date
```

### Épisode 43

**Token.** 133385354248234.

Qui est le véritable Corbeau, sachant qu'il a pour patient exactement un amant de Denise ?

**Formule** (remplacez (0) par le Corbeau). `salt_087(string_hash('(0)') + bit_xor(sum(nn(A.hash))) OVER ()) AS token`

```sql
WITH
    amants_denise AS (
        SELECT personne_1 AS amant FROM amants WHERE personne_2 = "Denise Saillens"
        UNION ALL
        SELECT personne_2 AS amant FROM amants WHERE personne_1 = "Denise Saillens"
    )
SELECT docteur
FROM consultation A
JOIN amants_denise on patient = amant
GROUP BY docteur
HAVING count(DISTINCT patient) = 1
```

### Épisode 44

**Token.** 54254940905285.

Vous avez vaincu le Corbeau ! Vous êtes maintenant prêt à voler de vos propres SQL.
