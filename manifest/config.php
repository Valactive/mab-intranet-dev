<?php
    $domaine = $_SERVER['SERVER_NAME'];
    switch ($domaine) {
        case 'intranet.mab-france.org':
            $dbname = 'mab-france_intra';
            $dbuser = 'mab-france';
            $dbpass = 'valactiveBio11';
            break;
        case 'mab-intranet.localhost':
            $dbname = 'mab-intranet';
            $dbuser = 'root';
            $dbpass = 'root';
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
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '17',
			'allow_page_subscription' => '1',
			'lang' => 'fr',
			'pages_table_nest_children' => 'no',
			'version' => '2.2.5',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
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
			'character_set' => 'utf8',
			'character_encoding' => 'utf8',
			'runtime_character_set_alter' => '1',
			'host' => 'localhost',
			'port' => '3306',
			'user'       => $dbuser,
			'password'   => $dbpass,
			'db'         => $dbname,
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'yes',
		),
		########


		###### GENERAL ######
		'general' => array(
			'useragent' => 'Symphony/2.2.5',
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
		),
		########


		###### LANGUAGE_REDIRECT ######
		'language_redirect' => array(
			'language_codes' => 'fr,en',
		),
		########


		###### MEMBERS ######
		'members' => array(
			'cookie-prefix' => 'sym-members',
			'section' => '7',
		),
		########


		###### CKEDITOR ######
		'ckeditor' => array(
			'sections' => '8,30,12',
		),
		########


		###### DOCUMENTATION ######
		'documentation' => array(
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
	);
