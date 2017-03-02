<?php
require_once 'company_ad_dd.php';
class company_ad extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = company_ad_dd::load_dictionary();
        $this->relations  = company_ad_dd::load_relationships();
        $this->subclasses = company_ad_dd::load_subclass_info();
        $this->table_name = company_ad_dd::$table_name;
        $this->tables     = company_ad_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('company_ad_id, company_id, billboard_loc, ad_start_date, ad_end_date, advertisement_name');
            $this->set_values("?,?,?,?,?,?");

            $bind_params = array('iiisss',
                                 &$this->fields['company_ad_id']['value'],
                                 &$this->fields['company_id']['value'],
                                 &$this->fields['billboard_loc']['value'],
                                 &$this->fields['ad_start_date']['value'],
                                 &$this->fields['ad_end_date']['value'],
                                 &$this->fields['advertisement_name']['value']);

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
            $this->set_update("company_id = ?, billboard_loc = ?, ad_start_date = ?, ad_end_date = ?, advertisement_name = ?");
            $this->set_where("company_ad_id = ?");

            $bind_params = array('iisssi',
                                 &$this->fields['company_id']['value'],
                                 &$this->fields['billboard_loc']['value'],
                                 &$this->fields['ad_start_date']['value'],
                                 &$this->fields['ad_end_date']['value'],
                                 &$this->fields['advertisement_name']['value'],
                                 &$this->fields['company_ad_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("company_ad_id = ?");

        $bind_params = array('i',
                             &$this->fields['company_ad_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function delete_many($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("billboard_loc = ?");

        $bind_params = array('i',
                             &$this->fields['billboard_loc']['value']);

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
        $this->set_where("company_ad_id = ?");

        $bind_params = array('i',
                             &$this->fields['company_ad_id']['value']);

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
        $this->set_where("company_ad_id = ? AND (company_ad_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['company_ad_id']['value'],
                             &$this->fields['company_ad_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
