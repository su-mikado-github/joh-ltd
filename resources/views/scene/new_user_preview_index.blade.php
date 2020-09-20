<?php
use App\Models\DivisionValue;

Log::debug($user_info);

?>
@extends('scene.layout.normal')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="{!! SceneHelper::url('/behavior/new_user_preview') !!}"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
@endsection

@section('content')
<article class="JOH-Flex Rows-CC" style="padding:1em;align-items:center;">
    <section class="JOH-Flex Rows-CC" style="padding:2em;">
      <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">新規会員登録（無料）</h1>

      <div class="" style="width:800px;">
        @foreach ($user_info as $item)
        <div class="JOH-Block JOH-M-XSEM">
          <div class="JOH-Inline-Block JOH-W12-4" style="vertical-align:top;">{!! $item['label'] !!}</div><div class="JOH-Inline-Block JOH-W12-8" style="word-break:keep-all;">{!! $item['value'] !!}</div>
        </div>
        @endforeach
      </div>
    </section>
    <section>
      <p class="JOH-Font-S">ご提供いただいた個人情報は@link([ 'link_id'=>'keyword','link_item_id'=>'service_name' ])@endlinkに会員登録し、
      各種のサービス提供やお問合わせ対応のほか、以下に記載する目的のために利用いたします。<br>
      個人情報の取り扱いについては、@link([ 'link_item_id'=>'here', 'class'=>'JOH-Color-Link-Text', 'style'=>'text-decoration:underline;' ])@endlinkをご覧ください。
      </p>
    </section>
    <section class="JOH-Flex Rows-CC" style="padding:2em;">
      <button id="btnAccept" data-id="btnAccept" type="button" class="JOH-Font-M JOH-Color-Button-Main JOH-Border-3 JOH-P-SSEM JOH-MV-XSEM JOH-Font-Weight-Bold" style="width:600px;">上記に同意して登録する</button>
      <button id="btnBackword" data-id="btnBackword" type="button" class="JOH-Font-M JOH-Color-Button-Sub JOH-Border-3 JOH-P-SSEM JOH-MV-XSEM JOH-Font-Weight-Bold" style="width:600px;">登録内容を修正する</button>
    </section>
</article>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
