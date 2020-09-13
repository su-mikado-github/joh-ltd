<?php
use App\Models\LinkItem;
use App\Helpers\ViewHelper;
use App\Helpers\ProfileHelper;

/**
 * ■パラメータ
 * string id=null: 要素のID属性
 * string link_id='*': link_itemsのlink_idカラム。省略すると「'*'」が指定されたものとみなします。
 * string link_item_id: link_itemsのlink_item_idカラム
 * string class=null: 要素のclass属性
 * string style=null: 要素のstyle属性
 */

$profile = ProfileHelper::get();
$is_guest = ProfileHelper::is_guest($profile);

$link_item = LinkItem::rowByLinkIdLinkItemId(@$link_id?:'*', $link_item_id, !$is_guest);

if ($link_item) {
    $attrs = [
        'data-link-item-type' => $link_item->link_item_type
    ];
    if (isset($id)) { $attrs['id'] = $id; $attrs['data-id'] = $id; }
    if (isset($class)) { $attrs['class'] = $class; }
    if (isset($style)) { $attrs['style'] = $style; }
?>
@switch($link_item->link_item_type)
@case(0)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value ]), (empty(trim($slot)) ? $link_item->name : $slot)) !!}@break
@case(1)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'href'=>@$link_item->url ]), (empty(trim(@$slot)) ? $link_item->name : $slot)) !!}@break
@case(2)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'data-url'=>@$link_item->url, 'href'=>'#' ]), (empty(trim(@$slot)) ? $link_item->name : $slot)) !!}@break
@case(3)
  {!! ViewHelper::tag('a', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value, 'data-url'=>@$link_item->url, 'href'=>'#' ]), (empty(trim(@$slot)) ? $link_item->name : $slot)) !!}@break
@case(4)
  {!! ViewHelper::tag('span', array_merge($attrs, [ 'data-link-item-value'=>$link_item->link_item_value ]), (empty(trim($slot)) ? '&nbsp;' : $slot)) !!}@break
@default
@endswitch
<?php } ?>