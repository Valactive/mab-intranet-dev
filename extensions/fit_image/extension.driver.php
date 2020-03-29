<?php
	Class extension_fit_image extends Extension
	{
		public function about(){
			return array('name' => 'Fit image',
				'version' => '0.11',
				'release-date' => '2010-10-26',
				'author' => array('name' => 'Giel Berkers',
					'website' => 'http://www.gielberkers.com',
					'email' => 'info@gielberkers.com'),
				'description' => 'JIT Manipulate an image according to the dimensions in it\'s width-, height- or style-tag.'
			);
		}

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/frontend/',
					'delegate' => 'ManageEXSLFunctions',
					'callback' => 'init'
				)
			);
		}

		public function init($context){
			$context['manager']->addFunction('extension_fit_image::fitImage', 'http://example.com', 'fit-image');
		}

		public static function fitImage($img, $maxWidth = 400, $w = null, $h = null, $align = null, $style = null, $title = null, $alt = null)
		{
			$src = $img[0]->value;
			$originalSrc = $src;

			if(substr($src, 0, 7) != 'http://')
			{
				$slash = $src[0] == '/' ? '' : '/';
				$src = $_SERVER['DOCUMENT_ROOT'].$slash.$img[0]->value;
			}

			$doc    = new DOMDocument();

			list($width, $height) = getimagesize($src);

			if(count($w) > 0) { $width = $w[0]->value; }
			if(count($h) > 0) { $height = $h[0]->value; }
			if(count($style) > 0) {
				// Check if the width & height is in the style:
				$styleValue = strtolower(str_replace(' ', '', $style[0]->value));
				$a = explode(';', $styleValue);
				foreach($a as $elem)
				{
					$b = explode(':', $elem);
					if(count($b)==2) {
						if($b[0]=='width')  { $width = intval($b[1]); }
						if($b[0]=='height') { $height = intval($b[1]); }
					}
				}
			}
			if($width > $maxWidth)
			{
				if (strpos($src, '/workspace/') !== false){
					$a = explode('/workspace/', $src);
					$src = $a[1];
					$src = '/image/1/'.$maxWidth.'/0/'.$src;
					$resized = true;
				} else {
					$src = str_replace('http://', '', $src);
					$src = '/image/1/'.$maxWidth.'/0/1/'.$src;
					$resized = true;
				}

			} else {

				if (strpos($src, '/workspace/') !== false){
					$a = explode('/workspace/', $src);
					$src = $a[1];
					$src = '/image/1/'.$width.'/'.$height.'/'.$src;
					$resized = false;
				} else {
					$src = str_replace('http://', '', $src);
					$src = '/image/1/'.$width.'/'.$height.'/1/'.$src;
					$resized = false;
				}
			}

			// Create a new node:
			$link   = $doc->createElement('a');
			$link->setAttribute('href', $originalSrc);
			$link->setAttribute('class', 'fitted');
			$newImg = $doc->createElement('img');
			$newImg->setAttribute('src', $src);
			if(count($align) > 0) {
				$newImg->setAttribute('align', $align[0]->value);
			}
			if(count($title) > 0) {
				$newImg->setAttribute('title', $title[0]->value);
			}
			if(count($alt) > 0) {
				$newImg->setAttribute('alt', $alt[0]->value);
			}

			// Set the correct Style-attribute:
			if(count($style) > 0) {
				if($resized)
				{
					// Replace width- and height-element in style-attribute:
					$a = explode(';', $styleValue);
					$newStyleArr = array();
					foreach($a as $elem) {
						$b = explode(':', $elem);
						if(count($b)==2)
						{
							if($b[0]=='width') { $b[1] = $maxWidth.'px'; }
							if($b[0]=='height') { $b[1] = round($height * ($maxWidth / $width)).'px'; }
						}
						$newStyleArr[] = implode(':', $b);
					}
					$newStyle = implode(';', $newStyleArr);
					$newImg->setAttribute('style', $newStyle);
				} else {
					$newImg->setAttribute('style', $style[0]->value);
				}
			}

			// Set the correct width- and height-attribute:
			if($resized)
			{
				$newImg->setAttribute('width', $maxWidth);
				$newImg->setAttribute('height', round($height * ($maxWidth / $width)));
			} else {
				$newImg->setAttribute('width', $width);
				$newImg->setAttribute('height', $height);
			}

			// Return the correct HTML:
			if($resized)
			{
				$link->appendChild($newImg);
				return $link;
			} else {
				return $newImg;
			}
		}
	}
