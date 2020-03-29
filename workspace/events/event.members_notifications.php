<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventmembers_notifications extends Event{

		const ROOTELEMENT = 'members-notifications';

		public $eParamFILTERS = array(
			'etm-intranet-notification'
		);

		public static function about(){
			return array(
				'name' => 'Members : Notifications',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.org',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2012-02-15T16:03:51+00:00',
				'trigger-condition' => 'action[members-notifications]'
			);
		}

		public static function getSource(){
			return '23';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Exemples de réussites et d’échecs XML</h3>
        <p>Quand l’enregistrement est réalisé avec succès, le XML suivant sera retourné :</p>
        <pre class="XML"><code>&lt;members-notifications result="success" type="create | edit">
  &lt;message>[Création | Modification ] de l’entrée réussie.&lt;/message>
&lt;/members-notifications></code></pre>
        <p>Si une erreur survient durant l’enregistrement, liée à un champ manquant ou invalide, le XML suivant sera retourné:</p>
        <pre class="XML"><code>&lt;members-notifications result="error">
  &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/members-notifications></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;members-notifications result="error">
  &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/members-notifications></code></pre>
        <h3>Example de balisage pour un formulaire de la partie publique</h3>
        <p>Voici un exemple de balisage de formulaire que vous pouvez utiliser pour la partie publique :</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
  &lt;label>Auteur
    &lt;select name="fields[auteur]">
      &lt;option value="1">Valéry Frisch&lt;/option>
      &lt;option value="2">Catherine Cibien&lt;/option>
      &lt;option value="4">Laurence Lemaire&lt;/option>
      &lt;option value="5">Réserve de biosphère Cévennes&lt;/option>
      &lt;option value="6">Réserve de biosphère de Fontainebleau et du Gâtinais&lt;/option>
      &lt;option value="7">Réserve de biosphère Camargue&lt;/option>
      &lt;option value="8">Réserve de biosphère Archipel de Guadeloupe&lt;/option>
      &lt;option value="9">Réserve de biosphère Luberon Lure&lt;/option>
      &lt;option value="10">Réserve de biosphère Commune de Fakarava&lt;/option>
      &lt;option value="11">Réserve de biosphère Mont Ventoux&lt;/option>
      &lt;option value="12">Réserve de biosphère Vosges du Nord-Pfälzerwald&lt;/option>
      &lt;option value="13">Réserve de biosphère Vallée du Fango&lt;/option>
      &lt;option value="14">Réserve de biosphère Mer d\'Iroise&lt;/option>
      &lt;option value="15">Groupe Forêt&lt;/option>
      &lt;option value="16">Michel Etienne&lt;/option>
      &lt;option value="17">Groupe Pedagogie&lt;/option>
      &lt;option value="18">Martine Atramentowicz&lt;/option>
      &lt;option value="20">Admin biosphere&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;input name="fields[reserve]" type="hidden" value="..." />
  &lt;label>Actions
    &lt;!-- Modify just current language value -->
    &lt;input name="fields[actions][value-{$url-language}]" type="text" /> 
    
    &lt;!-- Modify all values -->
    &lt;input name="fields[actions][value-fr]" type="text" />
    &lt;input name="fields[actions][value-en]" type="text" />
  &lt;/label>
  &lt;input name="action[members-notifications]" type="submit" value="Envoyer" />
&lt;/form></code></pre>
        <p>Pour modifier une entrée existante, ajoutez l’identifiant de l’entrée dans le formulaire. C’est encore mieux avec un champ caché comme ceci :</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>Pour rediriger à une autre adresse après un enregistrement sans erreur, ajoutez l’adresse de redirection dans le formulaire. C’est encore mieux avec un champ caché comme ceci, ou la valeur est l’URL vers laquelle rediriger</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://mab-france.org/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['members-notifications'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
