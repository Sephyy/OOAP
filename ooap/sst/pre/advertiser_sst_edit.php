<?php
require 'subclasses/advertiser_sst.php';
$sst = new advertiser_sst;
$sst->auto_test();
$sst_script = $sst->script;