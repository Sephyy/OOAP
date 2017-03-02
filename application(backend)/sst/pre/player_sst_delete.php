<?php
require 'subclasses/player_sst.php';
$sst = new player_sst;
$sst->auto_test('delete');
$sst_script = $sst->script;