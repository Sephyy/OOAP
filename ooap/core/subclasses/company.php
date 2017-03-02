<?php
require_once 'company_dd.php';
class company extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = company_dd::load_dictionary();
        $this->relations  = company_dd::load_relationships();
        $this->subclasses = company_dd::load_subclass_info();
        $this->table_name = company_dd::$table_name;
        $this->tables     = company_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num');
            $this->set_values("?,?,?,?,?,?");

            $bind_params = array('isssss',
                                 &$this->fields['company_id']['value'],
                                 &$this->fields['company_name']['value'],
                                 &$this->fields['company_address']['value'],
                                 &$this->fields['company_mobile_num1']['value'],
                                 &$this->fields['company_mobile_num2']['value'],
                                 &$this->fields['company_tel_num']['value']);

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
            $this->set_update("company_name = ?, company_address = ?, company_mobile_num1 = ?, company_mobile_num2 = ?, company_tel_num = ?");
            $this->set_where("company_id = ?");

            $bind_params = array('sssssi',
                                 &$this->fields['company_name']['value'],
                                 &$this->fields['company_address']['value'],
                                 &$this->fields['company_mobile_num1']['value'],
                                 &$this->fields['company_mobile_num2']['value'],
                                 &$this->fields['company_tel_num']['value'],
                                 &$this->fields['company_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("company_id = ?");

        $bind_params = array('i',
                             &$this->fields['company_id']['value']);

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
        $this->set_where("company_id = ?");

        $bind_params = array('i',
                             &$this->fields['company_id']['value']);

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
        $this->set_where("company_id = ? AND (company_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['company_id']['value'],
                             &$this->fields['company_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
