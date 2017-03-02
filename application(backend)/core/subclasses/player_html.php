<?php
require_once 'player_dd.php';
class player_html extends html
{
    function __construct()
    {
        $this->fields        = player_dd::load_dictionary();
        $this->relations     = player_dd::load_relationships();
        $this->subclasses    = player_dd::load_subclass_info();
        $this->table_name    = player_dd::$table_name;
        $this->readable_name = player_dd::$readable_name;
    }
}
