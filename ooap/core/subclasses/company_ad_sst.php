<?php
require_once 'sst_class.php';
require_once 'company_ad_dd.php';
class company_ad_sst extends sst
{
    function __construct()
    {
        $this->fields        = company_ad_dd::load_dictionary();
        $this->relations     = company_ad_dd::load_relationships();
        $this->subclasses    = company_ad_dd::load_subclass_info();
        $this->table_name    = company_ad_dd::$table_name;
        $this->readable_name = company_ad_dd::$readable_name;
        parent::__construct();
    }
}
