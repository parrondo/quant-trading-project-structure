===========
Style Guide
===========

Make your text as literal and specific as possible. Put yourself in the place of the person who is using your project 
and looking for instructions on performing a task. Don't make them guess, but spell 
out every step in order, and tell exactly what buttons to click or what form 
fields to fill out. Give complete information; for example, when using a 
time variable be sure to say if it is in seconds, miliseconds or some other unit value.

Page Filenames
--------------

Use lowercase filenames with underscores, for example my_config.rst.

Page Titles and Headings
------------------------

There are many ways to markup headings and subheadings. This is my preferred way.
Use title case. Three levels is enough; if you find that you need more, 
then you should re-think the organization of your text::

 ==============
 Page Title, h1
 ==============

 Subhead, h2
 -----------

 Subhead, h3
 ^^^^^^^^^^^
 
This is how they render:

==============
Page Title, h1
==============

Subhead, h2
-----------

Subhead, h3
^^^^^^^^^^^

Labels and Code
---------------

  
Use double-backticks for inline code and command examples::
  
  ``sudo -u www-data php occ files:scan --help``
  ``maintenance:install``
  
This is how they render:

``sudo -u www-data php occ files:scan --help``

``maintenance:install``

When you are giving hyperlinks as examples, use double-backticks rather than 
creating a live hyperlink::

 ``https://example.com``

Images
------

Use lowercase with hyphens for image names, for example image-name.png.


1. Create a subfolder under /images using the same name as the markdown file in which the images will be used.  

For example, the following folder name for code.md

/images/code/

2. Add images to the subfolder created in step 1.  Name the images with a prefix identifying the markdown file they are associated with, separated hyphens with a brief description of the image.

For example: **code-deep-learning-view.png** for a a screenshot of the code's modules.

.. note:: The underscore character causes GitHub to incorrectly process the image filenames in Markdown, which leads to problems in building files in the ReadtheDocs.

3. Add reusuable images such as icons to the /images/general folder.


All images must have alt tags, which are brief and descriptive, and figure 
numbers. Sphinx RST markup does not have a tag for figure numbers, so you must 
use the caption element. You may use simple numbering like "Figure 1, Figure 2", 
or add a caption. Captions must follow a blank line and be italicized, like this example::

  .. figure:: images/code/code-deep-learning-view.png
     :align: center
     :alt: Optional title.
     
     *Figure 1: Deep Learning Code's modules.*

Example URL
-----------

Use ``https://example.com`` in your examples where you want to include an URL.

.. note::
    
    you may not use github wiki page editor preview to determine which markdown :code:`#` title level you should use, since github will render major :code:`#` header is usually very large.

After creating a document, make sure your new document file name is in :code:`index.rst` or satisfying any pattern matching in any :code:`toctree` section. Otherwise, readers are not able to navigate to your page (**In other words, your documents are useless**)

