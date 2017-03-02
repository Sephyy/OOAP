<?php
require_once 'player_dd.php';
class player_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'PLAYER_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'player_html';
    var $data_subclass = 'player';
    var $result_page = 'reporter_result_player.php';
    var $cancel_page = 'listview_player.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_player.php';

    function __construct()
    {
        $this->fields        = player_dd::load_dictionary();
        $this->relations     = player_dd::load_relationships();
        $this->subclasses    = player_dd::load_subclass_info();
        $this->table_name    = player_dd::$table_name;
        $this->tables        = player_dd::$table_name;
        $this->readable_name = player_dd::$readable_name;
        $this->get_report_fields();
    }
}
