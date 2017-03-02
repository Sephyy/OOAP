<?php
require 'subclasses/company_ad_sst.php';
$sst = new company_ad_sst;
$sst->auto_test();
$sst_script = $sst->script;