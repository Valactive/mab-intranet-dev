<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<html>
<head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <title>Mab France - Intranet - Notification</title>
        <!--general stylesheet-->
        <style type="text/css">
            p {
                padding: 0;
                margin: 0;
            }

            h1, h2, h3, p, li {
                font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
            }

            td {
                vertical-align: top;
            }

            ul, ol {
                margin: 0;
                padding: 0;
            }
        </style>
		<!--[if gte mso 9]>
		<style type="text/css">
		.transparent{ background-color: #f4faff; background-image: url('http://newsletters.urldock.com/hitc-cm4/images/article-bg.jpg'); }
		</style>
		<![endif]-->
    </head>

	<body class="body" marginheight="0" topmargin="0" marginwidth="0" leftmargin="0" bgcolor="#f4faff" style="margin: 0px; background-color: #f4faff;">
        <table cellspacing="0" border="0" cellpadding="0" width="100%" align="center" style="margin: 0px;">
        <tbody>
        	<tr valign="top" class="logo">
        		<td>
					<table cellspacing="0" cellpadding="0" border="0" align="center" width="600">
						<tbody>
						<tr><td height="50"></td></tr>
						<tr>
							<td valign="bottom" height="50"><img src="https://intranet.mab-france.org/workspace/intranet/img/logo-mab-intranet.png" style="display:block;" height="31" width="148"/></td>
						</tr>
						</tbody>
        			</table>
		        </td>
		    </tr>
        	<tr valign="top">
        		<td>
					<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" bgcolor="#ffffff">
						<tbody>
						<tr>
							<td style="padding-top:15px; padding-bottom:15px; padding-left:25px; padding-right:25px;">
								<h3 style="color:#718b9a;">Du nouveau sur votre intranet !</h3>
								<p  style="font-size:14px;">Le document " <span style="color:#718b9a"><xsl:value-of select='/data/intranet-notification/entry/nom-du-document'/></span>" vient d'être mis en ligne par <span style="color:#718b9a"><xsl:value-of select='/data/intranet-notification/entry/auteur'/></span> dans la catégorie : "<xsl:value-of select='/data/intranet-notification/entry/categorie'/>".</p>
								<p  style="font-size:14px;">Vous pouvez consulter celui-ci directement en vous rendant sur votre <a href="http://intranet.mab-france.org/" style="color:#607890;">intranet</a>.</p><br />
								<p style="font-size:12px; color:#666666;">N'oubliez pas de vous munir de vos identifiants pour pouvoir vous connecter.<br/>Si vous avez oublié votre mot de passe, vous pouvez vous rendre sur cette <a href="https://intranet.mab-france.org/membres/mot-de-passe-oublie/" style="color:#607890;">page</a> pour en créer un nouveau.</p><br />
								<p style="font-size:14px; color:#7db827; text-align:right;">L'équipe du Mab France</p>

							</td>
						</tr>
						<tr>
							<td height="100"></td>
						</tr>
						</tbody>
        			</table>
		        </td>
		    </tr>
		</tbody>
	 	</table>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>