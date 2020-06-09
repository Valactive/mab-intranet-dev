<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventadd_documents_with_notifications extends Event{

		const ROOTELEMENT = 'add-documents-with-notifications';

		public $eParamFILTERS = array(
			'etm-intranet-notification'
		);

		public static function about(){
			return array(
				'name' => 'add documents with notifications',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.org',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-02-28T15:15:21+00:00',
				'trigger-condition' => 'action[add-documents-with-notifications]'
			);
		}

		public static function getSource(){
			return '28';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Exemples de réussites et d’échecs XML</h3>
        <p>Quand l’enregistrement est réalisé avec succès, le XML suivant sera retourné :</p>
        <pre class="XML"><code>&lt;add-documents-with-notifications result="success" type="create | edit">
  &lt;message>[Création | Modification ] de l’entrée réussie.&lt;/message>
&lt;/add-documents-with-notifications></code></pre>
        <p>Si une erreur survient durant l’enregistrement, liée à un champ manquant ou invalide, le XML suivant sera retourné:</p>
        <pre class="XML"><code>&lt;add-documents-with-notifications result="error">
  &lt;message>champs manquant ou invalide lors de l’enregistrement de l’entrée.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/add-documents-with-notifications></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;add-documents-with-notifications result="error">
  &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/add-documents-with-notifications></code></pre>
        <h3>Example de balisage pour un formulaire de la partie publique</h3>
        <p>Voici un exemple de balisage de formulaire que vous pouvez utiliser pour la partie publique :</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
  &lt;label>Nom du document
    &lt;input name="fields[nom-du-document]" type="text" />
  &lt;/label>
  &lt;label>Date
    &lt;input name="fields[date][start][]" type="text" />
  &lt;/label>
  &lt;label>Publié
    &lt;input name="fields[publie]" type="checkbox" />
  &lt;/label>
  &lt;label>Document
    &lt;input name="fields[document]" type="file" />
  &lt;/label>
  &lt;input name="fields[categorie]" type="hidden" value="..." />
  &lt;input name="fields[auteur]" type="hidden" value="..." />
  &lt;label>Actif
    &lt;input name="fields[actif]" type="checkbox" checked="checked" />
  &lt;/label>
  &lt;label>Notifications
    &lt;select name="fields[notifications][]" multiple="multiple">
      &lt;option value="catherine.cibien@mab-france.org">catherine.cibien@mab-france.org&lt;/option>
      &lt;option value="staminh@valactive.com">staminh@valactive.com&lt;/option>
      &lt;option value="martine.atramentowicz@mab-france.org">martine.atramentowicz@mab-france.org&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;input name="action[add-documents-with-notifications]" type="submit" value="Envoyer" />
&lt;/form></code></pre>
        <p>Pour modifier une entrée existante, ajoutez l’identifiant de l’entrée dans le formulaire. C’est encore mieux avec un champ caché comme ceci :</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>Pour rediriger à une autre adresse après un enregistrement sans erreur, ajoutez l’adresse de redirection dans le formulaire. C’est encore mieux avec un champ caché comme ceci, ou la valeur est l’URL vers laquelle rediriger</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://mab-france.org/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['add-documents-with-notifications'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
