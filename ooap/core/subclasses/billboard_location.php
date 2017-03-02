<?php
require_once 'billboard_location_dd.php';
class billboard_location extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = billboard_location_dd::load_dictionary();
        $this->relations  = billboard_location_dd::load_relationships();
        $this->subclasses = billboard_location_dd::load_subclass_info();
        $this->table_name = billboard_location_dd::$table_name;
        $this->tables     = billboard_location_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('billboard_location_id, address, postal_code');
            $this->set_values("?,?,?");

            $bind_params = array('isi',
                                 &$this->fields['billboard_location_id']['value'],
                                 &$this->fields['address']['value'],
                                 &$this->fields['postal_code']['value']);

            $this->stmt_prepare($bind_params);
        }

        $this->stmt_execute();
        return $this;
    }

    function edit($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('UPDATE');
            $this->set_update("address = ?, postal_code = ?");
            $this->set_where("billboard_location_id = ?");

            $bind_params = array('sii',
                                 &$this->fields['address']['value'],
                                 &$this->fields['postal_code']['value'],
                                 &$this->fields['billboard_location_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("billboard_location_id = ?");

        $bind_params = array('i',
                             &$this->fields['billboard_location_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function delete_many($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("");

        $bind_params = array('',
                             );

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function select()
    {
        $this->set_query_type('SELECT');
        $this->exec_fetch('array');
        return $this;
    }

    function check_uniqueness($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('SELECT');
        $this->set_where("billboard_location_id = ?");

        $bind_params = array('i',
                             &$this->fields['billboard_location_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }

    function check_uniqueness_for_editing($param)
    {
        $this->set_parameters($param);


        $this->set_query_type('SELECT');
        $this->set_where("billboard_location_id = ? AND (billboard_location_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['billboard_location_id']['value'],
                             &$this->fields['billboard_location_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
