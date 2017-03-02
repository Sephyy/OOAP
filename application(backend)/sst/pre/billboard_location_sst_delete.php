<?php
require 'subclasses/billboard_location_sst.php';
$sst = new billboard_location_sst;
$sst->auto_test('delete');
$sst_script = $sst->script;