<?php
/**
 * 属性：
 * *string id … 当コンポーネントの識別ID
 * *string link_id … リンクID
 *  bool certified … 認証状態
 *  class … 各タグに設定するclass属性　※下記のキーを設定可能
 *    dl
 *    dl/dd
 *    dl/dd/span
 *    dl/dd/a
 *  style … 各タグに設定するstyle属性　※下記のキーを設定可能
 *    dl
 *    dl/dd
 *    dl/dd/span
 *    dl/dd/a
 */

use App\Models\LinkItem;
use App\Helpers\ViewHelper;

$link_items = LinkItem::rowsetByLinkId($link_id, (@$certified ?: false));
?>
<dl id="{!! $id !!}" data-id="{!! $id !!}" data-behavior-type="JOH.components.Links"{!! ViewHelper::attr('class', @$class['dl']) !!}{!! ViewHelper::attr('style', @$style['dl']) !!}>
@foreach ($link_items as $link_item)
<dd{!! ViewHelper::attr('class', @$class['dl/dd']) !!}{!! ViewHelper::attr('style', @$style['dl/dd']) !!}>@php
$attrs = [
    'data-link-item-type' => $link_item->link_item_type
];
if (isset($id)) { $attrs['id'] = $id; $attrs['data-id'] = $id; }
@endphp
@switch($link_item->link_item_type)
@case(0)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>@$class['dl/dd/span'], 'style'=>@$style['dl/dd/span'] ]), $link_item->name) !!}@break
@case(1)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>@$class['dl/dd/a'], 'style'=>@$style['dl/dd/a'], 'href'=>@$link_item->url ]), $link_item->name) !!}@break
@case(2)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>@$class['dl/dd/a'], 'style'=>@$style['dl/dd/a'], 'data-url'=>@$link_item->url, 'href'=>'#' ]), $link_item->name) !!}@break
@case(3)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>@$class['dl/dd/a'], 'style'=>@$style['dl/dd/a'], 'data-url'=>@$link_item->url, 'href'=>'#' ]), $link_item->name) !!}@break
@case(4)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>@$class['dl/dd/span'], 'style'=>@$style['dl/dd/span'] ]), $link_item->name) !!}@break
@endswitch
</dd>
@endforeach
</dl>
