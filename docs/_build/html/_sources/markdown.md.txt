# Page Title, h1 Markdown text template
Every Document Starts with `#`, a title for this documentation

You only need to modify this Markdown file according with your necesities.
If you change the Markdown file name, remember also to change the name in the index.rst file or where the ".. toctree::" is.

## Subhead, h2
Use `##` for subsection

### Subhead, h3
use `###` as further section division

Code example: Add the URL in `urlpatterns` in `app/urls.py`:
```
urlpatterns = [ 
    url(r'^register/$', app_views.register, name='register'),
]
```
### More instructions

Syntax highlighting can be used with triple backticks, like so:

```python
#Fibonacci, tuple assignment 
parents, babies = (1, 1)
while babies < 100:
    print 'This generation has {0} babies'.format(babies)
    parents, babies = (babies, parents + babies)
```

Here we continue with more code documentation examples.
  
A link to [Jekyll Flash](http://github.com/parrondo/jekyll-flash/). A literal link <http://github.com/parrondo/jekyll-flash/>

An image, located within /images/markdown

![an image alt text](./images/markdown/markdown-nn-deep-learning-cognitive.jpg "an image title")

* A bulletted list
- alternative syntax 1
+ alternative syntax 2
  - an indented list item

1. An
2. ordered
3. list

Inline markup styles:

- _italics_
- **bold**
- `code()`

> Blockquote
>> Nested Blockquote

### Finally, horizontal lines
----
****
