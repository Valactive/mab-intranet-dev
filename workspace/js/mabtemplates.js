/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.addTemplates('mabtemplates',
{
	imagesPath : '/workspace/templates/images/',
//	imagesPath:CKEDITOR.getUrl(CKEDITOR.plugins.getPath('templates')+'templates/images/'),
	
	templates:
		[
			{
				title:'Bouton imprimer',
				image:'print_template.jpg',
				description:'Bouton d\'impression pour les titres de pages',
				html:'<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>'
			}
		]
});
