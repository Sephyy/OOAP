<?php
require_once 'company_dd.php';
class company_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'COMPANY_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'company_html';
    var $data_subclass = 'company';
    var $result_page = 'reporter_result_company.php';
    var $cancel_page = 'listview_company.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_company.php';

    function __construct()
    {
        $this->fields        = company_dd::load_dictionary();
        $this->relations     = company_dd::load_relationships();
        $this->subclasses    = company_dd::load_subclass_info();
        $this->table_name    = company_dd::$table_name;
        $this->tables        = company_dd::$table_name;
        $this->readable_name = company_dd::$readable_name;
        $this->get_report_fields();
    }
}
