# Lab 10 : Migration, Import/Export et Automatisation MySQL
**Cours :** Bases de Données  
**Étudiant :** [TON NOM ICI]  
**Date :** 28/12/2024

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

