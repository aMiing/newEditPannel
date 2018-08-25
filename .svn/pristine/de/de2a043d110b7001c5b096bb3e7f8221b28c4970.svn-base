<template>
	<div class="screenPannel" style="width:100%;height:100%;" :style="{backgroundColor:screenSet.bgcolor}"
	v-loading="loadTime"
    element-loading-text="Hard loading......"
    element-loading-spinner=""
    element-loading-background="rgba(0, 0, 0, 1)">

		<div id="pageBox"></div>  
		<!-- 增加一个大框，阻止鼠标的事件触发 -->
			
						<border-widget v-for="item in pageComponents" v-if="item.attribute=='borderWidget'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</border-widget>
						<scroll-cards v-for="item in pageComponents" v-if="item.attribute=='scrollCards'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</scroll-cards>
						<line-chart v-for="item in pageComponents" v-if="item.attribute=='lineChart'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</line-chart>
						<bar-chart v-for="item in pageComponents" v-if="item.attribute=='barChart'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</bar-chart>
						<horizontalbar-chart v-for="item in pageComponents" v-if="item.attribute=='horizontalBarChart'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</horizontalbar-chart>
						<pie-chart v-for="item in pageComponents" v-if="item.attribute=='pieChart'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</pie-chart>
						<ring-chart v-for="item in pageComponents" v-if="item.attribute=='ringChart'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</ring-chart>
						<point-chart v-for="item in pageComponents" v-if="item.attribute=='pointChart'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</point-chart>
						<map-chart v-for="item in pageComponents" v-if="item.attribute=='mapChart'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</map-chart>
						<dash-bord v-for="item in pageComponents" v-if="item.attribute=='dashbord'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</dash-bord>
						<series-dashbord v-for="item in pageComponents" v-if="item.attribute=='seriesDashbord'" 
							:item="item" 
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</series-dashbord>
						<radar-chart v-for="item in pageComponents" v-if="item.attribute=='radarChart'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</radar-chart>
						<common-title v-for="item in pageComponents" v-if="item.attribute=='commonTitle'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</common-title>
						<lines-text v-for="item in pageComponents" v-if="item.attribute=='linesText'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</lines-text>
						<common-time v-for="item in pageComponents" v-if="item.attribute=='time'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</common-time>
						<scroll-text v-for="item in pageComponents" v-if="item.attribute=='scrollText'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</scroll-text>
						<icon-font v-for="item in pageComponents" v-if="item.attribute=='iconFont'" 
							:item="item"
							@loadSetting="loadSetting"
							@changeSize="changeSize"
							@changePosition="changePosition"
							@deleate="deleate">
						</icon-font>
	</div>
</template>

<script>
	import commonTitle from './widgetsLib/CommonTitle';
	import linesText from './widgetsLib/linesText';
	import Time from './widgetsLib/Time';
	import scrollText from './widgetsLib/scrollText';
	import scrollCards from './widgetsLib/scrollCards';
	import lineChart from './widgetsLib/lineChart';
	import radarChart from './widgetsLib/radarChart';
	import barChart from './widgetsLib/barChart';
	import horizontalBarChart from './widgetsLib/horizontalBarChart';
	import pieChart from './widgetsLib/pieChart';
	import ringChart from './widgetsLib/ringChart';
	import pointChart from './widgetsLib/pointChart';
	import mapChart from './widgetsLib/mapChart';
	import dashbord from './widgetsLib/dashbord';
	import seriesDashbord from './widgetsLib/seriesDashbord';
	import borderWidget from './widgetsLib/border';
	import iconFont from './widgetsLib/iconFont';
	//console.log(commonTitle);
	export default {
		components:{
			'common-title':commonTitle,
			'lines-text':linesText,
			'common-time':Time,
			'scroll-text':scrollText,
			'scroll-cards':scrollCards,
			'line-chart':lineChart,
			'radar-chart':radarChart,
			'bar-chart':barChart,
			'horizontalbar-chart':horizontalBarChart,
			'pie-chart':pieChart,
			'ring-chart':ringChart,
			'point-chart':pointChart,
			'map-chart':mapChart,
			'dash-bord':dashbord,
			'series-dashbord':seriesDashbord,
			'border-widget':borderWidget,
			'icon-font':iconFont,
		},
		data() {
			return {
				loadTime:true,
				pageComponents:[],
				screenSet:''
			}	
		},
		beforeCreate:function(){
			
		},
		created:function(){
			this.loadTime = false;

		/*从服务器加载组件数据*/

	    	var url = (window.location.href).replace('8080/#','8888');
	    	console.log(url);  
	    	this.$http.get(url).then(function(res){
	    		res.bodyText = res.bodyText.split(';');
	    		let BindWidget = JSON.parse(res.bodyText[0]);
	    		let screensetting = JSON.parse(res.bodyText[1]);
	    		this.screenSet = screensetting[0];
	    		// console.log(this.screenSet);
	    		let _self = this;
	    		for (var i = 0; i < BindWidget.length; i++) {
	    			// console.log(BindWidget[i].styleJson);
		    		let json = JSON.parse(BindWidget[i].styleJson);
			    		json['id'] = BindWidget[i].id;
			    		json['uid'] = BindWidget[i].uid;
			    		json['dataJson'] = BindWidget[i].dataJson;
			    		json['layer'] = BindWidget[i].layer;
		    		_self.pageComponents.push(json);
	    		}
		    		// console.log(this.pageComponents);

	    	},function(res){
	    		console.log('请求超时！');
	    		return;
	    	});
		},
		mounted:function(){

		},
		methods:{
			changeStyle(id){
			},
			removeColor(index){
			},
			addColor(color){
			},
			pannelResize(){
			},
			checkBox(e){
				
			},
			checkedIt:function(e){
			},
			loadSetting(id){
			},
			changeSize(size){
			},
			changePosition(position){
			},
			deleate(theId){
			}

		}
	}
</script>
<style>
	#pageBox{
		width:100%;
		height:100%;
		z-index: 999;
		position: absolute;
	}
	a{
		text-decoration:none; 
	}
	a:link,a:visitrd,a:hover,a:active{
		color:;
	}
	.titleText{
		text-decoration: none;
		color:#FFF;
	}
	.leftComponentList{
		width:95%;
		overflow: hidden;
		padding:0 5% 0 0;
		border-bottom: 1px solid #ccc;
		cursor:pointer;
	}
</style>

<style scoped>
	-moz-user-select: none;/*支持Firefox浏览器*/
	-webkit-user-select: none;/*支持Chrome，Opera，Safari等浏览器*/
	-ms-user-select: none;/*支持IE浏览器*/
	user-select: none;
	 	
</style>