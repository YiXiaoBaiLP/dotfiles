### 插件使用说明

##### vim-plug 插件管理的插件  
###### 升级vim-plug插件本身  
- `:PlugUpgrade`  
###### 插件升级  
- `:PlugUpdate`  
##### 删除插件；以及插件相关文件
- 1、先删除配置文件中的 Plug 'xxx/xxx'  
- 2、然后执行命令`:PlugClean`  

##### 插件懒加载（Lazy load）  
###### 1、使用某个命令后加载  
- 执行 NERTReeToggle命令事后执行  
- 例如：`:Plug 'scrooloose/nerdtree, {'on', 'NERTReeToggle'}'`  
###### 2、打开指定文件后缀执行的插件  
- 例如：打开go文件  
-	`Plug 'fatih\vim-go', {'for', 'go'}`  
- 例如：打开某些指定文件后缀  
-  `Plug 'yuezk/vim-js, {'for', ['php', 'html', 'javascript']}'`  
###### 3、自动化  
- vim-plug在安装或者升级一个插件后，执行一些脚本  
- 例如： `Plug 'Yggdroot/LeaderF', {'do', './install.sh'}`  
###### 4、其他情况  
- 某些插件频繁升级，比如 vim-go，可以通过如下命令来配置  
-  `Plug 'fatih/vim-go' , { 'tag': '*', 'for': 'go' }`  
