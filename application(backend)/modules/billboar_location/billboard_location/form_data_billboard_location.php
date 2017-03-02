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

require_once 'subclasses/company_ad.php';
$dbh_company_ad = new company_ad;
$dbh_company_ad->set_fields('company_id, ad_start_date, ad_end_date, advertisement_name');
$dbh_company_ad->set_where("billboard_loc='" . quote_smart($billboard_location_id) . "'");
if($result = $dbh_company_ad->make_query()->result)
{
    $num_company_ad = $dbh_company_ad->num_rows;
    for($a=0; $a<$num_company_ad; $a++)
    {
        $data = $result->fetch_row();
        $cf_company_ad_company_id[$a] = $data[0];
        $data_temp_cf_date = explode('-',$data[1]);
        $cf_company_ad_ad_start_date_year[$a] = $data_temp_cf_date[0];
        $cf_company_ad_ad_start_date_month[$a] = $data_temp_cf_date[1];
        $cf_company_ad_ad_start_date_day[$a] = $data_temp_cf_date[2];
        $data_temp_cf_date = explode('-',$data[2]);
        $cf_company_ad_ad_end_date_year[$a] = $data_temp_cf_date[0];
        $cf_company_ad_ad_end_date_month[$a] = $data_temp_cf_date[1];
        $cf_company_ad_ad_end_date_day[$a] = $data_temp_cf_date[2];
        $cf_company_ad_advertisement_name[$a] = $data[3];
    }
}

