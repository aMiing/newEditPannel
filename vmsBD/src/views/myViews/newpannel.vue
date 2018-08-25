
<template id="addPanel">
	<section>
		<el-col class="pannal" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
		    <el-card :body-style="{ padding: '0px' }">
		      <img src="../../assets/show.png" class="image">
		      <div style="padding:5px 10px 12px 10px;">
				<i class="el-icon-edit"></i>
		        <span style="line-height: 36px;">我的大屏幕</span>
		        <div class="line" style="height:1px;width:100%;background-color: #ccc;margin-bottom: 10px;"></div>
		        <!-- 操作按钮 -->
		        <el-row type="flex" class="row-bg" justify="space-around">
				  <el-col :span="7">
				  	<div class="grid-content bg-purple">
					<i class="el-icon-plus"></i>复制</div>
				  </el-col>
				  <el-col :span="7">
				  	<div class="grid-content bg-purple-light">
					<i class="el-icon-plus"></i>预览</div>
				  </el-col>
				  <el-col :span="8"><div class="grid-content bg-purple">
				  	<el-switch
					  v-model="value1" width=40 active-color="">
					</el-switch>发布</div>
				  </el-col>
				</el-row>
		      </div>
		    </el-card>
		  </el-col>

								
	</section>
</template>

<script>
	

	export default {
	   data() {
	      return {
	        value1: false,	      
	      }
	    },
	}
			

</script>

<style scoped>
</style>