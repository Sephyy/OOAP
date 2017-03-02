<?php
require 'components/get_listview_referrer.php';

require 'subclasses/advertiser.php';
$dbh_advertiser = new advertiser;
$dbh_advertiser->set_where("advertiser_id='" . quote_smart($advertiser_id) . "'");
if($result = $dbh_advertiser->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

