<?php
require 'path.php';
init_cobalt();
require 'subclasses/player_answered_question_doc.php';
$obj_doc = new player_answered_question_doc;
$obj_doc->auto_doc();