
<template id="newPannel">
	<section>
		<el-row style="line-height: 28px;font-size:15px;font-weight: 600;border-bottom:1px solid rgba(66,66,66,0.9);padding-bottom: 5px;background-color:#171b22; ">
			<el-col :span="3" style="padding-left: 20px;">
				<i class="el-icon-menu"></i><span> 我的分组</span>
			</el-col>
			<el-col :span="21" style="padding-left:10px;color:#6bf">
				<span>大屏管理</span>
			</el-col>
		</el-row>
		  <el-tabs tab-position="left" style="height: 100%;background-color:#171b22;padding-top: 5px;">
		    <el-tab-pane>
          		<span slot="label" style="display:block;width:9vw;text-align: left;"><i class="el-icon-menu"></i>全部大屏</span>
				<el-row class="pannelRow">
				 <el-col class="pannal" title="点击新增屏幕" @click="dialogFormVisible = true">
				    <el-card :body-style="{ padding: '0px' }">
					  <a id="add" href="#" style="line-height: 36px;font-size:18px;">
					      <div id="addPannel" style="padding:75px 10px;text-align: center;">
					        <div >
				        		<div>
									<i class="iconfont icon-add" style="font-size: 40px;"></i>
								</div>
								新建可视化
					        </div>
					      </div>
					  </a>
				    </el-card>
				 </el-col>

					<!-- 新屏幕的信息录入表单弹窗 -->
					<el-dialog title="新建屏幕" :visible.sync="dialogFormVisible" >
					  <el-form :model="theNewPannel">
					    <el-form-item label="屏幕名称" :label-width="formLabelWidth">
					    	<label for="">屏幕名称</label>
					    	<el-input style="display: none;"> </el-input>
					      <el-input v-model="theNewPannel.title" auto-complete="on"></el-input>
					    </el-form-item> 
					  </el-form>
					  <div slot="footer" class="dialog-footer">
					    <el-button @click="dialogFormVisible = false;">取 消</el-button>
					    <el-button type="primary" @click="addPannel()">确 定</el-button>
					  </div>
					</el-dialog>
					
				<el-col ref="pannelBox" class="pannal" v-for="(pannel, index) in pannels" :key="pannel.id">
				    <el-card :body-style="{ padding: '0px' }">
				      	<!-- 编辑功能的模态框 -->
				      	<div>
					      	<div ref='dialog' id="dialog" @mouseover="showEdit(index)"  @mouseout="hiddenEdit(index)" style="opacity:0;">
					      		<div class="dialog-modal"></div>
					      		<i class="el-icon-delete" @click="deleatePannel(index,pannel.id)"></i>
					      		<el-button type="primary" class="edit" @click="openWindow(pannel.id)">编辑</el-button>
					      	</div>
				      		<img :src="pannel.img" class="image" height="145">
				      	</div>
				      <div style="padding:5px 10px 10px 10px;">
				      	<div class="titlecontain" style="font-size: 16px;">
				      		<i class="el-icon-edit" @click="modifyPannelTitle(index)" title="编辑名称"></i>
				        	<span style="line-height: 36px;padding-left: 4px;">{{pannel.title}}</span>
				      	</div>
						
				        <div class="line" style="height:1px;width:100%;border-bottom:1px dashed #333;margin-bottom: 10px;"></div>
				        <!-- 操作按钮 -->
				        <el-row type="flex" class="row-bg" justify="space-around">
						  <el-col :span="7">
						  	<div class="grid-content bg-purple" >
									<i class="iconfont icon-fuzhi1" title="复制">复制</i>
							</div>
						  </el-col>
						  <el-col :span="7">
						  	<div class="grid-content bg-purple-light" @click="previewScreen(pannel.id)">
								<i class="iconfont icon-view" title="预览">预览</i>
							</div>
						  </el-col>
						  <el-col :span="8">
						  	<div class="grid-content bg-purple">
							  	<el-switch v-model="pannel.published" :width='a' active-text="发布" inactive-text="" disabled v-if="pannel.haveContent==0" title="空界面不可发布哦">
								</el-switch>
							  	<el-switch active-color="#02710d" inactive-color="#333" @change="publishedOr($event,pannel.id,index)" v-model="pannel.published" :width='a' title="发布">
								</el-switch>
								<label>发布</label>
							</div>
						  </el-col>
						</el-row>

				      </div>
				    </el-card>
				 </el-col>

				</el-row>
		    </el-tab-pane>
		    <el-tab-pane>
          		<span slot="label" style="display:block;width:9vw;text-align: left;"><i class="el-icon-menu"></i>未分组</span>
          	</el-tab-pane>
		  </el-tabs>
				
	</section>

