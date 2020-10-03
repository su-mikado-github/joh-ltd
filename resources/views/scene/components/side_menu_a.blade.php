<?php
use App\Helpers\ProfileHelper;
use App\Models\LinkItem;
use App\Models\LinkGroupRel;

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);

$link_group_rels = LinkGroupRel::rowsetByLinkGroupId('side_menu_a');
?>
<style>
#{!! $id !!} > div > h3::before
{
    content: "»";
    position:relative;
    left: -16px;
}
</style>
<div id="{!! $id !!}" class="JOH-W-Full JOH-Color-Panel-SideMenuA">
  @foreach ($link_group_rels as $link_group_rel)
  <div class="JOH-W-Full JOH-PH-SSEM" style="margin-bottom:2em;">
    <h3 class="JOH-Font-M JOH-PV-XSEM JOH-Color-Panel-SideMenuAGroup JOH-Border-Top-5 JOH-Border-Bottom-3" style="padding-left:1em;">{{ $link_group_rel->link_name }}</h3>
    @links(['id'=>'pnl' . str_replace('_', '', ucwords($link_group_rel->link_group_id, '_')) . '_' . str_replace('_', '', ucwords($link_group_rel->link_id, '_')), 'link_id'=>$link_group_rel->link_id, 'certified'=>!$is_guest, 'class'=>[ 'dl'=>'JOH-Vertical Separated JOH-IPos-Center','dl/dd'=>'JOH-PV-XSEM JOH-Border-Bottom-1 JOH-Color-Panel-SideMenuAItem','dl/dd/a'=>'JOH-Font-M JOH-LineH-M JOH-Color-Panel-SideMenuA','dl/dd/span'=>'JOH-Font-M JOH-LineH-M' ] ])
    @endlinks
  </div>
  @endforeach
</div>
