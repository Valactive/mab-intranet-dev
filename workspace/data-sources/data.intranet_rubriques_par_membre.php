<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintranet_rubriques_par_membre extends Datasource{

		public $dsParamROOTELEMENT = 'intranet-rubriques-par-membre';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '137';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'nom';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$ds-intranet-sous-rubriques-par-membre}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'nom',
				'rubrique-parente'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-intranet-sous-rubriques-par-membre');
		}

		public function about(){
			return array(
				'name' => 'Intranet Rubriques par Membre',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.dev',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-11-22T14:16:46+00:00'
			);
		}

		public function getSource(){
			return '25';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
