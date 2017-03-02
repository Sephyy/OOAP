<?php
require 'path.php';
init_cobalt();
require 'subclasses/trivia_doc.php';
$obj_doc = new trivia_doc;
$obj_doc->auto_doc();