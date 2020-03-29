<?php

	Class extension_lang_french extends Extension {

		/**
		 * Extension information
		 */

		public function about() {
			return array(
				'name' => 'Language: French',
				'type' => 'Localisation',
				'version' => '1.1',
				'release-date' => '2010-02-09',
				'author' => array(
					'name' => 'Grégoire Dierendonck / Pierre Bertet',
					'website' => 'http://www.lefauteuil.fr',
					'email' => 'contact@lefauteuil.fr'
				),
				'description' => 'French translation for the Symphony backend',
				'compatibility' => array(
					'2.0.0' => false,
					'2.0.1' => false,
					'2.0.2' => false,
					'2.0.3' => false,
					'2.0.4' => false,
					'2.0.5' => false,
					'2.0.6' => false,
					'2.0.7' => true,
					'2.0.8' => true,
				)
			);
		}

	}