<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="members-config">
	<data>
		<!--
			If the 'use-password-postback' value is true, any POST password value
			will be sent back as input field value. If form submission fails for
			any reason, this behaviour is more convenient for the user.
			However, sending the password value in the page source means a
			slight security issue, so it should not be used when security has
			the highest priority!
		-->
		<security>
			<use-password-postback>false</use-password-postback>
		</security>

		<!--
			This datasource is needed to edit member data.
			See members.form-edit-account.xsl
		-->
		<datasources>
			<member handle="members-1-by-member-id"/>
		</datasources>

		<fields>
			<!--
				Identity field: The 'link' attribute value must be either
				'username' or 'email'.
			-->
			<field type="identity" link="identifiant"/>

			<field type="identifiant" handle="identifiant">
				<label>Identifiant</label>
				<errors>
					<identifiant type="missing" message="IDENTIFIANT est obligatoire."/>
					<identifiant type="invalid" message="IDENTIFIANT contient des caractères invalides.">L'identifiant est invalide. Celui-ci doit faire au minimum 4 caractères.</identifiant>
					<identifiant type="invalid" message="IDENTIFIANT est déjà pris."/>
					<identifiant type="invalid" message="Ce membre n'existe pas."/>
					<error type="invalid" message="Aucune Identité trouvée.">'Identifiant' set un champs obligatoire.</error>
				</errors>
			</field>
			<field type="email" handle="email">
				<label>E-Mail</label>
				<errors>
					<email type="missing" message="E-Mail is a required field."/>
					<email type="invalid" message="E-Mail is already taken."/>
					<email type="invalid" message="E-Mail contains invalid characters.">'Email' does not seem to be a valid address.</email>
					<email type="invalid" message="Member not found."/>
				</errors>
			</field>
			<field type="password" handle="password">
				<label>
					<new>Mot de passe</new>
					<edit>Nouveau mot de passe</edit>
					<login>Mot de passe <br/><small>(<a href="/intranet/membres/mot-de-passe-oublie/">Mot de passe oublié ?</a>)</small></login>
				</label>
				<errors>
					<password type="missing" message="Le Mot de passe est obligatoire."/>
					<password type="invalid" message="Le mot de passe est trop court. Il doit contenir au minimum 6 caractères."/>
					<password type="invalid" message="Le mot de passe n'est pas assez fort."/>
					<password type="invalid" message="Mot de passe invalide."/>
					<password type="invalid" message="Les mots de passe ne correspondent pas."/>
				</errors>
			</field>
			<field type="password-confirm">
				<label>
					<new>Confirmation du mot de passe</new>
					<edit>Confirmation du nouveau mot de passe</edit>
				</label>
				<errors>
					<passwort type="missing" message="Mot de passe est un champ obligatoire."/>
					<passwort type="invalid" message="Le mot de passe est trop court. Il doit contenir au minimum 6 caractères."/>
					<passwort type="invalid" message="Le mot de passe n'est pas assez fort."/>
					<passwort type="invalid" message="La confirmation du mot de passe ne concorde pas."/>
				</errors>
			</field>
			<field type="recovery-code">
				<label>Code de re-génération</label>
				<errors>
					<password type="invalid" message="No recovery code found.">Le code de re-génération du mot de passe est invalide ou expiré.</password>
				</errors>
			</field>
			<field type="activation" handle="activation">
				<label>Activation Code</label>
				<errors>
					<activation type="missing" message="Activation Code is a required field."/>
					<activation type="invalid" message="Activation error. Code was invalid or has expired."/>
					<activation type="invalid" message="Member is already activated."/>
					<activation type="invalid" message="Member is not activated."/>
					<error type="invalid" message="No Activation field found.">'Code d'activation' est un champ requis.</error>
				</errors>
			</field>

			<!-- Dummy error field; this will handle generic errors. -->
			<field type="error">
				<errors>
					<error type="invalid" message="No Authentication field found.">Il n'y a pas de champ de mot de passe dans la section membre active.</error>
					<error type="invalid" message="You cannot generate a recovery code while being logged in."/>
				</errors>
			</field>
		</fields>

		<events>
			<event handle="members-new" submit-value="Register">
				<messages>
					<success><p>Registration was successful.</p></success>
					<error><p>Problems occurred during registration.</p></error>
				</messages>
				<filter handle="etm-members-send-activation-code">
					<messages>
						<success><p>An email has been sent. If you do not receive it in the next couple of minutes, please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></success>
						<error><p>There was a problem sending your registration email. Please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></error>
					</messages>
				</filter>
				<filter handle="permission">
					<messages>
						<passed/>
						<error><p>Hello? You know that you must not do this!</p></error>
					</messages>
				</filter>
			</event>
			<event handle="members-edit" submit-value="Save">
				<messages>
					<success><p>Your account has been saved.</p></success>
					<error><p>Problems occurred while saving your account.</p></error>
				</messages>
				<filter handle="permission">
					<messages>
						<passed/>
						<error><p>Hello? You know that you must not do this!</p></error>
					</messages>
				</filter>
			</event>
			<event handle="members-activate-account" submit-value="Activate Account">
				<messages>
					<success><p>Activation was successful.</p></success>
					<error><p>Problems occurred while activating your account.</p></error>
				</messages>
				<filter handle="etm-members-account-activated">
					<messages>
						<success><p>An email has been sent. If you do not receive it in the next couple of minutes, please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></success>
						<error><p>There was a problem sending your activation email. Please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></error>
					</messages>
				</filter>
			</event>
			<event handle="members-regenerate-activation-code" submit-value="Request Activation Code">
				<messages>
					<success><p>A new activation code has been created.</p></success>
					<error><p>Problems occurred while generating your activation code.</p></error>
				</messages>
				<filter handle="etm-members-resend-activation-code">
					<messages>
						<success><p>An email has been sent. If you do not receive it in the next couple of minutes, please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></success>
						<error><p>There was a problem sending your activation email. Please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></error>
					</messages>
				</filter>
			</event>
			<event handle="member-login-info" submit-value="Log in">
				<messages>
					<success><p>Vous êtes connecté.</p></success>
					<error><p>Un problème est survenu durant la connection.</p></error>
				</messages>
			</event>
			<event handle="members-generate-recovery-code" submit-value="Créer le code">
				<messages>
					<success><p>Le code de re-génération du mot de passe a été créé avec succès.</p></success>
					<error><p>Un problème est survenu lors de la création du code de re-génération.</p></error>
				</messages>
				<filter handle="etm-members-send-recovery-code">
					<messages>
						<success><p>An email has been sent. If you do not receive it in the next couple of minutes, please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></success>
						<error><p>There was a problem sending your recovery code email. Please inform the webmaster at <a href="mailto:webmaster@example.com">webmaster@example.com</a>.</p></error>
					</messages>
				</filter>
			</event>
			<event handle="members-reset-password" submit-value="Enregistrer le mot de passe">
				<messages>
					<success><p>Votre nouveau mot de passe a été enregistré avec succès.</p></success>
					<error><p>Un problème est survenu pendant l'enregistrement du nouveau mot de passe.</p></error>
				</messages>
			</event>
		</events>
	</data>
</xsl:variable>

</xsl:stylesheet>