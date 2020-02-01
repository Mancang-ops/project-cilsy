echo "Lemme get Update first dude"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo apt-get update
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo "I'm doing installation nginx now"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo apt-get install php-fpm php-mysql
echo -e "\033[1;32m <<=======================================>>\033[0m" 
echo -e "\033[1;32m <<=======================================>>\033[0m"   
echo "And You need This Mysql, so i'll install it for you bruhh"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo apt-get install -y mysql-server
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo "installation of zip"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo apt install -y zip
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo "Config Nginx PHP"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
cd /etc/nginx/sites-available/
sudo cp default php7.2-config
#


sudo tee php7.2-config > /dev/null <<EOF 
                server {
                    listen 80 default_server;
                    listen [::]:80 default_server;

                    root /var/www/html/sosial-media-master;
                    index index.php index.html index.htm index.nginx-debian.html;

                    server_name server_domain_or_IP;

                    location / {
                        try_files \$uri \$uri/ =404;
                    }

                    location ~ \.php$ {
                        include snippets/fastcgi-php.conf;
                        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
                    }

                    location ~ /\.ht {
                        deny all;
                    }
                }


EOF

#
cd /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/php7.2-config /etc/nginx/sites-enabled/
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo nginx -t
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo systemctl reload nginx
echo "The Preparation is done"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
sudo mysql -u root  -e "create user 'devopscilsy'@'localhost' identified by '1234567890';"
sudo mysql -u root  -e "grant all privileges on *.* to 'devopscilsy'@'localhost';"
echo "user devopscilsy has added, Check it first bruhh :"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
#echo "Insert the password of the user : "
sudo mysql -u devopscilsy -p1234567890 -e "create database dbsosmed;"
sudo mysql -u devopscilsy -p1234567890 -e "show databases;"
echo "database has created, please check it boss"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo "download web sosial media script"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
cd
wget https://github.com/sdcilsy/sosial-media/archive/master.zip
unzip master.zip
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo -e "\033[1;32m <<=======================================>>\033[0m"
echo "<<Unzip the master of sosial media web, then move it to /var/www/html/>>"
sudo rm -r /var/www/html/*
sudo mv sosial-media-master/* /var/www/html/
cd /var/www/html/
sudo mysql -u devopscilsy -p1234567890 dbsosmed < dump.sql
echo "All done, Enjoy it bro"

