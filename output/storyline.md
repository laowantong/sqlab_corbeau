
L'histoire commence le 21 avril 1933 à Saint-Robin, une petite ville de province, ici ou ailleurs… M. Germain, 45 ans, est notre personnage principal.

<details><summary>Énoncé</summary>Écrivez une requête SQL renvoyant le nom et l'adresse de ce M. Germain.

_Aide._ Utilisez l'opérateur `LIKE` sur la table `personne`.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>complément</th>
            <th>numéro</th>
            <th>voie</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Rémy Germain</td>
            <td>app. 5</td>
            <td>18</td>
            <td>rue de la Mairie</td>
            <td>63758212138630</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


La première scène se déroule dans une cour de ferme. Il y a là une vieille femme vêtue de noir, Mme Henriette Beaugé. Des voisines sont à ses côtés. Elles ne parlent pas. Elles sont à l'écoute de tous les bruits qui viennent de la maison. 

Enfin un homme sort de la maison, l'air grave. C'est Germain. Ses mains et ses poignets sont tachés de sang. Il les plonge dans une barrique pleine d'eau et les frotte en silence. La grand-mère s'est levée. Elle vient à lui à petits pas, lui apportant son chapeau et sa redingote.

— La mère est sauvée, lâche-t-il.<br>
— Et l'enfant ?

Il la regarde dans les yeux, met son chapeau, secoue la tête.

— Non.<br>
— Mon Dieu, docteur... Vous n'avez pas fait ça ?<br>
— Je l'ai fait, répond-il. En conscience.  

Après un moment, il reprend :  

— Si vous tenez à avoir un petit-fils... Dans... dans six ou huit mois — mais pas avant, hein ! — vous demanderez à votre gendre de lui en faire un autre.

Les deux voisines, restées un peu en retrait, commentent à mi-voix :  

— Il a déjà eu du mal la première fois...<br>
— Il se fera aider par un voisin !

<details><summary>Énoncé</summary>Écrivez une requête donnant le nom des voisines.

_Aide._ Vous aurez besoin de la table `relation` qui, pour certaines personnes, donne la nature de leur relation avec certaines autres. Cette table est symétrique, c'est-à-dire par exemple que si la personne 1 est répertoriée comme fille des personnes 2 et 3, les personnes 2 et 3 sont également répertoriées comme père et mère de la personne 1.<br><br>

<table>
    <thead>
        <tr>
            <th>personne_1</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Félicie François</td>
            <td>136520204158016</td>
        </tr>
        <tr>
            <td>Liliane Touraine</td>
            <td>136520204158016</td>
        </tr>
</table>
Total: 2 rows affected.

</details><br>


Le médecin est rentré dans sa voiture. Avant de démarrer, il prend les mains de la vieille femme :  

— Ne pleurez pas, grand-mère. Vous gardez votre fille. C'est l'essentiel.

Pendant ce temps, dans la salle commune de l'hôpital de Saint-Robin, une infirmière à l'air revêche vient poser un verre sur la table de chevet d'un jeune homme. Celui-ci tente péniblement de le prendre.

— Quand vous aurez fini de gémir, lui lance-t-elle...<br>
— Je ne peux pas me relever...<br>
— Eh bien, restez couché ! dit-elle en quittant la salle.  

Une autre employée se trouve là, les bras chargés de livres qu'elle distribue aux malades. C'est l'épouse du docteur Vorzet, qui dirige le service des aliénés. Elle s'approche et, avec beaucoup de douceur, aide le malade à se redresser. Il la prend à témoin :

— C'est une méchante femme.<br>
— Allons... Ne parlez pas ainsi. C'est ma sœur.<br>
— Pardon... c'est une méchante sœur.<br>
— Non, c'est une malheureuse... Elle l'a toujours été.

<details><summary>Énoncé</summary>
Extrayez de la table `relation` deux lignes comportant, à gauche le nom de l'infirmière et de sa sœur, et à droite celui du Dr. Vorzet.

_Aide._ La sœur de ma femme est ma ....-.....<br><br>

<table>
    <thead>
        <tr>
            <th>personne_1</th>
            <th>nature</th>
            <th>personne_2</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Laura Vorzet</td>
            <td>femme</td>
            <td>Michel Vorzet</td>
            <td>277525249483034</td>
        </tr>
        <tr>
            <td>Marie Corbin</td>
            <td>belle-sœur</td>
            <td>Michel Vorzet</td>
            <td>277525249483034</td>
        </tr>
</table>
Total: 2 rows affected.

</details><br>




— Tenez, vous lirez ça ce soir, dit Laura Vorzet.  

Le malade regarde distraitement la couverture du livre qu'elle lui apporte. Et, à brûle-pourpoint :

— Madame... Est-ce que... est-ce que votre mari pourrait me faire changer de lit ?<br>
— De lit ?<br>
— Oui, le mien a ce numéro qui porte malheur... Si je reste ici, il m'arrivera quelque chose.

_Rappel._ Nous sommes le 21 avril 1933.

<details><summary>Énoncé</summary>Donner le nom de ce patient, avec son numéro de lit.

_Aide._ Vous devez deviner le numéro du lit (stocké comme un entier), et rechercher qui est hospitalisé ce jour-là dans ce lit. Chaque ligne de la table `consultation` donne les noms d'un patient et du médecin qui l'a examiné. Si cette consultation a donné lieu à une hospitalisation, celle-ci se trouve dans la table `hospitalisation`, sous le même identifiant, avec les dates d'entrée et de sortie, ainsi que le numéro de lit. L'information étant répartie dans ces deux tables, vous avez besoin d'une jointure.<br><br>

<table>
    <thead>
        <tr>
            <th>patient</th>
            <th>lit</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>François Boulin</td>
            <td>13</td>
            <td>253113982671323</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


— Ne dites pas de sottises, dit Laura avec un sourire... Tenez, voilà votre mère qui vous rend visite. Je vous laisse.

Le visage de l'homme s'est éclairé.

— Bonjour, maman.<br>
— Bonjour, François.  

Elle l'embrasse.  

— Oh ! tu as le visage en sueur. Comment vas-tu ? Tiens, je t'ai apporté un nouveau rasoir.

Il prend l'objet entre ses mains, l'ouvre. Il pose le fil de la lame sur son ongle et entreprend de le tailler.

----

En sortant de la salle commune, Laura Vorzet est tombée sur sa sœur :

— Marie, pourquoi es-tu si désagréable avec les malades ?  <br>
— Pourquoi es-tu si aimable avec le docteur Germain ?  <br>
— Qu'est-ce que tu dis ?  <br>
— Je dis que depuis quelque temps, on te voit beaucoup trop dans son service. Je le signalerai à Michel quand il rentrera.  <br>
— Mon mari est au courant et il trouve ça très bien.  <br>
— D'autres trouvent ça très mal.  <br>
— Mais enfin, tout de même, c'est mon devoir : je suis assistante sociale !<br>
— Tu es une traînée !  

À ce moment, la porte s'ouvre. Elles se taisent. C'est le docteur Germain. Il les salue, traverse le corridor et entre dans le bureau d'un confrère.

<details><summary>Énoncé</summary>Dressez la liste du personnel de l'hôpital de Saint-Robin avec, pour chaque membre, sa fonction
dans l'établissement.

_Aide._ Pour chaque personne de la table `personne`, vous avez une clé étrangère vers la table `travail` qui va
vous permettre de retrouver le nom de son travail, ainsi que le site qui l'emploie. La formule du token n'utilise
qu'une table. De façon générale, pour laisser la possibilité d'écrire les jointures en imbriqué, seules les tables dont une colonne est projetée dans le SELECT seront mentionnées dans la formule du token.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Antoine Delorme</td>
            <td>109535642974975</td>
        </tr>
        <tr>
            <td>Georges Massard</td>
            <td>109535642974975</td>
        </tr>
</table>
Total: 12 rows affected.

</details><br>




— Alors ? dit le docteur Bertrand à l'entrée de son confrère.<br>
— J'ai sauvé la mère.<br>
— Encore ?  <br>
— Pourquoi, encore ?  <br>
— C'est la troisième fois en six semaines.  <br>
— Si vous ne me faites pas confiance, pourquoi vous décharger sur moi de ces consultations ?  <br>
— Oh ! rassurez-vous : je ne vous imposerai plus ce dérangement !  

