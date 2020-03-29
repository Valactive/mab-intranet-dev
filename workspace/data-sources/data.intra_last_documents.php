<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintra_last_documents extends Datasource{

		public $dsParamROOTELEMENT = 'intra-last-documents';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '10';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'142' => '{$ds-intra-categories-filtre-par-sous-rubrique}',
				'157' => 'yes',
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


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-intra-categories-filtre-par-sous-rubrique');
		}

		public function about(){
			return array(
				'name' => 'Intra last documents',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.valactive.net',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-01-28T22:01:47+00:00'
			);
		}

		public function getSource(){
			return '28';
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
