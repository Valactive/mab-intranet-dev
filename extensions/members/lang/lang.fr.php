<?php

	$about = array(
		'name' => 'French',
		'author' => array(
			'name' => 'Valéry Frisch',
			'email' => 'valery@valactive.com',
			'website' => 'valactive.com'
		),
		'release-date' => '2011-06-20'
	);

	/**
	 * Members
	 */
	$dictionary = array(

		// Missing

		'Role' =>
		'Rôle',
		
		'Member Roles' => 
		'Rôles des membres',

		'Members Timezone' => 
		'Fuseau horaire des membres',

		'Members: Lock Role' => 
		'Membres : Vérouillage du rôle',

		'Members: Lock Activation' => 
		'Membres : Activation du verrou',

		'Members: Update Password' => 
		'Membres : Mise à jour du mot de passe',

		'Email Template Filter' => 
		'Filtre du gabarit de mail',

		'Email Template Manager' => 
		'Gestionnaire de gabarits d\'email',

		'Members' => 
		'Membres',

		'Active Members Section' => 
		'Section des membres actifs',

		'A Members section will at minimum contain either a Member: Email or a Member: Username field' => 
		'Une section Membres doit contenir au minimum : Email ou Membre : Champs Nom d\'utilisateur',

		'The page you have requested has restricted access permissions.' => 
		'La page que vous avez demandées est soumises à des restrictions d\accès',

		'You are not authorised to perform this action.' => 
		'Vous n\'avez pas les autorisations suffisantes pour cette action',

		'Event updated at {$time}. <a href="{$new_url}" accesskey="c">Create another?</a> <a href="{$url}" accesskey="a">View all Events</a>' => 
		'Évenement mis à jour à {$time}. <a href="{$new_url}" accesskey="c">Créer un autre ?</a> <a href="{$url}" accesskey="a">Voir tout les évenements</a>',

		'An error occurred while processing this form.' => 
		'Une erreur est survenue pendant le traitement de ce formulaire',

		'There is no Member: Role field in the active Members section. <a href="%s%d/">Add Member: Role field?</a>' => 
		'Il n\'y à pas de Membre : Champ Rôle dans la section Membres active. <a href="%s%d/">Ajouter Membre : Champs Rôle ?</a>',

		'Create a Role' => 
		'Créer un Rôle',

		'No Member section has been specified in %s. Please do this first.' => 
		'Aucune section Membre n\'a été spécifiée dans %s. Merci de le faire en premier.',

		'This is the role assumed by the general public.' => 
		'Ceci est le rôle destiné au public général',

		'Delete Members' => 
		'Supprimer Membres',

		'Move Members To' => 
		'Déplacer Membres vers',

		'The role you requested to edit does not exist.' => 
		'Le rôle que vous souhaitez éditer n\'existe pas',

		'Role not found' => 
		'Rôle introuvable',

		'Role updated at %1$s. <a href="%2$s" accesskey="c">Create another?</a> <a href="%3$s" accesskey="a">View all Roles</a>' => 
		'Rôle mis à jour à %1$s. <a href="%2$s" accesskey="c">Créer un autre ?</a> <a href="%3$s" accesskey="a">Voir tout les rôles</a>',

		'Role created at %1$s. <a href="%2$s" accesskey="c">Create another?</a> <a href="%3$s" accesskey="a">View all Roles</a>' => 
		'Rôle créé à %1$s. <a href="%2$s" accesskey="c">Créer un autre ?</a> <a href="%3$s" accesskey="a">Voir tout les rôles</a>',

		'Symphony &ndash; Member Roles' => 
		'Symphony &ndash; Rôles des Membres',

		'Symphony &ndash; Member Roles &ndash; ' => 
		'Symphony &ndash; Rôles des Membres &ndash; ',

		'Event Level Permissions' => 
		'Niveau de permission pour les évenements',

		'User can create new entries' => 
		'L\'utilisateur peut créer de nouvelles entrées',

		'User cannot edit existing entries' => 
		'L\'utilisateur ne peut éditer les entrées existantes',

		'User can edit their own entries only' => 
		'L\'utilisateur ne peux éditer que ses propres entrées',

		'User can edit all entries' => 
		'L\'utilisateur peut éditer toutes les entrées',

		'Event' => 
		'Évenement',

		'Toggle all' => 
		'Tout inverser',

		'No Edit' => 
		'Édition interdite',

		'Edit Own' => 
		'Édition (les siens)',

		'Edit All' => 
		'Édition (tous)',

		'Page Level Permissions' => 
		'Autorisation pour les pages',

		'Deny Access' => 
		'Interdire l\'accès',

		'Delete this Role' => 
		'Supprimer ce Rôle',

		'A role with the name <code>%s</code> already exists.' => 
		'Un rôle avec ce nom <code>%s</code> existe déjà.',

		'The Public role cannot be removed' => 
		'Le rôle Publique ne peut être supprimer',

		'The role you requested to delete does not exist.' => 
		'Le rôle que vous souhaitez supprimer n\'existe pas',

		'Activate Account Email Template' => 
		'Gabarit d\'email d\'activation de compte',

		'%s Automatically log the member in after activation' => 
		'%s Logger automatiquement le membre après l\'activation',

		'No Activation field found.' => 
		'Aucun champs d\'Activation trouvé.',

		'No Identity field found.' => 
		'Aucun champs Identité trouvé',

		'%s is a required field.' => 
		'%s est un champs requis',

		'Member not found.' => 
		'Membre non trouvé.',

		'Member is already activated.' => 
		'Compte déjà activé',

		'Activation error. Code was invalid or has expired.' => 
		'Erreur d\'activation. Le code est faux ou bien il a expiré',

		'Generate Recovery Code Email Template' => 
		'Gabarit d\'email pour la demande de re-génération de code de récupération.',

		'You cannot generate a recovery code while being logged in.' => 
		'Vous ne pouvez générer un nouveau code en étant loggé',

		'Regenerate Activation Code Email Template' => 
		'Gabarit d\'email pour la re-génération de code d\'activation',

		'Reset Password Email Template' => 
		'Gabarit d\'email pour réinitialiser le mot de passe',

		'%s Automatically log the member in after changing their password' => 
		'%s Logger automatiquement le membre après avoir changé le mot de passe',

		'No Authentication field found.' => 
		'Aucun champ d\'Authentification trouvé',

		'Recovery code is a required field.' => 
		'Code de récupération est un champs obligatoire',

		'No recovery code found.' => 
		'Aucun code de récupération trouvé',

		'Recovery code has expired.' => 
		'Le code de récupération a expiré',

		'Member: Activation' => 
		'Membre : Activation',

		'Activation Code Expiry' => 
		'Expiration du code d\'activation',

		'How long a member\'s activation code will be valid for before it expires' => 
		'Combien de temps le code d\'activation doit-t-il  être valide avant son expiration',

		'Role for Members who are awaiting activation' => 
		'Rôle pour les Membres en attente d\'activation',

		'%s Prevent unactivated members from logging in' => 
		'%s Empèche les membres inactifs de se connecter',

		'Code expiry must be a unit of time, such as <code>1 day</code> or <code>2 hours</code>' => 
		'Le code d\'expiration doit être une unité de temps, comme <code>1 jour</code> ou <code>2 heures</code>',

		'Not Activated' => 
		'Non activé',

		'Activated' => 
		'Activé',

		'Activation code %s' => 
		'Code d\'activation %s',

		'Activation code expired %s' => 
		'Le code d\'activation expire %s',

		'Account will be activated when entry is saved' => 
		'Le compte sera activé à l\'enregistrement de l\'entrée',

		'Activated %s' => 
		'Activé %s',

		'Member: Email' => 
		'Membre : Email',

		'%s contains invalid characters.' => 
		'%s contient des caractères interdits.',

		'%s is already taken.' => 
		'%s est déjà utilisé.',

		'Member: Password' => 
		'Membre : Mot de passe',

		'Weak' => 
		'Moyen',

		'Good' => 
		'Bon',

		'Strong' => 
		'Fort',

		'Invalid %s.' => 
		'%s est invalide',

		'Minimum Length' => 
		'Longueur minimale',

		'Minimum Strength' => 
		'Résistance minimale',

		'Password Salt' => 
		'Salage du mot de passe',

		'A salt gives your passwords extra security. It cannot be changed once set' => 
		'Le salage améliore la sécurité de vos mots de passe. Il ne peut être changé par la suite.',

		'Recovery Code Expiry' => 
		'Expiration du code de récupération',

		'How long a member\'s recovery code will be valid for before it expires' => 
		'Combien de temps le code de récupération est-il valide avant son expiration',

		'Leave new password field blank to keep the current password' => 
		'Laissez le champs Nouveau mot de passe vide pour garder le mot de passe actuel',

		'%s confirmation does not match.' => 
		'%s confirmation ne correspond pas',

		'%s is too short. It must be at least %d characters.' => 
		'%s est trop court. Il doit contenir au minimum %d caractères',

		'%s is not strong enough.' => 
		'%s n\'est pas assez fort.' ,

		'%s cannot be blank.' => 
		'%s ne peut être vide',

		'Confirm' => 
		'Confirmation',

		'Member: Role' => 
		'Membre : Rôle',

		'Default Member Role' => 
		'Rôle par défaut du membre',

		'Member will assume the role <strong>%s</strong> when activated.' => 
		'Membre aura le rôle de <strong>%s</strong> après activation.',

		'Member: Timezone' => 
		'Membre : Fuseau horaire',

		'Available Zones' => 
		'Zones disponibles',

		'Member: Username' => 
		'Membre : nom d\'utilisateur',

		'Member is not activated.' => 
		'Membre n\'est pas activé',

	);
