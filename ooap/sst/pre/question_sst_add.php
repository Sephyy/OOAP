<?php
require 'subclasses/question_sst.php';
$sst = new question_sst;
$sst->auto_test();
$sst_script = $sst->script;