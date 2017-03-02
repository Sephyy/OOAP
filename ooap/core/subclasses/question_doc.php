<?php
require_once 'documentation_class.php';
require_once 'question_dd.php';
class question_doc extends documentation
{
    function __construct()
    {
        $this->fields        = question_dd::load_dictionary();
        $this->relations     = question_dd::load_relationships();
        $this->subclasses    = question_dd::load_subclass_info();
        $this->table_name    = question_dd::$table_name;
        $this->readable_name = question_dd::$readable_name;
        parent::__construct();
    }
}
