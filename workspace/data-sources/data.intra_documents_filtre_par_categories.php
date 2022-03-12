<?php

class datasourceintra_documents_filtre_par_categories extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'intra-documents-filtre-par-categories';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '142' => '{$ds-intra-categories-filtre-par-sous-rubrique}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'nom-du-document',
        'date',
        'publie',
        'document',
        'categorie',
        'auteur',
        'actif'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-intra-categories-filtre-par-sous-rubrique');
    }

    public function about()
    {
        return array(
            'name' => 'Intra documents filtre par catégories',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-intranet.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-07T21:39:16+00:00'
        );
    }

    public function getSource()
    {
        return '28';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}