<?php
require_once 'company_dd.php';
class company_html extends html
{
    function __construct()
    {
        $this->fields        = company_dd::load_dictionary();
        $this->subclasses    = company_dd::load_subclass_info();
        $this->table_name    = company_dd::$table_name;
        $this->readable_name = company_dd::$readable_name;
    }
}
