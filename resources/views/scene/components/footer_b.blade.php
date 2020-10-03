<?php
use App\Models\System;
use App\Models\LinkItem;
use App\Helpers\ProfileHelper;

use App\Models\LinkGroupRel;

$system = System::row();

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);

$link_group_rels = LinkGroupRel::rowsetByLinkGroupId('footer_b');
?>
<div id="{!! $id !!}" class="JOH-W-Full JOH-Color-Panel-Footer" style="position:relative;">
  <div class="JOH-Flex Rows-CC JOH-P-SSEM JOH-H-Full" style="position:absolute;top:0px;left:0px;width:300px;flex-direction:column;">
    <div><img src="{!! $system->logo_url !!}" style="width:180px;background-color:white;"></div>
    <span class="JOH-Font-SS">運営会社：{{ $system->source_company_name }}</span>
  </div>
  <div class="JOH-W-Full JOH-Flex Rows-TC JOH-P-SSEM" style="flex-wrap:wrap;height:840px;">
    @foreach ($link_group_rels as $link_group_rel)
    <div class="JOH-PH-MEM" style="margin-bottom:2em;">
      <h3 class="JOH-Font-S" style="margin-bottom:1em;">{{ $link_group_rel->link_name }}</h3>
      @links(['id'=>'pnl' . str_replace('_', '', ucwords($link_group_rel->link_group_id, '_')) . '_' . str_replace('_', '', ucwords($link_group_rel->link_id, '_')), 'link_id'=>$link_group_rel->link_id, 'certified'=>!$is_guest, 'class'=>[ 'dl'=>'JOH-Virtical', 'dl/dt'=>'JOH-Font-SS' ] ])
      @endlinks
    </div>
    @endforeach
  </div>
  <div class="JOH-Invisible">-</div>
  <div class="Copyright JOH-W-Full JOH-Font-SS JOH-PH-SSEM JOH-PV-XSEM">{{ $system->copyright }}</div>
</div>