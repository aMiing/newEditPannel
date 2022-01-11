<template>
	<el-row class="container">
		<el-col :span="24" class="header">
			<el-col :span="3" class="backBtn">
				<el-link href="/">{{sysName}}</el-link>
			</el-col>
			<!-- 控件组 -->
			<div class="widgetGroup" style="position: absolute;left:200px;top:;z-index: 9;width:600px;text-align: center;color:#fff;">
				
				<el-col :span="24" class="components"style="line-height:18px;">
					<el-menu class="el-menu-demo" mode="horizontal" @select="" text-color="#fff" active-text-color="#6bf" default-active="1">
					  <el-submenu v-for="(tabItem,index) in tabItems" :key="index" :index="index" >
					    <template slot="title"><i :class="'iconfont '+tabItem.icon" :title="tabItem.name"></i></template>
						  	  <el-tabs tab-position="left" value="all" style="min-height: 240px;width: 640px;">
							    <el-tab-pane label="全部" title="全部" name="all">
								  	<div class="Charts">
								  		<div class="components-item" 
										  v-for="item in widgets" 
										  :key="item.heapId"
										  v-if="item.heapId==index&&item.usable==1" @click="UseIt(item)">
								  			<img :src="item.img" :alt="item.name" :title="item.name">
								  			<p style="line-height: 16px;width:100%;margin:0;">{{item.name}}</p>
								  		</div>
								  		<div class="components-item" 
										  v-for="item in widgets" 
										  :key="item.heapId"
										  v-if="item.heapId==index&&item.usable==0">
			      							<div class="dialog" style="width:120px;height:90px;position: absolute;background-color: rgba(25,25,25,0.7);color:#fff;text-align: center;vertical-align: middle;display: table;">
			      								<i class="iconfont icon-suo1" style="line-height: 90px;"></i>
								  			</div>
								  				<img :src="item.img" :alt="item.name" :title="item.name">
								  			<p style="line-height: 18px;width:100%;margin:0;">{{item.name}}</p>
								  		</div>
								  	</div>
							    </el-tab-pane>
							    <el-tab-pane :label="child" :title="child" v-for="(child,childIndex) in tabItem.childTab" :key="child.name">
								  	<div class="barChart">
								  		<div class="components-item"  v-for="(item) in widgets" v-if="item.widgetsGroupId==index+''+childIndex&&item.usable==1" @click="UseIt(item)">
								  				<img :src="item.img" :alt="item.name" :title="item.name">
								  			<p style="line-height: 18px;width:100%;margin:0;">{{item.name}}</p>
								  		</div>
								  		<div class="components-item"  v-for="(item) in widgets" v-if="item.widgetsGroupId==index+''+childIndex&&item.usable==0">
			      							<div class="dialog" style="width:120px;height:90px;position: absolute;background-color: rgba(25,25,25,0.7);color:#fff;text-align: center;vertical-align: middle;display: table;">
			      								<i class="iconfont icon-suo1" style="line-height: 90px;"></i>
								  			</div>
								  				<img :src="item.img" :alt="item.name" :title="item.name">
								  			<p style="line-height: 18px;width:100%;margin:0;">{{item.name}}</p>
								  		</div>
								  	</div>
							    </el-tab-pane>
							  </el-tabs>
					  </el-submenu>
					</el-menu>
					
				</el-col> 
			</div>
			


			<el-col :span="12" class="userinfo">
				<el-button id="saveBtn" type="text" @click="saveChange()" size="medium" title="保存"><i class="iconfont icon-baocun1"></i></el-button>
				<el-popover class="navbar-item"
				  placement="bottom-start"
				  size=""
				  width="200"
				  trigger="hover"
				  content="没有任何异常">
				  <el-button type="text" slot="reference" size="medium" title="异常"><i class="iconfont icon-warning navbar-item"></i></el-button>
				</el-popover>
				<el-dropdown trigger="hover" class="navbar-item">
					<div>
						<i ></i>
						<el-button type="text" size="medium" class="el-dropdown-link" title="帮助"><i class="iconfont icon-icon navbar-item"></i></el-button>
					</div>
					<el-dropdown-menu slot="dropdown">
						<el-dropdown-item>帮助文档</el-dropdown-item>
						<el-dropdown-item>提交工单</el-dropdown-item>
						<el-dropdown-item>社区论坛</el-dropdown-item>
					</el-dropdown-menu>
				</el-dropdown>
				<el-button type="text" size="medium" title="发布"><i class="iconfont icon-fabu navbar-item"></i></el-button>
				<el-button type="text" @click="previewIt()" size="medium" title="预览"><i class="iconfont icon-yulan navbar-item"></i></el-button>
			</el-col>
		</el-col>
		<el-col :span="24" class="main">
			<aside id="aside-left" :class="collapsed1?'menu-collapsed':'menu-expanded'" style="">
		        <div class="side-head" style="width:100%;text-align: center;">
		        	<h3 style="margin:10px 0;">
		        		<span>控件列表</span>
		        	</h3>
		        	<div style="background: none;height:22px;padding:5px 0;border-bottom:1px solid #bbb;">
		        		    <el-tooltip class="item" effect="dark" content="上移一层" placement="top-start">
						      <el-button type="text" size="small"><i class="iconfont icon-line-up"></i></el-button>
						    </el-tooltip>
		        		    <el-tooltip class="item" effect="dark" content="下移一层" placement="bottom">
						      <el-button type="text" size="small"><i class="iconfont icon-line-down"></i></el-button>
						    </el-tooltip>
		        		    <el-tooltip class="item" effect="dark" content="置顶" placement="top-start">
						      <el-button type="text" size="small"><i class="iconfont icon-zhiding"></i></el-button>
						    </el-tooltip>
		        		    <el-tooltip class="item" effect="dark" content="置底" placement="bottom-start">
						      <el-button type="text" size="small"><i class="iconfont icon-zhidi"></i></el-button>
						    </el-tooltip>
		        		
		        	</div>
		        </div>
		        <div class="z-axis-list">
		        	<div class="leftComponentList .drag" v-for="(pageComponent,index) in pageComponents" >
			        	<div class="z-axis-item" @click = "checkedIt">
			        		<input type="checkbox" name="" id="" @click="checkBox">
			        		<i :class=" 'iconfont icon-'+pageComponent.icon " @click="checkBox"></i>
			        		{{pageComponent.name}}{{index}}
			        	</div>
		        	</div>
		        	
		        </div>
		        
			</aside>
			<!-- 折叠按钮 -->
			<el-button  @click.prevent="collapse" style="position:fixed;z-index:9;left:0px;margin-top:6px;border-left: 0;text-align: center;padding:8px;background-color: #1b1f25;border:1px solid #444;">
				<i :class="collapseIcon" @click="changeIcon()" title="折叠/展开"></i>
			</el-button>

			<section class="content-container" ref="mainPannel" @click="screenSetting()">
				<!-- 操作面板 -->
				<div class="mainPannel" style="width:96%;height:auto;margin:2%;box-shadow: 0 0 2px red;" >
					<div ref="pannel" class="screenPannel" :style="{backgroundColor:ScreenBgColor,backgroundImage:screenBgImg}">
						
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
				</div>
			</section>
	<!-- 右侧设置面板	
		右侧折叠按钮 -->
			<el-button   @click.prevent="collapse2"  style="position:fixed;z-index:9;right:0px;margin-top:6px;border-right: 0;text-align: center;padding:8px;background-color: #1b1f25;border:1px solid #444;">
					<i :class="collapseIcon2" @click="changeIcon2()" title="折叠/展开"></i>
			</el-button>
			<aside id="aside-right" :class="collapsed2?'menu-collapsed2':'menu-expanded2'" style="background-color: #1b1f25;border-left:1px solid #dcdee3;width:400px;">
					        
			  <div class="pageSetting" style="display:block">
	        	<div class="style-pannel .pannal">
				  	<h3 style="padding:9px 0;margin:0;width:100%;text-align: center;border-bottom:1px solid #ccc;">
		        		<span>{{screenSet.title}}</span>
		        	</h3>
				  	<div class="contain" style="padding:5px 5px 0 20px;font-size: 12px;">
				  		<div class="screenSize contain-item" style="line-height: 35px;height:50px;">
				  			<span>屏幕大小</span>
				  			<div class="data-right" style="margin-left: 120px;">
				  				<div class="screenWidth input-num">
				  					<el-input-number  v-model="screenWidth" size="small" :min="975" :max="4000" disabled></el-input-number>
				  					<span>宽度</span>
				  				</div>
				  				
								
				  				<div class="screenWidth input-num">
									<el-input-number  v-model="screenHeight" size="small" :min="400" :max="2200" disabled></el-input-number>
									<span>高度</span>
								</div>
				  			</div>
				  		</div>
				  		<div class="backgroundImg contain-item" style="line-height: 40px;">
				  			<span>背景图片</span>
				  			<div class="data-right" style="margin-left: 60px;">
				  				<div class="imgContainer">
				  					<div alt="背景图片" style="background-size:100% 100%;width:90px;height:60px;box-shadow: 0 0 1px #6bf; margin:0 auto 10px;" :style="{backgroundImage:screenSet.bgimg}"></div>
				  					<p style="font-size: 0.8em;color:#888;margin:-10px;">点击或将文件拖拽到这里更换</p>
				  				</div>
				  			</div>
				  			<el-form  label-width="80px" size="mini" style="margin-left: 40px;">
					  			<el-form-item label="">
								    <el-input style="display: none;"></el-input>
								    <el-input placeholder="粘贴图片url于此处"></el-input>
								</el-form-item>
							</el-form>
				  			<div style="display: table;">
					  			<span style="display: table-cell;vertical-align: middle;">背景颜色</span>
					  			<span class="data-right" style="margin-left:70px;">
								  	<el-color-picker
									  v-model="ScreenBgColor"
									  show-alpha
									  :predefine="predefineColors">
									</el-color-picker>
								</span>
				  			</div>
				  		</div>
				  		<div class="zoomType contain-item" style="line-height: 40px;">
				  			<span>缩放方式</span>
				  			<div class="data-right" style="margin-left: 60px;">
				  				<ul style="margin: -20px auto 5px 20px;line-height: 34px;">
				  					<li>
				  						<el-radio type="radio" v-model="zoomType" label="1"><span>等比缩放宽度铺满</span></el-radio>
				  					</li>
				  					<li>
				  						<el-radio type="radio" v-model="zoomType" label="2"><span>等比缩放高度铺满</span></el-radio>
				  					</li>
				  					<li>
				  						<el-radio type="radio" v-model="zoomType" label="3"><span>全屏铺满</span></el-radio>
				  					</li>
				  				</ul>
				  			</div>
				  		</div>
				  		<div class="backgroundImg contain-item" style="line-height: 40px;">
				  			<div>
					  			<span>栅格间距</span>
					  			<span class="data-right" style="margin-left: 70px;">
					  				<el-input-number  v-model="Space" size="small" :precision="1" :step="0.5" :max="10">
									</el-input-number>
								</span>
				  			</div>
				  			<div>
					  			<span>封面样式</span>
					  			<span class="data-right" style="margin-left: 70px;">
					  				<el-button type="primary" plain>截取封面</el-button>
									<img src="@/assets/bg.png" alt="背景图片" width="180" height="120"  style="margin:5px 0 0 120px;">					  				
								</span>
				  			</div>
				  		</div>

				  		<div class="reNew contain-item" style="line-height: 40px;border:0;">
				  			<div style="margin-top:5px;">
					  			<span>重置</span>
					  			<span class="data-right" style="margin-left: 92px;">
					  				<el-button type="primary" plain>恢复默认背景</el-button>					  				
								</span>
				  			</div>
				  		</div>

				  	</div>
				</div>
	          </div>
		<!-- 组件属性设置面板 -->
			<div class="widgetSetting" style="display:none;background-color:#1b1f25;">
				<el-tabs type="border-card" style="height:100%;background-color: #1b1f25;">
				  <el-tab-pane label="样式" style="margin-top: -15px;">
				  	<div class="style-pannel .pannal" v-for="(pageComponent,index) in pageComponents" v-show="pageComponent.uid==showSetting" >
					  	<h3>
					  		<span style="padding:0">{{(pageComponent.name).slice(0,4)}}.v1.0.0</span>
					  	</h3>
				  		<div>
				  			<el-form  label-width="80px" size="mini">
					  			<el-form-item label="标题名称">
								    <el-input style="display: none;"></el-input>
								    <el-input v-model="pageComponent.name" @blur="changeStyle(pageComponent.uid)"></el-input>
								</el-form-item>
							</el-form>
			  			</div>
					  <!-- 尺寸和位置属性 -->
					    <div class="widgetSize contain-item" style="line-height: 35px;height:55px;padding-left: 15px">
				  			<span>图表尺寸(%)</span>
				  			<div class="data-right" style="margin-left: 90px;">
				  				<div class="widgetWidth input-num">
				  					<el-input-number ref='widgetWidth'  v-model="pageComponent.widgetWidth" size="small"  :min="1" :max="100" ></el-input-number>
				  					<span>宽度</span>
				  				</div>
				  				
				  				<div class="widgetHeight input-num">
									<el-input-number ref="widgetHeight" v-model="pageComponent.widgetHeight" size="small"  :min="1" :max="100" ></el-input-number>
									<span>高度</span>
								</div>
				  			</div>
			  			</div>
					    <div class="widgetPosition contain-item" style="line-height: 35px;height:55px;padding-left: 15px">
				  			<span>图表位置(%)</span>
				  			<div class="data-right" style="margin-left: 90px;">
				  				<div class="widgetLeft input-num">
				  					<el-input-number ref="widgetLeft" v-model="pageComponent.widgetLeft" size="small"  :min="-20" :max="100" ></el-input-number>
				  					<span>横坐标</span>
				  				</div>
				  				
				  				<div class="widgetTop input-num">
									<el-input-number ref="widgetTop" v-model="pageComponent.widgetTop"  size="small" :min="-20" :max="100" ></el-input-number>
									<span>纵坐标</span>
								</div>
				  			</div>
			  			</div>
						
						
					    <el-form ref="form" label-width="80px" size="mini" style="margin:15px 0 -15px">
						  <el-form-item label="文本内容" v-if="pageComponent.attribute == 'commonTitle'||pageComponent.attribute=='linesText' ">
							<el-input style="display: none;"></el-input>
						    <el-input type="textarea" :rows="1" v-model="pageComponent.text" @change="changeStyle(pageComponent.uid)"></el-input>
						  </el-form-item>
						</el-form>
					  	<el-collapse v-model="activeNames" style="border-left:0;" >
						  <el-collapse-item title="文本样式" name="1" v-if="pageComponent.fontSize">
						    <el-form>
							  <el-form-item label="字体">
							    <el-select v-model="pageComponent.fontValue" placeholder="请选择字体" @change="changeStyle(pageComponent.uid)">
							      <el-option v-for="item in fontOptions" :key="item.value" :label="item.label" :value="item.value">
							      	
							      </el-option>
							    </el-select>
							  </el-form-item>
							  <el-form-item label="字体粗细">
							  	  <div class="block">
								    <el-slider
								      v-model="pageComponent.fontWeight"
								      :step="5"  @change="changeStyle(pageComponent.uid)">
								    </el-slider>
								  </div>
							    <!-- <el-input type="number" v-model="pageComponent.fontWeight" :value="pageComponent.fontWeight" name="size">  -->  
							    </el-input>
							  </el-form-item>
							  <el-form-item label="字体颜色">
							  	<el-color-picker v-model="pageComponent.fontColor" size="small"  @change="changeStyle(pageComponent.uid)"></el-color-picker>
							  </el-form-item>
							  <el-form-item label="字体大小">
							  	  <div class="block">
								    <el-slider :min="1" v-model="pageComponent.fontSize"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							  <el-form-item label="对齐方式">
								 <el-radio-group v-model="pageComponent.textAlign" size="mini">
								      <el-radio-button label="left" >居左</el-radio-button>
								      <el-radio-button label="center" >居中</el-radio-button>
								      <el-radio-button label="right" >居右</el-radio-button>
							    </el-radio-group>
							  </el-form-item>
							  <el-form-item label="首行缩进" v-show="pageComponent.attribute == 'linesText' ">
							  	  <div class="block">
								    <el-slider :max="20" v-model="pageComponent.tabWidth"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							  <el-form-item label="行高" v-show="pageComponent.attribute == 'linesText' ">
							  	  <div class="block">
								    <el-slider :min="10" :max="60" v-model="pageComponent.lineHeight"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							</el-form>
							<!-- 标题通用属性设置 -->
						  </el-collapse-item>
						  <el-collapse-item title="超链接配置" name="2" v-show="pageComponent.attribute=='commonTitle'">
						    <el-form ref="form"  label-width="80px" size="mini">
							  <el-form-item label="超链接">
								<el-input style="display: none;"></el-input>
							    <el-input v-model="pageComponent.url" @change="changeStyle(pageComponent.uid)"></el-input>
							  </el-form-item>
							  
							  <el-form-item label="新开窗口">
  								<el-radio-group v-model="pageComponent.target" @change="changeStyle(pageComponent.uid)">
							        <el-radio label="_blank">新窗口</el-radio>
  									<el-radio label="_parent">此窗口</el-radio>
  								</el-radio-group>
							  </el-form-item>
							</el-form>
						  </el-collapse-item>
						  <el-collapse-item title="时间格式化" name="2" v-show="pageComponent.attribute=='time'">
						    <el-form ref="form"  label-width="80px" size="mini">
							  <el-form-item label="显示格式">
							    <el-select v-model="pageComponent.format" placeholder="请选择显示格式" @change="changeStyle(pageComponent.uid)">
							         <el-option
									      v-for="item in formatOptions"
									      :key="item.value"
									      :label="item.label"
									      :value="item.value">
								     </el-option>
							    </el-select>
							  </el-form-item>
							</el-form>
						  </el-collapse-item>
						  <!-- //滚动文本特有属性 -->
						  <el-collapse-item title="属性控制" name="2" v-show="pageComponent.attribute=='scrollText'">
						    <el-form ref="form"  label-width="80px" size="mini">
							  <el-form-item label="文本内容">
								<el-input style="display: none;"></el-input>
							    <el-input type="textarea" :rows="1" v-model="pageComponent.text" @change="changeStyle(pageComponent.uid)"></el-input>
							  </el-form-item>
							  <el-form-item label="滚动方向">
  								<el-radio-group v-model="pageComponent.direction" @change="changeStyle(pageComponent.uid)">
							        <el-radio label="left">向左</el-radio>
  									<el-radio label="right">向右</el-radio>
  								</el-radio-group>
							  </el-form-item>
							  <el-form-item label="滚动方式">
  								<el-radio-group v-model="pageComponent.behavior" @change="changeStyle(pageComponent.uid)">
							        <el-radio label="scroll">绕圈</el-radio>
  									<el-radio label="alternate">反弹</el-radio>
  								</el-radio-group>
							  </el-form-item>
							  <el-form-item label="滚动快慢">
							  	  <div class="block">
								    <el-slider v-model="pageComponent.scrollamount"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							  <el-form-item label="背景颜色">
							  	<el-color-picker show-alpha :predefine="predefineColors" v-model="pageComponent.bgcolor" size="small"  @change="changeStyle(pageComponent.uid)"></el-color-picker>
							  </el-form-item>
							</el-form>
						  </el-collapse-item>
						  <!-- //边框组件特有属性 -->
						  <el-collapse-item title="边框设置" name="1" v-show="pageComponent.attribute=='borderWidget'">
						    <el-form ref="form"  label-width="80px" size="mini">
							  <el-form-item label="边框粗细">
							  	  <div class="block">
								    <el-slider v-model="pageComponent.borderWidth"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							  <el-form-item label="边框颜色">
							  	<el-color-picker v-model="pageComponent.borderColor" size="small"  @change="changeStyle(pageComponent.uid)"></el-color-picker>
							  </el-form-item>
							  <el-form-item label="边框类型">
  								<el-radio-group v-model="pageComponent.behavior" @change="changeStyle(pageComponent.uid)">
							        <el-radio label="solid">实线</el-radio>
  									<el-radio label="dashed">蚂蚁线</el-radio>
  								</el-radio-group>
							  </el-form-item>
							  <el-form-item label="圆角大小">
							  	  <div class="block">
								    <el-slider :max="pageComponent.widgetWidth/2" v-model="pageComponent.borderRadius"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							</el-form>
						  </el-collapse-item>

						  <el-collapse-item title="发光阴影" name="1" v-show="pageComponent.attribute=='borderWidget'">
						    <el-form ref="form"  label-width="80px" size="mini">
							  <el-form-item label="发光范围">
							  	  <div class="block">
								    <el-slider :max="20" v-model="pageComponent.shadowWidth"  @change="changeStyle(pageComponent.uid)"></el-slider>
								  </div>
							  </el-form-item>
							  <el-form-item label="发光颜色">
							  	<el-color-picker v-model="pageComponent.shadowColor" size="small"  @change="changeStyle(pageComponent.uid)"></el-color-picker>
							  </el-form-item>
						      <div class="widgetSize contain-item" style="line-height: 35px;height:55px;padding-left: 15px">
					  			<span>阴影偏移</span>
					  			<div class="data-right" style="margin-left: 90px;">
					  				<div class="widgetWidth input-num">
					  					<el-input-number ref='widgetWidth'  v-model="pageComponent.shadowX" size="small"  :min="-10" :max="10" ></el-input-number>
					  					<span>左右偏移</span>
					  				</div>
					  				
					  				<div class="widgetHeight input-num">
										<el-input-number ref="widgetHeight" v-model="pageComponent.shadowY" size="small"  :min="-10" :max="10" ></el-input-number>
										<span>上下偏移</span>
									</div>
					  			</div>
				  			  </div>
							  <el-form-item label="背景颜色">
							  	<el-color-picker 
							  	show-alpha 
							  	:predefine="predefineColors" 
							  	v-model="pageComponent.bgcolor"></el-color-picker>
							  </el-form-item>
							</el-form>
						  </el-collapse-item>
						  <!-- 轮播卡片专属属性 -->
						  <el-collapse-item title="属性控制" name="2" v-show="pageComponent.attribute=='scrollCards'">
						    <el-form ref="form"  label-width="80px" size="mini">
								
								<!-- 属性控制下面的二级折叠菜单 -->
								<el-collapse>
								  <el-collapse-item title="展示图片" name="1" >
									  <el-form-item label="图片一">
										  	<el-input placeholder="黏贴第一张图片url" v-model="pageComponent.cardsImg1"></el-input>
									  </el-form-item>
									  <el-form-item label="图片一">
										  	<el-input placeholder="黏贴第一张图片url" v-model="pageComponent.cardsImg2"></el-input>
									  </el-form-item>
									  <el-form-item label="图片一">
										  	<el-input placeholder="黏贴第一张图片url" v-model="pageComponent.cardsImg3"></el-input>
									  </el-form-item>
									</el-collapse-item>
								</el-collapse>
								

							  <el-form-item label="展示方式">
    								<el-radio-group v-model="pageComponent.Type" @change="changeStyle(pageComponent.uid)">
    									<el-radio label="card">卡片式</el-radio>
    									<el-radio label=" ">平铺式</el-radio>
    								</el-radio-group>
							  </el-form-item>
							  <el-form-item label="滚动快慢">
							  	  <div class="block">
  								    <el-slider  @change="changeStyle(pageComponent.uid)" disabled></el-slider>
  								  </div>
							  </el-form-item>

							</el-form>
						  </el-collapse-item>
						  <!-- 常规图表专属属性 -->
						  <el-collapse-item title="属性控制" name="2" v-show="pageComponent.attribute=='lineChart'||pageComponent.attribute=='pieChart'||pageComponent.attribute=='barChart'||pageComponent.attribute=='horizontalBarChart'||pageComponent.attribute=='pointChart'||pageComponent.attribute=='dashbord' ||pageComponent.attribute=='seriesDashbord' ||pageComponent.attribute=='mapChart'||pageComponent.attribute=='radarChart'||pageComponent.attribute=='ringChart'">
						    <el-form>

							  <el-form-item label="主题颜色">
								 <el-radio-group v-model="pageComponent.colorType" size="mini">
								      <el-radio label="1" border>深色</el-radio>
								      <el-radio label="2" border>浅色</el-radio>
							    </el-radio-group>
							  </el-form-item>
							  <el-form-item label="背景颜色">
							  	<el-color-picker
								  v-model="pageComponent.bgColor"
								  show-alpha
								  :predefine="predefineColors">
								</el-color-picker>
							  </el-form-item>

								<!-- 属性控制下面的二级折叠菜单 -->
								<el-collapse>
								  <el-collapse-item title="图例设置" name="1" v-if="pageComponent.attribute != 'dashbord'&&pageComponent.attribute != 'seriesDashbord' ">
									  <el-form-item label="图例">
										  	<el-switch
											  v-model="pageComponent.legend"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="排布方式">
										 <el-radio-group v-model="pageComponent.orient" size="mini">
										      <el-radio-button label="horizontal" >横向</el-radio-button>
										      <el-radio-button label="vertical" >纵向</el-radio-button>
									    </el-radio-group>
									  </el-form-item>
									  <el-form-item label="图例位置">
										 <el-radio-group v-model="pageComponent.x" size="mini">
										      <el-radio-button label="left" >左</el-radio-button>
										      <el-radio-button label="center" >中</el-radio-button>
										      <el-radio-button label="right" >右</el-radio-button>
									    </el-radio-group>
									  </el-form-item>
									  <el-form-item label="对齐方式">
										 <el-radio-group v-model="pageComponent.align" size="mini">
										      <el-radio-button label="left" >左对齐</el-radio-button>
										      <el-radio-button label="right" >右对齐</el-radio-button>
									    </el-radio-group>
									  </el-form-item>
								  </el-collapse-item>
								  <!-- 折线图设置 -->
								  <el-collapse-item title="图形设置" name="2" v-show="pageComponent.attribute=='lineChart'">
									  <el-form-item label="堆叠面积图">
										  	<el-switch
											  v-model="pageComponent.area"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="显示数据">
										  	<el-switch
											  v-model="pageComponent.seriesShow"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="数据位置">
										 <el-radio-group v-model="pageComponent.seriesPosition" size="mini">
										      <el-radio label="top" >顶部</el-radio>
										      <el-radio label="inside" >内部</el-radio>
										      <el-radio label="bottom" >底部</el-radio>
									    </el-radio-group>
									  </el-form-item>
								  </el-collapse-item>
								  <!-- 饼图样式 -->
								  <el-collapse-item title="图形设置" name="2" v-if="pageComponent.attribute=='pieChart'||pageComponent.attribute=='ringChart'">
									  <el-form-item label="图形样式">
										 <el-radio-group v-model="pageComponent.roseType" size="mini">
										      <el-radio label="" >常规</el-radio>
										      <el-radio label="angle" >玫瑰图</el-radio>
									    </el-radio-group>
									  </el-form-item>
									  <el-form-item label="多圆饼图" v-if="pageComponent.attribute == 'pieChart' ">
										  	<el-switch
											  v-model="pageComponent.level"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="显示数据">
										  	<el-switch
											  v-model="pageComponent.seriesShow"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="数据位置">
										 <el-radio-group v-model="pageComponent.seriesPosition" size="mini">
										      <el-radio label="top" >顶部</el-radio>
										      <el-radio label="inside" >内部</el-radio>
										      <el-radio label="bottom" >底部</el-radio>
									    </el-radio-group>
									  </el-form-item>
									    <el-form-item label="环形粗细">
										    <el-slider :min="8" :max="30" v-model="pageComponent.thin"  @change="changeStyle(pageComponent.uid)" ></el-slider>
									    </el-form-item>
								  </el-collapse-item>
								  <!-- 柱状图属性 -->
								  <el-collapse-item title="图形设置" name="2" v-show="pageComponent.attribute=='barChart'">
									  <el-form-item label="走势曲线">
										 <el-radio-group v-model="pageComponent.showLine" size="mini">
										      <el-radio-button label="1" >1</el-radio-button>
										      <el-radio-button label="2" >2</el-radio-button>
										      <el-radio-button label="3" >3</el-radio-button>
									    </el-radio-group>
									</el-form-item>
									  <el-form-item label="显示数据">
										  	<el-switch
											  v-model="pageComponent.seriesShow"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="数据位置">
										 <el-radio-group v-model="pageComponent.seriesPosition" size="mini">
										      <el-radio label="top" >顶部</el-radio>
										      <el-radio label="inside" >内部</el-radio>
										      <el-radio label="bottom" >底部</el-radio>
									    </el-radio-group>
									  </el-form-item>

								  </el-collapse-item>
								  <!-- 散点图属性 -->
								  <el-collapse-item title="图形设置" name="2" v-show="pageComponent.attribute=='pointChart'">
									  <el-form-item label="显示数据">
										  	<el-switch
											  v-model="pageComponent.seriesShow"
											  active-color="#13ce66"
											  inactive-color="#ff4949">
											</el-switch>
									  </el-form-item>
									  <el-form-item label="数据位置">
										 <el-radio-group v-model="pageComponent.seriesPosition" size="mini">
										      <el-radio label="top" >顶部</el-radio>
										      <el-radio label="inside" >内部</el-radio>
										      <el-radio label="bottom" >底部</el-radio>
									    </el-radio-group>
									  </el-form-item>
								  </el-collapse-item>
								  <!-- 仪表盘设置 -->
								  <el-collapse-item title="图形设置" name="1" v-show="pageComponent.attribute=='dashbord'||pageComponent.attribute=='seriesDashbord'">
							  		  	<el-form   size="">
								  			<el-form-item label="数据单位">
											    <el-input style="display: none;"></el-input>
											    <el-input v-model="pageComponent.dataName" @blur="changeStyle(pageComponent.uid)"></el-input>
											</el-form-item>
									  	</el-form>
									  	<el-form-item label="显示数据">
										  	<div>
										  	  <el-input placeholder="请输入内容" v-model="pageComponent.minData">
											    <template slot="prepend">最小值</template>
											  </el-input>
										  	  <el-input placeholder="请输入内容" v-model="pageComponent.maxData">
											    <template slot="prepend">最大值</template>
											  </el-input>
											</div>
									  	</el-form-item>
									    <el-form-item label="边框粗细">
										    <el-slider v-model="pageComponent.axisLineWidth"  @change="changeStyle(pageComponent.uid)" ></el-slider>
									    </el-form-item>
									  	<el-form-item label="表盘格数">
										 	<el-input-number v-model="pageComponent.splitNum" controls-position="right" :min="3" :max="30"></el-input-number>
									  	</el-form-item>
								  </el-collapse-item>
								</el-collapse>



							</el-form>
						  </el-collapse-item>


						</el-collapse>
					</div>
					</el-tab-pane>
				  <el-tab-pane label="数据">
				  	<div class="style-pannel .pannal dataPannal" v-for="pageComponent in pageComponents" v-show="pageComponent.uid==showSetting" >
					  	<h3>
					  		<span style="padding:0">{{(pageComponent.name).slice(0,4)}}.v1.0.0</span>
					  	</h3>

					  	<el-input type="textarea" :rows="10" placeholder="请输入内容" >
						</el-input>

					</div>
				  </el-tab-pane>
				  <el-tab-pane label="交互">
				  	<div class="interactive-pannel .pannal">
					  	<h3>
					  		<span style="padding:0">通用标题</span>
					  	</h3>
					</div>
				  </el-tab-pane>
				</el-tabs>
	        </div>	      
					        
			</aside>		
		</el-col>
	
			
	</el-row>
