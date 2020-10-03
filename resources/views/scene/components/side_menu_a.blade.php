<?php
use App\Helpers\ProfileHelper;
use App\Models\LinkItem;
use App\Models\LinkGroupRel;

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);
?>
<style>
#{!! $id !!} > dl > dt::before
{
    content: "»";
    position:relative;
}
</style>
<div id="{!! $id !!}" class="JOH-W-Full JOH-Color-Panel-SideMenuA">
  @links(['id'=>'SideMenuA', 'link_id'=>'side_menu_a', 'certified'=>!$is_guest,
    'class'=>[
      '1/dl'=>'JOH-Vertical JOH-P-SSEM',
      '1/dl/dt'=>'JOH-PV-XSEM JOH-Border-Top-5 JOH-Border-Bottom-3 JOH-Color-Panel-SideMenuAItem',
      '1/dl/dt/a'=>'JOH-Font-L JOH-LineH-L JOH-Color-Panel-SideMenuA',
      '1/dl/dt/span'=>'JOH-Font-L JOH-LineH-L JOH-Color-Panel-SideMenuA',
      '2/dl/dt'=>'JOH-PV-XSEM JOH-IPos-Center JOH-Border-Bottom-1 JOH-Color-Panel-SideMenuAItem',
      '2/dl/dt/a'=>'JOH-Font-M JOH-LineH-M JOH-Color-Panel-SideMenuA',
      '2/dl/dt/span'=>'JOH-Font-M JOH-LineH-M JOH-Color-Panel-SideMenuA',
    ],
    'style' => [
      '1/dl/dd'=>'margin-bottom:1em;',
    ],
   ])
  @endlinks
</div>
