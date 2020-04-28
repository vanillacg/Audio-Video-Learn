# Lame X264 ios 构建

### lame

##### 准备资源下载:

lame下载地址
https://sourceforge.net/projects/lame/

编译脚本下载地址

https://github.com/kewlbear/lame-ios-build

 

##### 编译lame

1. 将带有版本号的文件夹改为lame (脚本的入参指定为lame)

2. 将lame-ios-build-master 中build-lame.sh 放置在lame 同一级文件夹下

   ![image-20200421161413026](/Users/chenguang/Library/Application Support/typora-user-images/image-20200421161413026.png)

3. 执行脚本

   ```shell
   sudo ./build-lame.sh
   ```

4. 编译完成查看是否有fat-lame,thin-lame,scratch-lame

   ![image-20200421161609210](/Users/chenguang/Library/Application Support/typora-user-images/image-20200421161609210.png)

5. Fat-lame 中lib才是我们需要使用的

   ```shell
   lipo -info libmp3lame.a
   ----
   Architectures in the fat file: libmp3lame.a are: armv7 armv7s x86_64 arm64
   ```

   

### X264

##### 源码

x264源码http://www.videolan.org/developers/x264.html

编译脚本源码 https://github.com/kewlbear/x264-ios

##### 编译

1. 放到同一个文件下

   ![image-20200421180514699](/Users/chenguang/Library/Application Support/typora-user-images/image-20200421180514699.png)

2. 执行脚本

   ```shell
   sh ./build-x264.sh
   ```

3. 结果

   ![image-20200421180949380](/Users/chenguang/Library/Application Support/typora-user-images/image-20200421180949380.png)

4. 