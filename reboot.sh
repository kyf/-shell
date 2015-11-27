#! /bin/sh

proc_name="test"                               
pid=0

proc_num()                                             
{
	num=`ps -ef | grep $proc_name | grep -v grep | wc -l`
	return $num
}

proc_id()                                               
{
	pid=`ps -ef | grep $proc_name | grep -v grep | awk '{print $2}'`
}

proc_num
number=$?
if [ $number -eq 0 ]                                    
then 
	cd  ~/demo/test
	./test > /dev/null &                                      
else
	proc_id
	kill $pid
	cd ~/demo/test
	./test > /dev/null &
fi

