/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.addTemplates('default',
	{
		imagesPath:CKEDITOR.getUrl(CKEDITOR.plugins.getPath('templates')+'templates/images/'),
		templates:[
					{
						title:'Lien imprimer cette page',
						image:'print_template.gif',
						description:'Ajouter le picto d\'impression de la page.',
						html:'<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>'
					},
					{
						title:'Tableau des coordonnées',
						image:'coord_template.gif',
						description:'Permet d\'insérer un ou plusieurs tableaux de coordonnées dans votre document.',
						html:'<ul><li class="pic to home"><strong>ADRESSE</strong><br />complement d\'adresse<br />Code Postal Ville</li><li class="picto tel"><strong>T&#233;l</strong> +33 (0)0 00 00 00 00</li><li class="pic to fax"><strong>Fax </strong>+33 (0)0 00 00 00 00</li><li class="pic to mail"><strong>Courriel</strong><br />Adresse email</li><li class="pic to man"><strong>Coordinateur</strong><br />Nom du coordinateur</li></ul>',
					},
					{
						title:'Plus d\'informations',
						image:'informations.gif',
						
						description:'Ajouter des liens pour plus d\'information.',
						
						html:'<p><strong>Plus d\’informations :</strong></p><ul class="puces-bleues"><li><a href="www.valactive.com" rel="external">titre du  lien</a></li></ul>',
					},
				]
	});