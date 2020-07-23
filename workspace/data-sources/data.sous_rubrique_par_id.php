<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcesous_rubrique_par_id extends Datasource{

		public $dsParamROOTELEMENT = 'sous-rubrique-par-id';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'187' => 'yes',
				'id' => '{$sous-rub-id}',
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
				'name' => 'sous-rubrique-par-id',
				'author' => array(
					'name' => 'Sophie STMadmin',
					'website' => 'http://mab-intranet.localhost',
					'email' => 'staminh@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2020-07-23T06:29:05+00:00'
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
