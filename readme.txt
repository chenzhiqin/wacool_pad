1、包
网络连接:SystemConfiguration.framework, MobileCoreServices.framework,CoreGraphics.framework和libz.1.2.5.dylib、CFNetwork.framework
数据库:libsqlite3.0.dylib
下拉刷新：QuartzCore.framework

2、国际化
创建string file，选中Localizable.strings在最右边属性中选中Localization，点击Make localized按钮，
此时说明此文件可以被国际化。再选中项目－>project－>Localizables->+/-就ok了

3、git命令
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/chenzhiqin/wacool_pad.git
git pull -u origin master
git push -u origin master