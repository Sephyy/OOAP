<?php
require_once 'player_answered_question_dd.php';
class player_answered_question_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'PLAYER_ANSWERED_QUESTION_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'player_answered_question_html';
    var $data_subclass = 'player_answered_question';
    var $result_page = 'reporter_result_player_answered_question.php';
    var $cancel_page = 'listview_player_answered_question.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_player_answered_question.php';

    function __construct()
    {
        $this->fields        = player_answered_question_dd::load_dictionary();
        $this->relations     = player_answered_question_dd::load_relationships();
        $this->subclasses    = player_answered_question_dd::load_subclass_info();
        $this->table_name    = player_answered_question_dd::$table_name;
        $this->tables        = player_answered_question_dd::$table_name;
        $this->readable_name = player_answered_question_dd::$readable_name;
        $this->get_report_fields();
    }
	
	function get_custom_join()
    {
        $this->custom_join = 'player_answered_question a LEFT join question b on a.question = b.question_id LEFT JOIN company_ad c on b.company_ad = c.company_ad_id LEFT JOIN billboard_location d on c.billboard_loc = d.billboard_location_id';
        return $this;
    }

    function get_report_fields()
    {
        $this->arr_rpt_fields = array('Player Answered Question ID',
                                      '[Question] Question ID',
                                      '[Question] Question',
                                      '[Question] Question Type',
                                      '[Question] Points',
                                      '[Question] Time Limit',
                                      'Points Attained',
                                      'Time Answered',
									  'Advertisement Name',
									  'Billboard Location',
                                      );

        $this->arr_rpt_fields_sql = array($this->arr_rpt_fields[0]=>'a.player_answered_question_id',
                                          $this->arr_rpt_fields[1]=>'b.question_id',
                                          $this->arr_rpt_fields[2]=>'b.question',
                                          $this->arr_rpt_fields[3]=>'b.answer',
                                          $this->arr_rpt_fields[4]=>'b.points',
                                          $this->arr_rpt_fields[5]=>'b.time_limit',
                                          $this->arr_rpt_fields[6]=>'a.points_attained',
                                          $this->arr_rpt_fields[7]=>'a.time_answered',
										  $this->arr_rpt_fields[8]=>'c.advertisement_name',
										  $this->arr_rpt_fields[9]=>'d.address',
                                          );

        $this->arr_rpt_column_alignments = array($this->arr_rpt_fields[0]=>'center',
                                                 $this->arr_rpt_fields[1]=>'center',
                                                 $this->arr_rpt_fields[2]=>'left',
                                                 $this->arr_rpt_fields[3]=>'left',
                                                 $this->arr_rpt_fields[4]=>'right',
                                                 $this->arr_rpt_fields[5]=>'right',
                                                 $this->arr_rpt_fields[6]=>'left',
                                                 $this->arr_rpt_fields[7]=>'left',
                                                 $this->arr_rpt_fields[8]=>'left',
                                                 $this->arr_rpt_fields[9]=>'left'
                                                 );

        $this->arr_rpt_column_formats = array($this->arr_rpt_fields[0]=>'normal',
                                              $this->arr_rpt_fields[1]=>'normal',
                                              $this->arr_rpt_fields[2]=>'normal',
                                              $this->arr_rpt_fields[3]=>'normal',
                                              $this->arr_rpt_fields[4]=>'number_format2',
                                              $this->arr_rpt_fields[5]=>'number_format2',
                                              $this->arr_rpt_fields[6]=>'normal',
                                              $this->arr_rpt_fields[7]=>'normal',
                                              $this->arr_rpt_fields[8]=>'normal',
                                              $this->arr_rpt_fields[9]=>'normal'
                                              );

        $this->arr_rpt_show_sum = array($this->arr_rpt_fields[0]=>TRUE,
                                        $this->arr_rpt_fields[1]=>TRUE,
                                        $this->arr_rpt_fields[2]=>FALSE,
                                        $this->arr_rpt_fields[3]=>FALSE,
                                        $this->arr_rpt_fields[4]=>TRUE,
                                        $this->arr_rpt_fields[5]=>TRUE,
                                        $this->arr_rpt_fields[6]=>FALSE,
                                        $this->arr_rpt_fields[7]=>FALSE,
                                        $this->arr_rpt_fields[8]=>FALSE,
                                        $this->arr_rpt_fields[9]=>FALSE
                                        );
        return $this;
    }
}
