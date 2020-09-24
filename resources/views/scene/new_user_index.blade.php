<?php
use App\Models\DivisionValue;
use App\Helpers\SceneHelper;
?>
@extends('scene.layout.normal')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="{!! SceneHelper::url('/behavior/new_user') !!}"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
@endsection

@section('content')
<article class="JOH-Flex Rows-CC" style="padding:1em;align-items:center;"><input type="hidden" id="varTemporaryRegistId"  data-id="varTemporaryRegistId" value="{!! $temporary_regist_id !!}">
    <section class="JOH-Flex Rows-CC" style="padding:2em;">
      <h1 class="JOH-IPos-Center JOH-Font-LL" style="margin-bottom:1em;">新規会員登録（無料）</h1>

      <p class="JOH-Font-S JOH-Color-Label-WarningText" style="margin-bottom:1em;">全ての項目が必須です。</p>

      <dl class="JOH-W-Full">
      <dt class="JOH-Font-S"><label for="txtMailAddress">メールアドレス</label></dt>
      <dd style="margin-bottom:1em;">
        <input id="txtMailAddress" data-id="txtMailAddress" type="email" class="JOH-W-Full JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;" placeholder="メールアドレス" readonly value="{!! $email !!}">
      </dd>
      <dt class="JOH-Font-S"><label for="txtLoginPassword">パスワード（半角英数字混在８文字以上）</label></dt>
      <dd style="margin-bottom:1em;">
        <input id="txtLoginPassword" data-id="txtLoginPassword" type="password" data-item_id="password" class="JOH-W-Full JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;" placeholder="パスワード">
      </dd>
      <dt class="JOH-Font-S"><label for="txtLoginPasswordConfirmation">パスワード（確認）</label></dt>
      <dd style="margin-bottom:1em;">
        <input id="txtLoginPasswordConfirmation" data-id="txtLoginPasswordConfirmation" type="password" data-item_id="password_confirmation" class="JOH-W-Full JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;" placeholder="パスワード（確認）">
      </dd>

      @foreach ($attr_defs as $attr_def)
      <?php
      $id = 'attr' . str_replace('_', '', ucwords($attr_def->id, '_'));
      $input_width = (empty($attr_def->input_width) ? '' : 'width:' . $attr_def->input_width . 'em;' . 'min-width:' . $attr_def->input_width . 'em;' . 'max-width:' . $attr_def->input_width . 'em;');
      $input_height = (empty($attr_def->input_height) ? '' : 'height:' . $attr_def->input_height . 'em;' . 'min-height:' . $attr_def->input_height . 'em;' . 'max-height:' . $attr_def->input_height . 'em;');
      $required = ($attr_def->require_flag == 1 ? ' required' : '');
      ?>
      <dt class="JOH-Font-S"><label for="{!! $id !!}">{{ $attr_def->name }}{{ ($attr_def->value_type==6 && in_array($attr_def->selector_pattern, [ 3,5 ]) ? '（複数回答可）' : '') }}</label></dt>
      <dd class="JOH-Font-S" style="margin-bottom:1em;">
        @switch ($attr_def->value_type)
        @case (1)
          <input type="{!! (empty($attr_def->text_type) ? 'text' : $attr_def->text_type) !!}" id="{!! $id !!}" minlength="{!! $attr_def->min_length !!}" maxlength="{!! $attr_def->max_length !!}" pattern="{!! $attr_def->regex !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @case (11)
          <textarea  id="{!! $id !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" {!! ($attr_def->input_height ? ' rows="' . $attr_def->input_height . '"' : '') !!} class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}"{!! $required !!}></textarea>
        @break
        @case (2)
          <input type="{!! (empty($attr_def->text_type) ? 'number' : $attr_def->text_type) !!}" id="{!! $id !!}" min="{!! $attr_def->min_bigint_value !!}" max="{!! $attr_def->max_bigint_value !!}" step="{!! $attr_def->bigint_step_value !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @case (3)
          <input type="{!! (empty($attr_def->text_type) ? 'number' : $attr_def->text_type) !!}" id="{!! $id !!}" min="{!! $attr_def->min_double_value !!}" max="{!! $attr_def->max_double_value !!}" step="{!! $attr_def->double_step_value !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @cas e(4)
          <input type="{!! (empty($attr_def->text_type) ? 'date' : $attr_def->text_type) !!}" id="{!! $id !!}" min="{!! $attr_def->start_date !!}" max="{!! $attr_def->end_date !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @case (5)
          <input type="{!! (empty($attr_def->text_type) ? 'time' : $attr_def->text_type) !!}" id="{!! $id !!}" min="{!! $attr_def->start_time !!}" max="{!! $attr_def->end_time !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @case (6)
        <?php
        $list = DivisionValue::rowsetByDivisionId($attr_def->selector_division_id);
        ?>
          @switch ($attr_def->selector_pattern)
          @case (1)
            <select id="{!! $id !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
            @foreach ($list as $item)
              <option value="{!! $item->value !!}"{!! ($item->value==$attr_def->default_attr_value ? ' selected' : '') !!}>{!! $item->name !!}</option>
            @endforeach
            </select>
          @break;
          @case (2)
            <div style="{!! $input_width !!}" data-item_id="{{ $attr_def->id }}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}">
            @foreach ($list as $item)
              <div class="JOH-Wrap-Manual JOH-P-XSEM" style="margin-right:1em;">
                <input type="radio" id="{!! $id !!}{!! $item->value !!}" data-id="{!! $id !!}{!! $item->value !!}" name="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" value="{!! $item->value !!}"{!! ($item->value==$attr_def->default_attr_value ? ' checked' : '') !!}><label for="{!! $id !!}{!! $item->value !!}">{!! $item->name !!}</label>
              </div>
            @endforeach
            </div>
          @break;
          @case (3)
            <div style="{!! $input_width !!}" data-item_id="{{ $attr_def->id }}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}">
            @foreach ($list as $item)
              <div class="JOH-Wrap-Manual JOH-P-XSEM" style="margin-right:1em;">
                <input type="checkbox" id="{!! $id !!}{!! $item->value !!}" data-id="{!! $id !!}{!! $item->value !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" value="{!! $item->value !!}"><label for="{!! $id !!}{!! $item->value !!}">{!! $item->name !!}</label>
              </div>
            @endforeach
            </div>
          @break;
          @case (4)
            <select size="{!! ($attr_def->input_height ?: count($list)) !!}" id="{!! $id !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
            @foreach ($list as $item)
              <option value="{!! $item->value !!}"{!! ($item->value==$attr_def->default_attr_value ? ' selected' : '') !!}>{!! $item->name !!}</option>
            @endforeach
            </select>
          @break;
          @case (5)
            <select size="{!! ($attr_def->input_height ?: count($list)) !!}" multiple id="{!! $id !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
            @foreach ($list as $item)
              <option value="{!! $item->value !!}">{!! $item->name !!}</option>
            @endforeach
            </select>
          @break;
          @endswitch
        @break
{{--
        @case (7)
          <input type="{!! (empty($attr_def->text_type) ? 'text' : $attr_def->text_type) !!}" id="{!! $id !!}" minlength="{!! $attr_def->min_length !!}" maxlength="{!! $attr_def->max_length !!}" pattern="{!! $attr_def->regex !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
        @case (8)
          <input type="{!! (empty($attr_def->text_type) ? 'text' : $attr_def->text_type) !!}" id="{!! $id !!}" minlength="{!! $attr_def->min_length !!}" maxlength="{!! $attr_def->max_length !!}" pattern="{!! $attr_def->regex !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
        @break
--}}
        @case (9)
          <div style="{!! $input_width !!}" data-item_id="{{ $attr_def->id }}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" class="JOH-Wrap-Manual JOH-P-XSEM">
            @if ($attr_def->flag_label_display==1)<label for="{!! $id !!}">{{ $attr_def->flag_label }}</label>@endif
            <input type="checkbox" id="{!! $id !!}" data-id="{!! $id !!}" data-attr_def_id="{{ $attr_def->id }}" value="1">
            @if ($attr_def->flag_label_display==2)<label for="{!! $id !!}">{{ $attr_def->flag_label }}</label>@endif
          </div>
        @break
{{--
        @case (99)
          <input type="{!! (empty($attr_def->text_type) ? 'text' : $attr_def->text_type) !!}" id="{!! $id !!}" minlength="{!! $attr_def->min_length !!}" maxlength="{!! $attr_def->max_length !!}" pattern="{!! $attr_def->regex !!}" data-id="{!! $id !!}" data-attr_def_group_id="{{ $attr_def->attr_def_group_id }}" data-item_id="{{ $attr_def->id }}" data-attr_def_id="{{ $attr_def->id }}" class="JOH-Font-S JOH-Border-1 JOH-Color-Form-Text" style="padding:0.5em;{!! $input_width !!}" placeholder="{{ $attr_def->name }}"{!! $required !!}>
--}}
        @default
          <span>現在はサポートされていません。</span>
        @endswitch
      </dd>
      @endforeach
      </dl>
    </section>
    <section style="padding:2em;">
      <button id="btnPreview" data-id="btnPreview" type="button" class="JOH-Font-M JOH-Color-Button-Main JOH-Border-3 JOH-P-SSEM" style="width:600px;">入力内容を確認する</button>
    </section>
</article>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
