<?php
require 'components/get_listview_referrer.php';

require 'subclasses/billboard_location.php';
$dbh_billboard_location = new billboard_location;
$dbh_billboard_location->set_where("billboard_location_id='" . quote_smart($billboard_location_id) . "'");
if($result = $dbh_billboard_location->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

