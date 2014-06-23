@extends('master')

@section('content')
	<style type="text/css">
      		body {
		       padding-bottom: 40px;
		    }

	      	.form-signin {
		        max-width: 370px;
		        padding: 19px 29px 29px;
		        margin: 0 auto 20px;
		        background-color: #fff;
		        border: 1px solid #e5e5e5;
		        -webkit-border-radius: 5px;
		           -moz-border-radius: 5px;
		                border-radius: 5px;
		        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
		           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
		                box-shadow: 0 1px 2px rgba(0,0,0,.05);
	      	}
	      
	      	.form-signin .form-signin-heading,
	      	.form-signin .checkbox {
	        	margin-bottom: 10px;
	      	}
		    
		    .form-signin input[type="text"],
		    .form-signin input[type="password"] {
		    	font-size: 16px;
		     	height: auto;
		     	width: 310px;
		     	margin-bottom: 15px;
		     	padding: 7px 9px;
      		}

    </style>
	{{Form::open(array('class'=>'form-signin', 'enctype' => 'multipart/form-data'))}}
		<h2 class="form-signin-heading">Avatar Upload</h2>
		{{Form::label('avatar', 'Avatar')}}
		{{Form::file('avatar')}}
		@if($errors->has('avatar'))
			<div class="alert alert-danger">{{$errors->first('avatar')}}</div>
		@endif
		{{ Form::submit('Upload', array('class' => 'btn btn-large btn-primary'))}}
	{{Form::close()}}
	
@stop