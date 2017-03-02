<?php
require 'path.php';
init_cobalt();
require 'subclasses/advertiser_doc.php';
$obj_doc = new advertiser_doc;
$obj_doc->auto_doc();