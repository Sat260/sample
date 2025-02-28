{% set header_length = project_name|length %}
{{ '#' * header_length }}
{{ cookiecutter.project_slug }}
{{ '#' * header_length }}

{{ cookiecutter.project_description }}

.. toctree::
   :maxdepth: 2
   :caption: Home Page

.. toctree::
   :maxdepth: 2
   :caption: Contributing

   _pages/contributing


.. toctree::
   :maxdepth: 2
   :caption: Support

   _pages/contact
