<?php
use App\Helpers\ProfileHelper;

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);
?>
<div class="JOH-Flex Columns-TAround" style="margin-top: 0.5em;">
<div class="JOH-PH-XLEM JOH-PV-SSEM JOH-Color-Panel-HeaderMenu">
@links([ 'id'=>$id, 'link_id'=>'header_menu', 'certified'=>!$is_guest, 'class'=>['dl'=>'JOH-Horizontal Separated JOH-IPos-Left','dl/dt'=>'JOH-PH-MEM','dl/dt/a'=>'JOH-Font-L JOH-LineH-L  JOH-Color-Panel-HeaderMenu','dl/dt/span'=>'JOH-Font-L JOH-LineH-L'] ])
@endlinks
</div>
</div>
