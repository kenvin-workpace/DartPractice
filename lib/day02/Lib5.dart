/*
 * 导入包时使用deferred as可以让这个包懒加载，懒加载的包只会在该包被使用时得到加载，而不是一开始就加载
 */
func_deferred(int i) {
  print(i);
}
