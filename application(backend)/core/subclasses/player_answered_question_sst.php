<?php
require_once 'sst_class.php';
require_once 'player_answered_question_dd.php';
class player_answered_question_sst extends sst
{
    function __construct()
    {
        $this->fields        = player_answered_question_dd::load_dictionary();
        $this->relations     = player_answered_question_dd::load_relationships();
        $this->subclasses    = player_answered_question_dd::load_subclass_info();
        $this->table_name    = player_answered_question_dd::$table_name;
        $this->readable_name = player_answered_question_dd::$readable_name;
        parent::__construct();
    }
}
