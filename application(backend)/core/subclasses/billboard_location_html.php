<?php
require_once 'billboard_location_dd.php';
class billboard_location_html extends html
{
    function __construct()
    {
        $this->fields        = billboard_location_dd::load_dictionary();
        $this->relations     = billboard_location_dd::load_relationships();
        $this->subclasses    = billboard_location_dd::load_subclass_info();
        $this->table_name    = billboard_location_dd::$table_name;
        $this->readable_name = billboard_location_dd::$readable_name;
    }
}