</template>

	
<script>
	export default {
	   data() {
	      return {
	        dialogFormVisible : false,
	        dialogVisible:false,
	        dialogEditVisible:false,
	        a:40,
		    formLabelWidth: '120px',
	        pannels:'',
			theNewPannel:{'title':'新屏幕','img':'../../static/img/4.jpg','published':0}
	      }
	    },
	    created:function(){
	    	//ajax获取另一个服务上的数据
	    	var url = 'http://localhost:8888/getPannelList';
	    	this.$http.get(url).then(function(res){
	    		console.log(res.bodyText);
	    		let pannellist = JSON.parse(res.bodyText);
	    		console.log(pannellist);
	    		for (var i = 0; i < pannellist.length; i++) {
	    			if(pannellist[i].published == 1){
	    				pannellist[i].published=true;
	    			}else{
	    				pannellist[i].published = false;
	    			}
	    		}
	    		this.pannels = pannellist;
	    		// console.log(pannellist);
	    	},function(res){
	    		alert('未能从服务器/数据库加载到数据，请联系系统维护人员或稍后重试！');
	    		return;
	    	});
	    	//监听函数，监听data的变化
            this.$watch('pannels.length',function(){
                console.log('发生变化了');
                //location.reload(false);
            });
	    },
	
	    methods:{
	    	openWindow(id){
	    		window.open('http://localhost:8080/#/edit?id='+id,'_blank');
	    	},
	    	previewScreen(id){
	    		window.open('http://localhost:8080/#/previewScreen?id='+id,'_blank');
	    	},
	    	showEdit(index){
	    		//console.log(this.$refs.pannelBox);
	    		this.$refs.dialog[index].style.opacity = 1;
	    		console.log(index);//4
	    		console.log(this.pannels[index].id);//5
	    		/*this.style.opacity=1;*/
	    	},
	    	hiddenEdit(index){
	    		//console.log(this.$refs.dialog[index]);
	    		this.$refs.dialog[index].style.opacity = 0;
	    		/*this.style.opacity=1;*/
	    	},
	    	deleatePannel(index,id){
				this.$confirm('此操作将删除该面板, 是否继续?', '提示', {
		          confirmButtonText: '确定',
		          cancelButtonText: '取消',
		          type: 'warning'
		        }).then(() => {
		        this.$message({
		           type: 'success',
		           message: '删除成功!'
		        });
		          this.pannels.splice(index,1);
					//ajax获取另一个服务上的数据
					let url = 'http://localhost:8888/deleatePannel';
					this.$http.post(url,{"id":id},{emulateJSON:true}).then((req,res) => {
	    				console.log(res.bodyText);
			    	}).catch((err) =>{
			    		console.log('未能成功发送deleatePannel:id='+id+'数据，请联系系统维护人员或稍后重试！');
			    		return;
			    	});
		        }).catch(() => {
		          this.$message({
		            type: 'info',
		            message: '已取消删除'
		          });          
			    });
	    	},
	    	publishedOr(info,id,index){
	    		console.log(info);
	    		if(info==true){
					this.$confirm('发布之后可以通过链接分享和访问, 是否继续?', '提示', {
			          confirmButtonText: '确定',
			          cancelButtonText: '取消',
			          type: 'warning'
			        }).then(() => {
			        this.$message({
			           type: 'success',
			           message: '发布成功!'
			        });
						//ajax获取另一个服务上的数据
						let url = 'http://localhost:8888/publishedOr';
						this.$http.post(url,{"id":id,published:1},{emulateJSON:true}).then((req,res) => {
		    				console.log(res.bodyText);
				    	}).catch((err) =>{
				    		console.log('未能成功发送publishedOr(1)数据，请联系系统维护人员或稍后重试！');
				    		return;
				    	});
			        }).catch(() => {
			          this.$message({
			            type: 'info',
			            message: '已取消发布操作'
			          });
			        this.pannels[index].published = false;          
				    });
	    		}
	    		else{
					this.$confirm('取消发布之后不能通过链接分享和访问, 是否继续?', '提示', {
			          confirmButtonText: '确定',
			          cancelButtonText: '取消',
			          type: 'warning'
			        }).then(() => {
			        this.$message({
			           type: 'success',
			           message: '下架成功!'
			        });
						//ajax获取另一个服务上的数据
						let url = 'http://localhost:8888/publishedOr';
						this.$http.post(url,{"id":id,published:0},{emulateJSON:true}).then((req,res) => {
		    				console.log(res.bodyText);
				    	}).catch((err) =>{
				    		console.log('未能成功发送publishedOr(0)数据，请联系系统维护人员或稍后重试！');
				    		return;
				    	});
			        }).catch(() => {
			          this.$message({
			            type: 'info',
			            message: '已取消下架操作'
			          });
			        	this.pannels[index].published = true;            
				    });
	    		}
	    	},
	    	addPannel(){
	    		// this.pannels.unshift(this.theNewPannel);//本地更新面板列表
	    		var NewPannel = JSON.stringify(this.theNewPannel);//字符流方式传输，接收之后转换
	      		let url = 'http://localhost:8888/addPannel';
				this.$http.post(url,{"addPannel":NewPannel},{emulateJSON:true}).then((req,res) => {
	    			console.log(res.bodyText);
		    	}).catch((err) =>{
		    		// alert('添加成功，页面将同步数据库！');
		    	});
		    	//这里需要重新从服务器获取pannelList数据
		    	let url_load = 'http://localhost:8888/getPannelList';
		    	this.$http.get(url_load).then(function(res){
		    		// console.log(res.bodyText);
		    		let pannellist = JSON.parse(res.bodyText);
		    		console.log(pannellist);
		    		for (var i = 0; i < pannellist.length; i++) {
		    			if(pannellist[i].published == 1){
		    				pannellist[i].published=true;
		    			}else{
		    				pannellist[i].published = false;
		    			}
		    		}
		    		this.pannels = pannellist;
	    			this.dialogFormVisible = false;
		    		// console.log(pannellist);
		    	},function(res){
		    		alert('未能从服务器/数据库加载到数据，请联系系统维护人员或稍后重试！');
		    		return;
		    	});
	    	},
	    	modifyPannelTitle(index){
	    		this.$prompt('请输入新标题', '修改屏幕标题', {
		          confirmButtonText: '确定',
		          cancelButtonText: '取消',
		        }).then(({ value }) => {	
		          this.$message({
		            type: 'success',
		            message: '标题成功修改为: ' + value
		          });
		          this.pannels[index].title = value;
					//ajax向后台发送修改数据
					let url = 'http://localhost:8888/changeTitle';
					this.$http.post(url,{"id":this.pannels[index].id,"value":value},{emulateJSON:true}).then((req,res) => {
						console.log("保存修改到服务器");
			    	}).catch((err) =>{
		    			alert('页面数据可能与数据库不完全匹配，请刷新页面或联系系统维护人员！');
			    		return;
			    	});	
		          //定义一个提交修改的函数，这里调用
		        }).catch(() => {
		          this.$message({
		            type: 'info',
		            message: '取消修改'
		          });       
		        });
	    		
	    	}
	    }
	    
	}
			

