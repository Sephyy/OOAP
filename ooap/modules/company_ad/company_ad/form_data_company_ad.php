<?php
require 'components/get_listview_referrer.php';

require 'subclasses/company_ad.php';
$dbh_company_ad = new company_ad;
$dbh_company_ad->set_where("company_ad_id='" . quote_smart($company_ad_id) . "'");
if($result = $dbh_company_ad->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$ad_start_date);
    if(count($data) == 3)
    {
        $ad_start_date_year = $data[0];
        $ad_start_date_month = $data[1];
        $ad_start_date_day = $data[2];
    }
    $data = explode('-',$ad_end_date);
    if(count($data) == 3)
    {
        $ad_end_date_year = $data[0];
        $ad_end_date_month = $data[1];
        $ad_end_date_day = $data[2];
    }
}

require_once 'subclasses/question.php';
$dbh_question = new question;
$dbh_question->set_fields('question, points, time_limit');
$dbh_question->set_where("company_ad='" . quote_smart($company_ad_id) . "'");
if($result = $dbh_question->make_query()->result)
{
    $num_question = $dbh_question->num_rows;
    for($a=0; $a<$num_question; $a++)
    {
        $data = $result->fetch_row();
        $cf_question_question[$a] = $data[0];
        $cf_question_points[$a] = $data[1];
        $cf_question_time_limit[$a] = $data[2];
    }
}

