<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');

	Class eventAuthor_Login extends Event{
		
		public static function about(){
			
			$description = new XMLElement('p', 'This is an event that displays basic login details (such as their real name, username and author type) if the person viewing the site have been authenticated by logging in to Symphony. It is useful if you want to do something special with the site if the person viewing it is an authenticated author.');
					
			return array(
				'name' => 'Author Login',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://www.domain7.com/',
					'email' => 'stephen@domain7.com'
				),
				'version' => '0.1',
				'release-date' => '2010-12-31',
				'trigger-condition' => 'action[login] field or an already valid Symphony cookie',
				'recognised-fields' => array(
					array('username', true),
					array('password', true)
				));
		}
				
		public function load(){
			return $this->__trigger();
		}

		public static function documentation(){
			return new XMLElement('p', 'This is an event that displays basic login details (such as their real name, username and author type) if the person viewing the site have been authenticated by logging in to Symphony. It is useful if you want to do something special with the site if the person viewing it is an authenticated author.');
		}
		
		protected function __trigger(){
			
			## Cookies only show up on page refresh. This flag helps in making sure the correct XML is being set
			$loggedin = false;
		
			if(isset($_REQUEST['action']['login'])){
				$username = $_REQUEST['username'];
				$password = $_REQUEST['password'];
				$loggedin = Frontend::instance()->login($username, $password);
			}
			
			else $loggedin = Frontend::instance()->isLoggedIn();


			if($loggedin){
				$result = new XMLElement('login-info');
				$result->setAttribute('logged-in', 'true');
				$author = Frontend::instance()->Author;
				$result->setAttributeArray(array(
					'id' => $author->get('id'), 
					'user-type' => $author->get('user_type'),
					'primary-account' => $author->get('primary')
				));
	
				$fields = array(
					'name' => new XMLElement('name', $author->getFullName()),
					'username' => new XMLElement('username', $author->get('username')),
					'email' => new XMLElement('email', $author->get('email'))
				);
	
				if($author->isTokenActive()) $fields['author-token'] = new XMLElement('author-token', $author->createAuthToken());
	
				if($section = Symphony::Database()->fetchRow(0, "SELECT `id`, `handle`, `name` FROM `tbl_sections` WHERE `id` = '".$author->get('default_section')."' LIMIT 1")){
					$default_section = new XMLElement('default-section', $section['name']);
					$default_section->setAttributeArray(array('id' => $section['id'], 'handle' => $section['handle']));
					$fields['default-section'] = $default_section;
				}
				
				foreach($fields as $f) $result->appendChild($f);
				
				$context['params']['author-id'] = $author->get('id');
			}
			
			else{
				
				$result = new XMLElement('user');
				$result->setAttribute('logged-in', 'false');
			}
			
			return $result;
			
		}
	}

?>