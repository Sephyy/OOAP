<?php
require 'components/get_listview_referrer.php';

require 'subclasses/company.php';
$dbh_company = new company;
$dbh_company->set_where("company_id='" . quote_smart($company_id) . "'");
if($result = $dbh_company->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

require_once 'subclasses/trivia.php';
$dbh_trivia = new trivia;
$dbh_trivia->set_fields('trivia');
$dbh_trivia->set_where("company='" . quote_smart($company_id) . "'");
if($result = $dbh_trivia->make_query()->result)
{
    $num_trivia = $dbh_trivia->num_rows;
    for($a=0; $a<$num_trivia; $a++)
    {
        $data = $result->fetch_row();
        $cf_trivia_trivia[$a] = $data[0];
    }
}

require_once 'subclasses/company_ad.php';
$dbh_company_ad = new company_ad;
$dbh_company_ad->set_fields('billboard_loc, ad_start_date, ad_end_date, advertisement_name');
$dbh_company_ad->set_where("company_id='" . quote_smart($company_id) . "'");
if($result = $dbh_company_ad->make_query()->result)
{
    $num_company_ad = $dbh_company_ad->num_rows;
    for($a=0; $a<$num_company_ad; $a++)
    {
        $data = $result->fetch_row();
        $cf_company_ad_billboard_loc[$a] = $data[0];
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

require_once 'subclasses/advertiser.php';
$dbh_advertiser = new advertiser;
$dbh_advertiser->set_fields('person_id, contact_number, email');
$dbh_advertiser->set_where("company_id='" . quote_smart($company_id) . "'");
if($result = $dbh_advertiser->make_query()->result)
{
    $num_advertiser = $dbh_advertiser->num_rows;
    for($a=0; $a<$num_advertiser; $a++)
    {
        $data = $result->fetch_row();
        $cf_advertiser_person_id[$a] = $data[0];
        $cf_advertiser_contact_number[$a] = $data[1];
        $cf_advertiser_email[$a] = $data[2];
    }
}

