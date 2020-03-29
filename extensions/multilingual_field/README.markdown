Multilingual Field Extension
============================

* Version: 1.3
* Author: Guillem Lorman (guillem@bajoelcocotero.com)
* Build Date: 11 February 2011
* Requirements:  
	- Symphony 2.1 or above
	- Extension Language Redirect 1.0.1 by Jonas Coch (<http://github.com/klaftertief/language_redirect>)

- Based on TextBox Field extension by Rowan Lewis
- Support WMDeditor extension by Doug Stewart
- Support markItUp! extension by Marcin Konicki
- Support TinyMCE formater
- Compatible with forked version extension search_index by Nick Dunn (http://github.com/6ui11em/search_index)

Installation
------------

1. Upload the 'multilingual_field' folder in this archive to your Symphony 'extensions' folder.

2. Install and enable the extension Language Redirect if this is not installed yet.

3. Enable it by selecting the **Field: Mulitingual** extension, choose Enable from the with-selected menu, and then click Apply.

4. Go to System > Preferences and enter your language codes in the Language Redirect field.

5. Now add the *Multilingual Text* field to your sections.

Update from version earlier versions
------------------------------------

1. Upload the new version of 'multilingual_field' folder in this archive to your Symphony 'extensions' folder.  

2. Re-enable the extension selecting **Field: Mulitingual** extension, choose Enable from the with-selected menu, and then click Apply.  

It's important to execute the Database updates.

Changelog
----------
- 1.3:
 - Symphony 2.2 compatibility
 - Language Redirect 1.0.1 compatibilyt
 
- 1.2:
 - Add multilingual handles to work with localized URL params
 - Add compatibility with tinyMCE formatter
 - Add compatibility with Publish Filtering extension by Nick Dunn(http://github.com/nickdunn/publishfiltering)
 
- 1.1:  
 - Fix select box support bug.  
 - Fix DS filtering bug.  