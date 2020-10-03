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

Log::debug('--- @links(' . @$depth . ') [START] ---');
Log::debug('class => ' . var_export(@$class, true));

$link_items = LinkItem::rowsetByLinkId($link_id, (@$certified ?: false));
if (!isset($depth)) {
    $depth = 1;
}
?>
<dl id="{!! $id !!}" data-id="{!! $id !!}" data-behavior-type="JOH.components.Links"{!! ViewHelper::attr('class', (@$class[$depth . '/dl'] ?: @$class['dl'])) !!}{!! ViewHelper::attr('style', (@$style[$depth . '/dl'] ?: @$style['dl'])) !!}>
@foreach ($link_items as $link_item)
<dt{!! ViewHelper::attr('class', (@$class[$depth . '/dl/dt'] ?: @$class['dl/dt'])) !!}{!! ViewHelper::attr('style', (@$style[$depth . '/dl/dt'] ?: @$style['dl/dt'])) !!}>@php
$link_item_id = $id . '_' . str_replace('_', '', ucwords($link_item->link_item_id, '_'));
$attrs = [
    'data-link-item-type' => $link_item->link_item_type,
    'id' => $link_item_id,
    'data-id' => $link_item_id,
];
@endphp
@switch($link_item->link_item_type)
@case(0)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>(@$class[$depth . '/dl/dt/span'] ?: @$class['dl/dd/span']), 'style'=>(@$style[$depth . '/dl/dt/span'] ?: @$style['dl/dt/span']) ]), $link_item->name) !!}@break
@case(1)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>(@$class[$depth . '/dl/dt/a'] ?: @$class['dl/dt/a']), 'style'=>(@$style[$depth . '/dl/dt/a'] ?: @$style['dl/dt/a']), 'href'=>@$link_item->url ]), $link_item->name) !!}@break
@case(2)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>(@$class[$depth . '/dl/dt/a'] ?: @$class['dl/dt/a']), 'style'=>(@$style[$depth . '/dl/dt/a'] ?: @$style['dl/dt/a']), 'data-url'=>@$link_item->url, 'href'=>'#' ]), $link_item->name) !!}@break
@case(3)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>(@$class[$depth . '/dl/dt/a'] ?: @$class['dl/dt/a']), 'style'=>(@$style[$depth . '/dl/dt/a'] ?: @$style['dl/dt/a']), 'data-url'=>@$link_item->url, 'href'=>'#' ]), $link_item->name) !!}@break
@case(4)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'class'=>(@$class[$depth . '/dl/dt/span'] ?: @$class['dl/dt/span']), 'style'=>(@$style[$depth . '/dl/dt/span'] ?: @$style['dl/dt/span']) ]), $link_item->name) !!}@break
@endswitch
</dt>
<dd{!! ViewHelper::attr('class', (@$class[$depth . '/dl/dd'] ?: @$class['dl/dd'])) !!}{!! ViewHelper::attr('style', (@$style[$depth . '/dl/dd'] ?: @$style['dl/dd'])) !!}>
@if ($link_item->child_link_id)
@links([ 'id'=>$link_item_id . '_Child', 'link_id'=>$link_item->child_link_id, 'certified'=>(@certified ?: true), 'depth'=>$depth+1, 'class'=>@$class, 'style'=>@$style ])
@endlinks
@endif
</dd>
@endforeach
</dl>
