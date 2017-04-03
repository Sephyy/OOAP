<?php


function get_name($data)
{

	$dbh = cobalt_load_class('player');
	$dbh->set_table('player LEFT JOIN person ON player.person_id = person.person_id');
	$dbh->set_fields('first_name,middle_name,last_name');
	$dbh->set_where('player_id ='.trim($data," ").'');

	$dbh->exec_fetch('single');
	// debug($dbh->query);
	$name = $dbh->dump['first_name'] . ' '. $dbh->dump['middle_name'] .' '. $dbh->dump['last_name'];
	return $name;

}
?>