# Restore Backup
db_password=123
site_name=profond.ideendevelopers.xyz
db_backup=

cd ../
sudo docker cp profond_scripts/backup/$db_backup $(sudo docker compose ps -q backend):/tmp
sudo docker compose exec backend bench --site $site_name restore /tmp/$db_backup --mariadb-root-password $db_password
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend