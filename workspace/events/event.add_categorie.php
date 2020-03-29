<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventadd_categorie extends Event{

		const ROOTELEMENT = 'add-categorie';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'add-categorie',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.org',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-02-15T14:43:31+00:00',
				'trigger-condition' => 'action[add-categorie]'
			);
		}

		public static function getSource(){
			return '27';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Exemples de réussites et d’échecs XML</h3>
        <p>Quand l’enregistrement est réalisé avec succès, le XML suivant sera retourné :</p>
        <pre class="XML"><code>&lt;add-categorie result="success" type="create | edit">
  &lt;message>[Création | Modification ] de l’entrée réussie.&lt;/message>
&lt;/add-categorie></code></pre>
        <p>Si une erreur survient durant l’enregistrement, liée à un champ manquant ou invalide, le XML suivant sera retourné:</p>
        <pre class="XML"><code>&lt;add-categorie result="error">
  &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/add-categorie></code></pre>
        <h3>Example de balisage pour un formulaire de la partie publique</h3>
        <p>Voici un exemple de balisage de formulaire que vous pouvez utiliser pour la partie publique :</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
  &lt;label>Nom
    &lt;input name="fields[nom]" type="text" />
  &lt;/label>
  &lt;input name="fields[sous-rubrique-parente]" type="hidden" value="..." />
  &lt;label>Actif
    &lt;input name="fields[actif]" type="checkbox" checked="checked" />
  &lt;/label>
  &lt;input name="fields[auteur]" type="hidden" value="..." />
  &lt;input name="action[add-categorie]" type="submit" value="Envoyer" />
&lt;/form></code></pre>
        <p>Pour modifier une entrée existante, ajoutez l’identifiant de l’entrée dans le formulaire. C’est encore mieux avec un champ caché comme ceci :</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>Pour rediriger à une autre adresse après un enregistrement sans erreur, ajoutez l’adresse de redirection dans le formulaire. C’est encore mieux avec un champ caché comme ceci, ou la valeur est l’URL vers laquelle rediriger</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://mab-france.org/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['add-categorie'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
