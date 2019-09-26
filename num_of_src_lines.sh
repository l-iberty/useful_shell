# 统计代码行数，不含注释和空行

files=`find . -name "*.cpp" -o -name "*.h"`

total=`awk 'BEGIN{x=0}/^.*$/{x++}END{print x}' $files`
echo "total: $total"

n1=`awk 'BEGIN{x=0}/^[ \t]*\/\*.*$/{x++}END{print x}' $files`	# /*
n2=`awk 'BEGIN{x=0}/^[ \t]*\*.*$/{x++}END{print x}' $files` 	# *
n3=`awk 'BEGIN{x=0}/^[ \t]*\/\/.*$/{x++}END{print x}' $files`	# //
let n=n1+n2+n3
echo "comments: $n"

m=`awk 'BEGIN{x=0}/^$/{x++}END{print x}' $files`
echo "blank: $m"

let x=total-n-m
echo "valid: $x"
