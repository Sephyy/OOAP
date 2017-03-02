<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Edit company');

if(isset($_GET['company_id']))
{
    $company_id = urldecode($_GET['company_id']);
    require 'form_data_company.php';

}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_submit']);
    require 'components/query_string_standard.php';
    require 'subclasses/company.php';
    $dbh_company = new company;

    $object_name = 'dbh_company';
    require 'components/create_form_data.php';

    extract($arr_form_data);

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_company.php?$query_string");
    }


    if($_POST['btn_submit'])
    {
        log_action('Pressed submit button');

        $message .= $dbh_company->sanitize($arr_form_data)->lst_error;
        extract($arr_form_data);

        if($dbh_company->check_uniqueness_for_editing($arr_form_data)->is_unique)
        {
            //Good, no duplicate in database
        }
        else
        {
            $message = "Record already exists with the same primary identifiers!";
        }

        if($message=="")
        {
            require_once 'subclasses/trivia.php';
            $dbh_trivia = new trivia;
            $dbh_trivia->delete_many($arr_form_data);

            for($a=0; $a<$trivia_count;$a++)
            {
                
                $param = array(
                               'trivia'=>$cf_trivia_trivia[$a],
                               'company'=>$company_id
                              );
                $dbh_trivia->add($param);
            }

            require_once 'subclasses/company_ad.php';
            $dbh_company_ad = new company_ad;
            $dbh_company_ad->delete_many($arr_form_data);

            for($a=0; $a<$company_ad_count;$a++)
            {
                $cf_company_ad_ad_start_date[$a] = $cf_company_ad_ad_start_date_year[$a] . '-' . $cf_company_ad_ad_start_date_month[$a] . '-' . $cf_company_ad_ad_start_date_day[$a];
               $cf_company_ad_ad_end_date[$a] = $cf_company_ad_ad_end_date_year[$a] . '-' . $cf_company_ad_ad_end_date_month[$a] . '-' . $cf_company_ad_ad_end_date_day[$a];
               
                $param = array(
                               'company_id'=>$company_id,
                               'billboard_loc'=>$cf_company_ad_billboard_loc[$a],
                               'ad_start_date'=>$cf_company_ad_ad_start_date[$a],
                               'ad_end_date'=>$cf_company_ad_ad_end_date[$a],
                               'advertisement_name'=>$cf_company_ad_advertisement_name[$a]
                              );
                $dbh_company_ad->add($param);
            }

            require_once 'subclasses/advertiser.php';
            $dbh_advertiser = new advertiser;
            $dbh_advertiser->delete_many($arr_form_data);

            for($a=0; $a<$advertiser_count;$a++)
            {
                
                $param = array(
                               'person_id'=>$cf_advertiser_person_id[$a],
                               'company_id'=>$company_id,
                               'contact_number'=>$cf_advertiser_contact_number[$a],
                               'email'=>$cf_advertiser_email[$a]
                              );
                $dbh_advertiser->add($param);
            }


            $dbh_company->edit($arr_form_data);

            redirect("listview_company.php?$query_string");
        }
    }
}
require 'subclasses/company_html.php';
$html = new company_html;
$html->draw_header('Edit %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);
$html->draw_hidden('company_id');

$html->draw_controls('edit');

$html->draw_footer();