</template>

<script>
var i,
  h = 0;
var lastId;
var percentWidth;
var percentHeight;
import commonTitle from "@/components/widgets/CommonTitle";
import linesText from "@/components/widgets/linesText";
import Time from "@/components/widgets/Time";
import scrollText from "@/components/widgets/scrollText";
import scrollCards from "@/components/widgets/scrollCards";
import lineChart from "@/components/widgets/lineChart";
import radarChart from "@/components/widgets/radarChart";
import barChart from "@/components/widgets/barChart";
import horizontalBarChart from "@/components/widgets/horizontalBarChart";
import pieChart from "@/components/widgets/pieChart";
import ringChart from "@/components/widgets/ringChart";
import pointChart from "@/components/widgets/pointChart";
import mapChart from "@/components/widgets/mapChart";
import dashbord from "@/components/widgets/dashbord";
import seriesDashbord from "@/components/widgets/seriesDashbord";
import borderWidget from "@/components/widgets/border";
import iconFont from "@/components/widgets/iconFont";
//console.log(commonTitle);
export default {
  components: {
    "common-title": commonTitle,
    "lines-text": linesText,
    "common-time": Time,
    "scroll-text": scrollText,
    "scroll-cards": scrollCards,
    "line-chart": lineChart,
    "radar-chart": radarChart,
    "bar-chart": barChart,
    "horizontalbar-chart": horizontalBarChart,
    "pie-chart": pieChart,
    "ring-chart": ringChart,
    "point-chart": pointChart,
    "map-chart": mapChart,
    "dash-bord": dashbord,
    "series-dashbord": seriesDashbord,
    "border-widget": borderWidget,
    "icon-font": iconFont,
  },
  data() {
    return {
      ScreenBgColor: "rgb(36,43,41)",
      screenBgImg: "",
      value0: true,
      fullscreenLoading: true,
      disabled: false,
      sysName: "VMS面板",
      showSetting: "uid_1",
      pageComponents: [],
      screenSet: "",
      widgets: "",
      tabItems: [],
      collapsed1: false,
      collapsed2: false,
      sysUserName: "",
      sysUserAvatar: "",
      collapseIcon: "el-icon-d-arrow-left",
      collapseIcon2: "el-icon-d-arrow-right",
      activeNames: "",
      screenWidth: 1,
      screenHeight: 1,
      Space: 5,
      zoomType: "2",
      tabPosition: "left",
      predefineColors: [
        "#ff4500",
        "#ff8c00",
        "#ffd700",
        "#90ee90",
        "#00ced1",
        "#1e90ff",
        "#c71585",
        "rgba(255, 69, 0, 0.68)",
        "rgb(255, 120, 0)",
        "hsv(51, 100, 98)",
        "hsva(120, 40, 94, 0.5)",
        "hsl(181, 100%, 37%)",
        "hsla(209, 100%, 56%, 0.73)",
        "#c7158577",
      ],
      formatOptions: [
        {
          value: "yyyy/MM/dd hh:mm:ss",
          label: "年/月/日 时:分:秒",
        },
        {
          value: "yyyy/MM/dd hh:mm",
          label: "年/月/日 时:分",
        },
        {
          value: "yyyy/MM/dd",
          label: "年/月/日",
        },
        {
          value: "yyyy-MM-dd hh:mm:ss",
          label: "年-月-日 时:分:秒",
        },
        {
          value: "yyyy-MM-dd hh:mm",
          label: "年-月-日 时:分",
        },
        {
          value: "yyyy-MM-dd",
          label: "年-月-日",
        },
        {
          value: "yyyy.MM.dd hh:mm:ss",
          label: "年.月.日 时:分:秒",
        },
        {
          value: "yyyy.MM.dd hh:mm",
          label: "年.月.日 时:分",
        },
        {
          value: "yyyy.MM.dd",
          label: "年.月.日",
        },
      ],
      positionOptions: [
        {
          value: "center",
          label: "居中",
        },
        {
          value: "left",
          label: "居左",
        },
        {
          value: "right",
          label: "居右",
        },
      ],
      fontOptions: [
        {
          value: "宋体",
          label: "宋体",
        },
        {
          value: "楷体",
          label: "楷体",
        },
        {
          value: "罗马",
          label: "罗马",
        },
        {
          value: "新宋",
          label: "新宋",
        },
        {
          value: "等线",
          label: "等线",
        },
      ],
    };
  },
  beforeCreate: function () {
    this.fullscreenLoading = true;
  },
  created: function () {
    // 获取tabItems、pageComponents数据
    this.tabItems = [];
    this.pageComponents = [];
  },
  mounted: function () {
    /*初始化屏幕尺寸*/
    let screenPannel = document.getElementsByClassName("screenPannel")[0];
    screenPannel.style.height = screenPannel.clientWidth * 0.6 + "px";
    console.log(this.screenSet);
    /*当窗口大小改变时改变屏幕尺寸*/
    window.onresize = function () {
      screenPannel.style.height = screenPannel.clientWidth * 0.6 + "px";
    };

    //console.log(screenPannel.clientHeight);
    var user = sessionStorage.getItem("user");
    if (user) {
      user = JSON.parse(user);
      this.sysUserName = user.name || "";
      this.sysUserAvatar = user.avatar || "";
    }
    // this.$nextTick(function(){
    // 	alert('渲染完成');
    // })
    //

    window.onbeforeunload = () => {
      /*这里对data里的数据全部进行更新，所有需要保存的操作都调用该函数*/
      this.$notify({
        title: "保存",
        message: "正在为您保存页面更改",
        type: "success",
        offset: 90,
      });

      //计划执行保存操作
    };
  },
  beforeUpdate: function () {
    let screenPannel = document.getElementsByClassName("screenPannel")[0];
    screenPannel.style.height = screenPannel.clientWidth * 0.6 + "px";
    // this.screenBgImg = this.screenSet.bgimg;
  },
  updated: function () {
    // console.log('updata');
  },
  activabled: function () {},
  methods: {
    saveChange() {
      /*	let url_saveScreen = 'http://localhost:8888/saveScreenSetting';
					this.screenSet.bgcolor = this.ScreenBgColor;
					this.screenSet.bgimg = this.screenBgImg;
					let settingData = JSON.stringify(this.screenSet);
					console.log(settingData);
					this.$http.post(url_saveScreen,{"str":settingData},{emulateJSON:true}).then((req,res) => {
	    				console.log(res.bodyText);
			    	}).catch((err) =>{
			    		console.log('确实修改数据库成功了，但是这了还是报了个错');
			    		return;
			    	});*/
      /*这里对pageComponents里的数据全部进行更新，所有需要保存的操作都调用该函数*/
      let self = this;
      if (this.pageComponents != "") {
        let url = "http://localhost:8888/saveChange";
        var newJson = self.pageComponents;
        /*因为如果把dataJson保存在styleJson中，从数据库里拿出来的styleJson则会不能直接被解析成json对象，
						所以这里对dataJson剔除，单独保存*/
        for (var i = 0; i < newJson.length; i++) {
          delete newJson[i].dataJson;
          // console.log(newJson[i]);
        }
        var newJsonStr = JSON.stringify(newJson);
        console.log(newJsonStr);
        self.$http
          .post(url, { str: newJsonStr }, { emulateJSON: true })
          .then((req, res) => {
            console.log(res.bodyText);
          })
          .catch((err) => {
            console.log("确实修改数据库成功了，但是这了还是报了个错");
            return;
          });
      } else {
        console.log("页面未添加组件");
      }
    },
    changeStyle(id) {
      console.log(id);
      /*计划执行保存操作*/
    },
    removeColor(index) {
      // pageComponent.dataJson.unshift('');
    },
    addColor(color) {
      console.log(color);
    },
    pannelResize() {
      console.log(this.$refs.pannel.clientWidth);
    },
    checkBox(e) {
      e.stopPropagation(); //阻止事件冒泡
      let theList = e.path[1];
      let allList = document.getElementsByClassName("z-axis-item");
      theList.style.background = "rgba(0,192,222,.2)";
      //console.log(theList);
      let j = 0;
      while (theList != allList[j]) {
        j++;
      }
      // (uid.slice(0,-1) == j)
      /*获取*/
      var allDrags = document.getElementsByClassName("drag");
      var oDrag;
      for (let i = 0; i < allDrags.length; i++) {
        if (allDrags[i].attributes[3].nodeValue.slice(4) == j) {
          oDrag = allDrags[i]; //获取操作目标对象
        }
      }
      var theBtns = oDrag.getElementsByClassName("btn");
      if (e.path[0].checked == true) {
        /*获取当前的 .btn 并且设置为显示状态*/
        for (let i = 0; i < theBtns.length; i++) {
          theBtns[i].style.visibility = "visible";
          oDrag.style.border = "0.1px solid #6bf";
        }
      } else {
        for (let i = 0; i < theBtns.length; i++) {
          theBtns[i].style.visibility = "hidden";
          oDrag.style.border = 0;
        }
      }
    },
    checkedIt: function (e) {
      //实现了点击列表的正常切换，要实现点击带动主面板控件的切换
      let allList = document.getElementsByClassName("z-axis-item");
      let theList = e.target;
      for (let i = 0; i < allList.length; i++) {
        allList[i].style.background = "#1b1f25";
        allList[i].getElementsByTagName("input")[0].checked = false;
      }
      theList.style.background = "rgba(50,180,255,.8)";
      theList.getElementsByTagName("input")[0].checked = true;
      var j = 0;
      while (theList != allList[j]) {
        j++;
      }
      var allDrags = document.getElementsByClassName("drag");
      var oDrag = allDrags[j];
      // console.log(oDrag);
      //去除其他元素的边框
      for (let m = 0; m < allDrags.length; m++) {
        allDrags[m].style.border = "0";
        //console.log(allDrags[m].style);
      }
      /*获取所有的 .btn 并且设置为隐藏状态*/
      var allBtns = document.getElementsByClassName("btn");
      for (let q = 0; q < allBtns.length; q++) {
        //console.log('iii');
        allBtns[q].style.visibility = "hidden";
      }
      //console.log('ccc');
      /*获取当前的 .btn 并且设置为显示状态*/
      var theBtns = oDrag.getElementsByClassName("btn");
      for (let q = 0; q < theBtns.length; q++) {
        theBtns[q].style.visibility = "visible";
        oDrag.style.border = "0.1px solid #6bf";
      }
      //切换属性设置面板
      let pageSetting = document.getElementsByClassName("pageSetting")[0];
      //console.log(this.$parent.$el.childNodes[0].childNodes[2].getElementsByClassName('leftComponentList')[i]);
      let widgetSetting = document.getElementsByClassName("widgetSetting")[0];
      //console.log(widgetSetting);
      pageSetting.style.display = "none";
      widgetSetting.style.display = "block";
      this.showSetting = this.pageComponents[j].uid;
      // console.log(e.path['div.z-axis-item']);
    },
    loadSetting(id) {
      // console.log(this.pageComponents);
      this.showSetting = "uid_" + id;
      /*设置左侧图层列表，点击激活
				思路：先获取所有图层，取消激活状态，再给点击的图层增加激活态*/
      let allList = document.getElementsByClassName("z-axis-item");
      let theList;
      for (let i = 0; i < allList.length; i++) {
        allList[i].style.background = "#1b1f25";
        allList[i].getElementsByTagName("input")[0].checked = false;
      }

      let self = this;
      for (let h = 0; h < self.pageComponents.length; h++) {
        if (self.pageComponents[h].uid == "uid_" + id) {
          theList = allList[h];
        }
      }
      theList.style.background = "rgba(50,180,255,.8)";
      theList.getElementsByTagName("input")[0].checked = true;
      //console.log(theList.getElementsByTagName('input'));
    },
    changeSize(size) {
      // console.log(this.pageComponents);
      let self = this;
      for (let i = 0; i < self.pageComponents.length; i++) {
        if (self.pageComponents[i].uid == size.uid) {
          self.pageComponents[i].widgetWidth = Math.round(size.width * 10) / 10;
          self.pageComponents[i].widgetHeight =
            Math.round(size.height * 10) / 10;
          return;
        }
      }
      //console.log(size.width);
      //console.log(this.pageComponents[size.theId].widgetWidth);
    },
    changePosition(position) {
      // console.log(this.pageComponents);
      let self = this;
      for (let i = 0; i < self.pageComponents.length; i++) {
        if (self.pageComponents[i].uid == position.uid) {
          self.pageComponents[i].widgetLeft =
            Math.round(position.left * 10) / 10;
          self.pageComponents[i].widgetTop = Math.round(position.top * 10) / 10;
          return;
        }
      }
      //console.log(this.pageComponents[position.theId].widgetLeft)
    },
    deleate(theId) {
      //从数据列表中彻底删除该控件的配置数据，不可恢复
      console.log("将删除第：" + theId);

      let url = "http://localhost:8888/deleteBindWidgets";
      this.$http
        .post(url, { id: theId }, { emulateJSON: true })
        .then((req, res) => {
          console.log(res.bodyText);
        })
        .catch((err) => {
          console.log(
            "未能成功发送新增widget数据，请联系系统维护人员或稍后重试！"
          );
          return;
        });
      //遍历数组，删除选定元素
      let self = this;
      for (let i = 0; i < self.pageComponents.length; i++) {
        if (self.pageComponents[i].id == theId) {
          console.log(i);
          self.pageComponents.splice(i, 1);
          return;
        }
      }
    },
    previewIt() {
      /*var titleText = document.getElementsByClassName('titleText')[i];
				//给标题文本设置超链接
				titleText.append(this.form.name);
				if((this.form.url)!=''){
					titleText.href = this.form.url;
					titleText.target = this.form.target;
				}*/
      // alert("预览？");
      /*点击预览之前应该先执行保存操作，完成之后再跳转进行预览*/
      var content = document.getElementsByClassName("screenPannel")[0]
        .innerHTML;
      console.log(content);
      let pageId = window.location.href.split("=")[1];
      //1、上传数据到服务器思路
      let url = "http://localhost:8888/previewScreen";
      this.$http
        .post(url, { id: pageId, content: content }, { emulateJSON: true })
        .then((req, res) => {
          console.log(res.bodyText);
        })
        .catch((err) => {
          console.log(
            "未能成功发送预览界面数据，请联系系统维护人员或稍后重试！"
          );
          return;
        });
      //跳转预览界面
      window.open("http://localhost:8080/#/previewScreen?id=" + pageId);
    },
    screenSetting() {
      //框定除了编辑面板之外的部分
      this.$refs.pannel.onclick = function (e) {
        e.stopPropagation();
      };
      var pageSetting = document.getElementsByClassName("pageSetting")[0];
      var widgetSetting = document.getElementsByClassName("widgetSetting")[0];
      //去除元素选中状态
      var allDrags = document.getElementsByClassName("drag");
      //去除其他元素的边框
      for (let m = 0; m < allDrags.length; m++) {
        allDrags[m].style.border = "0";
        //console.log(allDrags[m].style);
      }
      /*获取所有的 .btn 并且设置为隐藏状态*/
      var allBtns = document.getElementsByClassName("btn");
      for (let q = 0; q < allBtns.length; q++) {
        //console.log('iii');
        allBtns[q].style.visibility = "hidden";
      }
      //更换属性配置面板
      pageSetting.style.display = "block";
      widgetSetting.style.display = "none";
      //console.log();
    },
    UseIt(item, index) {
      i =
        this.pageComponents.length != 0
          ? parseInt(
              this.pageComponents[this.pageComponents.length - 1].uid.slice(4)
            ) + 1
          : this.pageComponents.length;
      console.log("i:" + i);
      //i++;//重要参数
      //插入控件，保存到数据库，并从数据库中检索出返回给data，重新渲染界面
      //uid可以是从数据库里取出的pageControlId.
      this.showSetting = "uid_" + i;
      console.log(item);
      var widgetJson = JSON.parse(item.styleJson);
      console.log(widgetJson);
      let bindId = window.location.href.split("=")[1];
      //ajax发送到数据库的数据
      let url = "http://localhost:8888/addBindWidgets";
      this.$http
        .post(
          url,
          {
            uid: "uid_" + i,
            name: item.name,
            bindId: bindId,
            styleJson: item.styleJson,
            dataJson: item.dataJson,
            layer: i,
          },
          { emulateJSON: true }
        )
        .then((req, res) => {
          console.log(res.bodyText);
        })
        .catch((err) => {
          console.log(
            "未能成功发送新增widget数据，请联系系统维护人员或稍后重试！"
          );
          return;
        });

      //直接加到data里的数据是不可信的，我们需要重新从服务器加载数据回来
      let reload_url = window.location.href.replace("8080/#", "8888");
      // console.log(url);
      this.$http.get(reload_url).then(
        function (res) {
          let res_arr = res.bodyText.split(";"); //两部分数据混在一起，进行拆分
          console.log(res_arr);
          let BindWidget = JSON.parse(res_arr[1]);
          console.log(BindWidget);
          let _self = this;
          this.pageComponents = [];
          for (var i = 0; i < BindWidget.length; i++) {
            console.log(BindWidget[i].styleJson);
            let json = JSON.parse(BindWidget[i].styleJson);
            json["id"] = BindWidget[i].id;
            json["uid"] = BindWidget[i].uid;
            json["dataJson"] = BindWidget[i].dataJson;
            json["layer"] = BindWidget[i].layer;
            _self.pageComponents.push(json);
          }
          console.log(this.pageComponents);
        },
        function (res) {
          console.log("请求超时！");
          return;
        }
      );
    },
    changeIcon() {
      console.log(this.collapsed1);
      if (this.collapsed1) {
        this.collapseIcon = "el-icon-d-arrow-left";
      } else {
        this.collapseIcon = "el-icon-d-arrow-right";
      }
    },
    changeIcon2() {
      console.log(this.collapsed2);

      if (this.collapsed2) {
        //console.log(this.isCollapse);
        this.collapseIcon2 = "el-icon-d-arrow-right";
      } else {
        this.collapseIcon2 = "el-icon-d-arrow-left";
      }
    },
    onSubmit() {
      console.log("submit!");
    },
    handleopen() {
      //console.log('handleopen');
    },
    handleclose() {
      //console.log('handleclose');
    },
    handleselect: function (a, b) {},
    //退出登录
    logout: function () {
      var _this = this;
      this.$confirm("确认退出吗?", "提示", {
        //type: 'warning'
      })
        .then(() => {
          sessionStorage.removeItem("user");
          _this.$router.push("/login");
        })
        .catch(() => {});
    },
    //折叠导航栏
    //讲道理在这里对屏幕适配情况进行调整是我们想到比较合适的了
    collapse: function () {
      this.collapsed1 = !this.collapsed1;
      /*获取此时的控件对象*/
      var oDrag = document.getElementsByClassName("drag") || [];
      //console.log(oDrag);
      /*对所有控件的宽高进行调整*/
      var self = this;
      /*for (let i = 0; i < self.pageComponents.length; i++) {

						percentWidth = self.pageComponents[i].widgetWidth/self.$refs.pannel.clientWidth;
						percentHeight = self.pageComponents[i].widgetHeight/self.$refs.pannel.clientHeight;

						setTimeout(function(){
							oDrag[i].style.width = percentWidth*self.$refs.pannel.clientWidth+'px';
							console.log(oDrag[i].style.width);
						},30);
					}*/
      //self.pageComponents
      setTimeout(function () {
        let pannel = self.$refs.pannel;
        pannel.style.height = pannel.clientWidth * 0.6 + "px";
      }, 30);
    },
    //折叠导航栏
    collapse2: function () {
      this.collapsed2 = !this.collapsed2;
      var self = this;
      setTimeout(function () {
        let pannel = self.$refs.pannel;
        pannel.style.height = pannel.clientWidth * 0.6 + "px";
      }, 30);
    },
    showMenu(i, status) {
      this.$refs.menuCollapsed.getElementsByClassName(
        "submenu-hook-" + i
      )[0].style.display = status ? "block" : "none";
    },
  },

  beforeDestroyed: function () {
    console.log("即将销毁组件");
  },
};
</script>
<style>
a {
  text-decoration: none;
}
a:link,
a:visitrd,
a:hover,
a:active {
  color: ;
}
.drag > div.btn {
  visibility: hidden;
}
.titleText {
  text-decoration: none;
  color: #fff;
}
.drag:active,
.drag:hover {
  box-shadow: 0 0 1px #6bf;
  background-color: rgba(0, 192, 222, 0.1);
}
.leftComponentList {
  width: 100%;
  overflow: hidden;
  padding: 0;
  cursor: pointer;
  border: 0 !important;
}

