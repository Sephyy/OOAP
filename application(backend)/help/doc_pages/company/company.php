<?php
require 'path.php';
init_cobalt();
require 'subclasses/company_doc.php';
$obj_doc = new company_doc;
$obj_doc->auto_doc();