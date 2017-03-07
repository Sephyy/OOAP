<?php
require_once 'sst_class.php';
require_once 'question_choices_dd.php';
class question_choices_sst extends sst
{
    function __construct()
    {
        $this->fields        = question_choices_dd::load_dictionary();
        $this->relations     = question_choices_dd::load_relationships();
        $this->subclasses    = question_choices_dd::load_subclass_info();
        $this->table_name    = question_choices_dd::$table_name;
        $this->readable_name = question_choices_dd::$readable_name;
        parent::__construct();
    }
}
