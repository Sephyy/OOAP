<?php
require 'path.php';
init_cobalt();
require 'subclasses/billboard_location_doc.php';
$obj_doc = new billboard_location_doc;
$obj_doc->auto_doc();