<?php
require 'subclasses/company_sst.php';
$sst = new company_sst;
$sst->auto_test('delete');
$sst_script = $sst->script;