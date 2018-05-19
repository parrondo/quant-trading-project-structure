=====================================================
Page Title, h1: reStructuredText Primer text template 
=====================================================

That has a paragraph about a main subject and is set when the '='
is at least the same length of the title itself.

.. code-block :: bash

    ====================
    This is a Page Title
    ====================


Subhead, h2
===========

.. code-block :: bash

    This is a Subhead, h2 Title
    ===========================

Subtitles are set with '-' and are required to have the same length 
of the subttitle itself, just like titles.

Lists can be unnumbered like:

 * Item Foo
 * Item Bar

Or automatically numbered:

 #. Item 1
 #. Item 2

Subhead, h3
-----------

.. code-block :: bash

    This is a Subhead, h3 Title
    ---------------------------


Words can have *emphasis in italics* or be **bold** and you can
define code samples with back quotes, like when you talk about a 
command: ``sudo`` gives you super user powers! 

This is the preferred form on how to link images:

  .. figure:: images/restructuredtext/restructured-artificial-intelligence-brain.jpg
     :align: left
     :scale: 100%
     :alt: Artificial Intelligence Brain page.
     
     *Figure 1: Artificial intelligence brain.*



This is another form to link images:

.. image:: images/restructuredtext/restructured-artificial-intelligence-brain.jpg

.. csv-table::
    :header: Header1, Header2, Header3

    A, B, "These lines appear as one line,
    even though they are written in two lines."
    C, D, "This is normal text. ``this is inline stuff that is very long and may wrap on multiple lines of text in a table cell, and it could look OK`` This is normal text again."
