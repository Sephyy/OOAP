<?php
require_once 'company_ad_dd.php';
class company_ad_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'COMPANY_AD_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'company_ad_html';
    var $data_subclass = 'company_ad';
    var $result_page = 'reporter_result_company_ad.php';
    var $cancel_page = 'listview_company_ad.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_company_ad.php';

    function __construct()
    {
        $this->fields        = company_ad_dd::load_dictionary();
        $this->relations     = company_ad_dd::load_relationships();
        $this->subclasses    = company_ad_dd::load_subclass_info();
        $this->table_name    = company_ad_dd::$table_name;
        $this->tables        = company_ad_dd::$table_name;
        $this->readable_name = company_ad_dd::$readable_name;
        $this->get_report_fields();
    }
}
