<?php
require_once 'player_answered_question_dd.php';
class player_answered_question_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'PLAYER_ANSWERED_QUESTION_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'player_answered_question_html';
    var $data_subclass = 'player_answered_question';
    var $result_page = 'reporter_result_player_answered_question.php';
    var $cancel_page = 'listview_player_answered_question.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_player_answered_question.php';

    function __construct()
    {
        $this->fields        = player_answered_question_dd::load_dictionary();
        $this->relations     = player_answered_question_dd::load_relationships();
        $this->subclasses    = player_answered_question_dd::load_subclass_info();
        $this->table_name    = player_answered_question_dd::$table_name;
        $this->tables        = player_answered_question_dd::$table_name;
        $this->readable_name = player_answered_question_dd::$readable_name;
        $this->get_report_fields();
    }
}