</script>

<style>
i{
	cursor:pointer;
}
i:hover{
	color:#6bf;
}
#add{
	color:gray;
	text-decoration: none;
}
#add:hover{
	color:#43ccbf;
	text-decoration: none;
}
.edit{
	position:absolute;
	margin:45px 90px;
	background-color: #6bf;
	border-color: #6bf;
	width:60px;
	z-index: 11;
}
.el-card{
	position: absolute;
	background-color: #171b22;
	color:#ccc;
	border:1px dashed rgba(126,126,126,0.6);
	 box-shadow: 0 0 2px #4bf !important; 
}
#dialog{
	 /* opacity: 0;  */
}
#dialog>i{
	position:absolute;
	margin:5px 215px;
	font-size: 18px;
	z-index: 11;
	color:#fff;
}
.dialog-modal{
	position: absolute;
	width:240px;
	height:145px;
	z-index: 9;
	background-color: #000;
	opacity: 0.8;
}
 .time {
    font-size: 13px;
    color: #999;
  }
  .el-switch__label{
  	z-index: 0;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
  .el-switch__label{
	display: none;
  }
  /* 自定义a标签的不可点击事件 */
	a.disabled{
		cursor:not-allowed;
		color:#aaa;
	}
	a.disabled>i:hover{
		color:#aaa;
	}
	a.disabled>i{
		cursor:not-allowed;
	}
	.content-container{
		overflow-y:hidden !important;
	}
	.pannelRow{
		 padding-left: 10px;
	}

</style>
<style scoped lang="scss">
	
</style>