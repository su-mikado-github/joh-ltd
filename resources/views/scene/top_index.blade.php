@extends('scene.layout.normal')

@section('makeup')
@endsection

@section('behavior')
<script type="text/javascript" charset="utf-8" src="/behavior/top"></script>
@endsection

@section('header')
	@header(['id'=>'pnlHeader'])
	@endheader
@endsection

@section('content')
<!-- Standard Headings -->
<h1>Heading</h1>
<h2>Heading</h2>
<h3>Heading</h3>
<h4>Heading</h4>
<h5>Heading</h5>
<h6>Heading</h6>

<!-- Base type size -->
<p>The base type is 15px over 1.6 line height (24px)</p>

<!-- Other styled text tags -->
<strong>Bolded</strong>
<em>Italicized</em>
<a>Colored</a>
<u>Underlined</u>
@endsection

@section('footer')
	@footer_a(['id'=>'pnlFooter'])
	@endfooter_a
@endsection