.el-menu-item,
.el-submenu__title {
  color: #20a0ff;
}
.dataPannal .el-textarea__inner {
  background: #000;
  color: #fff;
}
.el-button--small,
.el-button--small.is-round {
  padding: 6px 8px;
}
.el-button--medium {
  margin-right: 28px;
  font-size: 20px;
}

.el-input-number--small .el-input-number__decrease {
  width: 26px;
  right: 26px;
}
.el-input-number--small .el-input-number__increase {
  width: 26px;
}
.el-input-number--small .el-input__inner {
  padding-left: 28px;
  padding-right: 28px;
}
i:hover {
  color: #e91 !important;
}
.components-item > p {
  text-align: center;
}
.el-menu--horizontal {
  border-bottom: 0;
}
.el-menu--horizontal > .el-submenu .el-submenu__title:hover {
  background-color: #373d41;
}
.el-form-item__content {
  margin-left: 80px;
}
.el-tabs__item {
  color: #999;
}
.el-menu--popup-bottom-start {
  margin: 0;
  border-bottom: 0;
}
.el-radio + .el-radio {
  margin-left: 8px;
}
.el-menu--horizontal > .el-submenu .el-submenu__title {
  height: 40px;
  line-height: 40px !important;
}
.el-submenu__title i {
  color: #ccc;
}
.el-tabs--border-card > .el-tabs__header {
  background-color: #1b1f25;
}
.el-collapse-item__wrap {
  background-color: #1b1f25;
}
.el-collapse-item__header {
  background-color: #1b1f25;
  color: #ccc;
}
.el-form-item__label {
  color: #ccc;
}
.el-collapse-item__content {
  color: #ccc;
}
</style>

