@extends('master')

@section('content')
	<style type="text/css">
      		body {
		        padding-bottom: 40px;
		    }

	      	.form-signin {
		        max-width: 350px;
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
		     	margin-bottom: 15px;
		     	padding: 7px 9px;
		     	width: 300px;
      		}
      		.checkbox {
	  			font-weight: normal;
			}

    </style>
	{{Form::open(array('class'=>'form-signin'))}}
		<h2 class="form-signin-heading">Password Recovery</h2>
		{{Form::text('email', null,  ['placeholder'=>'Email', 'class' => 'input-block-level'])}}
		@if($errors->has('email'))
			<div class="alert alert-danger">{{$errors->first('email')}}</div>
		@endif
		
		{{Form::submit('Recover', array('class' => 'btn btn-large btn-primary'))}}
	{{Form::close()}}
	
@stop