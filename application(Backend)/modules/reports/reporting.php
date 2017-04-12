<?php
require_once 'path.php';
init_cobalt();

$show = FALSE;
init_var($_POST['btn_submit']);
if($_POST['btn_submit'])
{
	$question_id = $_POST['question'];
	$company_ad = $_POST['company_ad'];
	debug($question_id);
	debug($company_ad);
	
	$date_from = $_POST['from_year'].'-'.$_POST['from_month'].'-'.$_POST['from_day'];
	$date_to = $_POST['to_year'].'-'.$_POST['to_month'].'-'.$_POST['to_day'];
	
	if($_POST['question']== "")
	{
		brpt();
		$question_clause = ' AND b.question_id > 0';
	}
	else
	{
		$question_clause = ' AND b.question_id = '.$question_id;
	}
	
	if($_POST['company_ad']== "")
	{
		brpt();
		$company_ad_clause = ' AND b.company_ad > 0';
	}
	else
	{
		$company_ad_clause = ' AND b.company_ad = '.$company_ad;
	}
	
	debug($_POST);
	$dbh = cobalt_load_class('player_answered_question');
	
	$dbh->set_table('player_answered_question a LEFT JOIN question b ON a.question = b.question_id LEFT JOIN company_ad c ON b.company_ad = c.company_ad_id');
	$dbh->set_fields('count(points_attained) AS "counter",b.question,advertisement_name');
	$dbh->set_where('time_answered BETWEEN "'.$date_from.'" AND "'.$date_to.'" '.$question_clause.$company_ad_clause);
	$dbh->set_group_by('b.question');
	
	$dbh->exec_fetch();
	debug($dbh->query);
	
	$arr_result = $dbh->dump;
	
	$show = TRUE;
	
	
}







$html = cobalt_load_class('player_answered_question_html');
$html->draw_header('Reporting Tool');
$html->draw_container_div_start();
$html->draw_fieldset_header('Reports');
$html->draw_fieldset_body_start();
echo '<table>';
$html->draw_date_field($draw_table_tags=TRUE, $cobalt_field_label='Date From', $cobalt_field_date_year='from_year', $cobalt_field_date_month='from_month', $cobalt_field_date_day='from_day','', FALSE,'date_from');
$html->draw_date_field($draw_table_tags=TRUE, $cobalt_field_label='Date To', $cobalt_field_date_year='to_year', $cobalt_field_date_month='to_month', $cobalt_field_date_day='to_day','', FALSE,'date_to');
$html->draw_field('question');
$html = cobalt_load_class('question_html');
$html->draw_field('company_ad');

$arr_hour = array();
$arr_minutes = array();
for($a = 1;$a<=24;++$a)
{
	array_push($arr_hour,$a);
}

for($a = 0;$a<=59;++$a)
{
	array_push($arr_minutes,$a);
}
echo '<tr><td align ="right">Time: </td><td>';
$options = array('per_line'=> TRUE,
				 'items'=>$arr_hour,
				 'values'=>$arr_hour);
$html->draw_select_field($options, 'Time', $form_control_name='hours', $draw_table_tags=FALSE, $extra='');

$options1 = array('per_line'=> TRUE,
				 'items'=>$arr_minutes,
				 'values'=>$arr_minutes);
$html->draw_select_field($options1, '', $form_control_name='minutes', $draw_table_tags=FALSE, $extra='');
echo '</td></tr>';
echo '</table>';
$html->draw_fieldset_body_end();
$html->draw_fieldset_footer_start();
$html->draw_submit_cancel();
$html->draw_fieldset_footer_end();


if($show)
{
	$html->draw_fieldset_header('Reports');
$html->draw_fieldset_body_start();
//debug($arr_result);
echo '<table border = 1>';
echo '<tr><td>Question</td><td>Advertisement Name</td><td>Count</td></tr>';
for($a = 0;$a < count($arr_result['question']);++$a)
{
	echo '<tr><td>'.$arr_result['question'][$a].'</td><td>'.$arr_result['advertisement_name'][$a].'</td><td>'.$arr_result['counter'][$a].'</td></tr>';
}
echo '</table>';

$html->draw_fieldset_body_end();
$html->draw_fieldset_footer_start();

$html->draw_fieldset_footer_end();
}



$html->draw_container_div_end();




?>