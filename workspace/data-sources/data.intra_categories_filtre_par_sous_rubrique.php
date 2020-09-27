<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintra_categories_filtre_par_sous_rubrique extends Datasource{

		public $dsParamROOTELEMENT = 'intra-categories-filtre-par-sous-rubrique';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '136';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'nom';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'136' => '{$sous-rubrique}',
				'153' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'nom',
				'sous-rubrique-parente',
				'actif',
				'auteur'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Intra categories filtre par sous-rubrique',
				'author' => array(
					'name' => 'Sophie STMadmin',
					'website' => 'http://mab-intranet.localhost',
					'email' => 'staminh@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2020-09-24T13:56:21+00:00'
			);
		}

		public function getSource(){
			return '27';
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
