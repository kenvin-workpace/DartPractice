/*
 * 可以使用as关键字为导入的某个包设置一个前缀，或者说别名
 */
int add(int a, int b, [int c]) {
  if(c!=null){
    return a + b + c;
  }
  return a + b;
}