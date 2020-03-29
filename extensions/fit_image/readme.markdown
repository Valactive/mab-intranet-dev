# Fit Image #

You have created a great site and you've used a rich text editor such as CKEditor
so your clients can simply insert their own pictures. Offcourse, you tell your
client that they are not supposed to insert those 12 megapixel pictures
taken with their Canon DSLR-camera's because it's a website and all.
Your client says he understands and happily starts using their website.

After a while, your client calls that the images on their website are extremely
slow. Offcourse in an instance you know what's wrong... The cleint did upload
and insert those 12 megapixel pictures after all, and just gave them other
dimensions in CKEditor (or whatever). So the image is still 5 MB, but the width-
and height-attributes of the image say they should be shown in the format of
a stamp.

This is where this extension pops in! It will magicaly use JIT to resize the
images according to their width-, height- or style-attribute, and makes them
clickable to display the original image.

## Requirements

There are some requirements for this extension. You need to have the following
extensions and XSLT-utilities installed:

* [Pointybeard's JIT Image Manipulation](http://github.com/pointybeard/jit_image_manipulation/tree)
* [Ashooner's exsl_function_manager](http://github.com/ashooner/EXSL_Function_Manager/)
* [Allen's HTML Manipulation - The Ninja Utility](http://symphony-cms.com/download/xslt-utilities/view/20035/)

## How to use

When installed, apply the EXSL Function Manager to the page you wish to manipulate.
After that, extract the image-tags from your content with the Ninja XSLT-utility.

An example template could look like this:

    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:function="http://example.com">
        <!-- Note the include of xmlns:function above for the EXSL Function Manager -->
        
        <xsl:import href="ninja.xsl" />
        
        <!-- EXSL Function Manager: -->
        <xsl:include href="efm://functions" />
        
        <xsl:template match="my-section/entry">        
            <h1><xsl:value-of select="title" /></h1>
            <xsl:apply-templates select="content" mode="html" />
        </xsl:template>
        
        <!-- Adjust the images: -->
        <xsl:template match="img" mode="html">
            <!-- call the fit-image()-function to do some magic for you: -->
            <xsl:copy-of select="function:fit-image(@src, 460, @width, @height, @align, @style)" />
        </xsl:template>
        
    </xsl:stylesheet>

As you can see, the `fit-image()`-function takes 6 (optional) parameters:

src: the source of the image  
(nr): the maximum width the image is allowed to have  
width: the width of the current image  
height: the height of the current image  
align: the align-attribute (for aligning done by some richtext-editors)  
style: the style-attribute (for float-aligning done by some richtext-editors)

The image will be wrapped in a link with a class named `fitted`, so you can
use it to popup in a lightbox or a fancybox or something.