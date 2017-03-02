<?php
require 'subclasses/trivia_sst.php';
$sst = new trivia_sst;
$sst->auto_test();
$sst_script = $sst->script;