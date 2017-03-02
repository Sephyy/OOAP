<?php
require 'subclasses/player_answered_question_sst.php';
$sst = new player_answered_question_sst;
$sst->auto_test();
$sst_script = $sst->script;