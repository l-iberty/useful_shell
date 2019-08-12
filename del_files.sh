# 查找并删除文件，如果文件路径中有空格，需要设置IFS

IFS=$(echo -en "\n\b")
rm `find . -name "filename"`
