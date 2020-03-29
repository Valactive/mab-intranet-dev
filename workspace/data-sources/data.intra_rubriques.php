<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintra_rubriques extends Datasource{

		public $dsParamROOTELEMENT = 'intra-rubriques';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'nom';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		

		public $dsParamINCLUDEDELEMENTS = array(
				'nom'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Intra rubriques',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.valactive.net',
					'email' => 'valery@valactive.com'),
				'version' => '1.0',
				'release-date' => '2011-09-19T14:43:32+00:00'
			);
		}

		public function getSource(){
			return '26';
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
