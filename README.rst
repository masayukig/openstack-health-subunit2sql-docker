openstack-health-subunit2sql-docker
===================================

.. image::
    https://img.shields.io/docker/build/masayukig/openstack-health-subunit2sql.svg
    :target: https://hub.docker.com/r/masayukig/openstack-health-subunit2sql/builds/
.. image::
    https://img.shields.io/docker/automated/masayukig/openstack-health-subunit2sql.svg
    :target: https://hub.docker.com/r/masayukig/openstack-health-subunit2sql/

How to build
------------

You can build this docker image like below::

  $ docker build -t masayukig/openstack-health-subunit2sql:latest .

Or if you'd like to update the subunit2sql code base, you can do it::

  $ docker build --no-cache -t masayukig/openstack-health-subunit2sql:latest .

How to use
----------

You can specify the listen port like below::

  $ docker run -d --rm masayukig/openstack-health-subunit2sql