<style scoped lang="scss">
@import "~scss_vars";
.container {
  background-color: #999;
}
aside {
  background-color: #1b1f25 !important;
  color: #ccc !important;
}
.drag > btn {
  visiblty: none;
}
/*滚动条样式*/
::-webkit-scrollbar {
  /*滚动条整体样式*/
  width: 5px; /*高宽分别对应横竖滚动条的尺寸*/
  height: 5px;
}
::-webkit-scrollbar-thumb {
  /*滚动条里面小方块*/
  border-radius: 5px;
  -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.6);
  background: rgba(0, 0, 0, 0.6);
}

* {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.el-menu {
  background: #373d41;
}
.el-menu--horizontal .el-submenu > .el-menu {
  width: 545px;
  background-color: #222225;
}
.components-item[data-v-498a33db],
.target-item[data-v-498a33db] {
  color: #999;
}
.components-item[data-v-498a33db]:hover,
.target-item[data-v-498a33db]:hover {
  color: #e91;
}
.el-menu-item,
.el-submenu__title {
  color: #eceff3;
}
.el-menu-item,
.el-submenu__title:hover {
  background-color: #373d41;
}
.el-menu--horizontal .el-menu-item[data-v-498a33db] {
  height: 40px;
}
i {
  cursor: pointer;
}
.reSize:hover {
  cursor: se-resize;
}
.components-item,
.target-item {
  width: 120px;
  height: 120px;
  cursor: pointer;
  margin: 5px 8px;
  float: left;
}
.components-item:hover,
.target-item:hover {
  /* color:#fff; */
  img {
    border: 1px solid #6be;
    width: 118px;
    height: 88px;
    /* margin-top:-1px; */
  }
}
.components-item > img,
.target-item > img {
  width: 120px;
  height: 90px;
}
.el-collapse {
  border: 0;
}
.el-tabs--border-card {
  background: #2f2d2d;
  border: 0;
}
.screenPannel {
  width: 100%;
  box-shadow: 0 0 2px #8bf;
  position: relative;
}
.input-num {
  width: 90px;
  float: left;
  margin-right: 5px;
}
.input-num > span {
  width: 90px;
  text-align: center;
  font-size: 8px;
  line-height: 16px;
  float: left;
}
.el-input-number__increase {
  line-height: 28px;
  width: 20px;
  font-size: 10px;
  border: 1px solid #dcdfe6;
}
li {
  list-style-type: none;
}
.imgContainer {
  margin: -20px auto 10px 60px;
  width: 170px;
  height: 90px;
  border: 1px dashed #ccc;
  text-align: center;
  padding: 15px;
}
.data-right {
  margin: -35px 0 5px auto;
}
.contain-item {
  padding: 3px 0;
  border-bottom: 1px solid #ccc;
}
.el-input-number--small .el-input-number__decrease {
  right: 20px;
}
.el-input-number--small {
  width: 90px;
  margin-right: 5px;
  /* 	    top: 10px; */
}
.el-collapse-item__header {
  color: #333;
  border-left: 0;
}
.pannal {
  border-bottom: 1px solid #ccc;
}
.el-tabs__item {
  width: 150px !important;
  height: 45px;
  line-height: 45px;
  background: #fff;
  color: #333;
}
.el-menu--horizontal .el-menu-item {
  float: left;
  width: 33%;
  height: 45px;
  line-height: 45px;
  /* background:#fff; */
  color: #333;
}
.el-menu-item.is-active {
  /* background-color: #00c1de; */
  box-shadow: 0 0 1px #2196f3;
}

.navbar-item {
  margin: 0;
  position: releative;
}
.el-button + .el-button {
  margin-left: 0px;
}
aside {
  color: #666;
  background-color: #f4f4f4;
  border-right: 1px solid #333;
  overflow: hidden;
}
.navbar-item {
  margin: 0;
  position: releative;
}
.z-axis-list {
  overflow: scroll;
  width: 100%;
  text-align: center;
}
.z-axis-item {
  line-height: 30px;
  width: 100%;
  text-align: left;
  height: 30px;
}
.z-axis-item:hover {
  background-color: rgba(88, 110, 76, 0.3);
}
.container {
  position: absolute;
  top: 0px;
  bottom: 0px;
  width: 100%;
  .header {
    height: 40px;
    line-height: 40px;
    background: $color-primary;
    color: #fff;

    .widgetGroup {
      .el-menu {
        background-color: #373d41;
      }
      .el-menu--horizontal .el-submenu > .el-menu {
        width: 545px;
      }
      .el-menu--popup-bottom-start {
        background-color: #171b22;
      }
      .el-menu--horizontal .el-menu-item {
        float: left;
        width: 33%;
        height: 45px;
        line-height: 45px;
        background-color: #373d41;
        color: #333;
        .el-menu {
          background-color: #373d41;
        }
      }
      .el-menu-item.is-active {
        /* background-color: #00c1de; */
        box-shadow: 0 0 1px #2196f3;
      }
    }
    .userinfo {
      text-align: right;

      padding-right: 50px;
      float: right;
      .userinfo-inner {
        cursor: pointer;
        color: #fff;
        img {
          width: 40px;
          height: 40px;
          border-radius: 20px;
          margin: 10px 0px 10px 10px;
          float: right;
        }
      }
    }
    .backBtn {
      height: 60px;
      font-size: 22px;
      padding-left: 20px;
      padding-right: 20px;
      img {
        width: 40px;
        float: left;
        margin: 10px 10px 10px 18px;
      }
      .txt {
        color: #fff;
      }
    }
    .backBtn-width {
      width: 150px;
    }
    .tools {
      padding: 0px 23px;
      width: 14px;
      height: 40px;
      line-height: 40px;
      cursor: pointer;
    }
  }
  .main {
    display: flex;
    // background: #324057;
    position: absolute;
    top: 40px;
    bottom: 0px;
    overflow: hidden;
    el-button {
      cursor: pointer;
    }
    aside {
      flex: 0 0 230px;
      width: 230px;
      // position: absolute;
      // top: 0px;
      // bottom: 0px;
      .el-menu {
        height: 100%;
      }
      .collapsed {
        width: 60px;
        .item {
          position: relative;
        }
        .submenu {
          position: absolute;
          top: 0px;
          left: 60px;
          z-index: 99999;
          height: auto;
          display: none;
        }
      }
    }
    .menu-collapsed {
      flex: 0 0 0;
      width: 60px;
    }
    .menu-expanded {
      flex: 0 0 160px;
      width: 160px;
    }
    .menu-collapsed2 {
      flex: 0 0 0;
      width: 60px;
    }
    .menu-expanded2 {
      flex: 0 0 360px;
      width: 360px;
    }
    .content-container {
      // background: #f1f2f7;
      flex: 1;
      // position: absolute;
      // right: 0px;
      // top: 0px;
      // bottom: 0px;
      // left: 230px;
      overflow-y: scroll;
      padding: 20px;
      .breadcrumb-container {
        //margin-bottom: 15px;
        .title {
          width: 200px;
          float: left;
          color: #475669;
        }
        .breadcrumb-inner {
          float: right;
        }
      }
      .content-wrapper {
        /* background-color: #fff; */
        box-sizing: border-box;
      }
    }
  }
}
</style>