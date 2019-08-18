# 统计代码行数，不含注释和空行

c_files=`find . -name "*.c"`
h_files=`find . -name "*.h"`
asm_files=`find . -name "*.asm"`

total1=`awk 'BEGIN{x=0}/^.*$/{x++}END{print x}' $c_files`
total2=`awk 'BEGIN{x=0}/^.*$/{x++}END{print x}' $h_files`
total3=`awk 'BEGIN{x=0}/^.*$/{x++}END{print x}' $asm_files`
let total=total1+total2+total3
echo "total: $total"

n1=`awk 'BEGIN{x=0}/^[ \t]*\/\*.*$/{x++}END{print x}' $c_files` # /*
n2=`awk 'BEGIN{x=0}/^[ \t]*\*.*$/{x++}END{print x}' $c_files` # *
n3=`awk 'BEGIN{x=0}/^[ \t]*\/\/.*$/{x++}END{print x}' $c_files` # //
n4=`awk 'BEGIN{x=0}/^[ \t]*\/\*.*$/{x++}END{print x}' $h_files` # /*
n5=`awk 'BEGIN{x=0}/^[ \t]*\*.*$/{x++}END{print x}' $h_files` # *
n6=`awk 'BEGIN{x=0}/^[ \t]*\/\/.*$/{x++}END{print x}' $h_files` # //
n7=`awk 'BEGIN{x=0}/^[ \t]*;.*$/{x++}END{print x}' $asm_files` # //
let n=n1+n2+n3+n4+n5+n6+n7
echo "comments: $n"

m1=`awk 'BEGIN{x=0}/^$/{x++}END{print x}' $c_files`
m2=`awk 'BEGIN{x=0}/^$/{x++}END{print x}' $h_files`
m3=`awk 'BEGIN{x=0}/^$/{x++}END{print x}' $asm_files`
let m=m1+m2+m3
echo "blank: $m"

let x=total-n-m
echo "valid: $x"
