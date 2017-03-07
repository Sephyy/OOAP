<?php
require_once 'question_answer_dd.php';
class question_answer_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'QUESTION_ANSWER_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'question_answer_html';
    var $data_subclass = 'question_answer';
    var $result_page = 'reporter_result_question_answer.php';
    var $cancel_page = 'listview_question_answer.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_question_answer.php';

    function __construct()
    {
        $this->fields        = question_answer_dd::load_dictionary();
        $this->relations     = question_answer_dd::load_relationships();
        $this->subclasses    = question_answer_dd::load_subclass_info();
        $this->table_name    = question_answer_dd::$table_name;
        $this->tables        = question_answer_dd::$table_name;
        $this->readable_name = question_answer_dd::$readable_name;
        $this->get_report_fields();
    }
}
