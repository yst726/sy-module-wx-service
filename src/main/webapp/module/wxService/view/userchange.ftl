
<#include "module/header.ftl" > 

<#assign menu_active = "userchange" >  
<#include "module/menu.ftl" >


	<style>
		#table_list {margin-top: 50px;}
		.btn_submit {margin-left: 20px;}
	</style>

	<div class="panel panel-default">
		<div class="panel-heading">
			用户变化趋势
		</div>
		<div class="panel-body">
			
			<!-- 统计头信息 -->
			<div class="well well-lg">
			
				<form class="form-inline" role="form" id="search_form" >
					<input type="hidden" name="querytype" value="${querytype }" />
				  <div class="form-group">
				    <label class="sr-only" for="form_starttime">开始时间</label>
				    <input type="text" class="form-control" id="form_starttime" name="starttime" value="${starttime?string('yyyy-MM-dd HH:mm:ss') }"
						onclick="WdatePicker({maxDate:'#F{$dp.$D(\\\'form_endtime\\\')}', dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
				  </div>
				  <div class="form-group">
				    <label class="sr-only" for="form_endtime">结束时间</label>
				    <input type="text" class="form-control"  id="form_endtime" name="endtime" value="${endtime?string('yyyy-MM-dd HH:mm:ss') }"
						onclick="WdatePicker({minDate:'#F{$dp.$D(\\\'form_starttime\\\')}', dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
				  </div>
				  <div class="form-group"  >
				    <label class="sr-only" for="form_accuracy">精度（秒）</label>
				    <select name="accuracy" class="form-control" id="form_accuracy" value="${accuracy?c }" >
				    	<option value="600" >10分钟</option>
				    	<option value="1800" >0.5小时</option>
				    	<option value="3600" >1小时</option>
				    	<option value="21600" >6小时</option>
				    	<option value="43200" >12小时</option>
				    	<option value="86400" >1天</option>
				    	<option value="259200" >3天</option>
				    	<option value="604800" >7天</option>
				    	<option value="864000" >10天</option>
				    </select>
				    <script type="text/javascript" >
				    	$("#form_accuracy option").removeAttr("selected");
						$("#form_accuracy option[value='"+$("#form_accuracy").attr("value")+"']").attr("selected", "selected");
				    </script>
				  </div>
				  <button type="submit" class="btn btn-default btn_submit">刷新</button>
				</form>
				
			</div>	<!-- 统计头信息 -->
			
			<ul class="nav nav-tabs" id="querytype_nav_bar" action="${querytype }" >
			  <li class="active"><a href="#">新增关注人数</a></li>
			  <li><a href="#">取消关注人数</a></li>
			  <li><a href="#">净增关注人数</a></li>
			  <li><a href="#">累计关注人数</a></li>
			</ul>
			
			<div id="highcharts" style="min-width: 310px; height: 400px; margin: 0 auto" ></div>
			
			<!-- Table -->
			<table class="table" id="table_list" >
			    <tr>
			    	<td>时间段</td>
			    	<td>新关注人数</td>
			    	<td>取消关注人数</td>
			    	<td>净增关注人数</td>
			    	<td>累计关注人数</td>
			    </tr>
			</table>
		</div>
	</div>
    
	<script src="../resources/userchange.js" ></script>
    
    
    
<#include "module/footer.ftl" > 