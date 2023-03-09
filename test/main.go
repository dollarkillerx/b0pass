package main

import (
	"b0pass/boot"
	_ "b0pass/boot"
	_ "b0pass/router"
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

var server *ghttp.Server

func main() {
	//处理命令行参数
	boot.ExecArgs()

	server = boot.Run()
	fmt.Printf("[ServerUrl] http://127.0.0.1:%d\n", boot.ServPort)
	fmt.Printf("[Work-Path] %s\n", boot.PathRoot)
	g.Wait()
}
