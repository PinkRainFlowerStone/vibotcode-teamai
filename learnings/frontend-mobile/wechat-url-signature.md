# WeChat SDK Signatures Follow The Current URL

使用微信 JS-SDK 的移动 Web 项目中，签名通常绑定去除 hash 后的当前 URL。支付或导航改变 URL 后，旧签名可能失效；实现应保存初始化 URL，在 URL 变化时重置 readiness、重新请求签名并初始化。

重构微信封装时还应保留仓库已有的非微信环境、localhost 或内网环境保护。具体跳过条件必须由当前仓库代码证明。

Source: existing mobile H5 repository payment, sharing and intranet environment behavior.
