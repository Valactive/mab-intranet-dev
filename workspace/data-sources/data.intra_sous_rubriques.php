<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintra_sous_rubriques extends Datasource{

		public $dsParamROOTELEMENT = 'intra-sous-rubriques';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '137';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '100';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'nom';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'187' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'nom',
				'rubrique-parente'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Intra sous rubriques',
				'author' => array(
					'name' => 'Sophie STMadmin',
					'website' => 'http://mab-intranet.localhost',
					'email' => 'staminh@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2020-09-21T16:49:13+00:00'
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
