<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceintranet_notification extends Datasource{

		public $dsParamROOTELEMENT = 'intranet-notification';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$etm-entry-id}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'nom-du-document',
				'document',
				'categorie',
				'auteur',
				'notifications'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Intranet notification',
				'author' => array(
					'name' => 'Valéry Frisch',
					'website' => 'http://mab-france.org',
					'email' => 'valery@valactive.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-02-15T20:39:52+00:00'
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
