#!/usr/bin/bash

# This is a modified version of the quiverlocal setup script
# It must be run as root (as it would be with AWS user-data)
# It will install all prerequisite packages and then 
# download the latest WordPress and configure a new site
# It DOES NOT configure any of the QuiverLocal Db setup steps

bold=$(tput bold)
normal=$(tput sgr0)

USER=`whoami`
USER_HOME=/home/$USER
APACHE_ROOT=/etc/apache2
DOMAIN_HOME=/var/www/domains
DOMAIN_CONFIG=$DOMAIN_HOME/config

APACHE_ROOT=/etc/apache2
APACHE_CONF=$APACHE_ROOT/sites-available
APACHE_LOG=/var/log/apache2

SITE_NAME="localdev01"
DOMAIN_NAME="${SITE_NAME}.local"
SERVER_ADMIN="name@domain.local"

DB_NAME="${SITE_NAME}_db"
DB_USER=wordpress
DB_PASS=start123

BACKGROUND_BBLUE="\u001b[44;1m"
BACKGROUND_END="\u001b[0m"

### Install any of the required packages that are missing
function installRequiredPackages() {
    echo "${bold}►►► Updating Repositories...${normal}"
    apt -y update 
    echo ""

    echo "${bold}►►► Installing Apache...${normal}"
    apt --yes install apache2 ghostscript libapache2-mod-php 
    echo ""

    echo "${bold}►►► Installing PHP...${normal}"
    apt --yes install php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip
    echo ""

    echo "${bold}►►► Installing MySQL...${normal}"
    apt --yes install mysql-server
    echo ""
}


#Download the latest wordpress files, unpack them into the $DOMAIN_HOME, and rename the directory
function installLatestWordpress() {
    if [ ! -d $DOMAIN_HOME ]; then
        mkdir $DOMAIN_HOME
    fi

    cd $DOMAIN_HOME
    curl https://wordpress.org/latest.tar.gz | tar zx -C $DOMAIN_HOME
    mv $DOMAIN_HOME/wordpress $DOMAIN_HOME/$DOMAIN_NAME
}


# Setup the core configuration for the domain
function createCoreDomainConfig() {
    if [ ! -d $DOMAIN_CONFIG ]; then
        mkdir $DOMAIN_CONFIG
    fi

    cat << EOF > $DOMAIN_CONFIG/$SITE_NAME.core
    ServerAdmin $SERVER_ADMIN
    ServerName $DOMAIN_NAME
    DocumentRoot $DOMAIN_HOME/$DOMAIN_NAME

    <Directory $DOMAIN_HOME/$DOMAIN_NAME>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>

    <Directory $DOMAIN_HOME/$DOMAIN_NAME/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
EOF
}

# setup the Apache configuration file for this domain
function createApacheConfig() {

    echo "Updating Apache Configuration"
    cat << EOF > $APACHE_CONF/$SITE_NAME.conf
    <VirtualHost *:80>
	    Include $DOMAIN_CONFIG/$SITE_NAME.core
    </VirtualHost>
EOF
    chown root: $APACHE_CONF/$SITE_NAME.conf

    # Enable the site
    a2ensite $SITE_NAME

    # Disable the default site
    a2dissite 000-default

    # Enable the mod_rewrite module
    a2enmod rewrite
}

### Setup empty database
function createEmptyDatabase() {
    cat << EOF > /tmp/tdbconf
    CREATE USER IF NOT EXISTS $DB_USER@localhost IDENTIFIED BY '$DB_PASS';
    CREATE DATABASE $DB_NAME;
    GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,REFERENCES ON $DB_NAME.* TO $DB_USER@localhost;
    FLUSH PRIVILEGES;
EOF

    mysql -u root < /tmp/tdbconf
}



### Update existing WordPress config
function updateWordPressConfig() {
    cp $DOMAIN_HOME/$DOMAIN_NAME/wp-config-sample.php /tmp/twpconf

    # Remove cache entry
    sed -i "/WPCACHEHOME/d" /tmp/twpconf

    # Replace database connection information with local values
    NEW_DB_NAME_STRING="define( 'DB_NAME', '${DB_NAME}' );"
    NEW_DB_USER_STRING="define( 'DB_USER', '${DB_USER}' );"
    NEW_DB_PASS_STRING="define( 'DB_PASSWORD', '${DB_PASS}' );"
    NEW_DB_HOST_STRING="define( 'DB_HOST', 'localhost' );"
    sed -i "s|.*'DB_NAME'.*|$NEW_DB_NAME_STRING|g" /tmp/twpconf
    sed -i "s|.*'DB_USER'.*|$NEW_DB_USER_STRING|g" /tmp/twpconf
    sed -i "s|.*'DB_PASSWORD'.*|$NEW_DB_PASS_STRING|g" /tmp/twpconf
    sed -i "s|.*'DB_HOST'.*|$NEW_DB_HOST_STRING|g" /tmp/twpconf

    echo "Updating SALTs"
    NEW_AUTH_KEY="define( 'AUTH_KEY',         '`openssl rand -base64 48`' );"
    NEW_SECURE_AUTH_KEY="define( 'SECURE_AUTH_KEY',  '`openssl rand -base64 48`' );"
    NEW_LOGGED_IN_KEY="define( 'LOGGED_IN_KEY',    '`openssl rand -base64 48`' );"
    NEW_NONCE_KEY="define( 'NONCE_KEY',        '`openssl rand -base64 48`' );"
    NEW_AUTH_SALT="define( 'AUTH_SALT',        '`openssl rand -base64 48`' );"
    NEW_SECURE_AUTH_SALT="define( 'SECURE_AUTH_SALT', '`openssl rand -base64 48`' );"
    NEW_LOGGED_IN_SALT="define( 'LOGGED_IN_SALT',   '`openssl rand -base64 48`' );"
    NEW_NONCE_SALT="define( 'NONCE_SALT',       '`openssl rand -base64 48`' );"

    sed -i "s|.*'AUTH_KEY.*|$NEW_AUTH_KEY|g" /tmp/twpconf
    sed -i "s|.*'SECURE_AUTH_KEY.*|$NEW_SECURE_AUTH_KEY|g" /tmp/twpconf
    sed -i "s|.*'LOGGED_IN_KEY.*|$NEW_LOGGED_IN_KEY|g" /tmp/twpconf
    sed -i "s|.*'NONCE_KEY.*|$NEW_NONCE_KEY|g" /tmp/twpconf
    sed -i "s|.*'AUTH_SALT.*|$NEW_AUTH_SALT|g" /tmp/twpconf
    sed -i "s|.*'SECURE_AUTH_SALT.*|$NEW_SECURE_AUTH_SALT|g" /tmp/twpconf
    sed -i "s|.*'LOGGED_IN_SALT.*|$NEW_LOGGED_IN_SALT|g" /tmp/twpconf
    sed -i "s|.*'NONCE_SALT.*|$NEW_NONCE_SALT|g" /tmp/twpconf

    cp /tmp/twpconf $DOMAIN_HOME/$DOMAIN_NAME/wp-config.php
}


### Restart Apache
function restartApache() {
    systemctl restart apache2
}


printf " ${BACKGROUND_BBLUE}Setting Up WordPress${BACKGROUND_END} \n\n"
installRequiredPackages
installLatestWordpress

createCoreDomainConfig
createApacheConfig
createEmptyDatabase

# Create new wp-config.php file from default template
updateWordPressConfig


restartApache


printf "${BACKGROUND_BBLUE} WordPress setup complete ${BACKGROUND_END}\n"

