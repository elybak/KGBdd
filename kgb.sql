
 Créer une application web
©Studi - Reproduction interdite GDWFSCAWEXAIII1A Page 2 sur 3
Veuillez noter que les envois des différentes étapes qui seraient envoyés par un autre moyen que cette interface 
‘Evaluation’ de votre plateforme (courrier, email, fax) ne pourront être traités. Seuls les documents transmis au 
format .doc, .docx ou au format .pdf ou .zip pourront être traités par notre serveur.
L’objectif est de créer un site internet permettant la gestion des données du KGB.
Consignes techniques :

1 Le site sera réalisé en HTML5, CSS3, JS ES6+ et PHP 7.
2 Vous pouvez utiliser un Framework CSS de votre choix.
3 Vous pouvez utiliser les librairies JS / CSS de votre choix, jQuery inclus.
4 Vous ne pouvez pas utiliser de Framework JS (React, Angular, etc.), de Framework PHP (Symfony, etc.).
5 Les agents ont un nom, un prénom, une date de naissance, un code d''identification, une nationalité, 1 
ou plusieurs spécialités.
 Les cibles ont un nom, un prénom, une date de naissance, un nom de code, une nationalité.
 Les contacts ont un nom, un prénom, une date de naissance, un nom de code, une nationalité.
 Les planques ont un code, une adresse, un pays, un type.
 Les missions ont un titre, une description, un nom de code, un pays, 1 ou plusieurs agents, 1 ou 
plusieurs contacts, 1 ou plusieurs cibles, un type de mission (Surveillance, Assassinat, Infiltration …), un 
statut (En préparation, en cours, terminé, échec), 0 ou plusieurs planque, 1 spécialité requise, date de 
début, date de fin.
 Les administrateurs ont un nom, un prénom, une adresse mail, un mot de passe, une date de création.
Règle métier :
 Sur une mission, la ou les cibles ne peuvent pas avoir la même nationalité que le ou les agents.
 Sur une mission, les contacts sont obligatoirement de la nationalité du pays de la mission.
 Sur une mission, la planque est obligatoirement dans le même pays que la mission.
 Sur une mission, il faut assigner au moins 1 agent disposant de la spécialité requise.
Il vous est demandé de créer la base de données selon cette description. Tous les champs devront 
avoir les bons types, avec optimisation. Il faut également créer les liens entre les différentes tables. 
Certaines colonnes sont peut-être manquantes et nécessaires à votre développement, à vous de les 
fournir. Aucun jeu de données n’est fourni. Il faudra présenter un schéma de conception (MCD/MLD). 
Il faudra créer un script de création de la base, facilement exécutable pour une création rapide.
Il vous est ensuite demandé de créer une interface front-office, accessible à tous, permettant de 
consulter la liste de toutes les missions, ainsi qu’une page permettant de voir le détail d’une mission.
Livrable attendu pour l’examen de ce bloc
Contexte du projet : la BDD
Modalités Pédagogiques



---------------------------------------------------------------------------------------

 Les cibles ont un nom, un prénom, une date de naissance, un nom de code, une nationalité.
 Les contacts ont un nom, un prénom, une date de naissance, un nom de code, une nationalité.
 Les planques ont un code, une adresse, un pays, un type.
 Les missions ont un titre, une description, un nom de code, un pays, 1 ou plusieurs agents, 1 ou 
plusieurs contacts, 1 ou plusieurs cibles, un type de mission (Surveillance, Assassinat, Infiltration …), un 
statut (En préparation, en cours, terminé, échec), 0 ou plusieurs planque, 1 spécialité requise, date de 
début, date de fin.
 Les administrateurs ont un nom, un prénom, une adresse mail, un mot de passe, une date de création.
Règle métier :
 Sur une mission, la ou les cibles ne peuvent pas avoir la même nationalité que le ou les agents.
 Sur une mission, les contacts sont obligatoirement de la nationalité du pays de la mission.
 Sur une mission, la planque est obligatoirement dans le même pays que la mission.
 Sur une mission, il faut assigner au moins 1 agent disposant de la spécialité requise.


-- creation de la base de données

creation des entités :

- agents
- cibles
- contacts
- planques
- missions
- administrateurs

-- creation des tables

CREATE TABLE agents (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    code_identification VARCHAR(100),
    nationalite VARCHAR(100),
    specialites VARCHAR(100)
);

CREATE TABLE cibles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    nom_code VARCHAR(100),
    nationalite VARCHAR(100)
);

CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    nom_code VARCHAR(100),
    nationalite VARCHAR(100)
);

CREATE TABLE planques (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(100),
    adresse VARCHAR(100),
    pays VARCHAR(100),
    type VARCHAR(100)
);

CREATE TABLE missions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100),
    description TEXT,
    nom_code VARCHAR(100),
    pays VARCHAR(100),
    agents VARCHAR(100),
    contacts VARCHAR(100),
    cibles VARCHAR(100),
    type_mission VARCHAR(100),
    statut VARCHAR(100),
    planques VARCHAR(100),
    specialite_requise VARCHAR(100),
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE administrateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    adresse_mail VARCHAR(100),
    mot_de_passe VARCHAR(100),
    date_creation DATE
);

-- creation des liens entre les tables

ALTER TABLE missions ADD FOREIGN KEY (agents) REFERENCES agents(id);
ALTER TABLE missions ADD FOREIGN KEY (contacts) REFERENCES contacts(id);
ALTER TABLE missions ADD FOREIGN KEY (cibles) REFERENCES cibles(id);
ALTER TABLE missions ADD FOREIGN KEY (planques) REFERENCES planques(id);


