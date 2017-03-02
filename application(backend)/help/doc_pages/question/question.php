<?php
require 'path.php';
init_cobalt();
require 'subclasses/question_doc.php';
$obj_doc = new question_doc;
$obj_doc->auto_doc();