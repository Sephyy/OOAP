<?php
require_once 'question_dd.php';
class question_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'QUESTION_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'question_html';
    var $data_subclass = 'question';
    var $result_page = 'reporter_result_question.php';
    var $cancel_page = 'listview_question.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_question.php';

    function __construct()
    {
        $this->fields        = question_dd::load_dictionary();
        $this->relations     = question_dd::load_relationships();
        $this->subclasses    = question_dd::load_subclass_info();
        $this->table_name    = question_dd::$table_name;
        $this->tables        = question_dd::$table_name;
        $this->readable_name = question_dd::$readable_name;
        $this->get_report_fields();
    }
}
