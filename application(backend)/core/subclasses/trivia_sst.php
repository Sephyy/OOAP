<?php
require_once 'sst_class.php';
require_once 'trivia_dd.php';
class trivia_sst extends sst
{
    function __construct()
    {
        $this->fields        = trivia_dd::load_dictionary();
        $this->relations     = trivia_dd::load_relationships();
        $this->subclasses    = trivia_dd::load_subclass_info();
        $this->table_name    = trivia_dd::$table_name;
        $this->readable_name = trivia_dd::$readable_name;
        parent::__construct();
    }
}
