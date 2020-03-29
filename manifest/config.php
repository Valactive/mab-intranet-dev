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
			'password' => 'France2020MAB?',
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
			'sections' => '33,8,30,12',
		),
		########


		###### DOCUMENTATION ######
		'documentation' => array(
		),
		########


		###### SEARCH_INDEX ######
		'search_index' => array(
			're-index-per-page' => '20',
			're-index-refresh-rate' => '0.5',
			'get-param-prefix' => null,
			'get-param-keywords' => 'keywords',
			'get-param-per-page' => 'per-page',
			'get-param-sort' => 'sort',
			'get-param-direction' => 'direction',
			'get-param-sections' => 'sections',
			'get-param-page' => 'page',
			'default-sections' => null,
			'default-per-page' => '20',
			'default-sort' => 'score',
			'default-direction' => 'desc',
			'excerpt-length' => '250',
			'min-word-length' => '3',
			'max-word-length' => '30',
			'stem-words' => 'yes',
			'build-entries' => 'no',
			'mode' => 'like',
			'log-keywords' => 'yes',
			'indexes' => 'a:8:{i:11;a:3:{s:6:\"fields\";a:2:{i:0;s:5:\"titre\";i:1;s:5:\"texte\";}s:9:\"weighting\";s:1:\"0\";s:7:\"filters\";a:0:{}}i:15;a:3:{s:6:\"fields\";a:4:{i:0;s:9:\"biosphere\";i:1;s:7:\"adresse\";i:2;s:6:\"auteur\";i:3;s:14:\"liens-internet\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}i:17;a:3:{s:6:\"fields\";a:6:{i:0;s:9:\"biosphere\";i:1;s:18:\"nombre-de-communes\";i:2;s:17:\"nombre-dhabitants\";i:3;s:16:\"superficie-en-ha\";i:4;s:7:\"regions\";i:5;s:12:\"departements\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}i:9;a:3:{s:6:\"fields\";a:4:{i:0;s:3:\"nom\";i:1;s:7:\"contenu\";i:2;s:16:\"rubrique-parente\";i:3;s:12:\"type-de-page\";}s:9:\"weighting\";s:1:\"0\";s:7:\"filters\";a:0:{}}i:16;a:3:{s:6:\"fields\";a:1:{i:0;s:7:\"contenu\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}i:12;a:3:{s:6:\"fields\";a:4:{i:0;s:5:\"titre\";i:1;s:13:\"fichier-joint\";i:2;s:24:\"auteur-de-la-publication\";i:3;s:7:\"editeur\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}i:18;a:3:{s:6:\"fields\";a:1:{i:0;s:10:\"territoire\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}i:23;a:3:{s:6:\"fields\";a:1:{i:0;s:7:\"actions\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}}',
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


		###### SITEMAP_XML ######
		'sitemap_xml' => array(
			'index_type' => 'index',
			'global' => 'sitemap',
			'lastmod' => '2013-06-05T08:59:16+02:00',
			'changefreq' => 'daily',
		),
		########


		###### RECAPTCHA ######
		'recaptcha' => array(
			'public-key' => '6LeFIhQUAAAAACZTFrrkbVEpEkCdbi3aeo4bNQJU',
			'private-key' => '6LeFIhQUAAAAACOIdgPlHcXfGhL8d_o_GbOuZM4r',
		),
		########
	);
