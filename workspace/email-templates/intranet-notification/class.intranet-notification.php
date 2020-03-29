<?php

Class Intranet_notificationEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'intranet_notification',);
	public $layouts = Array(
 			'html' => 'template.html.xsl',
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Mab France - Intranet - nouveau document';
	public $reply_to_name = 'Mab France';
	public $reply_to_email_address = 'mab@mab-france.org';
	public $recipients = '{/data/intranet-notification/entry/notifications/item}';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Intranet notification',
		'version' => '1.0',
		'author' => array(
			'name' => 'Valéry Frisch',
			'website' => 'http://mab-france.org',
			'email' => 'valery@valactive.com'
		),
		'release-date' => '2013-11-29T14:37:34+00:00'
	);	
}