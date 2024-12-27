# Cursor Tool Use

这是一个用于快速设置 Cursor 开发环境的工具集。

## 功能特点

- 自动创建和配置 Python 虚拟环境
- 自动复制必要的工具和配置文件
- 支持自定义虚拟环境名称
- 自动安装基础依赖包

## 安装

1. 克隆仓库:
```bash
git clone https://github.com/yourusername/cursor_tool_use.git ~/cursor_tool_use
```

2. 运行安装脚本:
```bash
~/cursor_tool_use/install_cursor_env.sh
```

## 使用方法

安装完成后，可以在任何目录使用以下命令来设置 Cursor 开发环境:

```bash
setup_cursor_env [venv_name]
```

参数说明:
- `venv_name`: 可选参数，指定虚拟环境名称，默认为 "venv"

## 目录结构

```
cursor_tool_use/
├── .cursorrules        # Cursor 配置规则
├── tools/              # 工具脚本目录
├── install_cursor_env.sh    # 安装脚本
└── requirements.base   # 基础依赖包列表
```

## 注意事项

- 需要预先安装 Python 3
- 需要使用 zsh shell
- 确保有足够的权限修改 ~/.zshrc 文件 