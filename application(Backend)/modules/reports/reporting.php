<?php
require_once 'path.php';
init_cobalt();

$show = FALSE;
init_var($_POST['btn_submit']);
init_var($_POST['minutes']);
init_var($_POST['hours']);
init_var($_POST['from_day']);
init_var($_POST['from_month']);
init_var($_POST['from_year']);
init_var($_POST['question_name']);
init_var($_POST['to_day']);
init_var($_POST['to_month']);
init_var($_POST['to_year']);
$time_clause = '';
 require 'subclasses/player_answered_question.php';
    $dbh_question = new player_answered_question;

    $object_name = 'dbh_question';
    require 'components/create_form_data.php';
	$arr_form_data['hours']=$_POST['hours'];
	$arr_form_data['minutes']=$_POST['minutes'];
	
	$arr_form_data['from_day']=$_POST['from_day'];
	$arr_form_data['from_month']=$_POST['from_month'];
	$arr_form_data['from_year']=$_POST['from_year'];
	
	$arr_form_data['to_day']=$_POST['to_day'];
	$arr_form_data['to_month']=$_POST['to_month'];
	$arr_form_data['to_year']=$_POST['to_year'];

	$arr_form_data['question_name']=$_POST['question_name'];
    extract($arr_form_data);


if($_POST['btn_submit'])
{

	$question_id = $_POST['question_name'];
	$company_ad = $_POST['company_ad'];
	//debug($question_id);
	//debug($company_ad);
	//debug($question_id);
	$date_from = $_POST['from_year'].'-'.$_POST['from_month'].'-'.$_POST['from_day'];
	$date_to = $_POST['to_year'].'-'.$_POST['to_month'].'-'.$_POST['to_day'];
	$minutes1 = $_POST['minutes'];
	$hours1 = $_POST['hours'];
	$time = $hours1 . '' . $minutes1;

	//debug($time);
	
	if($_POST['question_name']== "")
	{
	//	brpt();
		$question_clause = ' AND b.question_id > 0';
	}
	else
	{
		$question_clause = ' AND b.question_id = '.$question_id;
	}
	
	if($_POST['company_ad']== "")
	{
		//brpt();
		$company_ad_clause = ' AND b.company_ad > 0';
	}
	else
	{
		$company_ad_clause = ' AND b.company_ad = '.$company_ad;
	}

	if($time != '')
	{
		// brpt();
		$time_time = $hours1 . ':' . $minutes1;
		$time_clause = ' AND time_answered LIKE "%'.$time_time.'%" ';
	}
	
	//debug($_POST);
	$dbh = cobalt_load_class('player_answered_question');
	
	$dbh->set_table('player_answered_question a LEFT JOIN question b ON a.question = b.question_id LEFT JOIN company_ad c ON b.company_ad = c.company_ad_id');
	$dbh->set_fields('count(points_attained) AS "counter",b.question,advertisement_name');
	$dbh->set_where('time_answered BETWEEN "'.$date_from.'" AND "'.$date_to.'" '.$time_clause.'' . $company_ad_clause  );
	
	$dbh->set_group_by('b.question');
	
	$dbh->exec_fetch();
	//debug($dbh->query);
	
	$arr_result = $dbh->dump;
	
	
	$show = TRUE;
	
	
}







$html = cobalt_load_class('player_answered_question_html');
$html->draw_header('Reporting Tool');

	if($_POST['btn_submit'])
	{
		
		if ($hours1=="" && $minutes1 != '')
		{
			$html->display_error("Hours should be filled");

		}

		if($hours1 != '' && $minutes1=="")
		{
		$html->display_error(" Minutes should be filled");	
		}
		
	}
$html->draw_container_div_start();
$html->draw_fieldset_header('Reports');
$html->draw_fieldset_body_start();
echo '<table>';
$html->draw_date_field($draw_table_tags=TRUE, $cobalt_field_label='Date From', $cobalt_field_date_year='from_year', $cobalt_field_date_month='from_month', $cobalt_field_date_day='from_day','', FALSE,'date_from');
$html->draw_date_field($draw_table_tags=TRUE, $cobalt_field_label='Date To', $cobalt_field_date_year='to_year', $cobalt_field_date_month='to_month', $cobalt_field_date_day='to_day','', FALSE,'date_to');
// $html->draw_select_field_from_query("Select question,question_id from question", 'question_id',array('question'), "Question", $form_control_name='question_name', $detail_view=FALSE, $draw_table_tags=TRUE, $list_separators='', $extra='');
$html = cobalt_load_class('question_html');
$html->draw_field('company_ad');

$arr_hour = array();
$arr_minutes = array();
for($a = 1;$a<=24;++$a)
{
	$fin_hr=str_pad($a,2,"0",STR_PAD_LEFT);
	array_push($arr_hour,$fin_hr);
}

for($a = 0;$a<=59;++$a)
{
	$fin_min=str_pad($a,2,"0",STR_PAD_LEFT);
	array_push($arr_minutes,$fin_min);
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
	if(count($arr_result)>0){
	$html->draw_fieldset_header('Reports');
$html->draw_fieldset_body_start();
//debug($arr_result);
echo '<table border = 1>';
echo '<tr><td>Question</td><td>Advertisement Name</td><td>Number of Person Answered</td></tr>';


	

for($a = 0;$a < count($arr_result['question']);++$a)
{
	echo '<tr><td>'.$arr_result['question'][$a].'</td><td>'.$arr_result['advertisement_name'][$a].'</td><td>'.$arr_result['counter'][$a].'</td></tr>';
}
echo '</table>';

$html->draw_fieldset_body_end();
$html->draw_fieldset_footer_start();

$html->draw_fieldset_footer_end();
} else{
	$html->display_info("No value retrieved");
}

}


$html->draw_container_div_end();




?>