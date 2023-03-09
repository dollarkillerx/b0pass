package b0pass

import (
	"b0pass/boot"
	_ "b0pass/boot"
	_ "b0pass/router"
	"fmt"
	"github.com/gogf/gf/net/ghttp"
)

var server *ghttp.Server

// 对外暴露两个方法。 一个 运行go程序
func Run() {
	if server != nil {
		return
	}

	//处理命令行参数
	boot.ExecArgs()

	server = boot.Run()
	fmt.Printf("[ServerUrl] http://127.0.0.1:%d\n", boot.ServPort)
	fmt.Printf("[Work-Path] %s\n", boot.PathRoot)
	//g.Wait()
}

// 一个停止go程序
func Stop() {
	server.Shutdown()
	server = nil
}
