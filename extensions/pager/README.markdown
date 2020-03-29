# Pager
 
* Version: 1.0.0
* Author: Wilhelm Murdoch
* Build Date: 2011-09-06
* Requirements: Symphony 2.2.3

## Purpose
To provide a hassle-free way of generating standardized pagination elements to backend pages. This is primarily used by other Symphony extensions.

## Installation
 
1. Upload the "pager" folder in this archive to your Symphony 'extensions' folder
2. Enable it by selecting "Pager" in the list, choose Enable from the with-selected menu, then click Apply

## Usage

Using this utility class is quite straight-forward:


	$totalRecords = 50;     // Typically the value of a MySQL SELECT COUNT(1) query against a data table.
	$perPage      = 15;     // Usually a call to `Symphony::Configuration()->get('pagination_maximum_rows', 'symphony')`.
	$pageKey      = 'page'; // For instance: http://www.mysite.com/articles/?page=3

	$Pager = Pager::factory($totalRecords, $perPage, $pageKey);

	$results = Symphony::Database()->fetch("
		SELECT
			`id`,
			`title` 
		FROM `my_table`
		ORDER BY `id` DESC '.$Pager->getLimit(true)
	");

	// ... more code here to display page data ... 

	$this->Form->appendChild($Pager->save()); // If being invoked through a backend page.

	// ... OR ...

	echo $Pager; // Will generate an HTML string representing the pagination bar.

## Compatibility

I haven't tested this with previous versions of Symphony. But, if I had to hazard a guess, I'd say it works for Symphony 2 and up. Don't hold me to it! :)

## Issues

There are currently no known issues with this extension. If you find anything wrong, feel free to submit a pull request or submit an issue to the tracker.