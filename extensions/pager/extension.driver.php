<?php

	class Extension_Pager extends Extension {
		private $about;
		public function __construct() {
			$this->about = array(
				'name'         => 'Pager',
				'version'      => '1.0.0',
				'release-date' => '2011-09-06',
				'description'  => 'A utility class that can be used to easily generate standardized Symphony page bars for the backend.',
				'author'       => array(
					'name'	  => 'Wilhelm Murdoch',
					'website' => 'http://thedrunkenepic.com/',
					'email'	  => 'wilhelm.murdoch@gmail.com'
				)
			);
		}

		public function about() {
			return $this->about;
		}
	}