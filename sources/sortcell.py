# encoding=utf8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

def SortCell(row):
	row.sort(key=lambda x: len(x[0]))	
	return row