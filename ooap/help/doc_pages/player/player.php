<?php
require 'path.php';
init_cobalt();
require 'subclasses/player_doc.php';
$obj_doc = new player_doc;
$obj_doc->auto_doc();