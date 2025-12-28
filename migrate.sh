#!/bin/bash

# Configuration des variables
DB_SOURCE="universite_dev"
DB_TARGET="universite_prod"
DB_USER="root"
# Laissez vide si pas de mot de passe, ou mettez votre mot de passe ici
DB_PASS="votre_mot_de_passe" 

# Chemin sécurisé pour l'export CSV (Souvent /var/lib/mysql-files/ sous Linux)
CSV_OUTPUT="/var/lib/mysql-files/inscriptions_export.csv"

echo "==========================================="
echo "   DÉBUT DE LA MIGRATION AUTOMATISÉE       "
echo "==========================================="

# 1. DUMP (Export) de la base DEV
echo "[1/3] Export de $DB_SOURCE..."
mysqldump -u $DB_USER -p"$DB_PASS" \
    --single-transaction \
    --routines --triggers \
    $DB_SOURCE > /tmp/full_dump.sql

if [ $? -eq 0 ]; then
    echo "      -> Export SQL réussi (/tmp/full_dump.sql)."
else
    echo "      -> Erreur lors de l'export."
    exit 1
fi

# 2. IMPORT dans la base PROD
echo "[2/3] Import vers $DB_TARGET..."
mysql -u $DB_USER -p"$DB_PASS" $DB_TARGET < /tmp/full_dump.sql

if [ $? -eq 0 ]; then
    echo "      -> Import SQL réussi."
else
    echo "      -> Erreur lors de l'import."
    exit 1
fi

# 3. EXPORT CSV (Table Inscription)
echo "[3/3] Génération du fichier CSV..."
# On supprime le fichier s'il existe déjà pour éviter l'erreur "File exists"
if [ -f "$CSV_OUTPUT" ]; then
    rm "$CSV_OUTPUT"
fi

mysql -u $DB_USER -p"$DB_PASS" -e "SELECT * INTO OUTFILE '$CSV_OUTPUT' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM $DB_SOURCE.INSCRIPTION;"

if [ $? -eq 0 ]; then
    echo "      -> Export CSV réussi ($CSV_OUTPUT)."
else
    echo "      -> Erreur lors de l'export CSV (Vérifiez les permissions secure-file-priv)."
fi

echo "==========================================="
echo "   MIGRATION TERMINÉE AVEC SUCCÈS          "
echo "==========================================="