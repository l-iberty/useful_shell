# 统计代码行数，不含注释和空行

total=`awk 'BEGIN{x=0}/^.*$/{x++}END{print x}' *.cpp`
echo "total: $total"

n1=`awk 'BEGIN{x=0}/^[ \t]*\/\*.*$/{x++}END{print x}' *.cpp` # /*
n2=`awk 'BEGIN{x=0}/^[ \t]*\*.*$/{x++}END{print x}' *.cpp` # *
n3=`awk 'BEGIN{x=0}/^[ \t]*\/\/.*$/{x++}END{print x}' *.cpp` # //
let n=n1+n2+n3
echo "comments: $n"

m=`awk 'BEGIN{x=0}/^$/{x++}END{print x}' *.cpp`
echo "blank: $m"

let x=total-n-m
echo "valid: $x"

read x