<details><summary>Énoncé</summary>Donnez la liste des accouchements assurés par le docteur Germain au cours des six dernières semaines
(avec le numéro et la date de la consultation, le nom et l'âge de la patiente) ordonnée par date croissante.
Le résultat vous permettra (facultativement) d'en déduire le nom de la fille de Mme Beaugé.

_Aide._ Vous avez besoin d'une jointure triple. Un accouchement est stocké comme une `consultation` dont
le `diagnostic` inclut « accouchement » dans la colonne `trouble`. Utilisez la fonction `SUBDATE()` pour
calculer proprement la date de début de cette période.<br><br>

<table>
    <thead>
        <tr>
            <th>consultation</th>
            <th>date</th>
            <th>patient</th>
            <th>âge</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>41528</td>
            <td>1933-03-20</td>
            <td>Fanny Molyneux</td>
            <td>40</td>
            <td>75996846005486</td>
        </tr>
        <tr>
            <td>34299</td>
            <td>1933-04-01</td>
            <td>Juliette Yvain</td>
            <td>26</td>
            <td>75996846005486</td>
        </tr>
</table>
Total: 5 rows affected.

</details><br>


À ce moment, le docteur Delorme entre à son tour dans le bureau.

— Encore en train de vous chamailler ?<br>
— Ah ! M. le Directeur, jugez plutôt... commence le docteur Bertrand.<br>
— Oh, non, non ! Ne me mêlez pas à vos bisbilles. Tenez. J'ai rentré ce matin un cas de gangrène tout à fait pittoresque... Le tibia est sorti de la jambe de plus de dix centimètres !<br>
— Dix centimètres ! s'exclame le docteur Bertrand. Vous blaguez ?<br>
— Si je vous le dis ! Allez, au lieu de vous disputer, venez tous les deux avec moi.<br>
— Je vous demande pardon, M. le Directeur, répond le docteur Germain, mais je ne suis guère amateur de blagues.<br>
— Tant pis pour vous. Le docteur Bertrand profitera seul du spectacle. Mais vous le regretterez !<br>
— J'en suis sûr, fait Germain.<br>
— Vous allez voir, mon cher Bertrand, c'est tordant !

<details><summary>Énoncé</summary>Quel patient du docteur Delorme présente ce pittoresque cas de gangrène ?

_Aide._ On s'intéresse à la date d'hospitalisation de ce patient, non à sa date de consultation.<br><br>

<table>
    <thead>
        <tr>
            <th>patient</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Henriette Lagarde</td>
            <td>30286867277324</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


En passant devant la buanderie de l'hôpital, le docteur Germain regarde machinalement par le carreau de la porte. Il aperçoit Marie Corbin qui sort une lettre de son enveloppe. Il fait irruption dans la pièce.

— Eh bien, ne vous gênez pas ! Donnez-moi ça.

Il prend la lettre et la déchire.

— Vous laissez tout un tas de paperasse dans vos poches, se défend l'infirmière. Il faut bien que je change votre correspondance de blouse si vous ne voulez pas qu'elle aille à l'étuve.<br>
— Je ne vous demande pas de la lire.<br>
— Et moi, je ne vous demande pas pourquoi vous écrivez à ma sœur, répond-elle sans se démonter.<br>
— Vous êtes chargée de la surveiller ?<br>
— Ce que j'en dis, c'est pour vous : Laura est une petite vipère.<br>
— Pas pendant le service, voulez-vous ?

Et, changeant de sujet :

— Le 13 se plaint de ne pas dormir.

<details><summary>Énoncé</summary>Pourquoi François Boulin n'arrive-t-il pas à dormir ? Vous le saurez en listant les spécialités que
Germain lui a prescrites, mais qui ne sont pas ou plus disponibles à la pharmacie. Vous projetterez également
le stock correspondant.

_Aide._ La table `prescription` a pour clé primaire deux clés étrangères, l'une vers la table `consultation`,
l'autre vers la table `spécialité`. Celle-ci répertorie les différentes « spécialités » (ou médicaments), avec
éventuellement leur stock en pharmacie.<br><br>

<table>
    <thead>
        <tr>
            <th>spécialité</th>
            <th>stock</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Morphine</td>
            <td>0</td>
            <td>8030012698937</td>
        </tr>
        <tr>
            <td>Rayons X</td>
            <td>None</td>
            <td>8030012698937</td>
        </tr>
</table>
Total: 2 rows affected.

</details><br>




— Le 13 ? dit Marie Corbin... Ah ! le cancer du foie ? Bah, il en a pour quinze jours, et encore...<br>
— Vous lui donnez bien sa morphine ?<br>
— À quoi bon ? Je lui en ai donné le premier jour, il ne s'en est même pas aperçu.<br>
— Je ne vous ai pas dit d'arrêter la série !<br>
— Je lui mets de l'eau distillée, ça lui fait le même effet.<br>
— Malheureusement pour vous, je viens de la pharmacie : toutes les ampoules ont disparu. J'ignore si vous les employez à votre usage personnel ou si vous les revendez, mais il faudra les retrouver avant demain matin !<br>
— Écoutez, docteur...<br>
— Non ! Demain matin.  

Il sort de l'hôpital pour rentrer chez lui.

<details><summary>Énoncé</summary>Pour chaque habitant de l'école, donnez son adresse complète (incluant le complément, qui va donner l'appartement) et le nom de son travail (ou la chaîne vide s'il est sans travail).

_Aide._ La table `site` répertorie les établissements employant des gens de Saint-Robin. Vous y trouverez des adresses similaires à celles de `personne` (mais sans complément d'adresse). Pour afficher la chaîne vide, cherchez la documentation de la fonction `coalesce()`.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>travail</th>
            <th>complément</th>
            <th>numéro</th>
            <th>voie</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Denise Saillens</td>
            <td></td>
            <td>app. 6</td>
            <td>18</td>
            <td>rue de la Mairie</td>
            <td>148086545142137</td>
        </tr>
        <tr>
            <td>Françoise Mespoulhé</td>
            <td>institutrice</td>
            <td>app. 3</td>
            <td>18</td>
            <td>rue de la Mairie</td>
            <td>148086545142137</td>
        </tr>
</table>
Total: 9 rows affected.

</details><br>


À la grille, le directeur de l'école, Noël Saillens, accueille les enfants qui reviennent pour les classes de l'après-midi.

— Bonjour M. le directeur, dit un petit en mordant dans une tartine.<br>
— Bonjour, Philippe. Tu n'as donc pas déjeuné ?<br>
— Si, monsieur.<br>
— Alors, qu'est-ce que tu fais ?<br>
— Je commence à goûter !

Le directeur sourit. Il avise M. Germain qui passe devant la grille.

— Ah ! docteur ! Excusez-moi...<br>
— Je vous en prie...<br>
— J'ai quelqu'un de malade chez moi.<br>
— Rolande ?<br>
— Non, ma sœur.<br>
— Ah ?<br>
— En montant chez vous, vous pourriez peut-être frapper à sa porte. Ça ne vous ennuie pas ?<br>
— Pas du tout. Je suis médecin.

D'un coup de poing, Germain renvoie un ballon qui a manqué de faire tomber son chapeau.

— Dis donc, toi ! Tu veux que j'aille te tirer les oreilles ?<br>
— Eh bien, Fernand, fais un peu attention !

Et, à l'intention du docteur :

— Ils sont jeunes...<br>
— Ouais...<br>
— Vous n'aimez pas les enfants ?<br>
— Pas trop.<br>
— Et vous êtes venu habiter chez un directeur d'école !<br>
— Le destin !

En arrivant à la porte, celle-ci s'ouvre devant lui.

— Alors, Rolande, vous jouez la concierge ?

C'est la fille du directeur. L'adolescente baisse les yeux derrière ses grosses lunettes.

— Non, docteur. Je me trouvais là... par hasard, et... je vous ai vu venir.<br>
— Votre tante est malade ?<br>
— Denise ? Ouais... Il paraît, répond-elle avec un air plein de sous-entendus.

Germain prend l'escalier.

— Ah ! Docteur, lui crie-t-elle. On a apporté une lettre pour vous ce matin. Je l'ai laissée sur votre bureau. Il n'y a pas de nom d'expéditeur.<br>
— Merci.

<details><summary>Énoncé</summary>Rolande habite en face de son lieu de travail. Dressez la liste de toutes les personnes qui sont dans le même cas (on considérera que deux bâtiments de la même rue se font face si leurs numéros diffèrent de 1 ou 3). La table devra comporter les colonnes suivantes : nom, âge, adresse du domicile, travail, site, adresse du travail. Chaque adresse consistera en la concaténation du numéro et de la rue.

_Aide._ Sous MySQL, la concaténation se fait avec une fonction `CONCAT()`.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>âge</th>
            <th>adresse domicile</th>
            <th>travail</th>
            <th>site</th>
            <th>adresse travail</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Elisabeth Chromo</td>
            <td>55</td>
            <td>35 allée des Ormes</td>
            <td>photographe</td>
            <td>L'Écho des Robinais</td>
            <td>34 allée des Ormes</td>
            <td>112873126312901</td>
        </tr>
        <tr>
            <td>Raymond Cogoluègnes</td>
            <td>31</td>
            <td>20 rue de la Mairie</td>
            <td>postier</td>
            <td>poste</td>
            <td>19 rue de la Mairie</td>
            <td>112873126312901</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


Note historique : Rolande est employée au guichet de la poste. En France, l'interdiction d'employer un enfant de moins de 16 ans remonte à 1959. À l'époque où se déroule notre récit, l'âge minimum était de 14 ans.

Le docteur frappe chez Denise Saillens.

— Bonjour, mademoiselle.<br>
— Bonjour.

Les cris des enfants qui jouent montent de la cour. Il va fermer la fenêtre.

— Vous pouvez la laisser ouverte, dit la jeune femme. L'air me fait du bien.<br>
— Ce n'est pas pour vous, c'est pour moi. Ces piaillements m'exaspèrent... Vous vous parfumez ?<br>
— Ça ne vous plaît pas ?<br>
— J'aurais dû laisser la fenêtre ouverte. Alors ? D'où souffrez-vous ?<br>
— D'un peu partout. Je tousse, j'ai la fièvre et une espèce de lassitude... Et comme un point dans le dos ! En haut et à gauche.<br>
— Ici ?<br>
— Oui.<br>
— Ou là ?<br>
— C'est-à-dire...<br>
— Peut-être entre les deux ?<br>
— Peut-être...<br>
— Je vais vous ausculter, déshabillez-vous. Le lainage, seulement. Respirez. Toussez. Encore. Dites 33.<br>
— 33 ! 33 ! 33 !<br>
— Moins fort.<br>
— 33. 33. 33.<br>
— Bon, étendez-vous. Vous avez un mouchoir ?<br>
— La chemise ne suffit pas ?<br>
— Non. Peu importe. Je prendrai le mien.

Il étend le mouchoir sur la poitrine de Denise, puis y colle son oreille.

— Respirez. Encore... Normalement ! Respirez normalement.<br>
— Vous voyez ce que j'ai ?<br>
— Parfaitement.

Il se redresse.

— Vous n'avez rien.<br>
— Je ne suis pas malade, moi ?<br>
— Vous vouliez juste vous faire ausculter. Mais pour ce genre d'auscultation, ce n'est pas un médecin qu'il faut appeler. Pas moi en tout cas ! Au revoir, mademoiselle.<br>
— Joseph, va ! lui lance-t-elle au moment où il va sortir.<br>
— Je m'appelle Rémy.

---

_Note._ Denise fait une référence moqueuse à Joseph, fils de Jacob, qui dans le récit biblique repousse les avances de la femme d'un officier de Pharaon auquel il a été vendu comme esclave.

<details><summary>Énoncé</summary>Quelles consultations (patient, date) du docteur Germain n'ont donné lieu au diagnostic d'aucun trouble ?<br><br>

<table>
    <thead>
        <tr>
            <th>patient</th>
            <th>date</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Juliette Yvain</td>
            <td>1932-07-25</td>
            <td>139733827413451</td>
        </tr>
        <tr>
            <td>Denise Saillens</td>
            <td>1933-04-21</td>
            <td>139733827413451</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


En sortant de l'appartement, il rencontre Laura Vorzet qui monte rapidement l'escalier.

— J'étais venue apporter des journaux de mode à Denise.<br>
— Vous pouvez y aller.<br>
— Elle n'a rien de grave au moins ? Je ne vais pas la fatiguer ?<br>
— Rassurez-vous, vous ne la fatiguerez pas.

Elle frappe à la porte.

— C'est toi ? lui crie Denise. Entre !

La main sur la poignée, la jeune femme semble se raviser.

— Attendez, dit-elle au docteur. Je ne vais pas jouer la comédie. C'est vous que je voulais voir. Les journaux de mode n'étaient qu'un prétexte.<br>
— Mais... vous n'aviez pas besoin de prétexte.<br>
— Vous croyez ? Eh bien, vous vous trompez. C'était peut-être vrai hier, ça ne l'est plus aujourd'hui... Et par votre faute !<br>
— Par ma faute ? Je ne comprends pas.<br>
— Oh ! vous êtes un ami réservé, docteur, très réservé. Mais il vous est sans doute arrivé de dire ou de laisser dire quelque chose sur mon compte, n'est-ce pas ?<br>
— Moi ?<br>
— Il paraît que nous profitons de nos rencontres à l'hôpital pour... pour prendre des rendez-vous secrets. On m'accuse d'être votre maîtresse.<br>
— Quoi ! Qui vous accuse ?<br>
— J'ai reçu au courrier de midi une lettre anonyme, une lettre ignoble. Vous comprendrez maintenant que je sois obligée de vous éviter.

Sur ces mots, elle entre chez Denise. Le docteur Germain est décontenancé. En bas, dans le hall, il aperçoit Rolande, toujours là, qui fait mine de jouer à la balle. Il hausse les épaules, et rentre chez lui.

Rolande monte l'escalier sur la pointe des pieds, colle son œil à la serrure. Le docteur a trouvé l'enveloppe sur son bureau. Il l'ouvre, lit la lettre et s'asseoit, pétrifié.

<details><summary>Énoncé</summary>Pour la lire à votre tour, extrayez de la table `fragment` toutes les lignes dont l'identifiant est
divisible par celui de la lettre reçue ce jour-là par le docteur Germain, et triez-les par identifiant
décroissant.

_Aide._ La table `fragment` comporte l'ensemble des phrases des lettres du Corbeau, mais mélangées. Elle
n'est pas directement liée au reste de la base, et ne peut être exploitée que par des manipulations un peu
« tordues » comme celle-ci, qui vous seront révélées au fur et à mesure. Ici, vous avez besoin de la fonction
`MOD()`.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ℙ𝔼𝕋𝕀𝕋 𝔻É𝔹𝔸𝕌ℂℍÉ</td>
            <td>48452550811506</td>
        </tr>
        <tr>
            <td>𝕋𝕌 𝔽𝔸𝕀𝕊 𝕁𝕆𝕌𝕁𝕆𝕌</td>
            <td>48452550811506</td>
        </tr>
</table>
Total: 7 rows affected.

</details><br>


Le lendemain matin, le docteur Michel Vorzet rentre d'un congrès de psychiatrie. La bonne lui ouvre la porte.

— Bonjour, monsieur.<br>
— Bonjour, Raymonde.

Mme Vorzet paraît, une enveloppe à la main.

— Emportez les valises dans la chambre de monsieur.<br>
— Bien, madame.<br>
— Quel voyage ! s'exclame Vorzet en ôtant son pardessus. Quoi de plus ridicule qu'un congrès de médecins ?... Si ce n'est un congrès de psychiatres, bien entendu ! Personne n'écoute celui qui parle... Dieu merci : pour prendre ces communications au sérieux, il faudrait un public de malades.

Et, avec un clin d'œil :

— Au fond, reprend-il, la seule utilité de ces manifestations, c'est de permettre aux médecins de province d'aller tromper leur femme avec les Parisiennes... Comme ça n'est plus de mon âge, je suis rentré.

Mme Vorzet ne réagit pas.

— Eh bien, Laura, qu'y a-t-il ? Qu'est-ce qui ne va pas ?<br>
— Michel, je t'ai parlé de la lettre d'hier.<br>
— Oui, et après ?<br>
— Il y en a une pour toi aujourd'hui, dit-elle en lui tendant l'enveloppe.<br>
— Ah.

Il déchire l'enveloppe, en extrait la lettre et la lit en silence.

<details><summary>Énoncé</summary>Parmi les couples mariés, quelle est la différence d'âge maximale ?

_Aide._ Vous aurez besoin d'une auto-jointure (jointure d'une table avec elle-même), pour mettre sur la même ligne les âges requis pour le calcul des différences.<br><br>

<table>
    <thead>
        <tr>
            <th>maximum</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>41</td>
            <td>24589489494065</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Un peu plus tard dans la journée, Germain, en traversant le parc pour retourner à l'hôpital, voit un de ses confrères qui s'amuse à nourrir les oiseaux avec des morceaux de pain trempés dans du lait.

— Bonjour, Vorzet. Je ne vous savais pas de retour.<br>
— Mon cher Germain, un vieux mari ne doit pas laisser longtemps seule sa jeune femme, répond le psychiatre d'un air malicieux.<br>
— C'est pour moi que vous dites ça ?<br>
— Eh eh ! Pourquoi pour vous ? Je dis ça pour elle et pour moi. Ne vous fâchez pas !

Germain se mord les lèvres.

— Vous aimez les oiseaux ? reprend-il.<br>
— Ils m'intéressent. Ils sont plus intelligents qu'on ne croit. Je suis un peu ornithologue à mes heures, voyez-vous... Ah, à propos d'oiseaux...<br>
— Oui ?<br>
— Figurez-vous que ma femme a reçu hier une lettre signée d'un certain Corbeau.<br>
— Elle vous l'a dit ?<br>
— Oui, oh ! elle ne me cache rien. C'est le bénéfice de mon grand âge, eh eh ! Et d'ailleurs, j'ai reçu moi-même ce matin... une seconde lettre.<br>
— Sur le même sujet ?<br>
— Oui. Avec des détails supplémentaires... Il paraîtrait que vos relations avec Laura auraient laissé des traces fâcheuses.<br>
— Quoi ?<br>
— Ne vous énervez pas !... Et que vous auriez profité de mon absence pour les faire disparaître... chirurgicalement.<br>
— Oh, le...<br>
— Eh... oui, que voulez-vous. Et j'ajoute que Delorme a reçu en tant que médecin-chef un torchon du même genre. On vous accuse de délivrer les faibles femmes d'un fardeau encombrant. Voilà, vous êtes prévenu.<br>
— Si je connaissais le salaud...<br>
— Tout de suite les grands mots. Mon cher, j'ai la chance de connaître assez bien la question. J'ai été nommé plusieurs fois expert dans des affaires de lettres anonymes. Croyez-moi, nous ne sommes pas en présence d'un salaud, mais d'un malade.<br>
— Eh bien, je me charge de le soigner !<br>
— Quand vous l'aurez découvert !

Et, désignant tour à tour quelques visiteurs du parc :

— C'est peut-être M. le substitut qui passe avec un mandat à la main. Ou M. Fayolle qui lit le journal en marchant... N'est-ce pas, M. Fayolle ?<br>
— Pardon ?<br>
— Je dis, c'est peut-être vous...<br>
— Qui fait quoi ?<br>
— Chut !... C'est un secret !<br>
— Ah, toujours le mot pour rire, docteur ! dit Fayolle en s'éloignant.<br>
— Et si ce n'est ni Fayolle, ni le substitut, c'est peut-être le docteur Germain lui-même...<br>
— Vous me soupçonnez, moi, la victime de ce malade ?<br>
— Un malade peut fort bien s'accuser lui-même. C'est fréquent chez les anonymographes. Remarquez, je ne vous crois pas coupable... pour le moment.<br>
— Vous êtes trop bon...<br>
— Seulement il faut vous méfier. Ouvrir l’œil. Quand ce genre de maladie se déclare, on ne sait pas où elle s'arrête. Toute une ville peut en être atteinte. Au revoir, Germain.<br>
— Au revoir.

Il s'est à peine éloigné de quelques pas, qu'une idée lui traverse l'esprit.

— Dites donc ! lance-t-il à son confrère... Au fond, le corbeau, c'est peut-être vous !<br>
— Et pourquoi pas ? répond Vorzet.

_Note._ En France, l'avortement a longtemps été passible de la prison, des travaux forcés à perpétuité, voire de la peine de mort. À l'époque, environ 300 personnes par an étaient condamnées pour ce motif. Mais malgré tous les risques encourus, le nombre de femmes qui recouraient à un avortement clandestin était de l'ordre de 500 000 par an. De nos jours, en dépit de la légalisation de l'IVG, mais avec la « pilule », ce chiffre a diminué de moitié.

<details><summary>Énoncé</summary>Combien de lettres anonymes ont été reçues jusqu'à ce jour (22 avril 1933) ?<br><br>

<table>
    <thead>
        <tr>
            <th>letters</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>5</td>
            <td>59494493715131</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Quatre jours se sont écoulés. Nous sommes maintenant le 26 avril 1933. Le directeur de l'hôpital, Antoine Delorme, entre dans le bureau du comptable, Henri Bonnevie.

— Ah, M. le médecin-chef !<br>
— Restez assis...

Lui-même reste debout.

— Mon cher Bonnevie, je suis très embêté.<br>
— Rien de grave, j'espère ?<br>
— J'ai encore reçu une lettre anonyme.<br>
— Encore ?<br>
— Et celle-ci ne met pas seulement Germain en cause. Je vais vous la lire.<br>
— Je vous en prie. J'en serais très honoré.<br>
— « 𝕍𝕀𝔼𝕀𝕃 𝕀𝕍ℝ𝕆𝔾ℕ𝔼 », commence le docteur... Hum, c'est une clause de style, naturellement.<br>
— Naturellement !

<details><summary>Énoncé</summary>Pour connaître la suite de cette lettre, joignez les tables `fragment` et `consultation` sur leurs identifiants, en ne gardant que les neuf consultations les plus récentes du docteur Delorme.

_Aide._ Utilisez la clause `ORDER BY` pour trier les dates, et `LIMIT` pour n'afficher que le nombre de lignes voulu.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝕍𝕀𝔼𝕀𝕃 𝕀𝕍ℝ𝕆𝔾ℕ𝔼</td>
            <td>17727469371145</td>
        </tr>
        <tr>
            <td>𝕃'𝔸𝕃ℂ𝕆𝕆𝕃 𝕋𝔼 𝕋ℝ𝕆𝕌𝔹𝕃𝔼 𝕃𝔸 𝕍𝕌𝔼</td>
            <td>17727469371145</td>
        </tr>
</table>
Total: 9 rows affected.

</details><br>


— Qu'en pensez-vous, Bonnevie ?<br>
— Et vous, M. le médecin-chef ?<br>
— Eh bien, pour vous dire la vérité, je suis embêté. Très embêté. Ça pose véritablement un cas de conscience ! Vous me comprenez ?<br>
— Je vous comprends, et d'autant plus que je me trouve moi-même confronté à pareil cas de conscience.<br>
— Non ? dit Delorme en s'asseyant.<br>
— J'ai moi aussi reçu une lettre anonyme. Et je vous demande la permission de vous en donner lecture.<br>
— Mais, je pense bien, allez-y, mon cher.

L'économe se lève, et vient s'appuyer sur le coin de son bureau, juste au-dessus de Delorme.

— « 𝕍𝕀𝔼𝕀𝕃𝕃𝔼 ℂ𝔸ℕ𝔸𝕀𝕃𝕃𝔼 », commence-t-il... Hum, c'est une clause de style, naturellement.<br>
— Naturellement !

<details><summary>Énoncé</summary>Pour connaître la suite de cette lettre, convertissez en binaire la somme des identifiants des métiers des filles d'Henri Bonnevie, et extrayez de la table `fragment` toutes les lignes dont l'identifiant en binaire se termine par les mêmes chiffres.

_Aide._ Utilisez la fonction `CONV(nombre_à_convertir, base_de_départ, base_d'arrivée)` qui renvoie une chaîne de caractères, ainsi que la fonction `CONCAT()` et l'opérateur `LIKE`.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝕍𝕀𝔼𝕀𝕃𝕃𝔼 ℂ𝔸ℕ𝔸𝕀𝕃𝕃𝔼</td>
            <td>155334593873678</td>
        </tr>
        <tr>
            <td>𝕋𝕌 𝔼𝕊 𝔸𝕌 𝕄𝕀𝔼𝕌𝕏 𝔸𝕍𝔼ℂ 𝔾𝔼ℝ𝕄𝔸𝕀ℕ 𝕃'𝔸𝕍𝕆ℝ𝕋𝔼𝕌ℝ</td>
            <td>155334593873678</td>
        </tr>
</table>
Total: 7 rows affected.

</details><br>




— Qu'est-ce que vous pensez de ça ? demande Bonnevie en finissant la lecture.

Le médecin-chef s'est décomposé.

— Décidément, ces lettres sont un tissu de mensonges et de calomnies. Mon opinion est faite, dit-il en lui serrant la main.<br>
— La mienne aussi, M. le médecin-chef.

Quand son supérieur a quitté le bureau, il s'éponge le front.

------------------------

À la fin de la journée, au Cercle, le café où les notables de Saint-Robin ont leurs habitudes.

— Bonsoir, M. le maire.<br>
— M. le comte...<br>
— Bonsoir.<br>
— Bonsoir, mon ami.<br>
— Alors, on ne joue pas ?<br>
— Non, ces messieurs discutent.<br>
— Fayolle a reçu une lettre.<br>
— Moi aussi, dit le maire. Et c'est plus grave.<br>
— Pourquoi plus grave ?<br>
— Parce que je suis un homme public, M. Fayolle ! Preuve que le coupable n'a même pas le respect des fonctions officielles ! Triste nature !

Il s'asseoit, sort une lettre de sa poche.

— Tenez ! écoutez-moi ça : « 𝕍𝕀𝔼𝕀𝕃 𝔼𝕄𝔹𝕌𝕊ℚ𝕌É », commence-t-il...

Quelqu'un étouffe un rire.

— J'ai fait justice de cette ânerie pendant ma campagne électorale. « 𝕋𝕌 𝔸𝔻𝕄𝕀ℕ𝕀𝕊𝕋ℝ𝔼𝕊 𝕌ℕ𝔼 𝕍𝕀𝕃𝕃𝔼 ℙ𝕆𝕌ℝℝ𝕀𝔼, 𝔼𝕋 ℙ𝕆𝕌ℝℝ𝕀𝔼 ℙ𝔸ℝ 𝔾𝔼ℝ𝕄𝔸𝕀ℕ, 𝕃𝔼 𝕊𝕆𝕄𝔹ℝ𝔼𝕌ℝ 𝔻𝔼 ℙ𝕆𝕃𝕀ℂℍ𝕀ℕ𝔼𝕃𝕃𝔼𝕊. 𝕍𝕆𝕀ℂ𝕀 𝕄𝕆ℕ ℝÉℚ𝕌𝕀𝕊𝕀𝕋𝕆𝕀ℝ𝔼 𝔼ℕ 𝕋ℝ𝕆𝕀𝕊 ℙ𝕆𝕀ℕ𝕋𝕊 : ℙℝ𝕀𝕄𝕆, 𝔾𝔼ℝ𝕄𝔸𝕀ℕ 𝔸 𝔽𝔸𝕀𝕋 𝕃𝔼𝕊 ℚ𝕌𝔸𝕋ℝ𝔼 ℂ𝔼ℕ𝕋𝕊 ℂ𝕆𝕌ℙ𝕊 𝔸𝕍𝔼ℂ »...

Il jette un coup d'œil au docteur Vorzet qui joue au billard à l'autre bout de la salle.

— Ici, continue-t-il, le nom d'une dame honorablement connue de la société. Inutile de dire le cas qu'il faut faire d'une semblable assertion. « 𝕊𝔼ℂ𝕌ℕ𝔻𝕆, 𝔾𝔼ℝ𝕄𝔸𝕀ℕ 𝕋ℝ𝔸𝔽𝕀ℚ𝕌𝔼 𝔻𝔼 𝕃𝔸 𝕄𝕆ℝℙℍ𝕀ℕ𝔼, 𝔼𝕋 ℂℍ𝔼ℝℂℍ𝔼 À 𝔽𝔸𝕀ℝ𝔼 𝔸ℂℂ𝕌𝕊𝔼ℝ 𝕌ℕ𝔼 𝕍𝕀ℂ𝕋𝕀𝕄𝔼 𝕀ℕℕ𝕆ℂ𝔼ℕ𝕋𝔼, 𝕄𝔸ℝ𝕀𝔼 ℂ𝕆ℝ𝔹𝕀ℕ, ℚ𝕌𝔼 𝕁𝔼 𝕊𝔸𝕃𝕌𝔼 ℝ𝔼𝕊ℙ𝔼ℂ𝕋𝕌𝔼𝕌𝕊𝔼𝕄𝔼ℕ𝕋. » Alors, qu'en pensez-vous ?<br>
— Et tertio ? demande le docteur Bertrand.<br>
— Tertio ? Sans importance.<br>
— Tertio, tu es cocu !

Le maire foudroie le docteur Bertrand du regard.

— Qu'en savez-vous ?<br>
— J'ai moi aussi reçu une lettre anonyme.<br>
— Hum ! Ce ne sont que des mensonges, mais c'est bien désagréable.<br>
— Je ne suis pas de votre avis.<br>
— Vous trouvez ça agréable ?<br>
— Non, je parle des mensonges. Il semble que ces lettres contiennent un fond de vérité.<br>
— Charmant ! s'insurge le pharmacien. Alors je vendrais des médicaments truqués ?<br>
— Il ne s'agit pas de vous, répond Bertrand. il s'agit du principal accusé... Celui dont le nom figure dans chaque missive. Je ne me permettrais pas de dire du mal d'un de mes confrères, mais... j'ai eu l'autre matin avec lui une conversation qui m'a fâcheusement impressionné.

À une autre table, un jeune homme discute avec le docteur Delorme.

— Depuis trois ans que je suis substitut, c'est la première fois qu'une affaire intéressante se présente. Je ne vais pas la rater.<br>
— On ne va pas arrêter Germain sans preuves.<br>
— Il ne s'agit pas d'arrêter. Il s'agit de mener une enquête à l'hôpital.<br>
— Ah non ! Non, jamais de la vie ! je m'y oppose formellement ! Assez d'histoires, hein !<br>
— Un médecin-chef ne peut entraver l'action du parquet.<br>
— Non, mais ton père peut te foutre une paire de claques si tu l'emmerdes !<br>
— Tu le prends comme ça ?<br>
— Parfaitement !<br>
— Bien, papa. Mais je sais où est mon devoir...

Vourzet a entendu la fin de leur conversation :

— Jeune homme, dit-il, vous n'avez qu'un devoir : la prudence. Notre ville a la fièvre... Et on n'opère pas un malade à chaud !

<details><summary>Énoncé</summary>Quel pourcentage de la population de Saint-Robin aura été destinataire d'une ou plusieurs lettres du Corbeau jusqu'à ce mercredi 26 avril 1933 ?<br><br>

<table>
    <thead>
        <tr>
            <th>pourcentage</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>4.0441 %</td>
            <td>133758539622466</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Le lendemain, en début d'après-midi, le directeur de l'école entre dans la chambre de sa sœur.

— Denise, secoue-toi !<br>
— Laisse-moi dormir.<br>
— Ah non, cette fois ça suffit ! s'exclame-t-il en lui arrachant la couverture.<br>
— Mais, tu es fou ! Je suis malade ! hurle-t-elle.<br>
— Malade, toi ? Tu crois que je ne te connais pas ? Tous les locataires, tous, il te les a fallu ! Sauf le boy-scout et le vieux Frochard ! Et encore, je ne suis pas sûr pour le boy-scout. Maintenant, c'est le tour du docteur Germain !<br>
— Germain ? Oh là là ! On peut dire que tu as du goût ! Il a l'air d'un parapluie ! Il doit faire l'amour comme un pion.<br>
— Alors pourquoi joues-tu la malade ?<br>
— Je ne joue pas la malade, je SUIS malade ! J'ai une bronchite ! Et une angine !<br>
— Attends... C'est vrai ? Tu as l'air vraiment malade... Tu as de la fièvre ? Fais voir ta gorge.

Il lui soulève le menton.

— Qu'est-ce que c'est que ça ?<br>
— Une compresse.<br>
— Une compresse d'eau glacée ! Mes compliments ! En effet, tu ne joues pas la malade, tu te rends malade ! Et dire que j'ai failli me faire avoir ! Heureusement qu'une lettre m'a ouvert l’œil !<br>
— Quelle lettre ?<br>
— Celle-ci ! dit-il en lui flanquant une paire de gifles.

<details><summary>Énoncé</summary>Combien le 18 rue de la mairie a-t-il compté de locataires de sexe masculin, au maximum ? On supposera pour simplifier que tous les anciens amants de Denise résident encore à Saint-Robin.

_Aide._ La table `amants` se concentre sur les relations illégitimes entre personnages. Au contraire de `relation`, elle ne comporte pas de doublons par symétrie. Notez le pluriel dans le nom de la table : chaque ligne comporte deux amants.<br><br>

<table>
    <thead>
        <tr>
            <th>locataires</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>38</td>
            <td>216542043023011</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Dans la chambre de Denise. La jeune femme est toujours alitée, à plat ventre, dos découvert. Sa nièce Rolande lui applique des ventouses.

— Tu crois que c'est vrai ? dit celle-ci.<br>
— Quoi ?<br>
— Les choses qu'on raconte sur M. Picard... Il aurait fait un enfant à...<br>
— Ça suffit, Rolande ! Ça ne te regarde pas. Ce ne sont pas des histoires pour les gamines.<br>
— Oh, la barbe ! Tu ne te rappelles plus quand tu avais mon âge...

L'adolescente reprend :

— En tout cas, s'il y en a un qui a mauvaise presse, c'est le docteur Germain. Rien que cet après-midi, les oreilles ont dû lui tinter. Il va en baver !<br>
— Tant mieux ! Ça lui apprendra.

On frappe à la porte.

— Va voir, souffle Denise.<br>
— Oh ! mais c'est le docteur, s'exclame Rolande en ouvrant... Bonsoir, docteur. Justement, nous parlions de vous, docteur...<br>
— Denise est malade ?<br>
— Oui, et cette fois, c'est pour de bon. Vous savez poser les ventouses ?<br>
— À votre avis ?<br>
— Alors, prenez ma place, elle adore ça.

Rolande sort.

— Vous êtes enfin arrivée à tomber malade...<br>
— Et après ? Si ça m'amuse de me rendre malade pour me faire soigner ?<br>
— Drôle de fille !<br>
— Je ne sais pas qui est le plus drôle des deux.<br>
— Oh ! moi, sûrement. Il faut être drôle pour ne pas se jeter sur la première femme qui s'offre, n'est-ce pas ?<br>
— Merci pour la première femme...

Il applique une ventouse sur le dos de Denise en disant :

— Vous comprenez fort bien.<br>
— Je comprends que pour faire ça, il vous faut l'Amour avec une lettre majuscule.<br>
— Au contraire. Si je croyais aimer une femme, je m'enfuirais d'autant plus vite.<br>
— Dans ce cas, qu'est-ce qui vous empêche de prendre du plaisir quand il se trouve ?<br>
— Oh, presque rien... Un fantôme. Ou plutôt, deux fantômes. Vous savez, Denise, je ne demande plus qu'une seule chose à la vie : l'apaisement.

<details><summary>Énoncé</summary>À cette époque, un enfant dont les parents n'étaient pas mariés ensemble était dit « naturel ».

Donnez la liste des enfants naturels, avec pour chacun son père et sa mère.<br><br>

<table>
    <thead>
        <tr>
            <th>mère</th>
            <th>enfant</th>
            <th>père</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Fanny Molyneux</td>
            <td>Guillaume Turpin</td>
            <td>Wenceslas Vorobeïtchik</td>
            <td>246283082308474</td>
        </tr>
        <tr>
            <td>Fanny Molyneux</td>
            <td>Susanne Lopes</td>
            <td>Wenceslas Vorobeïtchik</td>
            <td>246283082308474</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


Rolande rouvre la porte.

— Docteur, on vous demande !<br>
— Moi ? Je reviens tout de suite, dit-il en ramenant le drap sur le dos de Denise.

Le docteur Vorzet est à sa porte.

— Ah, c'est vous ! Vous me cherchiez ?<br>
— Oh, je passais... Et je me suis dit : tiens, si nous allions faire une petite visite d'amitié à notre bon docteur Germain ?<br>
— Entrez. Je passe devant, vous permettez ?

Le psychiatre pénètre dans l'appartement.

— Joli bureau Louis xv, félicitations !<br>
— Merci. Vous aimez les beaux meubles ?<br>
— Je les admire... de loin. Ce n'est pas avec les honoraires que nous recevons de nos concitoyens qu'on peut collectionner des pièces de cette importance... Vous devez avoir une belle fortune personnelle...<br>
— Honnête.<br>
— Oui, c'est ce que je leur disais.<br>
— À qui ?<br>
— Aux gens qui m'interrogeaient, tout à l'heure.<br>
— Sur ma fortune ?<br>
— Oui, sur votre fortune. Enfin, plutôt, sur votre passé. Vous comprenez, avec cette malheureuse affaire, la curiosité s'est éveillée...<br>
— La prochaine fois, envoyez-moi directement les curieux. Je les renseignerai moi-même.<br>
— À propos... Vous m'aviez dit qu'avant de venir ici vous exerciez à Grenoble ?<br>
— Oui... Sans doute.<br>
— Un imbécile s'est avisé de consulter l'annuaire médical...<br>
— Et alors ?<br>
— Et alors, il n'a pas trouvé de docteur Germain à Grenoble.<br>
— Vous direz de ma part à cet imbécile que la publication à l'annuaire n'est pas obligatoire. C'est une simple affaire de publicité.<br>
— En fait, le seul Germain qui ait habité Grenoble, a quitté cette ville il y a quinze ans pour Paris. Il est devenu un fameux chirurgien du cerveau.<br>
— Barthélémy Germain ? Je lui ai été présenté.<br>
— Oh, c'est quelque chose !... Son témoignage pourrait servir si on en arrivait à une enquête... Mais aujourd'hui, ils m'ont seulement demandé de recueillir quelques renseignements.<br>
— Qui, « ils » ?<br>
— Eh bien, euh... d'autres imbéciles... Nous n'en manquons pas. Maintenant, je vous quitte. Il se fait tard.<br>
— Vous avez découvert quelque chose sur le Corbeau ?<br>
— On accuse surtout ma belle-sœur, Marie Corbin. Naturellement, elle a des griefs contre vous. Mais je ne la crois pas coupable. J'étais fiancé avec Marie avant d'épouser Laura. Je la connais bien. Il faudrait qu'elle ait beaucoup changé...

Et, sur le palier :

— Vous m'en voulez de ma visite ?<br>
— Au contraire. Je vous en remercie.<br>
— N'exagérez rien, tout de même. Je vous souhaite de vivre vieux, Germain, mais de n'être jamais le doyen du corps médical. On nous impose des tâches bien désagréables.

<details><summary>Énoncé</summary>Vérifiez que Vorzet est le doyen du corps médical, en d'autres termes, qu'il est le plus vieux des employés de l'hôpital.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>âge</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Michel Vorzet</td>
            <td>75</td>
            <td>237752598059822</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Le docteur Germain est sur le point de frapper chez Denise, quand celle-ci ouvre sa porte.

— Je vous croyais au lit.<br>
— Je venais vous voir.<br>
— Chez moi ?<br>
— Vorzet ne se déplace pas pour rien. C'est grave, n'est-ce pas ?<br>
— Qu'est-ce que ça peut vous faire ?<br>
— Toujours aimable...<br>
— Recouchez-vous, vous allez prendre froid.<br>
— Qu'est-ce que ça peut vous faire ?

Denise retourne à son lit, laisse tomber ses chaussures. Le docteur Germain ne peut s'empêcher de les observer. Denise a surpris son regard.

— Oui, je boite. Et après ? Nous avons eu un accident de voiture, mon frère et moi. Lui a perdu un bras, moi, j'ai attrapé une coxalgie.

Elle se couche.

— Est-ce que ça m'empêche d'être belle femme ? Est-ce que ça empêche les hommes d'avoir envie de moi ? Est-ce que ça vous empêche d'avoir envie de moi ?<br>
— Bonsoir Denise, dit Germain, embarrassé et sans faire un pas.<br>
— Vous ne dormirez pas, vous le savez très bien. Vous êtes trop inquiet.<br>
— Ça se voit tant que ça ?<br>
— Vous disiez que tout ce que vous demandiez à la vie, c'était l'apaisement.<br>
— Oui, l'oubli total.<br>
— Je ne peux pas vous offrir tant que ça. Mais quelques heures d'oubli, ça compte quand même...<br>
— Taisez-vous, dit-il en lui mettant la main sur la bouche.

Elle pose sa main sur la sienne et la mord.

Sur le palier, Rolande recule, enlève ses lunettes et s'effondre en pleurant.

<details><summary>Énoncé</summary>Pour chaque médecin ayant couché avec au moins l'une des personnes qui l'ont consulté, affichez le nombre de celles-ci.<br><br>

<table>
    <thead>
        <tr>
            <th>docteur</th>
            <th>patients</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Georges Massard</td>
            <td>2</td>
            <td>202700035033277</td>
        </tr>
        <tr>
            <td>Louis Bertrand</td>
            <td>1</td>
            <td>202700035033277</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


Le lendemain matin, de bonne heure, en allant visiter une malade, le docteur Germain trouve porte close. La voiture du docteur Bertrand est garée devant la maison. Les gens commenceraient-ils à se méfier de lui ?

Il repart vers l'école, soucieux. Peu de temps après qu'il est arrivé chez lui, Denise entre à son tour.

— Tu es déjà revenu ?<br>
— Tu vois.<br>
— Qu'est-ce que tu fais ?<br>
— Je regardais jouer les enfants.<br>
— Je croyais que tu n'aimais pas les gosses...<br>
— Je ne sais plus ce que j'aime. Mais quand on sort de toute cette boue, ça... ça repose un peu.

Denise s'est approchée de lui.

— Tu n'es pas très tendre, ce matin.<br>
— Non. Denise, écoutez.<br>
— Tu me vouvoies ?<br>
— Je crains qu'il n'y ait entre nous un malentendu. Hier, vous me plaisiez, c'est vrai. Mais j'étais surtout très déprimé, très nerveux. Je suis resté près de vous autant par découragement que par désir. Vous comprenez ?<br>
— Je serais vraiment trop bête.<br>
— Non, vous ne comprenez pas. Ça n'a aucune importance, d'ailleurs... J'ai décidé de quitter la ville.<br>
— En ce moment, ce serait vous avouer coupable.<br>
— Aussi, j'attendrai que cette affaire soit réglée.<br>
— Et d'ici là ?<br>
— Nous serons des amis, si vous voulez bien...<br>
— Des amis ? Tu vois une femme comme moi être l'amie d'un homme comme toi ? Après cette nuit ? Vous me mésestimez, mon cher.<br>
— Réfléchissez...<br>
— C'est tout réfléchi. Tu es lâche. Tu es faible. De nous deux, c'est toi la grue. Mais ça m'est égal, je ne cèderai pas. Hier, tu m'as vue boiter parce que j'avais les pieds nus. Mais quand j'ai mes chaussures, personne ne s'aperçoit de rien. J'ai mis cinq ans pour arriver à ce résultat. J'ai réussi. Et tous les hommes que j'ai voulus, je les ai eus. Moi, l'infirme. Et chaque fois, c'est une revanche que je prends sur la vie. Maintenant, tu feras ce que tu voudras. Tu es prévenu, tu sais à qui tu as affaire.

Elle sort en claquant la porte.

<details><summary>Énoncé</summary>Pour chaque patient, donner le nombre de médecins qu'il consulte. Triez par nombre de médecins décroissant et par patient croissant.<br><br>

<table>
    <thead>
        <tr>
            <th>patient</th>
            <th>doctors</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Joseph-Alfred Durand</td>
            <td>6</td>
            <td>2152176172787</td>
        </tr>
        <tr>
            <td>Adrienne Picard</td>
            <td>5</td>
            <td>2152176172787</td>
        </tr>
</table>
Total: 172 rows affected.

</details><br>


En sortant de chez lui un quart d'heure plus tard, Germain a un mouvement de recul. Quelqu'un a posé devant sa porte un corbeau empaillé, perché sur un socle de bois. Il le ramasse et l'examine avec un mélange de fascination et de dégoût. En relevant la tête, il aperçoit Rolande qui l'observe.

— C'est vous qui avez posé ça là ?<br>
— Non.<br>
— Vous connaissez ce volatile ?<br>
— Non, répond-elle en évitant son regard...<br>
— Alors, que faites-vous ici ?<br>
— Eh bien voilà, docteur, commence-t-elle en s'avançant vers lui. J'ai un grand service à vous demander, un immense service. Voulez-vous me prêter 100 francs ?<br>
— 100 francs ?<br>
— Pour sauver mon honneur.

Il ne peut s'empêcher de sourire.

— Fichtre !<br>
— Ne riez pas, c'est très grave. Hier matin, j'ai vu dans une devanture un col en broderie. De la broderie anglaise, de la vraie.<br>
— Et alors ?<br>
— Alors, j'ai pris 100 francs dans ma caisse, à la poste. Je pensais les remettre sur mes économies, et puis...<br>
— Et puis ?<br>
— Je viens de m'apercevoir que ma grammaire est vide.<br>
— Votre grammaire ?<br>
— C'est là que je mets mes sous.<br>
— Vous n'avez qu'à rendre le col.<br>
— Je ne peux pas, dit-elle en le fixant effrontément. J'ai fait une tache.<br>
— Tenez, menteuse !<br>
— Merci, docteur.

Il lui met le volatile entre les mains.

— Et gardez ça, aussi.

<details><summary>Énoncé</summary>Pour chaque nom de travail exercé par au moins 3 personnes, afficher la fourchette des âges de ces personnes (âges minimal et maximal, par exemple "29-44").<br><br>

<table>
    <thead>
        <tr>
            <th>nom_travail</th>
            <th>fourchette</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>administrateur</td>
            <td>29-44</td>
            <td>217710522097188</td>
        </tr>
        <tr>
            <td>bonne</td>
            <td>28-52</td>
            <td>217710522097188</td>
        </tr>
</table>
Total: 28 rows affected.

</details><br>


Dans l'église déserte, une femme est agenouillée. C'est Laura Vorzet. Elle se retourne en entendant le pas de Germain.

— Ah, enfin, vous voilà ! chuchote-t-elle. Venez vous mettre à genoux près de moi, qu'on ne nous remarque pas.<br>
— Impossible de venir plus tôt, votre sœur montait la garde sur la place.<br>
— Voyez dans quelle situation vous me mettez ! Au lieu de venir, j'aurais dû montrer votre lettre à mon mari.<br>
— Ma lettre ? Mais je ne vous ai jamais écrit ! Au contraire, c'est votre lettre qui m'a fait venir.<br>
— Quelle lettre ?<br>
— Celle-ci.

Elle examine un instant le bout de papier qu'il a sorti de sa poche.

— C'est un faux, conclut-elle. Voici celle que j'ai reçue de vous.<br>
— Oh ! s'exclame-t-il en lisant la lettre. Et vous êtes venue tout de même ?<br>
— J'ai été blessée, bien sûr. Pourtant, je vous ai excusé. Une femme est toujours prête à pardonner quand... quand elle est amoureuse...

Elle cherche son regard.

— Je vous déçois ? murmure-t-elle.<br>
— Moi qui vous imaginais tellement au-dessus de tout ça, tellement lointaine...<br>
— Nous sommes pourtant sans doute assez près l'un de l'autre.

Ce disant, elle pose la main sur son bras. Il se dégage :

— Malheureusement, je ne suis pas libre.<br>
— Vous aimez une autre femme ?<br>
— Non, je... Je traîne après moi... Enfin, je vous expliquerai peut-être tout ça un jour...<br>
— Je ne vous demande rien. Je ne me jette à la tête de personne.<br>
— Ce qui m'inquiète, c'est de savoir pourquoi on nous a aménagé cette rencontre.<br>
— Je l'ignore mais je n'ai aucune intention de la prolonger. Adieu, Germain.

Cette fois, c'est lui qui lui prend la main. Il continue :

— Laura. Il ne faut surtout pas m'en vouloir. Si jamais vous avez besoin de moi, je serai là.

Une ombre vient de se glisser entre eux.

— Denise !<br>
— Vous ne m'attendiez pas, hein ?<br>
— Qu'est-ce que vous faites ici ? demande Germain.<br>
— Vos scrupules vous obligent à me quitter, mais ne vous empêchent pas de courir après une femme mariée. Une petite sainte Nitouche vicieuse et sournoise. Mes compliments.<br>
— Ce rendez-vous est une ruse ! se défend Germain. Un piège dans lequel vous tombez avec nous ! Qui vous a donné l'idée de venir ici ?<br>
— Quelqu'un qui vous connaît bien et qui a vu juste du premier coup ! J'ai reçu une lettre tout à l'heure.<br>
— Du Corbeau, sans doute, intervient Laura.<br>
— Toi, d'abord, je t'interdis de m'adresser la parole ! Tu m'as volé mon amant, laisse-moi tranquille...<br>
— Denise ! proteste Germain.<br>
— Michel le saura ! Tout le monde le saura !<br>
— Taisez-vous.<br>
— Le Corbeau a raison !<br>
— Allez-vous vous taire ?<br>
— Je crierai, je crierai si je veux ! Sale type ! sale type !

<details><summary>Énoncé</summary>Dressez une liste de toutes les personnes de la ville avec, en face, leur nombre d'amants, trié par
nombre croissant, puis nom croissant. Vous inclurez les personnes n'ayant aucun amant, mais exclurez celles qui n'ont pas atteint l'âge de la majorité sexuelle.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>amants</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Alfred Durry</td>
            <td>0</td>
            <td>146695421101260</td>
        </tr>
        <tr>
            <td>Ambroise Auger</td>
            <td>0</td>
            <td>146695421101260</td>
        </tr>
</table>
Total: 217 rows affected.

</details><br>


Une voix de femme les interrompt :

— Ne parlez pas si fort dans la maison du Seigneur.

C'est Marie Corbin qui, pendant qu'ils se disputaient, est entrée à son tour dans l'église.

— Je vous cherchais, docteur.<br>
— Vous saviez que j'étais ici ?<br>
— Je vous ai vu entrer. Il y a eu un accident dans votre service. Le 13 vient de se suicider.<br>
— Mon Dieu...<br>
— Il ignorait qu'il était perdu. Une lettre anonyme lui a révélé la gravité de son état. Il s'est coupé la gorge avec son rasoir.

<details><summary>Énoncé</summary>Pour connaître le contenu de la lettre, restreignez `fragment` aux textes dont l'identifiant est une sous-chaîne du cube de l'identifiant de la lettre reçue par François Boulin le 28 avril 1933.

_Aide._ Utilisez à nouveau la fonction `CAST()` pour convertir un type en un autre.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝕍𝕀𝔼𝕌𝕏 ℂ𝔸𝔻𝔸𝕍ℝ𝔼</td>
            <td>216551102692560</td>
        </tr>
        <tr>
            <td>𝔾𝔼ℝ𝕄𝔸𝕀ℕ 𝕊𝔼 ℙ𝔸𝕐𝔼 𝕋𝔸 ℙ𝔸𝕌𝕍ℝ𝔼 𝔹𝕆𝔹𝕀ℕ𝔼 𝔻𝔼 ℂℝ𝔼𝕍𝔸ℝ𝔻</td>
            <td>216551102692560</td>
        </tr>
</table>
Total: 6 rows affected.

</details><br>


Conseil de guerre dans le bureau du docteur Delorme.

— Alors ? demande-t-il. Votre opinion ?<br>
— Pour moi, répond Bonnevie, c'est Marie Corbin qui a écrit ces saletés. Elle ne pouvait pas souffrir le 13 depuis l'histoire des ampoules.<br>
— C'est l'avis de tout l'hôpital, confirme le docteur Bertrand.<br>
— N'importe ! s'exclame le médecin-chef. Quel imbécile, ce 13 ! Comme si je n'avais pas assez d'ennuis ! Que faire ?<br>
— Un bel enterrement, suggère Bertrand. Des funérailles officielles. Nous sommes aujourd'hui vendredi. Mettons ça à dimanche : toute la ville pourra assister aux obsèques.<br>
— Le curé ne laissera pas entrer un suicidé à l'église !

Bertrand se tourne vers le psychiatre.

— Dr Vorzet, vous nous signerez un certificat d'aliénation mentale. Le 13 était fou, n'est-ce pas ?<br>
— Mais bien entendu, il était fou... Comme tout le monde, comme moi, comme vous !<br>
— Je vous en prie, pas de plaisanteries !<br>
— Naturellement, reprend Bertrand, tout l'hôpital suivra le cortège.<br>
— Pas moi ! intervient le docteur Germain.<br>
— Pourquoi, pas vous ?<br>
— Parce que je n'aime pas les enterrements.

_Note._ « La seule possibilité d’obtenir des funérailles religieuses pour un suicidé restait donc pour la famille, comme sous l’Ancien Régime, de prouver que l’acte avait été commis dans un état de folie, et cet état mental pouvait être attesté par un certificat de médecin ou d’officier de santé. Les médecins aliénistes ont témoigné de cette activité consistant à accorder des certificats de complaisance [...]. En déclarant le suicidé atteint d’une aliénation passagère au moment du geste fatal, le médecin de famille sauvait l’honneur des proches survivants et, incidemment, celui de sa clientèle. »  
– Marc Renneville, _Le suicide est-il une folie ? Les lectures médicales du suicide en France au XIXe siècle_, Criminocorpus Online, La pathologie du suicide, 14 mai 2018 : http://journals.openedition.org/criminocorpus/3797.

<details><summary>Énoncé</summary>Donner, pour chaque médecin, le nombre de patients décédés qu'il a reçus pour leur ultime consultation, avec la liste de ceux-ci, le tout classé par nombres de patients décédés décroissants.

_Aide._ La table `personne` donne, pour chaque habitant de Saint-Robin, la date de son décès lorsqu'elle est connue. Utilisez `GROUP_CONCAT()` avec une virgule comme séparateur.<br><br>

<table>
    <thead>
        <tr>
            <th>docteur</th>
            <th>total</th>
            <th>patients</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Louis Bertrand</td>
            <td>9</td>
            <td>Alphonse Jacques, Baptiste Deburau, Géraldine Monet, Gloria Grand, Joseph-Alfred Durand, Juliette Gauthier, Maurice Verneuil, Modeste Manosque, Roger Drapeau</td>
            <td>56444350319188</td>
        </tr>
        <tr>
            <td>Rémy Germain</td>
            <td>7</td>
            <td>Édouard de Montray, François Boulin, Henri Noblet, Horace Édouard, Madeleine Chevalier, Michel Krauss, Sidonie Rose</td>
            <td>56444350319188</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


Le jour de l'enterrement. À la sortie de l'église, Marie Corbin rabroue un employé des pompes funèbres.

— Vous ne comprenez donc pas ? Je vous avais dit que cette couronne devait être placée à l'arrière du corbillard.

Elle lui prend des mains une couronne mortuaire qui porte un bandeau où se lit « LE PERSONNEL DE L'HÔPITAL ». Le médecin-chef s'approche d'elle.

— Une seconde, Mlle Corbin. Puis-je vous parler ?<br>
— Tenez-moi ça un instant, dit-elle en confiant la couronne à Denise.

Delorme la prend à part :

— Vous devriez rentrer chez vous, ce serait plus prudent.<br>
— Et si je ne veux pas être prudente ? répond-elle sèchement.<br>
— Presque tout le monde ici vous croit coupable. On parlera de provocation.<br>
— Inutile d'insister, docteur, je reste. Et j'irai jusqu'au bout.

Elle le plante là, va reprendre la couronne des mains de Denise, et la place à l'arrière du corbillard.

Bientôt le cortège s'ébranle, avec en tête la mère du trépassé et sa famille, suivie des notables de Saint-Robin, le maire, le sous-préfet, le substitut, etc. Le recueillement règne. Au passage du corbillard, les hommes se découvrent et chacun fait un signe de croix avant de prendre la suite du cortège.

Tout à coup, à la faveur d'un cahot, la couronne de l'hôpital laisse échapper une enveloppe. Elle atterrit au milieu du pavé. Mme Boulin marche dessus sans la voir. Mais, à mesure où le cortège s'avance, tout le monde s'en écarte avec un mélange d'horreur et de curiosité. Enfin, un jeune garçon la ramasse. Il ne l'a pas plus tôt ouverte que d'autres s'attroupent autour de lui, regardant par-dessus son épaule.

<details><summary>Énoncé</summary>Pour savoir ce qu'ils ont lu, extrayez de la table `fragment` toutes les lignes dont l'identifiant se termine par l'identifiant de cette lettre dans `lettre`, sachant que celle-ci est découverte le 30 avril 1933 et n'a pas de destinataire.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝕃𝔼 𝟙𝟛 ℕ'𝔸 ℙ𝔸𝕊 𝕍𝕆𝕃É 𝕊𝕆ℕ 𝕊𝕆ℝ𝕋</td>
            <td>146354356040596</td>
        </tr>
        <tr>
            <td>𝕀𝕃 𝔼𝕋𝔸𝕀𝕋 𝔻𝔼𝕁𝔸 ℝ𝔼𝔽ℝ𝕆𝕀𝔻𝕀</td>
            <td>146354356040596</td>
        </tr>
</table>
Total: 7 rows affected.

</details><br>


Au cimetière, tandis que la lettre passe de main en main, le sous-préfet est en train de prononcer l'oraison funèbre du malheureux.

— Car ce n'était pas assez des bonheurs brisés ! Ce n'était pas assez des foyers détruits ! À l'assassin anonyme, il fallait du sang ! Ces petits carrés de papier blanc qui pleuvaient sur la ville, ils ont fait rire quelques-uns d'entre vous. Auriez-vous ri si vous aviez su qu'ils feraient pleurer une mère ?

Il marque une pause, et chacun peut entendre les sanglots de Mme Boulin.

— Mais notre ville entière partage sa douleur. Et s'il n'était pas déplacé d'invoquer la justice des hommes auprès de cette tombe qui nous rapproche de la justice divine, je dirais que la ville entière partage son désir de vengeance.

Un murmure d'approbation parcourt la foule. Il reprend :

— Et comme, autrefois, la chouette était fixée sur la porte des granges, tu seras cloué sur la porte du cimetière, oiseau de sang ! Oiseau noir, corbeau !

Autour de Marie Corbin, les gens commencent à vociférer.

— Au nom de la foule émue qui m'entoure, continue le sous-préfet avec grandiloquence, au nom des pouvoirs que je représente, je le proclame : malheureuse victime innocente d'un assassin sans nom, tu seras vengée !

Un homme montre au doigt l'infirmière :

— C'est elle le corbeau !<br>
— C'est faux ! proteste-t-elle. Vous êtes ignoble.<br>
— La lettre est tombée de la couronne que tu as apportée !<br>
— Et alors ? Je ne l'ai pas toujours tenue entre les mains, se défend-elle en regardant Denise.<br>
— Qu'est-ce que vous dites ? s'insurge la jeune femme.<br>
— C'est vous qui avez mis la lettre !<br>
— Moi ?

Elle se jette sur Marie Corbin, toutes griffes dehors. Des gens essaient de les séparer. S'ensuit une indescriptible cohue. Bientôt des agents s'interposent et, au moment où Marie Corbin va se faire lyncher, se saisissent d'elle. Un fourgon de police arrive, qui la conduit en prison sous les huées de la populace.


**Note philologique.** « CORBIN, substantif. Anciennement, petit corbeau. »
– Dictionnaire de l’Académie française, huitième édition, 1932-1935 : https://www.cnrtl.fr/definition/academie8/corbin

<details><summary>Énoncé</summary>Listez par ordre alphabétique les personnes qui, soit ont reçu au moins une lettre du Corbeau jusqu'au dimanche 30 avril 1933, soit sont officiellement en relation avec au moins une telle personne. Vous exploiterez le fait que la table `relation` est symétrique, et ne tiendrez pas compte des relations (illégitimes !) de la table `amants`.

_Aide._ Passez par deux CTE, l'une pour les destinataires, l'autre pour leurs connaissances.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Albert Boulin</td>
            <td>147086758520779</td>
        </tr>
        <tr>
            <td>Anastasie Delorme</td>
            <td>147086758520779</td>
        </tr>
</table>
Total: 31 rows affected.

</details><br>


Deux jours après l'arrestation de Marie Corbin, Noël Saillens demande à voir Michel Vorzet pour, dit-il, « une affaire de la plus haute importance ». Le psychiatre le reçoit chez lui, en présence de Laura.

— Calme plat, commence le psychiatre. Plus une lettre à Saint-Robin ! C'est rassurant. Ou inquiétant, comme vous voudrez...<br>
— Vous savez que personne ne croit votre sœur coupable, dit Saillens.<br>
— Au contraire, tout le monde la croit coupable, c'est ce qui me rassure.<br>
— Je sais qu'elle est innocente. J'en ai la preuve.<br>
— Ah ! là, vous commencez à m'inquiéter...<br>
— Vous savez quelque chose ? intervient Laura.<br>
— Oui. Rolande m'a fait une révélation épouvantable. J'aurais voulu l'amener, mais elle pleure depuis deux jours.<br>
— Oh ! cette accusation de vol est ignoble, dit Laura. Tout le monde est indigné.<br>
— Malheureusement, le Corbeau a dit juste. Rolande a bien pris l'argent dans la caisse. Mais ce qui est plus grave, c'est qu'une seule personne l'a su. Et ce n'est pas Marie Corbin.<br>
— Mais alors qui ?<br>
— Le docteur Germain.<br>
— Oh !<br>
— Un instant ! dit le psychiatre. Germain aurait-il prêté de l'argent à votre fille pour le remettre dans la caisse ?<br>
— Ça alors ! Comment le savez-vous ?<br>
— Si c'est votre seul motif pour soupçonner Germain, je peux aussi bien être le coupable. Rolande m'a emprunté 200 francs le mois dernier, et 50 francs à Laura, il y a quinze jours. Sous le même prétexte. Eh ! c'est un truc à elle.

<details><summary>Énoncé</summary>Afficher la liste des personnes à qui Rolande doit au moins 50 francs au 3 mai 1933, avec le montant de la dette correspondante, le tout trié par dette décroissante.

_Aide._ La table `emprunt` répertorie l'ensemble des dettes contractées par Rolande : à qui, quand et combien elle a emprunté, et éventuellement quand elle a rendu l'argent.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>dette</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Théophile Esquirol</td>
            <td>530.00</td>
            <td>60086115509306</td>
        </tr>
        <tr>
            <td>Vania Pons</td>
            <td>395.00</td>
            <td>60086115509306</td>
        </tr>
</table>
Total: 17 rows affected.

</details><br>




— Oh, la petite garce !<br>
— On dirait qu'elle a voulu voulu faire accuser Germain, remarque le psychiatre...<br>
— Elle me le payera !<br>
— Oh, non, il faut être indulgent avec les jeunes filles nerveuses. Quel âge a Rolande ?<br>
— Quatorze ans et demi.<br>
— Ah ! c'est un peu tôt pour la marier... Mais il faudra faire vite !

---

Le dimanche suivant, sur le chemin de la messe, Michel et Laura Vorzet croisent le docteur Germain.

— Tiens, Germain ! s'exclame le psychiatre. Vous ne nous accompagnez pas à l'église ?<br>
— Non, je regrette : je ne suis pas croyant.<br>
— J'aurais dû m'en douter. Vous avez la sécurité de l'athée !<br>
— Et vous, vous êtes croyant ?<br>
— Prudent, répond Vorzet d'un air malicieux. Dans l'incertitude, je prends une assurance. Ça coûte si peu...

------

Quelques minutes plus tard, à l'église, le prêtre monte en chaire et commence par une courte litanie :

— Saint Michel à la lance de flammes...<br>
— Priez pour nous, répond l'assemblée.<br>
— Saint Côme et saint Damien...<br>
— Priez pour nous.<br>
— Agneau de Dieu qui effacez les péchés du monde...<br>
— Priez pour nous.<br>
— Amen.<br>
— Amen.<br>
— Seigneur, préservez-moi de la main du pécheur, et délivrez-moi des hommes injustes. Au nom du Père, du Fils et du Saint-Esprit, ainsi soit-il.

Puis il entame ainsi son homélie :

— Mes chers frères, l'esprit du mal s'était abattu sur votre ville, à cause de vos péchés. Le bruit des discordes submergeait la cité. Et le fils menaçait le père, et la mère maudissait la fille, et l'époux levait la main sur l'épouse. Mais le Seigneur, dans son ineffable miséricorde, a écarté de vous ce fléau. Il faut que vos cœurs, délivrés de la crainte, s'élèvent vers le cœur de Jésus, pour le remercier de cette grâce tout spéciale.

Et levant lui-même les yeux vers le ciel, il s'arrête, pétrifié. Un carré de papier est en train de descendre, comme une feuille morte, des voûtes de la cathédrale. Un murmure d'horreur et d'incrédulité monte de l'assemblée.

_Note._ Saint Michel est un archange, cité dans l'Apocalypse, qui terrasse un dragon assimilé à Satan. Saint Côme et Saint Damien sont deux frères jumeaux qui pratiquaient la médecine dans le port d'Égée, et sont devenus les patrons des chirurgiens et des pharmaciens. Ce n'est vraisemblablement pas par hasard que le prêtre invoque ces saints.

<details><summary>Énoncé</summary>Pour prendre connaissance de cette nouvelle lettre du Corbeau, extraire de la table `fragment` toutes les phrases apparaissant exactement deux fois.<br><br>

<table>
    <thead>
        <tr>
            <th>texte</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝔸𝕌𝕏 ℙ𝔸ℝ𝕆𝕀𝕊𝕊𝕀𝔼ℕ𝕊 𝔻𝔼 ℕ𝕆𝕋ℝ𝔼⌁𝔻𝔸𝕄𝔼</td>
            <td>231782804999116</td>
        </tr>
        <tr>
            <td>𝕄𝔼𝕊 ℂℍ𝔼ℝ𝕊 𝔽ℝ𝔼ℝ𝔼𝕊</td>
            <td>231782804999116</td>
        </tr>
</table>
Total: 9 rows affected.

</details><br>




— C'est un blasphème caractérisé ! s'écrie Bonnevie.<br>
— Il ne respecte même pas la religion ! s'indigne la mercière.

Les notables de Saint-Robin, suivis de quelques paroissiens, se sont retirés dans la sacristie où le substitut vient de leur faire lecture de la dernière missive du Corbeau.

— L'écriture de cette lettre, ajoute le substitut, strictement identique à celle des précédentes, doit innocenter Marie Corbin. N'est-ce pas, docteur Vorzet ?<br>
— C'est indubitable.<br>
— Alors, tout est à recommencer, dit le docteur Bertrand, accablé.<br>
— Oui, mais nous repartons en pleine certitude. L'enveloppe est tombée de la galerie. Pour accéder à la galerie, il faut passer par la tribune. Or, dans la tribune, il y avait dix-huit personnes. Les dix-huit personnes que j'ai priées de venir ici.<br>
— Vous nous accusez ?<br>
— C'est monstrueux !<br>
— Et pourquoi pas nous arrêter en bloc, tant que vous y êtes !<br>
— M. le substitut, nous protestons hautement !<br>
— Je n'y étais pas, dit un homme.<br>
— Et Coulaudon y était !<br>
— Et Ballandieu aussi !<br>
— Quelqu'un pouvait être caché dans la galerie !<br>
— Quelqu'un de la nef a pu envoyer le papier avec une sarbacane !

Le bedeau ouvre la porte :

— Silence, messieurs-dames ! L'office n'est pas terminé !

<details><summary>Énoncé</summary>Lister les paroissiens assistant à la messe ce jour-là.

_Aide._ La colonne `pratiquant` de la table `personne` indique si un paroissien est pratiquant, c'est-à-dire s'il va normalement à l'église tous les dimanches. Pour optimiser le stockage et vous donner un peu de fil à retordre, la table `assistance` ne liste que les exceptions à la pratique religieuse, à savoir, les dates auxquelles soit tel pratiquant était absent, soit tel non-pratiquant était présent.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Adrienne Picard</td>
            <td>225758797168147</td>
        </tr>
        <tr>
            <td>Adrienne Robert</td>
            <td>225758797168147</td>
        </tr>
</table>
Total: 228 rows affected.

</details><br>


Vendredi 12 mai. Tri du courier au bureau de poste.

— Encore une !<br>
— Et celle-ci !<br>
— C'est ma dix-septième !<br>
— Une carte postale anonyme.<br>
— Il y en a même pour la poste restante !<br>
— Oui, maintenant, tout le monde en écrit !<br>
— J'ai pincé la concierge qui en écrivait une à ma femme, qu'est-ce que je lui ai filé comme tarte !<br>
— À la concierge ?<br>
— Non, à ma femme !<br>
— Est-ce qu'on va continuer à les distribuer, oui ou non ?<br>
— Ben, naturellement... Tant qu'on n'aura pas d'ordres ! Qu'est-ce que tu veux faire d'autre ?<br>
— On devient complices, alors !

Le directeur paraît dans la salle de tri.

— Lerminet ! Vous ne semblez pas avoir conscience de notre mission. Quelles que soient les circonstances, une lettre qui nous est confiée doit être remise à son destinataire. Grandeur et servitude postales !

Il avise une enveloppe au-dessus d'un paquet.

— Celle-ci est pour moi, je la prends, dit-il en s'éclipsant.<br>
— C'était pour lui ?<br>
— Non, pour sa femme... Il doit préférer qu'elle ne la lise pas.<br>
— Grandeur et décadence postales ! ironise Lerminet.

<details><summary>Énoncé</summary>Avec qui (nom, nom de travail) le directeur de la poste trompe-t-il sa femme ?

_Aide._ À titre exceptionnel et pour vous aider, toutes les tables de la jointure figurent dans la formule du token.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>nom_travail</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Gatien Réginaud</td>
            <td>postier</td>
            <td>198610734269545</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Quelques jours ce sont écoulés. C'est l'heure des consultations chez le docteur Germain. Il vient de faire entrer dans son cabinet une femme élégante, le visage dissimulé sous un capeline noire d'où tombe une voilette en dentelle. 

— Asseyez-vous, madame. Je vous écoute.<br>
— Voilà, docteur, commence-t-elle en hésitant. Mon mari... Mon mari est tuberculeux... Le moindre choc sentimental pourrait aggraver son état. Je dois lui éviter toute émotion inutile, n'est-ce pas ?<br>
— Ça me paraît prudent, en effet, mais...<br>
— Eh bien voilà. Je... Je n'ai pas partagé la couche de mon mari depuis un an et...

Elle hésite.

— Et ?<br>
— Je suis enceinte.<br>
— Non ! s'écrie Germain en tapant du poing sur son bureau.<br>
— Comment, docteur ?<br>
— Je dis non, madame ! Vous avez peut-être entendu raconter que j'avais pour habitude d'effacer ce genre de souvenirs, mais c'est faux ! Au revoir, madame.

À ce moment, la femme soulève sa voilette.

— C'est vous ! dit-elle d'un air extasié.<br>
— Quoi ?<br>
— C'est vous. C'est bien vous. Oh ! vous ne vous souvenez pas de moi ? Vous m'avez sauvé la vie, il y a cinq ans. Une fracture du crâne, un accident d'auto.<br>
— Vous vous trompez.<br>
— Ah non, je ne me trompe pas.

Son sourire laisse place à la perplexité.

— Mais qu'est-ce qu'un chirurgien comme vous fait dans une ville comme celle-ci ? Vous ne dites rien. Oh ! soyez tranquille, je ne vous trahirai plus maintenant.<br>
— En somme, vous m'avez tendu un piège.<br>
— Je gagne ma vie comme je peux, docteur. On m'avait offert 10.000 francs... Si vous aviez marché, on vous prenait à la gorge.<br>
— Et... qui a monté cette jolie combinaison ?<br>
— Non, docteur. Je ne suis pas une casserole. Tout ce que je peux dire, c'est que ceux qui m'envoient sont des hommes mariés. Et que tous habitent dans la rue même où ils exercent leur métier. Et que chacun de leurs foyers compte exactement deux personnes.<br>
— J'aurais dû m'en douter, dit le docteur Germain après un moment de réflexion.

<details><summary>Énoncé</summary>Donnez la liste des conspirateurs, avec le nom de leur travail, le site où ils sont employés et enfin leur voie. Seule la table `personne` sera utilisée dans la formule du token.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>nom_travail</th>
            <th>site</th>
            <th>voie</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Antoine Delorme</td>
            <td>directeur</td>
            <td>hôpital</td>
            <td>rue du Docteur Larrieu</td>
            <td>90805938243861</td>
        </tr>
        <tr>
            <td>Bernard Delorme</td>
            <td>substitut</td>
            <td>tribunal</td>
            <td>rue François Quesnay</td>
            <td>90805938243861</td>
        </tr>
</table>
Total: 4 rows affected.

</details><br>


Ce même jour, les notables sont à nouveau réunis, cette fois dans le bureau du sous-préfet.

— La situation était grave, elle devient tragique, commence le maire. Je crains le pire.<br>
— Quoi ?<br>
— D'abord, je serai mis en minorité samedi, au conseil municipal...<br>
— C'est regrettable pour vous, dit le sous-préfet. Mais votre point de vue me paraît bien étroit... L'intérêt général d'abord, permettez-moi de vous le dire. Nous sommes face à une épidémie, la contagion gagne de jour en jour !

Un domestique apporte les journaux de Paris.

— Donnez-moi ça, dit Vorzet. Je vais vous lire les manchettes. Ça vous distraira.<br>
— Nous allons encore nous faire assassiner...<br>
— On devrait interdire la presse.<br>
— Alors ? demande le sous-préfet.<br>
— Alors, dit Vorzet... Rien de nouveau.<br>
— Vous permettez ? dit-il en lui prenant le journal des mains. Nom de Dieu !<br>
— Qu'est-ce qu'il y a ?<br>
— Déplacé ! Ils m'ont déplacé. Et j'apprends ça par le journal ! Oh ! oh ! Tout ça pour donner satisfaction à l'opinion publique !<br>
— C'est regrettable pour vous, dit le maire. Mais si cette nouvelle est de nature à ramener le calme dans les esprits, votre sacrifice n'aura pas été inutile. L'intérêt général d'abord, permettez-moi de vous le dire.<br>
— Ah vous, foutez-moi la paix, hein !

Le docteur Delorme lui prend l'épaule et, d'un air grave :

— Croyez bien, mon cher, que nous sommes tout à fait désolés pour vous.<br>
— Oh ! mais vous avez tort. Au fond, je suis ravi. Me voilà débarrassé de Saint-Robin et de ses habitants ! Après tout, j'ai de quoi vivre, n'est-ce pas ? Je ne sais pas pourquoi j'étais venu m'enterrer dans ce trou ! ajoute-t-il à l'adresse du maire.<br>
— Parce que c'était un trou... dans un fromage ! répond celui-ci.<br>
— Ce qui signifie ?<br>
— Ce qui signifie que le Corbeau m'a fourni de singulières précisions sur votre façon d'administrer !<br>
— Répétez ce que vous venez de dire ! Répétez-le !

À ce moment la porte s'ouvre avec fracas. Germain fait irruption dans la pièce.

— J'espère que je ne vous dérange pas. Excusez-moi d'avoir forcé votre porte, mais je n'en ai que pour un instant. M. le substitut, mes compliments. Au lieu d'agir contre l'auteur des lettres, vous essayez de vous débarrasser de sa principale victime ! C'est ingénieux. Plus de docteur Germain, plus de lettres, n'est-ce pas ?<br>
— Euh... vous le prenez sur un ton...<br>
— Qui ne convient pas, je le sais. Mais voici qui vous conviendra sans doute davantage : ma confession. Je ne suis pas gynécologue. Il y a trois ans, je n'avais jamais fait un accouchement. Êtes-vous contents ? Et je ne suis pas non plus le docteur Rémy Germain. Êtes-vous satisfaits ? Vous vouliez me chasser, je suis prêt à partir ! Est-ce suffisant ?<br>
— Ah mais non ! s'écrie le substitut. Si vous croyez vous en tirer comme ça...<br>
— J'ajoute ! l'interrompt Germain, j'ajoute qu'il y a trois ans, je dirigeais un service à l'hôpital Turgot à Paris. J'étais spécialisé dans la chirurgie du cerveau.<br>
— Dans la chirurgie du cerveau ? répète le sous-préfet.<br>
— Vous êtes... Barthélémy Germain ? demande Delorme. Le fameux docteur Barthélémy Germain ?<br>
— Oui. La moitié de mon nom était vraie.<br>
— Mais... pourquoi ?<br>
— Le docteur Barthélémy Germain avait une femme. Pas une virago comme la vôtre, monsieur le médecin-chef. Ni une bigote desséchée comme la vôtre, monsieur le maire.

<details><summary>Énoncé</summary>Affichez la liste des femmes qui n'ont aucun amant (comme la femme du médecin-chef) ou n'ont jamais manqué la messe (comme la femme du maire).<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Adrienne Picard</td>
            <td>155975930645834</td>
        </tr>
        <tr>
            <td>Aimée Fleury</td>
            <td>155975930645834</td>
        </tr>
</table>
Total: 67 rows affected.

</details><br>




— Une femme, reprend le docteur Germain sans même attendre que l'étudiant ait validé sa requête SQL. Une vraie femme. Elle attendait un bébé. Je l'ai mise entre les mains du plus célèbre des chirurgiens. L'affaire se présentait mal. Cet imbécile mit son point d'honneur à me donner un fils quand même. C'était un homme de devoir : il a tué à la fois la mère et l'enfant. Par la même occasion, il a tué le docteur Barthélémy Germain. Depuis, le docteur Rémy Germain s'est retiré dans une petite sous-préfecture. Et il met son savoir au service des mères. Et c'est en pleine liberté de conscience, messieurs, qu'il intervient dans les cas douteux !<br>
— Mais, mon cher, ça change tout...<br>
— En effet ! Vous soupçonniez Rémy Germain, et c'est Barthélémy Germain qui vous accuse de sottise ! Et d'incompétence ! Au revoir, messieurs !

Il sort, laissant les notables sidérés. Enfin, le docteur Delorme rompt le silence et, s'adressant à son fils :

— Eh bien, tu as gagné, petit imbécile !

Il se tourne vers le psychiatre :

— Docteur Vorzet, vous savez y faire avec Germain. Rattrapez-le, présentez-lui nos excuses, essayez de le retenir...

---

En passant devant le lavoir, Germain remarque un attroupement.

— Ah docteur, venez vite !<br>
— Que se passe-t-il ?<br>
— Une gosse est tombée dans le lavoir.<br>
— Un accident ?<br>
— Malheureusement, non.

Il entre. Un homme est en train de gronder une petite fille :

— Si tu étais à moi, je te flanquerais une claque ! Tu n'es pas folle ?<br>
— Laissez-moi mourir ! répond la petite en hoquetant.<br>
— On n'a pas idée de ça, se lamente une femme... À sept ans ! Il faut faire quelque chose !<br>
— Qu'y a-t-il, ma petite ? dit Germain en l'entourant de ses bras.<br>
— Laissez-moi mourir. Je veux mourir !<br>
— Pourquoi, mourir ?<br>
— Parce que papa n'est pas papa.<br>
— Qui a dit ça ?<br>
— Papa a reçu une lettre et maman est partie.<br>
— Bon, eh bien, tu vas rentrer bien gentiment chez toi. Tout ça, ce sont des mensonges. Demain, j'irai voir ton père et je lui expliquerai. Et celui qui a écrit ces lettres sera puni, je te le promets ! Tenez. Ramenez-la chez elle.

<details><summary>Énoncé</summary>Quel est le nom de cette fillette ?<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>âge</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Annette Poirier</td>
            <td>7</td>
            <td>251739877315743</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


— Eh bien, Germain, vous vous lancez sur le sentier de la guerre ?

C'est Vorzet, qui est apparu à l'entrée du lavoir. Les deux hommes se mettent en route vers l'école.

— Je suis complètement écœuré, finit par lâcher Germain. Si j'avais la moindre chance de trouver le coupable, je n'hésiterais pas. Mais là où la police a échoué...<br>
— Elle ne pouvait pas réussir. Ces messieurs cherchent un coupable qui aurait, pour agir, des motifs logiques. C'est imbécile ! Un anonymographe obéit à des mobiles infiniment plus mystérieux, incompréhensibles à la moyenne des hommes. À plus forte raison, à la moyenne des policiers ! Dans toutes les affaires que j'ai étudiées, les coupables présentaient les mêmes tares psychologiques. Toujours des refoulés, plus ou moins détraqués sexuellement.<br>
— Des vieilles filles ?<br>
— Souvent. C'est ce qui m'a gêné pour défendre ma belle-sœur. Et puis des veuves, des impuissants, des vieillards disgraciés, des infirmes. Une infirmité, même dissimulée, laisse dans l'âme des blessures secrètes, et qui peuvent s'envenimer.

En arrivant devant la porte de la résidence de Germain, ils rencontrent Denise. En les voyant, elle réprime un léger boitement.

— Bonjour, M. Vorzet.<br>
— Bonjour, Mlle Saillens.

Quand elle s'est éloignée, ils continuent leur conversation.

— Eh bien, mon cher ? dit Vorzet. Vous avez l'air songeur.<br>
— Pardon. Vous disiez que le Corbeau...<br>
— Oh non ! L'affaire du Corbeau est bien plus compliquée. Allons ! En deux mois, le coupable a écrit au moins huit cent cinquante lettres tracées en majuscules. Je doute qu'une seule personne, même disposant de loisirs importants, ait pu en venir à bout.

Par la fenêtre du bureau de la direction, ils aperçoivent Noël Saillens occupé, semble-t-il, à corriger des travaux d'élèves.

— Il y a de curieux cas de contagion familiale, reprend Vorzet. On voit un mari et une femme, un frère et une sœur, se pencher chaque soir sous la lampe, pour rédiger des missives au vitriol. À quoi pensez-vous ?<br>
— Moi ?<br>
— Je sais... Moi aussi, j'y ai pensé, mais il ne faut pas conclure trop vite.<br>
— À votre avis, c'est Denise ?<br>
— Eh bien... J'avoue que j'ai demandé à Laura de me procurer les lettres qu'elle lui avait écrites. Tout à l'heure encore, j'examinais son écriture. Il y a des coïncidences troublantes. Gênantes, même. Mais, rien de concluant.

Il lance à Germain un regard inquisiteur.

— Franchement, vous aimez Denise ?<br>
— Non... je ne pense pas. Je l'ai désirée. Je la désire encore certaines nuits, quand je me retourne dans mon lit. Mais si je la savais coupable... je la dénoncerais !<br>
— C'est cornélien. Vous avez tout du vieil Horace. Moins la barbe. Mais vous avez une barbe virtuelle, c'est peut-être plus beau.<br>
— Mais enfin, quand vous rencontrez un démon ?<br>
— J'en rencontre un chaque matin, dans ma glace, doublé d'un ange. Vous êtes extraordinaire... Vous croyez que les gens sont tout bons, ou tout mauvais ? Vous croyez que le bien, c'est la lumière, et que l'ombre, c'est le mal? Mais où est l'ombre ? Où est la lumière ? Où est la frontière du mal ? Savez-vous si vous êtes du bon ou du mauvais côté ?<br>
— Quelle littérature !

Pendant qu'ils devisaient, des petits oiseaux se sont regroupés autour d'eux.

— Eh eh ! se réjouit Vorzet. Reconnaîtraient-ils l'ange qui les nourrit ? Malheureusement, je n'ai rien pour eux aujourd'hui. Allez, mes petits !

Les oiseaux pépient et, comme s'ils avaient compris, prennent subitement leur envol.

— Tenez, Germain, je vous aime bien, c'est à mon tour de vous faire ma confession. Je me drogue. Je me pique. C'est pour moi que Marie Corbin subtilisait à la pharmacie les ampoules de morphine. Car elle a une vieille passion pour son ex-fiancé. Et pour autant je ne me considère pas comme un monstre.

Germain reste silencieux.

— Méditez là-dessus et faites votre examen de conscience, conclut Vorzet. Vous serez peut-être étonné du résultat.<br>
— Je me connais !<br>
— Orgueilleux ! Depuis qu'un tourbillon de haine et de délation souffle sur la ville, toutes les valeurs morales sont plus ou moins corrompues. Vous êtes atteint comme les autres et vous tomberez comme eux. Je ne dis pas que vous étranglerez votre maîtresse, non. Mais vous fouillerez ma serviette si je l'oublie sur ce banc. Vous donnerez à ma femme des rendez-vous secrets. Et vous coucherez avec Rolande si elle se jette dans vos bras. Vous n'avez que l'embarras du choix.<br>
— On voit que vous avez l'habitude de soigner les fous !<br>
— À votre service, dit Vorzet en tirant son chapeau.

Avant de partir, il lui lance encore :

— Bonne nuit, quand même !

<details><summary>Énoncé</summary>Vérifiez que Vorzet est le médecin qui prescrit le plus fréquemment une spécialité ne faisant pas partie des indications d'un trouble qu'il a diagnostiqué, et que cette spécialité est la morphine. Pour cela, vous listerez par ordre décroissant, pour chaque prescripteur et chaque spécialité prescrite mais non indiquée, le nombre de prescriptions concernées.

_Aide._ La table `indication` liste des couples de troubles et de spécialités : elle note que telle et telle spécialité est _indiquée_ pour traiter tel ou tel trouble.<br><br>

<table>
    <thead>
        <tr>
            <th>docteur</th>
            <th>spécialité</th>
            <th>prescriptions</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Michel Vorzet</td>
            <td>Morphine</td>
            <td>9</td>
            <td>100323367752641</td>
        </tr>
        <tr>
            <td>Théodore Linz</td>
            <td>Néoby</td>
            <td>2</td>
            <td>100323367752641</td>
        </tr>
</table>
Total: 56 rows affected.

</details><br>


Germain dort très mal cette nuit-là. Quand il sort de chez lui, du haut de l'escalier obscur il voit monter une forme noire, comme celle d'une sorcière avec un balai.

— Qu'est-ce que c'est ? s'écrie-t-il. Qui êtes-vous ?<br>
— Vous ne me reconnaissez pas, docteur ? Je suis Mme Boulin.<br>
— Ah, c'est vous ! Que venez-vous faire ici ?<br>
— La poussière. Depuis la mort de mon fils, je me suis remise femme de ménage. Je balaye l'école tous les matins. Vous ne le saviez pas ?<br>
— Pardon, j'ai eu peur. J'ai passé une nuit affreuse.<br>
— Je connais ça. Voilà deux mois que je ne dors pas. Mais quand François sera vengé, je dormirai.<br>
— Vous savez qui est responsable de sa mort ?<br>
— Je crois le savoir. J'ai interrogé tous les malades hospitalisés en même temps que lui.<br>
— Qui soupçonnez-vous ?<br>
— Vous le saurez toujours assez tôt. Vous connaissez ça ? reprend-elle en sortant un grand rasoir à main. Il n'a servi qu'une fois : François est mort avec sa barbe. Mais il va resservir.

Germain ne peut réprimer un frisson.

— Vous n'avez pas le droit de faire ça.<br>
— Vous croyez ?<br>
— J'en suis sûr.<br>
— Eh bien, je le ferai sans droit.

<details><summary>Énoncé</summary>Listez les patients qui ont été hospitalisés en même temps que François Boulin, avec leurs dates d'entrée et de sortie.<br><br>

<table>
    <thead>
        <tr>
            <th>patient</th>
            <th>entrée</th>
            <th>sortie</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Adrienne Robert</td>
            <td>1933-04-06</td>
            <td>1933-04-12</td>
            <td>258311964244527</td>
        </tr>
        <tr>
            <td>Aimée Fleury</td>
            <td>1933-04-23</td>
            <td>1933-05-11</td>
            <td>258311964244527</td>
        </tr>
</table>
Total: 24 rows affected.

</details><br>


Germain frappe chez Denise. Comme personne ne répond, il entre. Sur le secrétaire, il avise une enveloppe cachetée, sans adresse. Il prend un coupe-papier et, sans hésitation, ouvre l'enveloppe.

            ℂℍ𝕀ℝ𝕌ℝ𝔾𝕀𝔼ℕ 𝔻𝔼 𝕄𝕆ℕ ℂŒ𝕌ℝ
           𝔹𝔼𝕃𝕃𝔼 𝕆ℂℂ𝔸𝕊𝕀𝕆ℕ 𝔻'𝕆ℙÉℝ𝔼ℝ
          𝔻𝔼ℕ𝕀𝕊𝔼 𝔼𝕊𝕋 𝔼ℕℂ𝔼𝕀ℕ𝕋𝔼 𝔻𝔼 𝕋𝕆𝕀
                𝕃𝔼 𝕊𝔸𝕍𝔸𝕀𝕊⌁𝕋𝕌 ?
                 𝕃𝔼 ℂ𝕆ℝ𝔹𝔼𝔸𝕌

Il replie la lettre et la glisse dans une nouvelle enveloppe, qu'il ferme et replace au même endroit. En entendant un bruit de pas, il va se dissimuler derrière une tenture. Denise entre, va s'asseoir à son secrétaire, prend sa plume et écrit sur l'enveloppe :

               𝔻𝕆ℂ𝕋𝔼𝕌ℝ 𝔾𝔼ℝ𝕄𝔸𝕀ℕ

— 18 rue de la Mairie.

Denise sursaute. Germain est devant elle.

— Donnez-moi ça ! Vous économiserez un timbre, dit-il, sardonique.<br>
— Vous êtes là ? Vous m'espionnez, maintenant?<br>
— Donnez-moi ça !<br>
— Jamais !<br>
— Vous m'écrivez une lettre, c'est pour que je la lise !<br>
— Je ne le veux plus !

Elle la jette dans la cheminée.

— Chirurgien de mon cœur, récite Germain. Belle occasion d'opérer : Denise est enceinte de toi...<br>
— Vous avez lu ?<br>
— Ouais. Ainsi, c'est vous. La détraquée qui nous empoisonne depuis des mois, c'est vous !<br>
— Non, ce n'est pas moi.<br>
— Et je vais avoir un enfant de cette demi-folle ! Non !

Il la prend par les épaules, la secoue.

— Je ne veux pas d'un fils taré ! Le Corbeau a raison. Je vous promets que celui-là n'est pas prêt de voir le jour !<br>
— Rémi !

Il la repousse, elle s'effondre sur le lit et se met à sangloter.

— Tout de même, reprend-il, ça fait un drôle d'effet. Je vous soupçonnais depuis trois jours, mais de là à vous pincer en flagrant délit !<br>
— Je ne suis pas le Corbeau. Je te le jure sur l'enfant que je porte !<br>
— Ah non, Denise, pas ça, je vous en prie. Un peu de pudeur ! Je vous ai vue écrire.<br>
— C'est la première fois... Je n'osais pas vous dire la vérité en face. Alors, j'ai voulu vous envoyer une lettre. Et c'est devant le papier que l'idée m'est venue d'imiter l'écriture du Corbeau. Voilà tout.<br>
— J'étais sûr que vous trouveriez un truc. Vorzet m'avait bien dit que les auteurs de lettres anonymes n'avouent jamais. Tu as bien trouvé ton excuse. Seulement votre obstination même à nier prouve que vous êtes coupable.<br>
— Alors, je n'ai qu'à avouer pour que tu me crois innocente ? Tu raisonnes trop, Rémi, tu as la cervelle pleine de raisonnements. Tu ne peux plus rien sentir. Si tu veux savoir la vérité, regarde-moi dans les yeux.<br>
— C'est inutile, je sais.<br>
— Tais-toi. Regarde-moi.

Il la regarde. De longues secondes s'écoulent. Enfin, il détourne la tête.

— Je ne sais pas, reconnaît-il. Je ne sais plus.<br>
— Tu vois. Écoute, Rémi. Je ne suis pas intelligente comme toi, mais je sens les choses. Tout se précipite. J'ai peur. Tu devrais aller voir Laura, tout de suite.<br>
— Laura ? pourquoi, Laura ?<br>
— Elle a reçu ce matin une lettre plus grave que les autres. Une lettre de menaces. Des menaces de mort.<br>
— Tu as vu Laura, ce matin ?<br>
— Non. Elle vient de me téléphoner. Va, je t'en prie...

<details><summary>Énoncé</summary>Lister les personnes qui ont reçu une lettre du Corbeau le jour de leur mort, avec leur nom et la date.<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>date_décès</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>François Boulin</td>
            <td>1933-04-28</td>
            <td>63948705644169</td>
        </tr>
        <tr>
            <td>Modeste Manosque</td>
            <td>1933-05-09</td>
            <td>63948705644169</td>
        </tr>
</table>
Total: 2 rows affected.

</details><br>


Laura Vorzet ouvre sa porte.

— Germain ? Vous êtes bien matinal ! Je me lève à l'instant. Entrez. Que vous arrive-t-il ?<br>
— Je vous ai dit que si vous couriez un danger, je serais là, j'y suis.<br>
— Un danger ? De quoi s'agit-il ?<br>
— Vous n'avez pas reçu ce matin une lettre de menaces ?<br>
— Moi ?<br>
— Vous n'avez téléphoné à personne ?<br>
— À personne. Enfin, qu'est-ce que signifie cette histoire ?<br>
— Que je me suis laissé manœuvrer comme un gamin... Au revoir, Laura, dit-il en lui serrant la main. J'ai été ridicule.<br>
— Ah non, non ! Vous n'allez pas partir comme ça sans donner d'explications.<br>
— Plus tard, il faut que je rentre tout de suite.<br>
— Avouez tout de même que vous faites de drôles de visites.<br>
— J'avoue.<br>
— Attendez...

Laura désigne la boîte de l'entrée. Elle contient une enveloppe. C'est l'écriture du Corbeau. Il la lui prend des mains.

— Vous permettez ?<br>
— Je vous en prie.

En ouvrant l'enveloppe, une balle de fusil lui roule dans la paume. Il déplie la lettre et lit à voix haute :

                𝔻𝔼ℝℕ𝕀𝔼ℝ 𝔸𝕍𝔼ℝ𝕋𝕀𝕊𝕊𝔼𝕄𝔼ℕ𝕋
                 𝕊𝕀 𝕋𝕌 ℕ𝔼 ℂ𝔼𝕊𝕊𝔼𝕊 ℙ𝔸𝕊
         𝕋𝕆𝕌𝕋𝔼 ℝ𝔼𝕃𝔸𝕋𝕀𝕆ℕ 𝔸𝔻𝕌𝕃𝕋Èℝ𝔼 𝔸𝕍𝔼ℂ 𝔾𝔼ℝ𝕄𝔸𝕀ℕ
                     𝔾𝔸ℝ𝔼 À 𝕋𝕆𝕀
              𝕍𝕆𝕀ℂ𝕀 𝕃𝔸 𝕊Œ𝕌ℝ 𝔻𝔼 𝕃𝔸 𝔹𝔸𝕃𝕃𝔼
               ℚ𝕌𝕀 𝕋𝔼 𝕋ℝ𝕆𝕌𝔼ℝ𝔸 𝕃𝔸 ℙ𝔼𝔸𝕌
                    𝕃𝔼 ℂ𝕆ℝ𝔹𝔼𝔸𝕌

— Eh bien, maintenant, tout est clair. Pour m'envoyer ici, il fallait connaître cette lettre. Et pour la connaître, il fallait l'avoir écrite.<br>
— Qui vous a envoyé ici ?<br>
— Denise.<br>
— Ce n'est pas possible... C'est une erreur... Un horrible malentendu !<br>
— Il n'y a ni erreur, ni malentendu possibles.<br>
— Denise n'est pas capable de ça.<br>
— Vous avez une autre explication ?<br>
— Mon pauvre ami...<br>
— C'était bien combiné, si la lettre était arrivée à temps, le tour était joué.

<details><summary>Énoncé</summary>Quels amants de Denise Saillens sont décédés ?<br><br>

<table>
    <thead>
        <tr>
            <th>personne</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Alphonse Jacques</td>
            <td>78824031526341</td>
        </tr>
        <tr>
            <td>Horace Édouard</td>
            <td>78824031526341</td>
        </tr>
</table>
Total: 3 rows affected.

</details><br>


Il se laisse tomber sur une chaise, accablé.

— Je ne sais pas quoi vous dire, souffle-t-elle.<br>
— Oui. C'est effrayant.

Elle s'agenouille à ses côtés, pose sa main sur les siennes.

— Mon chéri...

Il la dévisage, soulève lentement sa main, y dépose un baiser, et soudain :

— Vous écrivez au lit ?<br>
— Quoi ?<br>
— Vous vous levez à l'instant et vous avez déjà les doigts tachés d'encre...<br>
— Je... j'ai rempli des papiers pour Michel, hier soir.<br>
— Vous allez me trouver odieux mais l'encre est encore bien fraîche, dit Germain en se redressant. Et puis on ne se vernit pas les ongles avant de se laver les mains... Oh, Laura, si vous avez fait ça...<br>
— Rémy, mon amour, qu'est-ce qui vous prend ?<br>
— Si vous l'aviez écrite vous-même, cette lettre... Si vous l'aviez glissée vous-même dans la boîte... Si vous aviez vraiment donné ce coup de téléphone... Alors, vous perdiez Denise.<br>
— Oh ! Rémy, comment pouvez-vous imaginer une chose pareille ? Je vous plains...

Pris d'une idée subite, il va au secrétaire, soulève le maroquin. 

— C'est vous qui êtes à plaindre, Laura ! Très à plaindre !<br>
— Qu'est-ce que c'est ?

Sans répondre, il prend la feuille de buvard et la brandit devant le miroir de la cheminée : dans le reflet dansent les caractères de l'écriture maléfique du Corbeau.

— C'est affreux ! Je ne comprends pas, s'écrie Laura... C'est un piège, c'est une machination !<br>
— Plus la peine de jouer la comédie ! Cette fois vous êtes prise, et j'en emporte la preuve ! dit-il en pliant le buvard.<br>
— Non, ne partez pas ! Non, j'ai trouvé : Denise vient faire sa correspondance ici !

Il la repousse, sort, claque la porte derrière lui.

— Rémi ! hurle-t-elle. Rémi ! Rémi !

<details><summary>Énoncé</summary>Concaténez avec un séparateur vide le premier caractère de toutes les phrases de `fragment` dont l'identifiant coïncide avec celui d'une lettre reçue par Laura Vorzet.<br><br>

<table>
    <thead>
        <tr>
            <th>acrostiche</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>𝕃𝔼 ℂ𝕆ℝ𝔹𝔼𝔸𝕌</td>
            <td>118173955981433</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Comme il entre dans le vestibule, le psychiatre arrive également.

— Que faites-vous là ?<br>
— Tenez. Voilà le buvard de votre femme.

Vorzet l'examine avec accablement.

— Je le savais... Laura est folle. Je l'ai surprise hier soir, et depuis je n'ai pas encore trouvé le courage de téléphoner au parquet. Venez avec moi.

Germain le suit dans son bureau. Le vieil homme s'asseoit, baisse la tête.

— Une très jeune femme, un très vieux mari... Voilà tout le drame. Au fond, je suis le grand responsable... Je n'aurais jamais dû épouser Laura. Au début de notre mariage, sa jeunesse m'a réchauffé. J'ai jeté, dans ses dernières flambées, tout ce qui me restait de désir et d'amour. Et puis, peu à peu, je suis devenu l'ami de ma femme. Je ne lui suffisais plus. Mais on lui avait appris la vertu : elle me restait fidèle.

Il regarde Germain.

— Là-dessus, vous êtes arrivé. Vous lui avez plu. Et pour attirer votre attention, elle a écrit la première lettre. Et comme ça ne répondait pas assez, la rage l'a prise. Elle s'est acharnée… Sur vous, qui ne répondiez pas à ses avances… Sur Denise, dont vous étiez l'amant. Elle a compromis sa sœur qui la surveillait ! La rage a tourné au délire, le délire à l'hystérie.

Il replie le buvard et le rend à Germain.

— Maintenant, soyez gentil, portez ce papier buvard au parquet. Je n'en aurai pas la force.<br>
— Moi non plus. Et puis, un procès n'arrangerait rien. Si Laura est malade, soignez-la.<br>
— C'est vous qui dites ça, l'homme aux principes ?<br>
— J'ai beaucoup changé en quelques jours, j'ai compris pas mal de choses. Voyez-vous, Vorzet, ce genre de crise n'est pas inutile. On en sort comme le convalescent émerge de la maladie, plus fort, et plus conscient. C'est terrible à dire mais le mal est nécessaire. Allez ! allez soigner Laura.<br>
— Non... il est trop tard !<br>
— Vous êtes psychiatre, vous dirigez l'asile...<br>
— Même si je le voulais, je ne peux pas signer un certificat d'internement pour ma propre femme !<br>
— Donnez-moi du papier.<br>
— Comment ? Vous le feriez ?<br>
— Oui, dit Germain en commençant à écrire.

Le téléphone sonne, Vorzet décroche.

— Allô ? Oui. C'est moi. Hein ? Oh oui... Oui, oui... Bien. Je vous l'envoie tout de suite.

Germain a terminé de rédiger le certificat d'internement.

— Il ne vous reste plus qu'à demander une ambulance.<br>
— Merci. Pour elle et pour moi. Maintenant, il faut que vous partiez. Denise est tombée en descendant ses escaliers. Elle a fait une mauvaise chute.<br>
— Est-ce que ça a provoqué...<br>
— Allez-y, mon vieux, tout de suite, allez-y !

<details><summary>Énoncé</summary>Quelle est la différence d'âge moyenne au sein des couples dont la femme trompe son mari ?<br><br>

<table>
    <thead>
        <tr>
            <th>différence</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0.5714</td>
            <td>202552683166466</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>




En sortant, ils aperçoivent Laura qui écoutait à la porte.

— Ah non ! ce serait trop facile, s'écrie-t-elle. Vous croyez que je vais me laisser faire comme ça ? C'est lui, le Corbeau ! C'est lui, le fou qu'il faut interner, vous m'entendez Rémy ! Les deux premières lettres, c'est vrai, je les ai écrites. Mais les autres, toutes les autres, il les a combinées ! Il me les a dictées une à une ! Tenez, regardez-le, comme il jubile !<br>
— Voyons, Laura...<br>
— Non ! Je vais parler, enfin ! Ne vous êtes-vous jamais demandé comment il connaissait tous les secrets de la ville ? Il a des espions, des dizaines, des centaines d'espions ! Ils sont partout, partout ! On ne s'en méfie pas mais ils savent tout de nous : les oiseaux ! les oiseaux !<br>
— Laura, dit Vorzet, tu délires, calme-toi.<br>
— Écoutez, Rémy ! Mon mari est chimiste. Il a mis au point sur ses patients un composé à base de morphine et de sérum névrosthénique. Quand il en donne aux oiseaux, leur intelligence peut se développer dans des proportions effroyables, jusqu'à les rendre capables de comprendre le langage des hommes, et de communiquer avec eux. Mon mari les attire, il les nourrit, ils ne peuvent plus se passer de lui. Ils vont, ils viennent, et pour avoir une nouvelle dose, ils lui raconteront tout, tout !<br>
— Allez, Germain, vous devez partir... Partez ! On vous attend !<br>
— Écoutez-moi, Rémy, supplie Laura. Je vous en prie ! Emmenez-moi !

Germain se dégage et sort en courant.

— Calme-toi, dit Vorzet...<br>
— Rémy ! Rémy !<br>
— Tais-toi ! tais-toi !<br>
— Non !<br>
— Tais-toi !<br>
— Menteur !<br>
— Allô ? Donnez-moi le 13 !<br>
— Rémi !<br>
— L'hôpital !<br>
— Rémy ! Rémy !

<details><summary>Énoncé</summary>Listez par dates croissantes les consultations ayant donné lieu au diagnostic d'un seul trouble et à la prescription de sérum névrosthénique. Colonnes attendues : date, patient, médecin, troubles (concaténation des troubles, pour permettre de vérifier qu'il y en a un seul).<br><br>

