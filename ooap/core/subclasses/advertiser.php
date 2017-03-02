<?php
require_once 'advertiser_dd.php';
class advertiser extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = advertiser_dd::load_dictionary();
        $this->relations  = advertiser_dd::load_relationships();
        $this->subclasses = advertiser_dd::load_subclass_info();
        $this->table_name = advertiser_dd::$table_name;
        $this->tables     = advertiser_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('advertiser_id, person_id, company_id, contact_number, email');
            $this->set_values("?,?,?,?,?");

            $bind_params = array('iiiss',
                                 &$this->fields['advertiser_id']['value'],
                                 &$this->fields['person_id']['value'],
                                 &$this->fields['company_id']['value'],
                                 &$this->fields['contact_number']['value'],
                                 &$this->fields['email']['value']);

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
            $this->set_update("person_id = ?, company_id = ?, contact_number = ?, email = ?");
            $this->set_where("advertiser_id = ?");

            $bind_params = array('iissi',
                                 &$this->fields['person_id']['value'],
                                 &$this->fields['company_id']['value'],
                                 &$this->fields['contact_number']['value'],
                                 &$this->fields['email']['value'],
                                 &$this->fields['advertiser_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("advertiser_id = ?");

        $bind_params = array('i',
                             &$this->fields['advertiser_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function delete_many($param)
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
        $this->set_where("advertiser_id = ?");

        $bind_params = array('i',
                             &$this->fields['advertiser_id']['value']);

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
        $this->set_where("advertiser_id = ? AND (advertiser_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['advertiser_id']['value'],
                             &$this->fields['advertiser_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
