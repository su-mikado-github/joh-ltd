<?php
use App\Models\System;
use App\Models\LinkItem;
use App\Helpers\ProfileHelper;

$system = System::row();

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);

$top = LinkItem::rowByLinkIdLinkItemId('*', 'top', !$is_guest);
$free_quote = LinkItem::rowByLinkIdLinkItemId('*', 'free_quote', !$is_guest);
$login = LinkItem::rowByLinkIdLinkItemId('*', 'login', !$is_guest);
$mypage = LinkItem::rowByLinkIdLinkItemId('*', 'mypage', !$is_guest);
?>
<div id="{{ $id }}" data-id="{{ $id }}" data-behavior-type="JOH.components.Header" class="JOH-Header-Guest JOH-W-Full">

{{-- 最上位のメニューバー --}}
<nav class="JOH-Flex Columns-TBetween JOH-W-Full JOH-LineH-S JOH-Color-Panel-MenuBar" style="padding:0.2em 4em;">
  <div class="JOH-Flex Columns-TBetween">
    <div class="JOH-IPos-Left" style="padding-right:1em;">
      <span class="JOH-Color-Label-Welcome JOH-Font-S JOH-LineH-S">
      @if ($is_guest)
      {{ $system->welcome_message_prefix }}&nbsp;{{ $system->name }}{{ $system->welcome_message_suffix }}
      @else
      {{ $system->welcome_message_prefix }}&nbsp;<a href="{!! $mypage->url ?: '#' !!}" class="JOH-Color-Label-MenuItem">{{ $profile['user']->nickname }}</a>{{ $system->certified_welcome_message_suffix }}
      @endif
      </span>
    </div>
    @if (!$is_guest)
      @links([ 'id'=>'pnlHeaderMenuLeft', 'link_id'=>'header_left', 'certified'=>!$is_guest, 'class'=>['dl'=>'JOH-Horizontal Separated JOH-IPos-Left','dl/dt'=>'JOH-Color-Label-MenuItem JOH-PH-SSEM','dl/dt/a'=>'JOH-Font-S JOH-LineH-S'], 'style'=>[ 'dl'=>'border-left: 1px solid #cccccc;' ] ])
      @endlinks
    @endif
  </div>
  @links([ 'id'=>'pnlHeaderMenuRight', 'link_id'=>'header_right', 'certified'=>!$is_guest, 'class'=>['dl'=>'JOH-Horizontal Separated JOH-IPos-Right','dl/dt'=>'JOH-Color-Label-MenuItem JOH-PH-SSEM','dl/dt/a'=>'JOH-Font-S JOH-LineH-S'] ])
  @endlinks
</nav>

{{-- ロゴ／連絡先／営業時間／無料お見積り／ログイン --}}
<div class="JOH-Flex Columns-TBetween JOH-PV-XSEM JOH-PH-SSEM" style="padding:0.5em 1em;">
  <div class="JOH-W12-3">
    <a data-id="{{ $id }}_Top" href="{!! $top->url ?: '#' !!}"><img src="{{ $system->logo_url }}" style="width:220px;" title="ロゴ"></a>
  </div>
  <div class="JOH-Flex Columns-CR JOH-W12-9 JOH-IPos-Right" style="align-items:center;">
    <div>
      <h6 class="JOH-Font-XS JOH-LineH-XS JOH-IPos-Left" style="font-weight:normal;white-space:nowrap;">お電話でのお問い合わせはこちら</h6>
      <h5 class="JOH-Font-S JOH-LineH-S JOH-IPos-Left" style="font-weight:bold;white-space:nowrap;">{{ $system->tel_no }}</h5>
      <h6 class="JOH-Font-XS JOH-LineH-XS JOH-IPos-Left" style="font-weight:normal;white-space:nowrap;"><span>受付時間</span><span class="JOH-Invisible">--</span><span>{{ $system->reception_time }}</span></h6>
    </div>
    <div class="JOH-Invisible">--</div>
    <div>
      @if (isset($free_quote))
      <a data-id="{{ $id }}_FreeQuote" class="JOH-Font-S JOH-LineH-S JOH-H-Full JOH-Radius-All JOH-Color-Button-TypeA JOH-W-8EM JOH-PV-XSEM JOH-PH-0" href="{!! $free_quote->url ?: '#' !!}">{!! $free_quote->name !!}</a>
      @endif
      @if (isset($mypage))
      <div class="JOH-Invisible">-</div>
      <a data-id="{{ $id }}_Mypage" class="JOH-Font-S JOH-LineH-S JOH-H-Full JOH-Radius-All JOH-Color-Button-TypeB JOH-W-8EM JOH-PV-XSEM JOH-PH-0" href="{!! $mypage->url ?: '#' !!}">{!! $mypage->name !!}</a>
      @endif
      @if (isset($login))
      <div class="JOH-Invisible">-</div>
      <a data-id="{{ $id }}_Login" class="JOH-Font-S JOH-LineH-S JOH-H-Full JOH-Radius-All JOH-Color-Button-TypeB JOH-W-8EM JOH-PV-XSEM JOH-PH-0" href="{!! $login->url ?: '#' !!}">{!! $login->name !!}</a>
      @endif
    </div>
    @if (!$is_guest)
    <div class="JOH-Invisible">--</div>
    <div class="JOH-Font-S JOH-LineH-S JOH-W-6EM JOH-Border-1 JOH-Radius-All JOH-Color-Button-TypeC" style="position:relative;height:44px;text-align:center;">
      <a style="position:relative;top:2px;"><img src="/images/cart.svg" style="width:30px;margin-top:6px;"></a>
      <a style="position:relative;top:-8px;">カート</a>
      <a class="JOH-Inline-Block JOH-Font-SS JOH-W-2EM JOH-IPos-Center" style="position:absolute;top:-2px;left:13px;">0</a>
    </div>
    @endif
  </div>
</div>

</div>