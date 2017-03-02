<?php
require_once 'documentation_class.php';
require_once 'advertiser_dd.php';
class advertiser_doc extends documentation
{
    function __construct()
    {
        $this->fields        = advertiser_dd::load_dictionary();
        $this->relations     = advertiser_dd::load_relationships();
        $this->subclasses    = advertiser_dd::load_subclass_info();
        $this->table_name    = advertiser_dd::$table_name;
        $this->readable_name = advertiser_dd::$readable_name;
        parent::__construct();
    }
}
