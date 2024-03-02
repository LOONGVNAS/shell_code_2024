
#!/bin/bash

echo "theme-1 string: REGEX"
echo "string:REGEX字符串匹配示例.要输出匹配到的字符串结果,需要使用\(和\), 否则返回的将是匹配到的字符串数量."

expr abcde : 'ab\(.*\)'
expr abcde : 'ab\(.\)'
expr abcde : 'ab.*'
expr abcde : 'ab.'
expr abcde : '.*cd*'

expr abcde : 'cd.*'
#由于REGEX中隐含了^,所以使得匹配时都是从string首字符开始的.
#[root@xuexi ~]# expr abcde : 'cd.*'
#0
#之所以为0,是因为真正的正则表达式是^cd.*, 而abcde不是c开头而是a开头的,所以无法匹配.


echo
echo "theme-2 index string chars用法示例"
echo "从string中搜索chars中某个字符的位置,这个字符是string中最靠前的字符."

expr index abcde dec
#该命令将对字符串”dec”逐字符分解,首先分解得到第一个字符d,从abcde中搜索到d的位置为4,再分解得到第二个字符e,该字符在abcde中的位置为5,最后得到的字符是c,该字符在abcde中的位置为3.其中3是最靠前的字符,所以命令返回的结果为3.
#如果chars中的所有字符都不存在于string中,则返回0.

expr index abcde xdc
expr index abcde 1
expr index abcde 1x


echo
echo "theme-3.substr string pos len用法示例"
echo "从string中取出从pos位置开始长度为len的子字符串,如果pos或len为非正整数时,将返回空字符串"

expr substr abcde 2 3
expr substr abcde 2 4
expr substr abcde 2 5
expr substr abcde 2 0
expr substr abcde 2 -1

echo
echo "theme-4.length string用法示例.该表达式是返回string的长度,其中string不允许为空,否则将报错,所以可以用来判断变量是否为空."

expr length abcde
expr length 111
expr length $xxx
#报错:expr: syntax error

echo
echo "theme-5+ token用法示例."
echo "expr中有些符号和关键字有特殊意义,如match/index/length,如果要让其成为字符,使用该表达式将任意token强制解析为普通字符串."

expr index index d
#报错: expr: syntax error
expr index length g
#报错: expr: syntax error
expr index + length g
#REF https://www.junmajinlong.com/shell/expr/index.html
