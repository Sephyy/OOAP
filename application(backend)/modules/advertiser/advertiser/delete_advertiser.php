<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Delete advertiser');

if(isset($_GET['advertiser_id']))
{
    $advertiser_id = urldecode($_GET['advertiser_id']);
    require_once 'form_data_advertiser.php';
}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_delete']);
    require 'components/query_string_standard.php';

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_advertiser.php?$query_string");
    }

    elseif($_POST['btn_delete'])
    {
        log_action('Pressed delete button');
        require_once 'subclasses/advertiser.php';
        $dbh_advertiser = new advertiser;

        $object_name = 'dbh_advertiser';
        require 'components/create_form_data.php';


        $dbh_advertiser->delete($arr_form_data);

        redirect("listview_advertiser.php?$query_string");
    }
}
require 'subclasses/advertiser_html.php';
$html = new advertiser_html;
$html->draw_header('Delete %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);

$html->draw_hidden('advertiser_id');

$html->detail_view = TRUE;
$html->draw_controls('delete');

$html->draw_footer();