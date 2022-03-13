<?php
    $domaine = $_SERVER['SERVER_NAME'];
    switch ($domaine) {
        case 'mab-intranet.localhost':
            $dbname = 'mab-intranet';
            $dbuser = 'root';
            $dbpass = 'root';
            break;
        case 'intranet.mab-france.org':
            $dbname = 'mab-france_intra';
            $dbuser = 'mab-france';
            $dbpass = 'valactiveBio11';
            break;
        default:
        $dbname = 'mab-france_intra';
        $dbuser = 'mab-france';
        $dbpass = 'valactiveBio11';
            break;
    }
    $settings = array(


        ###### ADMIN ######
        'admin' => array(
            'max_upload_size' => '62914560',
            'upload_blacklist' => '/\\.(?:php[34567s]?|phtml)$/i',
        ),
        ########


        ###### SYMPHONY ######
        'symphony' => array(
            'pagination_maximum_rows' => '20',
            'lang' => 'fr',
            'pages_table_nest_children' => 'no',
            'version' => '2.7.10',
            'cookie_prefix' => 'sym-',
            'session_gc_divisor' => '10',
            'association_maximum_rows' => '5',
            'cell_truncation_length' => '75',
            'admin-path' => 'symphony',
            'enable_xsrf' => 'no',
        ),
        ########


        ###### LOG ######
        'log' => array(
            'archive' => '1',
            'maxsize' => '102400',
            'filter' => 24575,
        ),
        ########


        ###### IMAGE ######
        'image' => array(
            'cache' => '1',
            'quality' => '90',
        ),
        ########


        ###### DATABASE ######
        'database' => array(
            'driver' => 'mysql',
            'host' => 'localhost',
            'port' => '3306',
            'user'       => $dbuser,
            'password'   => $dbpass,
            'db'         => $dbname,
            'tbl_prefix' => 'sym_',
            'query_logging' => 'off',
        ),
        ########


        ###### PUBLIC ######
        'public' => array(
            'display_event_xml_in_source' => 'no',
        ),
        ########


        ###### GENERAL ######
        'general' => array(
            'useragent' => 'Symphony/2.7.10',
            'sitename' => 'MAB France',
        ),
        ########


        ###### FILE ######
        'file' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### DIRECTORY ######
        'directory' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### REGION ######
        'region' => array(
            'time_format' => 'H:i',
            'date_format' => 'd F Y',
            'datetime_separator' => ' ',
            'timezone' => 'Europe/Paris',
        ),
        ########


        ###### MAINTENANCE_MODE ######
        'maintenance_mode' => array(
            'enabled' => 'no',
            'ip_whitelist' => null,
            'useragent_whitelist' => null,
        ),
        ########


        ###### EMAIL ######
        'email' => array(
            'default_gateway' => 'smtp',
        ),
        ########


        ###### EMAIL_SENDMAIL ######
        'email_sendmail' => array(
            'from_name' => 'Symphony',
            'from_address' => 'noreply@mab-france.valactive.net',
        ),
        ########


        ###### EMAIL_SMTP ######
        'email_smtp' => array(
            'from_name' => 'Mab France',
            'from_address' => 'mab@mab-france.org',
            'host' => 'smtp.gmail.com',
            'port' => '465',
            'secure' => 'ssl',
            'auth' => '1',
            'username' => 'mab@mab-france.org',
            'password' => 'MABFrance2020?',
            'helo_hostname' => null,
        ),
        ########


        ###### MEMBERS ######
        'members' => array(
            'cookie-prefix' => 'sym-members',
            'section' => '7',
        ),
        ########


        ###### BACKEND-NOTIFIER ######
        'backend-notifier' => array(
            'watched_role' => '2',
            'notified_role' => '1',
        ),
        ########


        ###### SITEMAP ######
        'sitemap' => array(
            'index_type' => 'index',
            'primary_type' => 'primary',
            'utilities_type' => 'global',
            'exclude_type' => null,
        ),
        ########


        ###### SORTING ######
        'sorting' => array(
            'section_sous-rubrique_sortby' => null,
            'section_sous-rubrique_order' => 'asc',
            'section_rubrique_sortby' => null,
            'section_rubrique_order' => 'asc',
            'section_categorie_sortby' => '135',
            'section_categorie_order' => 'desc',
            'section_intranet-doc_sortby' => '143',
            'section_intranet-doc_order' => 'desc',
        ),
        ########


        ###### DATETIME ######
        'datetime' => array(
            'english' => 'en, en_GB.UTF8, en_GB',
            'german' => 'de, de_DE.UTF8, de_DE',
        ),
        ########
    );
