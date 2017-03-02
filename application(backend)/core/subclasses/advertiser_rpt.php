<?php
require_once 'advertiser_dd.php';
class advertiser_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'ADVERTISER_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'advertiser_html';
    var $data_subclass = 'advertiser';
    var $result_page = 'reporter_result_advertiser.php';
    var $cancel_page = 'listview_advertiser.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_advertiser.php';

    function __construct()
    {
        $this->fields        = advertiser_dd::load_dictionary();
        $this->relations     = advertiser_dd::load_relationships();
        $this->subclasses    = advertiser_dd::load_subclass_info();
        $this->table_name    = advertiser_dd::$table_name;
        $this->tables        = advertiser_dd::$table_name;
        $this->readable_name = advertiser_dd::$readable_name;
        $this->get_report_fields();
    }
}
