<?php
require_once 'trivia_dd.php';
class trivia_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'TRIVIA_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'trivia_html';
    var $data_subclass = 'trivia';
    var $result_page = 'reporter_result_trivia.php';
    var $cancel_page = 'listview_trivia.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_trivia.php';

    function __construct()
    {
        $this->fields        = trivia_dd::load_dictionary();
        $this->relations     = trivia_dd::load_relationships();
        $this->subclasses    = trivia_dd::load_subclass_info();
        $this->table_name    = trivia_dd::$table_name;
        $this->tables        = trivia_dd::$table_name;
        $this->readable_name = trivia_dd::$readable_name;
        $this->get_report_fields();
    }
}
