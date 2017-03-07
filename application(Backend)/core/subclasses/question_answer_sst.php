<?php
require_once 'sst_class.php';
require_once 'question_answer_dd.php';
class question_answer_sst extends sst
{
    function __construct()
    {
        $this->fields        = question_answer_dd::load_dictionary();
        $this->relations     = question_answer_dd::load_relationships();
        $this->subclasses    = question_answer_dd::load_subclass_info();
        $this->table_name    = question_answer_dd::$table_name;
        $this->readable_name = question_answer_dd::$readable_name;
        parent::__construct();
    }
}
