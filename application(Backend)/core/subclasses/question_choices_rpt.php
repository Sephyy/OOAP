<?php
require_once 'question_choices_dd.php';
class question_choices_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'QUESTION_CHOICES_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'question_choices_html';
    var $data_subclass = 'question_choices';
    var $result_page = 'reporter_result_question_choices.php';
    var $cancel_page = 'listview_question_choices.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_question_choices.php';

    function __construct()
    {
        $this->fields        = question_choices_dd::load_dictionary();
        $this->relations     = question_choices_dd::load_relationships();
        $this->subclasses    = question_choices_dd::load_subclass_info();
        $this->table_name    = question_choices_dd::$table_name;
        $this->tables        = question_choices_dd::$table_name;
        $this->readable_name = question_choices_dd::$readable_name;
        $this->get_report_fields();
    }
}