<table>
    <thead>
        <tr>
            <th>date</th>
            <th>patient</th>
            <th>docteur</th>
            <th>troubles</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1933-04-28</td>
            <td>Laura Vorzet</td>
            <td>Michel Vorzet</td>
            <td>hystérie</td>
            <td>133385354248234</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Germain est au chevet de Denise.

— Alors, docteur ?<br>
— Tout va bien. J'ai eu terriblement peur !<br>
— Pour moi ?<br>
— Pour vous deux.<br>
— Tu as envie de cet enfant?<br>
— J'en ai besoin.<br>
— Nous avons bien failli le perdre. Je descendais les escaliers, quand quelque chose m'a frôlée, une chouette ou un autre oiseau. J'ai perdu l'équilibre, je suis tombée tête la première.<br>
— Tout va bien, Denise. En revenant, je ne pensais qu'à toi. Et pourtant je me disais que l'accoucheur qui a tué ma femme n'était pas aussi coupable que je l'avais jugé.

Germain va à la fenêtre, l'ouvre à deux battants. Les cris des enfants qui jouent remplissent la chambre.

— On ne peut pas sacrifier l'avenir au présent, conclut-il.<br>
— Maintenant, pour avoir un enfant, tu me tuerais à ton tour !<br>
— Peut-être bien, dit-il en l'embrassant...<br>
— Et Laura ? s'inquiète soudain Denise. J'oubliais Laura...<br>
— Oublie-la. Laura et le Corbeau ne font qu'un.<br>
— Tu es fou ? Qu'est ce que tu es allé te mettre dans la tête ? Laura connaissait le Corbeau, ça oui, je l'ai deviné depuis longtemps. Mais ce n'est pas elle. Elle a peur de lui.<br>
— Elle t'a joué la comédie.<br>
— Écoute, Rémi, je ne suis pas si sotte. Laura avait peur pour de bon. Elle était terrorisée.<br>
— Alors, dit lentement Germain, ce serait...

