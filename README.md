# Lab 10 : Migration, Import/Export et Automatisation MySQL

---

## 📋 Objectif du Lab
L'objectif de ce laboratoire est de maîtriser les différentes techniques de migration et de synchronisation de données entre deux environnements MySQL (**Développement** $\to$ **Production**).

Nous avons exploré plusieurs méthodes :
1.  **Ligne de commande (CLI)** : `mysqldump`, `mysqlpump`, `mysql`.
2.  **Fichiers plats** : Export et Import CSV (`SELECT ... INTO OUTFILE`, `LOAD DATA`).
3.  **Automatisation** : Scripting Bash/Shell pour les tâches récurrentes.
4.  **Outils graphiques** : MySQL Workbench (Migration Wizard).

---

## 📂 Contenu du Repository

| Fichier | Description |
| :--- | :--- |
| `universite_dev_full.sql` | Dump complet de la base de développement (Structure + Données). |
| `universite_dev_pump.sql` | Export réalisé avec `mysqlpump` (Sauvegarde parallèle). |
| `migrate.sh` | Script d'automatisation (Dump Dev $\to$ Import Prod $\to$ Export CSV). |
| `inscriptions.csv` | Exemple de fichier CSV généré par l'export des inscriptions. |
| `rapport.txt` | (Optionnel) Analyse détaillée des méthodes. |

---

## ⚙️ Instructions d'installation

### 1. Prérequis
* Serveur MySQL 8.0 ou supérieur.
* Client MySQL (Terminal ou Workbench).
*  PowerShell (Windows).


## Captures d'écran :

### Export des fichiers

<img width="1422" height="621" alt="image" src="https://github.com/user-attachments/assets/f152a031-b1b0-4d59-8293-c4e1eacdefbf" />



### Vérification en Production

<img width="1434" height="680" alt="image" src="https://github.com/user-attachments/assets/aee5d979-5783-4da2-9b19-7f964c6d16ff" />

---

<img width="1234" height="742" alt="image" src="https://github.com/user-attachments/assets/f2d17050-6be5-46e2-852b-3a6fa2d39cb7" />



