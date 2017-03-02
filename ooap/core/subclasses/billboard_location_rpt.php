<?php
require_once 'billboard_location_dd.php';
class billboard_location_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'BILLBOARD_LOCATION_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'billboard_location_html';
    var $data_subclass = 'billboard_location';
    var $result_page = 'reporter_result_billboard_location.php';
    var $cancel_page = 'listview_billboard_location.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_billboard_location.php';

    function __construct()
    {
        $this->fields        = billboard_location_dd::load_dictionary();
        $this->relations     = billboard_location_dd::load_relationships();
        $this->subclasses    = billboard_location_dd::load_subclass_info();
        $this->table_name    = billboard_location_dd::$table_name;
        $this->tables        = billboard_location_dd::$table_name;
        $this->readable_name = billboard_location_dd::$readable_name;
        $this->get_report_fields();
    }
}
