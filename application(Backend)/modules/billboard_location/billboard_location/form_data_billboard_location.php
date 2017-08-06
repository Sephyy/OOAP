<?php
require 'components/get_listview_referrer.php';

require 'subclasses/billboard_location.php';
$dbh_billboard_location = new billboard_location;
$dbh_billboard_location->set_where("billboard_location_id='" . quote_smart($billboard_location_id) . "'");
if($result = $dbh_billboard_location->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$sign_permit_date_issue);
    if(count($data) == 3)
    {
        $sign_permit_date_issue_year = $data[0];
        $sign_permit_date_issue_month = $data[1];
        $sign_permit_date_issue_day = $data[2];
    }
    $data = explode('-',$sign_permit_date_expired);
    if(count($data) == 3)
    {
        $sign_permit_date_expired_year = $data[0];
        $sign_permit_date_expired_month = $data[1];
        $sign_permit_date_expired_day = $data[2];
    }
    $data = explode('-',$brgy_clear_date_issuse);
    if(count($data) == 3)
    {
        $brgy_clear_date_issuse_year = $data[0];
        $brgy_clear_date_issuse_month = $data[1];
        $brgy_clear_date_issuse_day = $data[2];
    }
    $data = explode('-',$brgy_clear_date_expire);
    if(count($data) == 3)
    {
        $brgy_clear_date_expire_year = $data[0];
        $brgy_clear_date_expire_month = $data[1];
        $brgy_clear_date_expire_day = $data[2];
    }
    $data = explode('-',$mmda_clear_date_issue);
    if(count($data) == 3)
    {
        $mmda_clear_date_issue_year = $data[0];
        $mmda_clear_date_issue_month = $data[1];
        $mmda_clear_date_issue_day = $data[2];
    }
    $data = explode('-',$mmda_clear_date_expire);
    if(count($data) == 3)
    {
        $mmda_clear_date_expire_year = $data[0];
        $mmda_clear_date_expire_month = $data[1];
        $mmda_clear_date_expire_day = $data[2];
    }
}

