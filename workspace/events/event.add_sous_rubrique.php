<?php

class eventadd_sous_rubrique extends SectionEvent
{
    public $ROOTELEMENT = 'add-sous-rubrique';

    public $eParamFILTERS = array(
        
    );

    public static function about()
    {
        return array(
            'name' => 'add-sous-rubrique',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-intranet.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-07T21:49:34+00:00',
            'trigger-condition' => 'action[add-sous-rubrique]'
        );
    }

    public static function getSource()
    {
        return '25';
    }

    public static function allowEditorToParse()
    {
        return true;
    }

    public static function documentation()
    {
        return '
                <h3>Exemples de réussites et d’échecs XML</h3>
                <p>Quand l’enregistrement est réalisé avec succès, le XML suivant sera retourné :</p>
                <pre class="XML"><code>&lt;add-sous-rubrique result="success" type="create | edit">
    &lt;message>[Création | Modification ] de l’entrée réussie.&lt;/message>
&lt;/add-sous-rubrique></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;add-sous-rubrique result="error">
    &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/add-sous-rubrique></code></pre>
                <h3>Example de balisage pour un formulaire de la partie publique</h3>
                <p>Voici un exemple de balisage de formulaire que vous pouvez utiliser pour la partie publique :</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="33554432" />
    &lt;label>Nom
        &lt;input name="fields[nom]" type="text" />
    &lt;/label>
    &lt;input name="fields[rubrique-parente]" type="hidden" value="..." />
    &lt;label>Actif
        &lt;input name="fields[actif]" type="checkbox" value="yes" checked="checked" />
    &lt;/label>
    &lt;input name="action[add-sous-rubrique]" type="submit" value="Envoyer" />
&lt;/form></code></pre>
                <p>Pour modifier une entrée existante, ajoutez l’identifiant de l’entrée dans le formulaire. C’est encore mieux avec un champ caché comme ceci :</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>Pour rediriger à une autre adresse après un enregistrement sans erreur, ajoutez l’adresse de redirection dans le formulaire. C’est encore mieux avec un champ caché comme ceci, ou la valeur est l’URL vers laquelle rediriger</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://mab-intranet.localhost/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['add-sous-rubrique'])) {
            return $this->__trigger();
        }
    }

}
