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
            $this->set_fields('billboard_location_id, address, latitude, longitude, site_photo_day1, site_photo_day2, site_photo_night, size, material, no_of_faces, no_of_lights, visibility_range, readability_range, traffic_count, viewership, site_supplier, sign_permit_no, sign_permit_date_issue, sign_permit_date_expired, brgy_clear, brgy_clear_date_issuse, brgy_clear_date_expire, mmda_clear_no, mmda_clear_date_issue, mmda_clear_date_expire, cost_per_month, accredit_organization');
            $this->set_values("?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?");

            $bind_params = array('isddsssssssssssssssssssssis',
                                 &$this->fields['billboard_location_id']['value'],
                                 &$this->fields['address']['value'],
                                 &$this->fields['latitude']['value'],
                                 &$this->fields['longitude']['value'],
                                 &$this->fields['site_photo_day1']['value'],
                                 &$this->fields['site_photo_day2']['value'],
                                 &$this->fields['site_photo_night']['value'],
                                 &$this->fields['size']['value'],
                                 &$this->fields['material']['value'],
                                 &$this->fields['no_of_faces']['value'],
                                 &$this->fields['no_of_lights']['value'],
                                 &$this->fields['visibility_range']['value'],
                                 &$this->fields['readability_range']['value'],
                                 &$this->fields['traffic_count']['value'],
                                 &$this->fields['viewership']['value'],
                                 &$this->fields['site_supplier']['value'],
                                 &$this->fields['sign_permit_no']['value'],
                                 &$this->fields['sign_permit_date_issue']['value'],
                                 &$this->fields['sign_permit_date_expired']['value'],
                                 &$this->fields['brgy_clear']['value'],
                                 &$this->fields['brgy_clear_date_issuse']['value'],
                                 &$this->fields['brgy_clear_date_expire']['value'],
                                 &$this->fields['mmda_clear_no']['value'],
                                 &$this->fields['mmda_clear_date_issue']['value'],
                                 &$this->fields['mmda_clear_date_expire']['value'],
                                 &$this->fields['cost_per_month']['value'],
                                 &$this->fields['accredit_organization']['value']);

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
            $this->set_update("address = ?, latitude = ?, longitude = ?, site_photo_day1 = ?, site_photo_day2 = ?, site_photo_night = ?, size = ?, material = ?, no_of_faces = ?, no_of_lights = ?, visibility_range = ?, readability_range = ?, traffic_count = ?, viewership = ?, site_supplier = ?, sign_permit_no = ?, sign_permit_date_issue = ?, sign_permit_date_expired = ?, brgy_clear = ?, brgy_clear_date_issuse = ?, brgy_clear_date_expire = ?, mmda_clear_no = ?, mmda_clear_date_issue = ?, mmda_clear_date_expire = ?, cost_per_month = ?, accredit_organization = ?");
            $this->set_where("billboard_location_id = ?");

            $bind_params = array('sddsssssssssssssssssssssisi',
                                 &$this->fields['address']['value'],
                                 &$this->fields['latitude']['value'],
                                 &$this->fields['longitude']['value'],
                                 &$this->fields['site_photo_day1']['value'],
                                 &$this->fields['site_photo_day2']['value'],
                                 &$this->fields['site_photo_night']['value'],
                                 &$this->fields['size']['value'],
                                 &$this->fields['material']['value'],
                                 &$this->fields['no_of_faces']['value'],
                                 &$this->fields['no_of_lights']['value'],
                                 &$this->fields['visibility_range']['value'],
                                 &$this->fields['readability_range']['value'],
                                 &$this->fields['traffic_count']['value'],
                                 &$this->fields['viewership']['value'],
                                 &$this->fields['site_supplier']['value'],
                                 &$this->fields['sign_permit_no']['value'],
                                 &$this->fields['sign_permit_date_issue']['value'],
                                 &$this->fields['sign_permit_date_expired']['value'],
                                 &$this->fields['brgy_clear']['value'],
                                 &$this->fields['brgy_clear_date_issuse']['value'],
                                 &$this->fields['brgy_clear_date_expire']['value'],
                                 &$this->fields['mmda_clear_no']['value'],
                                 &$this->fields['mmda_clear_date_issue']['value'],
                                 &$this->fields['mmda_clear_date_expire']['value'],
                                 &$this->fields['cost_per_month']['value'],
                                 &$this->fields['accredit_organization']['value'],
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
