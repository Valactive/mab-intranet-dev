<?php

class datasourceintranet_rubriques_par_membre extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'intranet-rubriques-par-membre';
    public $dsParamORDER = 'asc';
    public $dsParamGROUP = '137';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'nom';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-intranet-sous-rubriques-par-membre}',
        '187' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'nom',
        'rubrique-parente'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-intranet-sous-rubriques-par-membre');
    }

    public function about()
    {
        return array(
            'name' => 'Intranet Rubriques par Membre',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-intranet.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-07T21:40:35+00:00'
        );
    }

    public function getSource()
    {
        return '25';
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