<details><summary>Énoncé</summary>Qui est le véritable Corbeau, sachant qu'il a pour patient exactement un amant de Denise ?<br><br>

<table>
    <thead>
        <tr>
            <th>docteur</th>
            <th>token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Michel Vorzet</td>
            <td>54254940905285</td>
        </tr>
</table>
Total: 1 row affected.

</details><br>


Le docteur Germain court chez les Vorzet. Sur la route, il croise le fourgon d'une ambulance. Les gémissements de Laura lui parviennent au passage : « Laissez-moi, c'est lui, c'est lui ! ».

Arrivé devant la porte, il appelle : « Vorzet ! ».

Pas de réponse. Il entre, traverse le vestibule, court au bureau. Là, il stoppe net, pétrifié. Le psychiatre est à son secrétaire, la gorge tranchée. Sous sa tête, le grand buvard du Corbeau est déjà saturé de sang. À côté, le rasoir de François Boulin, grand ouvert.

— Ainsi, murmure-t-il, c'était bien Vorzet...

Il entend la porte du vestibule qui se referme, un bruit de pas devant la maison. Il court à la fenêtre, l'ouvre en grand.

Dans la rue déserte, une femme toute vêtue de noir s'éloigne d'un pas tranquille.

Il porte la main à son front.

Soudain, un moineau entre par la fenêtre, immédiatement suivi d'un autre, puis d'un troisième.

Bientôt, toute la pièce est envahie d'oiseaux.

