<?php

class eventadd_documents_with_notifications extends SectionEvent
{
    public $ROOTELEMENT = 'add-documents-with-notifications';

    public $eParamFILTERS = array(
        'etm-intranet-notification'
    );

    public static function about()
    {
        return array(
            'name' => 'add documents with notifications',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-intranet.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-07T21:49:08+00:00',
            'trigger-condition' => 'action[add-documents-with-notifications]'
        );
    }

    public static function getSource()
    {
        return '28';
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
                <pre class="XML"><code>&lt;add-documents-with-notifications result="success" type="create | edit">
    &lt;message>[Création | Modification ] de l’entrée réussie.&lt;/message>
&lt;/add-documents-with-notifications></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;add-documents-with-notifications result="error">
    &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/add-documents-with-notifications></code></pre>
                <p>The following is an example of what is returned if any options return an error:</p>
                <pre class="XML"><code>&lt;add-documents-with-notifications result="error">
    &lt;message>Des erreurs ont été rencontrées lors de l’enregistrement de l’entrée.&lt;/message>
    &lt;filter name="admin-only" status="failed" />
    &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
...&lt;/add-documents-with-notifications></code></pre>
                <h3>Example de balisage pour un formulaire de la partie publique</h3>
                <p>Voici un exemple de balisage de formulaire que vous pouvez utiliser pour la partie publique :</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="33554432" />
    &lt;label>Nom du document
        &lt;input name="fields[nom-du-document]" type="text" />
    &lt;/label>
    &lt;label>Date
        &lt;input name="fields[date][start][]" type="text" />
        &lt;input name="fields[date][end][]" type="text" />
    &lt;/label>
    &lt;label>Publié
        &lt;input name="fields[publie]" type="checkbox" value="yes" />
    &lt;/label>
    &lt;label>Document
        &lt;input name="fields[document]" type="file" />
    &lt;/label>
    &lt;input name="fields[categorie]" type="hidden" value="..." />
    &lt;input name="fields[auteur]" type="hidden" value="..." />
    &lt;label>Actif
        &lt;input name="fields[actif]" type="checkbox" value="yes" checked="checked" />
    &lt;/label>
    &lt;label>Notifications
        &lt;select name="fields[notifications][]" multiple="multiple">
            &lt;option value="LBARBIER@parc-opale.fr">LBARBIER@parc-opale.fr&lt;/option>
            &lt;option value="MKILHOFFER@parc-opale.fr">MKILHOFFER@parc-opale.fr&lt;/option>
            &lt;option value="a.eich@parc-vosges-nord.fr">a.eich@parc-vosges-nord.fr&lt;/option>
            &lt;option value="alice.roth54@yahoo.fr">alice.roth54@yahoo.fr&lt;/option>
            &lt;option value="alice.roth@mab-france.org">alice.roth@mab-france.org&lt;/option>
            &lt;option value="aline.salvaudon@parcduluberon.fr">aline.salvaudon@parcduluberon.fr&lt;/option>
            &lt;option value="anne-caroline.prevot@mnhn.fr">anne-caroline.prevot@mnhn.fr&lt;/option>
            &lt;option value="anthony.roux@smaemv.fr">anthony.roux@smaemv.fr&lt;/option>
            &lt;option value="arnaud.larade@guadeloupe-parcnational.fr">arnaud.larade@guadeloupe-parcnational.fr&lt;/option>
            &lt;option value="biosphere-fango@mab-france.org">biosphere-fango@mab-france.org&lt;/option>
            &lt;option value="biosphere-iroise@mab-france.org">biosphere-iroise@mab-france.org&lt;/option>
            &lt;option value="biosphere.hawaiki@gmail.com">biosphere.hawaiki@gmail.com&lt;/option>
            &lt;option value="c.boulmier@gorgesdugardon.fr">c.boulmier@gorgesdugardon.fr&lt;/option>
            &lt;option value="c.gerrer@pnr-queyras.fr">c.gerrer@pnr-queyras.fr&lt;/option>
            &lt;option value="catherine.cibien@mab-france.org">catherine.cibien@mab-france.org&lt;/option>
            &lt;option value="christine.herve@inra.fr">christine.herve@inra.fr&lt;/option>
            &lt;option value="christophe.le_page@cirad.fr">christophe.le_page@cirad.fr&lt;/option>
            &lt;option value="ckergomard@gmail.com">ckergomard@gmail.com&lt;/option>
            &lt;option value="contact@parc-vosges-nord.fr">contact@parc-vosges-nord.fr&lt;/option>
            &lt;option value="daniel.silvestre@guadeloupe-parcnational.fr">daniel.silvestre@guadeloupe-parcnational.fr&lt;/option>
            &lt;option value="didier.babin@cirad.fr">didier.babin@cirad.fr&lt;/option>
            &lt;option value="e.furteau@pays-sarrebourg.fr">e.furteau@pays-sarrebourg.fr&lt;/option>
            &lt;option value="ecoacteurs.mab@gmail.com">ecoacteurs.mab@gmail.com&lt;/option>
            &lt;option value="education@parc-camargue.fr">education@parc-camargue.fr&lt;/option>
            &lt;option value="epidor@eptb-dordogne.fr">epidor@eptb-dordogne.fr&lt;/option>
            &lt;option value="f.moinot@eptb-dordogne.fr">f.moinot@eptb-dordogne.fr&lt;/option>
            &lt;option value="foret@mab-france.org">foret@mab-france.org&lt;/option>
            &lt;option value="frederic.bioret@univ-brest.fr">frederic.bioret@univ-brest.fr&lt;/option>
            &lt;option value="groupe.recherche@mab-france.org">groupe.recherche@mab-france.org&lt;/option>
            &lt;option value="h.berthier@pnr-queyras.fr">h.berthier@pnr-queyras.fr&lt;/option>
            &lt;option value="info@cevennes-parcnational.fr">info@cevennes-parcnational.fr&lt;/option>
            &lt;option value="info@parc-camargue.fr">info@parc-camargue.fr&lt;/option>
            &lt;option value="innocenzi.julien@gmail.com">innocenzi.julien@gmail.com&lt;/option>
            &lt;option value="j.quetier@eptb-dordogne.fr">j.quetier@eptb-dordogne.fr&lt;/option>
            &lt;option value="jocelyn.adam@univ-tlse3.fr">jocelyn.adam@univ-tlse3.fr&lt;/option>
            &lt;option value="julien.briand@parcduluberon.fr">julien.briand@parcduluberon.fr&lt;/option>
            &lt;option value="katell.guillou@pnr-armorique.fr">katell.guillou@pnr-armorique.fr&lt;/option>
            &lt;option value="ken.reyna@smaemv.fr">ken.reyna@smaemv.fr&lt;/option>
            &lt;option value="laurence.veillard@smaemv.fr">laurence.veillard@smaemv.fr&lt;/option>
            &lt;option value="mab@mab-france.org">mab@mab-france.org&lt;/option>
            &lt;option value="maraisaudomarois@parc-opale.fr">maraisaudomarois@parc-opale.fr&lt;/option>
            &lt;option value="marc.deconchat@toulouse.inra.fr">marc.deconchat@toulouse.inra.fr&lt;/option>
            &lt;option value="martine.atramentowicz@mab-france.org">martine.atramentowicz@mab-france.org&lt;/option>
            &lt;option value="mireillejardin@orange.fr">mireillejardin@orange.fr&lt;/option>
            &lt;option value="miri.tatarata@environnement.gov.pf">miri.tatarata@environnement.gov.pf&lt;/option>
            &lt;option value="ms.bergandi@biosphere-fontainebleau-gatinais.fr">ms.bergandi@biosphere-fontainebleau-gatinais.fr&lt;/option>
            &lt;option value="mtorre@hotmail.fr">mtorre@hotmail.fr&lt;/option>
            &lt;option value="nathalie.depompignan@sciencespo.fr">nathalie.depompignan@sciencespo.fr&lt;/option>
            &lt;option value="pedagogie@mab-france.org">pedagogie@mab-france.org&lt;/option>
            &lt;option value="r.thieleke@eptb-dordogne.fr">r.thieleke@eptb-dordogne.fr&lt;/option>
            &lt;option value="raphael.mathevet@cefe.cnrs.fr">raphael.mathevet@cefe.cnrs.fr&lt;/option>
            &lt;option value="solgne.louis@parcduluberon.fr">solgne.louis@parcduluberon.fr&lt;/option>
            &lt;option value="sophie_taminh@yahoo.fr">sophie_taminh@yahoo.fr&lt;/option>
            &lt;option value="staminh@valactive.com">staminh@valactive.com&lt;/option>
            &lt;option value="stephan.garnier@cevennes-parcnational.fr">stephan.garnier@cevennes-parcnational.fr&lt;/option>
            &lt;option value="theo.jacob@inrae.fr">theo.jacob@inrae.fr&lt;/option>
            &lt;option value="valery.frisch@gmail.com">valery.frisch@gmail.com&lt;/option>
            &lt;option value="ventoux.biosphere@smaemv.fr">ventoux.biosphere@smaemv.fr&lt;/option>
        &lt;/select>
    &lt;/label>
    &lt;input name="action[add-documents-with-notifications]" type="submit" value="Envoyer" />
&lt;/form></code></pre>
                <p>Pour modifier une entrée existante, ajoutez l’identifiant de l’entrée dans le formulaire. C’est encore mieux avec un champ caché comme ceci :</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>Pour rediriger à une autre adresse après un enregistrement sans erreur, ajoutez l’adresse de redirection dans le formulaire. C’est encore mieux avec un champ caché comme ceci, ou la valeur est l’URL vers laquelle rediriger</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://mab-intranet.localhost/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['add-documents-with-notifications'])) {
            return $this->__trigger();
        }
    }

}
