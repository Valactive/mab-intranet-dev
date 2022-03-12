<?php

class datasourceintranet_membre extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'intranet-membre';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$member-id}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'identifiant',
        'email',
        'role'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Intranet membre',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-intranet.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-07T21:40:26+00:00'
        );
    }

    public function getSource()
    {
        return '7';
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