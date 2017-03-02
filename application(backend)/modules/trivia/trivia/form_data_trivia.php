<?php
require 'components/get_listview_referrer.php';

require 'subclasses/trivia.php';
$dbh_trivia = new trivia;
$dbh_trivia->set_where("trivia_id='" . quote_smart($trivia_id) . "'");
if($result = $dbh_trivia->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

