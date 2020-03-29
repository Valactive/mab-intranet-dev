<?php
	require_once(EXTENSIONS . '/email_template_manager/lib/class.emailtemplate.php');
	require_once(EXTENSIONS . '/email_template_manager/lib/class.emailtemplatemanager.php');

	/**
	 * Extension driver
	 *
	 */
	class Extension_Backend_Notifier extends Extension {
	
		/**
		 * Extension information
		 */
		
		public function about() {
			return array(
				'name'			=> 'Backend Notifier',
				'version'		=> '0.1',
				'release-date'	=> '2011-10-12',
				'author'		=> array(
					'name'			=> 'Valéry Frisch',
					'website'		=> 'http://valactive.com/',
					'email'			=> 'valery@valactive.com'
				),
				'description'	=> 'send email notification to author with special Author Roles when new entry is created in backend by user with an other Author Roles. Ex. : when user with  role of "contributor" create a new entry, an email is send to all authors with "admin" role'
			);
		}

		/**
		 * Add callback functions to backend delegates
		 */
		public function getSubscribedDelegates() {
			return array(
				//PREFERENCES
				array(
					'page'		=> '/system/preferences/',
					'delegate'	=> 'AddCustomPreferenceFieldsets',
					'callback'	=> 'appendPresets'
				),
				
				array(
					'page'		=> '/system/preferences/',
					'delegate'	=> 'Save',
					'callback'	=> 'savePresets'
				),
				//BACKEND
				array(
					'page'		=> '/publish/new/',
					'delegate'	=> 'EntryPostCreate',
					'callback'	=> '__initBackendNotifier'
				)/*,
				array(
					'page'		=> '/publish/edit/',
					'delegate'	=> 'EntryPostEdit',
					'callback'	=> '__initBackendNotifier'
				),
				array(
					'page'		=> '/publish/',
					'delegate' 	=> 'Delete',
					'callback' 	=> '__initBackendNotifier'
				)*/

			);
		}

/***********************************************************/
/* Préférences                                             */
/***********************************************************/

		/**
		 * Ajout des paramètres dans les préférences.
		 *
		 * @return void
		 */		

		public function appendPresets($context)
		{
			$wrapper = $context['wrapper'];
			
			$fieldset = new XMLElement('fieldset', '', array('class'=>'settings'));
			$fieldset->appendChild(new XMLElement('legend', __('Backend Notifier')));
			
			$label = Widget::Label('Rôle à surveiller');

			
			$roles = $this->getRoles();
			
			//check for active surv roles
			$watched_role = Symphony::Configuration()->get('watched_role', 'backend-notifier');

			//check for active surv roles
			$notified_role = Symphony::Configuration()->get('notified_role', 'backend-notifier');

			foreach($roles as $role)
			{
				$surv_options[] = array($role['id'], $role['id'] == $watched_role, $role['name']);
				$not_options[] = array($role['id'], $role['id'] == $notified_role, $role['name']);
			}
			$label->appendChild(Widget::Select('backend_notifier[surveille]', $surv_options));
			
			$fieldset->appendChild($label);
			
			$label = Widget::Label('Rôle à notifier');

			$fieldset->appendChild($label);
			$fieldset->appendChild(new XMLElement('p', __('Attention à choisir un rôle différent du rôle surveillé !'), array('class' => 'help')));
			
			$label->appendChild(Widget::Select('backend_notifier[notifie]', $not_options));
		
			
			
			$wrapper->appendChild($fieldset);
		}
		/**
		 * Save the presets
		 */
		public function savePresets($context)
		{
			if(isset($_POST['backend_notifier'])) {	
			
					
				$survStr = $_POST['backend_notifier']['surveille'];
				$notStr = $_POST['backend_notifier']['notifie'];
				
				Symphony::Configuration()->set('watched_role', $survStr, 'backend-notifier');
				Symphony::Configuration()->set('notified_role', $notStr, 'backend-notifier');
				Administration::instance()->saveConfig();
			} else {
				// If no roles are selected, delete the file:
				$this->uninstall();
			}
		}

/***********************************************************/
/* Utilitaires                                             */
/***********************************************************/
		/**
		 * Get the roles
		 * @return	An array with the roles
		 */
		public function getRoles()
		{
			$roles = Symphony::Database()->fetch('SELECT * FROM `tbl_author_roles` ORDER BY `name` ASC');
			return $roles;
		}

		/**
		 * Get the role of the current logged in author
		 * @return	An associated array with all the information you need, or false if no role is assigned
		 */
		private function getCurrentAuthorRoleData()
		{
			if(Administration::instance()->isLoggedIn())
	        {
	            $id_author = Administration::instance()->Author->get('id');
	            $id_role   = $this->getAuthorRole($id_author);
	           

	            if($id_role != false)
	            {
	                $data      = $this->getData($id_role);
	                return $data;
	            } else {
	                return false;
	            }
	        }
		}
		/**
		 * Get the role of this author
		 * @param	$id_author	The ID of the author
		 * @return	The role ID
		 */
		public function getAuthorRole($id_author)
		{		
			$id_role = Symphony::Database()->fetchVar('id_role', 0, 'SELECT `id_role` FROM `tbl_author_roles_authors` WHERE `id_author` = '.$id_author.';');
			return $id_role;
		}
		/**
		 * Get the authors from a specific role:
		 * @param	$id_role	The ID of the role
		 * @return	array		An array with the id, first_name and last_name of the authors
		 */
		public function getAuthors($id_role)
		{
			$authors = Symphony::Database()->fetch('
				SELECT
					A.`id`,
					A.`first_name`,
					A.`last_name`,
					A.`email`
				FROM
					`tbl_authors` A,
					`tbl_author_roles_authors` B
				WHERE
					B.`id_role` = '.$id_role.' AND
					B.`id_author` = A.`id`;');
			return $authors;
		}
		

/***********************************************************/
/* Backend Notifier                                        */
/***********************************************************/

		/**
		 * Init the Backend Notifier if conditions are met
		 *
		 * @return void
		 */		
		public function __initBackendNotifier($context) {
			$callback = Symphony::Engine()->getPageCallback();

			Administration::instance()->Page->pageAlert("This is a notice",Alert::NOTICE);

			//check if is admin and entries are Actualités or Publications
			if(Administration::instance()->isLoggedIn())
	        {
	        	if($callback['context']['section_handle'] == 'publications' || $callback['context']['section_handle'] == 'actualites')
	        	{
			       	$fields = $context['fields'];
			       	$entry = $context['entry'];
			        	
			        if($entry){	
			        	$entry_id = $entry->get('id');
			        }
			        $entry_titre = $fields['titre'];
			        $author_username = Administration::instance()->Author->get('username');
			        $delegate = $context['delegate'];//possible values : EntryPostEdit, Delete, EntryPostCreate
			        
			        $admin_url = SYMPHONY_URL.'/publish/'.$callback['context']['section_handle'].'/edit/'.$entry_id.'/';
			        //prepare email content
			        //subject
			        $subject = "";
			        $body = "";
			        switch($delegate){
			        	case "EntryPostEdit":
			        	$subject = 'L\'utilisateur "'.$author_username.'" vient d\'effectuer la mise à jour de : "'.$entry_titre.'".';
			        	$body = "Vous pouvez voir ce contenu à l'adresse suivante : ".$admin_url.".\r\n\nCeci est un email envoyé automatiquement.\r\nMerci de ne pas y répondre.";
			        	break;
			        	
			        	case "Delete":
			        	$subject = "L'utilisateur ". $author_username . " vient de supprimer l'entrée n° ".$context['entry_id'][0].".";
			        	$body = "Ceci est un email d'information envoyé automatiquement.\r\nMerci de ne pas y répondre.";
			        	break;
			        	
			        	case "EntryPostCreate":
			        	$subject = 'L\'utilisateur "'. $author_username .'" vient de créer : "'.$entry_titre.'".';
			        	$body = "Vous pouvez voir ce contenu à l'adresse suivante : ".$admin_url.".\r\n\nCeci est un email envoyé automatiquement.\r\nMerci de ne pas y répondre.";
			        	break;
			        	
			        }
			        
			        
				        $id_author = Administration::instance()->Author->get('id');
				        $id_role   = $this->getAuthorRole($id_author);
						
						/* l'auteur est-il sous surveillance ? */
						if($id_role == Symphony::Configuration()->get('watched_role', 'backend-notifier')){
							
							//destinataire(s)
							$recipients = $this->getAuthors(Symphony::Configuration()->get('notified_role','backend-notifier'));
							
							$sent = 0;
							if(count($recipients) > 0){
								foreach((array)$recipients as $email){
									try{
									$addr=$email['email'];
									$fullname = $email['first_name']." ".$email['last_name'];
										
										$email = Email::create();
										$email->subject = $subject;
										$email->text_plain = $body;
										$email->recipients = array($fullname=>$addr);
										$email->send();
										$sent++;
									}
									catch(EmailException $e){
										Symphony::$Log->pushToLog(__('Email Template Manager: ') . $e->getMessage(), null, true);
										//$context['errors'][] = Array('etm-' . $template->getHandle() . '-' . Lang::createHandle($emailaddr), false, $e->getMessage());
										continue;
									}
								}
							}
							else {
								throw new EmailException("Can not send an email to nobody, please set a recipient.");
							}
							//ok display alert for user
							//Administration::instance()->Page->pageAlert("Un message vient d'être envoyé aux administrateurs du site.",Alert::SUCCESS);
					}//end if publications or actualites 
				} else {
					//ras, user not login
				}
			}
			
			
		}

	}
?>