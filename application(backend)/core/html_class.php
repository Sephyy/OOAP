<?php
require 'base_html_class.php';
class html extends base_html
{
	function draw_container_div_start_modal($modal_message)
    {
		echo '<style>
				#overlay 
				{
					
					position:absolute;
					top:-1%;
					right:1;
					height:100%;
					width:100%;
					background-color:RGBA(255,255,255,0.5);
					z-index:999;
				}
				.container_modal
				{
					position:absolute;
					left:32%;
					top:25%;
				}	
				
			 </style>
		';
		echo '<div id = "overlay">';
        echo '<div class="container_modal">' . "\r\n";
        echo '<fieldset class="container_invisible">' . "\r\n";
		
		$html = new base_html;
		$html->draw_fieldset_header('Confirmation');
		$html->draw_fieldset_body_start();
		echo $modal_message;
		$html->draw_fieldset_body_end();
		$html->draw_fieldset_footer_start();
		$html->draw_button($type='special', $button_class="sample", $button_name='btn_submit2', $button_label='SUBMIT', $draw_table_tags=FALSE, $colspan="2", $extra='');
		$html->draw_button($type='special', $button_class="sample", $button_name='btn_cancel2', $button_label='CANCEL', $draw_table_tags=FALSE, $colspan="2", $extra='');
		$html->draw_fieldset_footer_end();
		$html->draw_container_div_end();
		echo '</div>';
		
		
		
        return $this;
    }
}