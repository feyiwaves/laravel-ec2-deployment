#!/bin/bash

echo "Starting LAMP Stack Installation for Laravel Deployment..."

# Update system
sudo apt update -y
sudo apt upgrade -y

# Install Apache
echo "Installing Apache..."
sudo apt install apache2 -y

# Install MySQL Server
echo "Installing MySQL..."
sudo apt install mysql-server -y

# Secure MySQL (manual step required for password setup)
echo "un 'sudo mysql_secure_installation' manually after script if needed"

# Install PHP and extensions required for Laravel
echo "Installing PHP..."
sudo apt install php libapache2-mod-php php-mysql php-cli php-mbstring php-xml php-bcmath php-curl unzip -y

# Restart Apache after PHP install
sudo systemctl restart apache2

# Install Composer
echo "Installing Composer..."
cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Set permissions for web server
echo "Setting permissions..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Restart services
echo "Restarting services..."
sudo systemctl restart apache2
sudo systemctl enable apache2
sudo systemctl enable mysql

echo "LAMP STACK INSTALLATION COMPLETE!"
echo "Next step: clone Laravel project into /var/www/html"
```

